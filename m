Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VN7aI-00056P-NO
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 16:45:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>) id 1VN7aC-000520-7a
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 16:45:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>) id 1VN7a7-0007v9-Ds
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 16:45:44 -0400
Received: from nodalink.pck.nerim.net ([62.212.105.220]:37657
	helo=paradis.irqsave.net) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benoit.canet@irqsave.net>)
	id 1VN7Zv-0007tb-U1; Fri, 20 Sep 2013 16:45:28 -0400
Received: by paradis.irqsave.net (Postfix, from userid 1002)
	id 3625D874677; Fri, 20 Sep 2013 22:45:25 +0200 (CEST)
Received: from irqsave.net (unknown [192.168.77.20])
	by paradis.irqsave.net (Postfix) with ESMTP id C187587464D;
	Fri, 20 Sep 2013 22:45:17 +0200 (CEST)
Date: Fri, 20 Sep 2013 22:45:17 +0200
From: =?iso-8859-1?Q?Beno=EEt?= Canet <benoit.canet@irqsave.net>
To: Damien Millescamps <damien.millescamps@6wind.com>
Message-ID: <20130920204517.GC3276@irqsave.net>
References: <1379702087-8653-1-git-send-email-damien.millescamps@6wind.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1379702087-8653-1-git-send-email-damien.millescamps@6wind.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 62.212.105.220
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4] ivshmem: allow the
 sharing of mmap'd files
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
X-List-Received-Date: Fri, 20 Sep 2013 20:45:49 -0000

Le Friday 20 Sep 2013 =E0 20:34:47 (+0200), Damien Millescamps a =E9crit =
:
> This patch permits to share memory areas that do not specifically belon=
g to
> /dev/shm. In such case, the file must be already present when launching=
 qemu.
> A new parameter 'file' has been added to specify the file to use.
>=20
> A use case for this patch is sharing huge pages available through a
> hugetlbfs mountpoint.
>=20
> Signed-off-by: Damien Millescamps <damien.millescamps@6wind.com>
> ---
>  docs/specs/ivshmem_device_spec.txt |    7 +++-
>  hw/misc/ivshmem.c                  |   56 +++++++++++++++++++++++-----=
-------
>  2 files changed, 42 insertions(+), 21 deletions(-)
>=20
> diff --git a/docs/specs/ivshmem_device_spec.txt b/docs/specs/ivshmem_de=
vice_spec.txt
> index 667a862..cb7d310 100644
> --- a/docs/specs/ivshmem_device_spec.txt
> +++ b/docs/specs/ivshmem_device_spec.txt
> @@ -4,8 +4,11 @@ Device Specification for Inter-VM shared memory device
> =20
>  The Inter-VM shared memory device is designed to share a region of mem=
ory to
>  userspace in multiple virtual guests.  The memory region does not belo=
ng to any
> -guest, but is a POSIX memory object on the host.  Optionally, the devi=
ce may
> -support sending interrupts to other guests sharing the same memory reg=
ion.
> +guest, but is a either a POSIX memory object or a mmap'd file (includi=
ng
> +hugepage-backed file) on the host.
> +
> +Optionally, the device may support sending interrupts to other guests =
sharing
> +the same memory region.
> =20
> =20
>  The Inter-VM PCI device
> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> index 2838866..5d991cf 100644
> --- a/hw/misc/ivshmem.c
> +++ b/hw/misc/ivshmem.c
> @@ -98,6 +98,7 @@ typedef struct IVShmemState {
>      Error *migration_blocker;
> =20
>      char * shmobj;
> +    char * fileobj;
>      char * sizearg;
>      char * role;
>      int role_val;   /* scalar to avoid multiple string comparisons */
> @@ -715,9 +716,10 @@ static int pci_ivshmem_init(PCIDevice *dev)
>          /* if we get a UNIX socket as the parameter we will talk
>           * to the ivshmem server to receive the memory region */
> =20
> -        if (s->shmobj !=3D NULL) {
> -            fprintf(stderr, "WARNING: do not specify both 'chardev' "
> -                                                "and 'shm' with ivshme=
m\n");
> +        if (s->shmobj !=3D NULL || s->fileobj !=3D NULL) {
> +            fprintf(stderr, "WARNING: both 'chardev' and '%s' specifie=
d.\n"
> +                            "Falling back to 'chardev' only.\n",
> +                            s->shmobj ? "shm" : "file");
>          }
> =20
>          IVSHMEM_DPRINTF("using shared memory server (socket =3D %s)\n"=
,
> @@ -743,28 +745,43 @@ static int pci_ivshmem_init(PCIDevice *dev)
>      } else {
>          /* just map the file immediately, we're not using a server */
>          int fd;
> +        int is_shm =3D !!(s->shmobj !=3D NULL);
> +        int is_file =3D !!(s->fileobj !=3D NULL);

Out of curiosity why doing !! on a boolean which would be converted eithe=
r to
zero or one by implicit casting ?

> =20
> -        if (s->shmobj =3D=3D NULL) {
> -            fprintf(stderr, "Must specify 'chardev' or 'shm' to ivshme=
m\n");
> +        if (!(is_shm ^ is_file)) {
> +            fprintf(stderr, "ERROR: both 'file' and 'shm' specified fo=
r the "
> +                            "same ivshmem device.\n");
>              exit(1);
>          }
> =20
> -        IVSHMEM_DPRINTF("using shm_open (shm object =3D %s)\n", s->shm=
obj);
> -
> -        /* try opening with O_EXCL and if it succeeds zero the memory
> -         * by truncating to 0 */
> -        if ((fd =3D shm_open(s->shmobj, O_CREAT|O_RDWR|O_EXCL,
> -                        S_IRWXU|S_IRWXG|S_IRWXO)) > 0) {
> -           /* truncate file to length PCI device's memory */
> -            if (ftruncate(fd, s->ivshmem_size) !=3D 0) {
> -                fprintf(stderr, "ivshmem: could not truncate shared fi=
le\n");
> +        if (is_shm) {
> +            IVSHMEM_DPRINTF("using shm_open (shm object =3D %s)\n", s-=
>shmobj);
> +
> +            /* try opening with O_EXCL and if it succeeds zero the mem=
ory
> +             * by truncating to 0 */
> +            if ((fd =3D shm_open(s->shmobj, O_CREAT|O_RDWR|O_EXCL,
> +                            S_IRWXU|S_IRWXG|S_IRWXO)) > 0) {
> +               /* truncate file to length PCI device's memory */
> +                if (ftruncate(fd, s->ivshmem_size) !=3D 0) {
> +                    fprintf(stderr, "ivshmem: could not truncate"
> +                                    " shared file: %m\n");
> +                    exit(-1);
> +                }
> +
> +            } else if ((fd =3D shm_open(s->shmobj, O_RDWR,
> +                            S_IRWXU|S_IRWXG|S_IRWXO)) < 0) {
> +                fprintf(stderr, "ivshmem: could not open shared file: =
%m\n");
> +                exit(-1);
>              }
> +        } else {
> +            IVSHMEM_DPRINTF("using open (file object =3D %s)\n", s->fi=
leobj);
> =20
> -        } else if ((fd =3D shm_open(s->shmobj, O_CREAT|O_RDWR,
> -                        S_IRWXU|S_IRWXG|S_IRWXO)) < 0) {
> -            fprintf(stderr, "ivshmem: could not open shared file\n");
> -            exit(-1);
> -
> +            /* try opening a mmap's file. This file must have been pre=
viously
> +             * created on the host */
> +            if ((fd =3D open(s->fileobj, O_RDWR)) < 0) {
> +                fprintf(stderr, "ivshmem: could not open mmap'd file: =
%m\n");
> +                exit(-1);
> +            }
>          }
> =20
>          if (check_shm_size(s, fd) =3D=3D -1) {
> @@ -804,6 +821,7 @@ static Property ivshmem_properties[] =3D {
>      DEFINE_PROP_BIT("ioeventfd", IVShmemState, features, IVSHMEM_IOEVE=
NTFD, false),
>      DEFINE_PROP_BIT("msi", IVShmemState, features, IVSHMEM_MSI, true),
>      DEFINE_PROP_STRING("shm", IVShmemState, shmobj),
> +    DEFINE_PROP_STRING("file", IVShmemState, fileobj),
>      DEFINE_PROP_STRING("role", IVShmemState, role),
>      DEFINE_PROP_UINT32("use64", IVShmemState, ivshmem_64bit, 1),
>      DEFINE_PROP_END_OF_LIST(),
> --=20
> 1.7.2.5
>=20
>=20

Hi,

I won't be able to help you much on the semantic of the patch.
However you should ./script/checkpatch.pl before posting:

benoit@Laure:~/qemu (quorum_reboot2)$ ./scripts/checkpatch.pl /tmp/onx=20
ERROR: "foo * bar" should be "foo *bar"
#115: FILE: hw/misc/ivshmem.c:101:
+    char * fileobj;

WARNING: suspect code indent for conditional statements (12, 15)
#162: FILE: hw/misc/ivshmem.c:762:
+            if ((fd =3D shm_open(s->shmobj, O_CREAT|O_RDWR|O_EXCL,
[...]
+               /* truncate file to length PCI device's memory */

ERROR: do not use assignment in if condition
#162: FILE: hw/misc/ivshmem.c:762:
+            if ((fd =3D shm_open(s->shmobj, O_CREAT|O_RDWR|O_EXCL,

ERROR: do not use assignment in if condition
#171: FILE: hw/misc/ivshmem.c:771:
+            } else if ((fd =3D shm_open(s->shmobj, O_RDWR,

ERROR: do not use assignment in if condition
#186: FILE: hw/misc/ivshmem.c:781:
+            if ((fd =3D open(s->fileobj, O_RDWR)) < 0) {

total: 4 errors, 1 warnings, 99 lines checked

/tmp/patch has style problems, please review.  If any of these errors
are false positives report them to the maintainer, see
CHECKPATCH in MAINTAINERS.

Best regards

Beno=EEt

