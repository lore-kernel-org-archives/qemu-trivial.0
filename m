Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKmHO-0004M1-DT
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 05:36:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50560)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKmHH-0004Dw-Qm
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 05:36:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKmHC-00071p-OZ
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 05:36:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51035)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VKmH2-000703-4I; Sat, 14 Sep 2013 05:36:16 -0400
Received: from gandalf.local (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6D4A341074;
	Sat, 14 Sep 2013 13:36:14 +0400 (MSK)
Message-ID: <52342E0E.3010700@msgid.tls.msk.ru>
Date: Sat, 14 Sep 2013 13:36:14 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130827 Icedove/17.0.8
MIME-Version: 1.0
To: Damien Millescamps <damien.millescamps@6wind.com>
References: <1379010228-15324-1-git-send-email-damien.millescamps@6wind.com>
In-Reply-To: <1379010228-15324-1-git-send-email-damien.millescamps@6wind.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] ivshmem: allow the sharing of hugepages
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
X-List-Received-Date: Sat, 14 Sep 2013 09:36:37 -0000

12.09.2013 22:23, Damien Millescamps wrote:
> According to shm_open specifications:
>
>   A shared memory object should be identified by a name of the form /somename;
>   that is, a null-terminated string of up to NAME_MAX (i.e., 255) characters
>   consisting of an initial slash, followed by one or more characters, none of
>   which are slashes.
>
> This patch permits to share memory areas that do not specifically belong to
> /dev/shmem.
>
> A use case for this patch is sharing huge pages available through a
> hugetlbfs mountpoint.
>
> Signed-off-by: Damien Millescamps <damien.millescamps@6wind.com>
> ---
>   hw/misc/ivshmem.c |   16 +++++++++++++++-
>   1 files changed, 15 insertions(+), 1 deletions(-)
>
> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> index 2838866..9020bb2 100644
> --- a/hw/misc/ivshmem.c
> +++ b/hw/misc/ivshmem.c
> @@ -751,9 +751,23 @@ static int pci_ivshmem_init(PCIDevice *dev)
>
>           IVSHMEM_DPRINTF("using shm_open (shm object = %s)\n", s->shmobj);
>
> +        /*
> +         * A shared memory object should be identified by a name of the form /somename;
> +         * that is, a null-terminated string of up to NAME_MAX (i.e., 255) characters
> +         * consisting of an initial slash, followed by one or more characters, none of
> +         * which are slashes.

It'd be nice to give a hint about where this definition comes from.

And once you look at shm_open(3), you'll notice that this paragraph
is prefixed with "For portable use", and reads:

  For portable use, a shared memory object should be identified by a name of the
  form  /somename; that is, a null-terminated string of up to NAME_MAX (i.e., 255)
  characters consisting of an initial slash, followed by one or more characters,
  none of which are slashes.

That to say, this is not a _definition_ of a shared memory object, it is just
a suggested name syntax, suggested purely for portability.  In other words,
there may be other acceptable syntaxes for it.

So as the result, I'm not sure this approach is valid.  Maybe we should
always try shared first and create-new second?  I dunno.

Note that whole thing - using shared memory object like this - may lead
to surprizes at least, -- users who previously expected one behavour now
see different behavour.  Most likely the old behavour wasn't correct.

At least this should be documented somewhere in user-visible part of
ivshmem, so users will have an ides when objects will be shared and
when truncated.

> +         */
> +        if (s->shmobj && s->shmobj[0] == '/' && strstr(&s->shmobj[1], "/")) {

Here you're testing for s->shmobj, but before, the code were referencing
it directly as an argument for shm_open().  Can it be NULL in this place?

It is a somewhat minor nitpick, but it'd be not nice to spread such tests
(for NULLness) where the object can't be NULL and to confuse readers.

> +            /* This can't be a shared memory object. */
> +            fd = open(s->shmobj, O_RDWR);
> +            if (fd < 0) {
> +                perror("ivshmem - open");
> +                exit(-1);
> +            }
> +        }
>           /* try opening with O_EXCL and if it succeeds zero the memory
>            * by truncating to 0 */
> -        if ((fd = shm_open(s->shmobj, O_CREAT|O_RDWR|O_EXCL,
> +        else if ((fd = shm_open(s->shmobj, O_CREAT|O_RDWR|O_EXCL,
>                           S_IRWXU|S_IRWXG|S_IRWXO)) > 0) {
>              /* truncate file to length PCI device's memory */
>               if (ftruncate(fd, s->ivshmem_size) != 0) {
>

Thanks,

/mjt

