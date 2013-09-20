Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VN3tw-0001Q9-Ph
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 12:49:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN3tp-0001Ft-0k
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 12:49:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN3tj-0005rR-U2
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 12:49:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56817)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VN3tT-0005nn-A3; Fri, 20 Sep 2013 12:49:23 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id CA70F419BE;
	Fri, 20 Sep 2013 20:49:21 +0400 (MSK)
Message-ID: <523C7C91.4040501@msgid.tls.msk.ru>
Date: Fri, 20 Sep 2013 20:49:21 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Damien Millescamps <damien.millescamps@6wind.com>
References: <1379339167-1428-1-git-send-email-damien.millescamps@6wind.com>
In-Reply-To: <1379339167-1428-1-git-send-email-damien.millescamps@6wind.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, berrange@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v3] ivshmem: allow the sharing of
	hugepages
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Sep 2013 16:49:50 -0000

16.09.2013 17:46, Damien Millescamps wrote:
> This patch permits to share memory areas that do not specifically belong to
> /dev/shm. In such case, the file must be already present when launching qemu.
> A new parameter 'file' has been added to specify the file to use.
>
> A use case for this patch is sharing huge pages available through a
> hugetlbfs mountpoint.
>
> Signed-off-by: Damien Millescamps <damien.millescamps@6wind.com>
> ---
>   docs/specs/ivshmem_device_spec.txt |    5 ++-
>   hw/misc/ivshmem.c                  |   52 +++++++++++++++++++++++------------
>   2 files changed, 37 insertions(+), 20 deletions(-)
>
> diff --git a/docs/specs/ivshmem_device_spec.txt b/docs/specs/ivshmem_device_spec.txt
> index 667a862..3137e60 100644
> --- a/docs/specs/ivshmem_device_spec.txt
> +++ b/docs/specs/ivshmem_device_spec.txt
> @@ -4,8 +4,9 @@ Device Specification for Inter-VM shared memory device
>
>   The Inter-VM shared memory device is designed to share a region of memory to
>   userspace in multiple virtual guests.  The memory region does not belong to any
> -guest, but is a POSIX memory object on the host.  Optionally, the device may
> -support sending interrupts to other guests sharing the same memory region.
> +guest, but is a either a POSIX memory object or a mmap'd file (such as a
> +hugepage) on the host.  Optionally, the device may support sending interrupts
> +to other guests sharing the same memory region.

Here, the new addition "such as a hugepage", in my opinion, is a bit misleading.
You may say "including hugepage-backed file" for example.  Your version makes
hugepages-backed file a bit unique, it may be interpreted like only some special
files are supported, while in fact any mmap'ed file should work.  And a nitpick,
it is not "hugepage", it is "hugepages".

Also, the "Optionally.." should be in the next paragraph, I think.

> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> index 2838866..a9f268d 100644
> --- a/hw/misc/ivshmem.c
> +++ b/hw/misc/ivshmem.c
> @@ -98,6 +98,7 @@ typedef struct IVShmemState {
>       Error *migration_blocker;
>
>       char * shmobj;
> +    char * fileobj;
>       char * sizearg;
>       char * role;
>       int role_val;   /* scalar to avoid multiple string comparisons */
> @@ -715,9 +716,9 @@ static int pci_ivshmem_init(PCIDevice *dev)
>           /* if we get a UNIX socket as the parameter we will talk
>            * to the ivshmem server to receive the memory region */
>
> -        if (s->shmobj != NULL) {
> +        if (s->shmobj != NULL || s->fileobj != NULL) {
>               fprintf(stderr, "WARNING: do not specify both 'chardev' "
> -                                                "and 'shm' with ivshmem\n");
> +                            "and 'shm' or 'file' with ivshmem\n");

Ow, this is an.. interesting wording... ;)

>           }
>
>           IVSHMEM_DPRINTF("using shared memory server (socket = %s)\n",
> @@ -743,28 +744,42 @@ static int pci_ivshmem_init(PCIDevice *dev)
>       } else {
>           /* just map the file immediately, we're not using a server */
>           int fd;
> +        int is_shm = !!(s->shmobj != NULL);
> +        int is_file = !!(s->fileobj != NULL);
>
> -        if (s->shmobj == NULL) {
> -            fprintf(stderr, "Must specify 'chardev' or 'shm' to ivshmem\n");
> +        if (!(is_shm ^ is_file)) {
> +            fprintf(stderr, "Must specify one, and only one, in 'chardev',"
> +                            "  'file'  or 'shm' to ivshmem\n");

Another, even more interesting wording here ;)
Plus (tiny nitpick) an extra space before "or".

>               exit(1);
>           }
>
> -        IVSHMEM_DPRINTF("using shm_open (shm object = %s)\n", s->shmobj);
> -
> -        /* try opening with O_EXCL and if it succeeds zero the memory
> -         * by truncating to 0 */
> -        if ((fd = shm_open(s->shmobj, O_CREAT|O_RDWR|O_EXCL,
> -                        S_IRWXU|S_IRWXG|S_IRWXO)) > 0) {
> -           /* truncate file to length PCI device's memory */
> -            if (ftruncate(fd, s->ivshmem_size) != 0) {
> -                fprintf(stderr, "ivshmem: could not truncate shared file\n");
> +        if (is_shm) {
> +            IVSHMEM_DPRINTF("using shm_open (shm object = %s)\n", s->shmobj);
> +
> +            /* try opening with O_EXCL and if it succeeds zero the memory
> +             * by truncating to 0 */
> +            if ((fd = shm_open(s->shmobj, O_CREAT|O_RDWR|O_EXCL,
> +                            S_IRWXU|S_IRWXG|S_IRWXO)) > 0) {
> +               /* truncate file to length PCI device's memory */
> +                if (ftruncate(fd, s->ivshmem_size) != 0) {
> +                    fprintf(stderr, "ivshmem: could not truncate"
> +                                    " shared file\n");

Here, I think, should be some exit(), even if initially there was none.
And oh, please, pretty PLEASE add some strerror(errno) reporting (again,
even if the original code had no %m reporting here).  It is very sad when
users had to resort to use strace to see which error actually happens...

> +                }
> +
> +            } else if ((fd = shm_open(s->shmobj, O_CREAT|O_RDWR,

Does it make sense to open with O_CREAT here, when previous O_EXCL
failed?  It looks like we are EITHER creating a new file (above), OR
opening existing one, no?

> +                            S_IRWXU|S_IRWXG|S_IRWXO)) < 0) {
> +                fprintf(stderr, "ivshmem: could not open shared file\n");
> +                exit(-1);
>               }
> +        } else {
> +            IVSHMEM_DPRINTF("using open (file object = %s)\n", s->fileobj);
>
> -        } else if ((fd = shm_open(s->shmobj, O_CREAT|O_RDWR,
> -                        S_IRWXU|S_IRWXG|S_IRWXO)) < 0) {
> -            fprintf(stderr, "ivshmem: could not open shared file\n");
> -            exit(-1);
> -
> +            /* try opening a mmap's file. This file must have been previously
> +             * created on the host */
> +            if ((fd = open(s->fileobj, O_RDWR)) < 0) {
> +                fprintf(stderr, "ivshmem: could not open mmap'd file\n");
> +                exit(-1);
> +            }
>           }
>
>           if (check_shm_size(s, fd) == -1) {
> @@ -804,6 +819,7 @@ static Property ivshmem_properties[] = {
>       DEFINE_PROP_BIT("ioeventfd", IVShmemState, features, IVSHMEM_IOEVENTFD, false),
>       DEFINE_PROP_BIT("msi", IVShmemState, features, IVSHMEM_MSI, true),
>       DEFINE_PROP_STRING("shm", IVShmemState, shmobj),
> +    DEFINE_PROP_STRING("file", IVShmemState, fileobj),
>       DEFINE_PROP_STRING("role", IVShmemState, role),
>       DEFINE_PROP_UINT32("use64", IVShmemState, ivshmem_64bit, 1),
>       DEFINE_PROP_END_OF_LIST(),


Can you please send a v4 with the above changes?  Hopefully you agree
with them.  Overall, I like this new version too.

Thank you!

/mjt


