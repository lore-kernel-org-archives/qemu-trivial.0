Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SAjDk-0005ou-0k
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2012 10:42:32 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SAjDh-0005gN-Ek
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2012 10:42:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SAjDf-0001vF-HK
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2012 10:42:29 -0400
Received: from cantor2.suse.de ([195.135.220.15]:40818 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1SAjDT-0001pv-Li; Thu, 22 Mar 2012 10:42:15 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 035D190B96;
	Thu, 22 Mar 2012 15:42:13 +0100 (CET)
Message-ID: <4F6B3A45.1000306@suse.de>
Date: Thu, 22 Mar 2012 15:42:13 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120215 Thunderbird/10.0.2
MIME-Version: 1.0
To: Peter Portante <peter.portante@redhat.com>
References: <1332354187-15720-1-git-send-email-peter.portante@redhat.com>
In-Reply-To: <1332354187-15720-1-git-send-email-peter.portante@redhat.com>
X-Enigmail-Version: 1.3.5
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org, Peter Portante <pportant@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Whitespace clean up.
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
X-List-Received-Date: Thu, 22 Mar 2012 14:42:31 -0000

For one, while non-functional, this patch should probably be reviewed by
the block maintainer to not interfere with already queued patches.

Then the subject should indicate which part of code it touches, like
"block: " or "block/raw-posix.c: ". If Kevin agrees to merge this patch
I would suggest to amend the commit message saying that this is
converting tabs to spaces.
We don't usually place a period after the subject line (which happens to
not be a sentence) but that's an irrelevant detail. :)

Our policy has been to not apply formatting-only fixes without an
obvious reason. Is there a patch following that depends on this one?

That being said, the code movement looks correct.

Andreas

Am 21.03.2012 19:23, schrieb Peter Portante:
> Signed-off-by: Peter Portante <pportant@redhat.com>
> ---
>  block/raw-posix.c |   28 ++++++++++++++--------------
>  1 files changed, 14 insertions(+), 14 deletions(-)
>=20
> diff --git a/block/raw-posix.c b/block/raw-posix.c
> index 2d1bc13..719a590 100644
> --- a/block/raw-posix.c
> +++ b/block/raw-posix.c
> @@ -112,7 +112,7 @@
>     reopen it to see if the disk has been changed */
>  #define FD_OPEN_TIMEOUT (1000000000)
> =20
> -#define MAX_BLOCKSIZE	4096
> +#define MAX_BLOCKSIZE   4096
> =20
>  typedef struct BDRVRawState {
>      int fd;
> @@ -494,7 +494,7 @@ again:
>  #endif
>      if (!fstat(fd, &sb) && (S_IFCHR & sb.st_mode)) {
>  #ifdef DIOCGMEDIASIZE
> -	if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size))
> +    if (ioctl(fd, DIOCGMEDIASIZE, (off_t *)&size))
>  #elif defined(DIOCGPART)
>          {
>                  struct partinfo pi;
> @@ -894,7 +894,7 @@ static int hdev_has_zero_init(BlockDriverState *bs)
> =20
>  static BlockDriver bdrv_host_device =3D {
>      .format_name        =3D "host_device",
> -    .protocol_name        =3D "host_device",
> +    .protocol_name      =3D "host_device",
>      .instance_size      =3D sizeof(BDRVRawState),
>      .bdrv_probe_device  =3D hdev_probe_device,
>      .bdrv_file_open     =3D hdev_open,
> @@ -903,12 +903,12 @@ static BlockDriver bdrv_host_device =3D {
>      .create_options     =3D raw_create_options,
>      .bdrv_has_zero_init =3D hdev_has_zero_init,
> =20
> -    .bdrv_aio_readv	=3D raw_aio_readv,
> -    .bdrv_aio_writev	=3D raw_aio_writev,
> -    .bdrv_aio_flush	=3D raw_aio_flush,
> +    .bdrv_aio_readv     =3D raw_aio_readv,
> +    .bdrv_aio_writev    =3D raw_aio_writev,
> +    .bdrv_aio_flush     =3D raw_aio_flush,
> =20
>      .bdrv_truncate      =3D raw_truncate,
> -    .bdrv_getlength	=3D raw_getlength,
> +    .bdrv_getlength     =3D raw_getlength,
>      .bdrv_get_allocated_file_size
>                          =3D raw_get_allocated_file_size,
> =20
> @@ -1015,7 +1015,7 @@ static BlockDriver bdrv_host_floppy =3D {
>      .format_name        =3D "host_floppy",
>      .protocol_name      =3D "host_floppy",
>      .instance_size      =3D sizeof(BDRVRawState),
> -    .bdrv_probe_device	=3D floppy_probe_device,
> +    .bdrv_probe_device  =3D floppy_probe_device,
>      .bdrv_file_open     =3D floppy_open,
>      .bdrv_close         =3D raw_close,
>      .bdrv_create        =3D hdev_create,
> @@ -1024,10 +1024,10 @@ static BlockDriver bdrv_host_floppy =3D {
> =20
>      .bdrv_aio_readv     =3D raw_aio_readv,
>      .bdrv_aio_writev    =3D raw_aio_writev,
> -    .bdrv_aio_flush	=3D raw_aio_flush,
> +    .bdrv_aio_flush     =3D raw_aio_flush,
> =20
>      .bdrv_truncate      =3D raw_truncate,
> -    .bdrv_getlength	=3D raw_getlength,
> +    .bdrv_getlength     =3D raw_getlength,
>      .bdrv_get_allocated_file_size
>                          =3D raw_get_allocated_file_size,
> =20
> @@ -1114,7 +1114,7 @@ static BlockDriver bdrv_host_cdrom =3D {
>      .format_name        =3D "host_cdrom",
>      .protocol_name      =3D "host_cdrom",
>      .instance_size      =3D sizeof(BDRVRawState),
> -    .bdrv_probe_device	=3D cdrom_probe_device,
> +    .bdrv_probe_device  =3D cdrom_probe_device,
>      .bdrv_file_open     =3D cdrom_open,
>      .bdrv_close         =3D raw_close,
>      .bdrv_create        =3D hdev_create,
> @@ -1123,7 +1123,7 @@ static BlockDriver bdrv_host_cdrom =3D {
> =20
>      .bdrv_aio_readv     =3D raw_aio_readv,
>      .bdrv_aio_writev    =3D raw_aio_writev,
> -    .bdrv_aio_flush	=3D raw_aio_flush,
> +    .bdrv_aio_flush     =3D raw_aio_flush,
> =20
>      .bdrv_truncate      =3D raw_truncate,
>      .bdrv_getlength     =3D raw_getlength,
> @@ -1233,7 +1233,7 @@ static BlockDriver bdrv_host_cdrom =3D {
>      .format_name        =3D "host_cdrom",
>      .protocol_name      =3D "host_cdrom",
>      .instance_size      =3D sizeof(BDRVRawState),
> -    .bdrv_probe_device	=3D cdrom_probe_device,
> +    .bdrv_probe_device  =3D cdrom_probe_device,
>      .bdrv_file_open     =3D cdrom_open,
>      .bdrv_close         =3D raw_close,
>      .bdrv_create        =3D hdev_create,
> @@ -1242,7 +1242,7 @@ static BlockDriver bdrv_host_cdrom =3D {
> =20
>      .bdrv_aio_readv     =3D raw_aio_readv,
>      .bdrv_aio_writev    =3D raw_aio_writev,
> -    .bdrv_aio_flush	=3D raw_aio_flush,
> +    .bdrv_aio_flush     =3D raw_aio_flush,
> =20
>      .bdrv_truncate      =3D raw_truncate,
>      .bdrv_getlength     =3D raw_getlength,

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

