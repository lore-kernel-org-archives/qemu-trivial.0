Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yn4K5-0006GS-LU
	for mharc-qemu-trivial@gnu.org; Tue, 28 Apr 2015 08:09:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Yn4Jy-000607-C7
	for qemu-trivial@nongnu.org; Tue, 28 Apr 2015 08:09:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1Yn4Jt-0002gD-9I
	for qemu-trivial@nongnu.org; Tue, 28 Apr 2015 08:09:02 -0400
Received: from cantor2.suse.de ([195.135.220.15]:38612 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1Yn4Jg-0002Os-G9; Tue, 28 Apr 2015 08:08:44 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 040AAAC35;
	Tue, 28 Apr 2015 12:08:44 +0000 (UTC)
Message-ID: <553F784A.4040004@suse.de>
Date: Tue, 28 Apr 2015 14:08:42 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE Linux GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: arei.gonglei@huawei.com, qemu-devel@nongnu.org
References: <1430212264-9672-1-git-send-email-arei.gonglei@huawei.com>
	<1430212264-9672-4-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1430212264-9672-4-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/3] vhost-user: remove
 superfluous '\n' around error_report()
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
X-List-Received-Date: Tue, 28 Apr 2015 12:09:08 -0000

Am 28.04.2015 um 11:11 schrieb arei.gonglei@huawei.com:
> From: Gonglei <arei.gonglei@huawei.com>
>=20
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  hw/virtio/vhost-user.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index aefe0bb..e7ab829 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -128,7 +128,7 @@ static int vhost_user_read(struct vhost_dev *dev, V=
hostUserMsg *msg)
> =20
>      r =3D qemu_chr_fe_read_all(chr, p, size);
>      if (r !=3D size) {
> -        error_report("Failed to read msg header. Read %d instead of %d=
.\n", r,
> +        error_report("Failed to read msg header. Read %d instead of %d=
.", r,
>                  size);
>          goto fail;
>      }
> @@ -136,7 +136,7 @@ static int vhost_user_read(struct vhost_dev *dev, V=
hostUserMsg *msg)
>      /* validate received flags */
>      if (msg->flags !=3D (VHOST_USER_REPLY_MASK | VHOST_USER_VERSION)) =
{
>          error_report("Failed to read msg header."
> -                " Flags 0x%x instead of 0x%x.\n", msg->flags,
> +                " Flags 0x%x instead of 0x%x.", msg->flags,
>                  VHOST_USER_REPLY_MASK | VHOST_USER_VERSION);
>          goto fail;
>      }
> @@ -144,7 +144,7 @@ static int vhost_user_read(struct vhost_dev *dev, V=
hostUserMsg *msg)
>      /* validate message size is sane */
>      if (msg->size > VHOST_USER_PAYLOAD_SIZE) {
>          error_report("Failed to read msg header."
> -                " Size %d exceeds the maximum %zu.\n", msg->size,
> +                " Size %d exceeds the maximum %zu.", msg->size,
>                  VHOST_USER_PAYLOAD_SIZE);
>          goto fail;
>      }
> @@ -155,7 +155,7 @@ static int vhost_user_read(struct vhost_dev *dev, V=
hostUserMsg *msg)
>          r =3D qemu_chr_fe_read_all(chr, p, size);
>          if (r !=3D size) {
>              error_report("Failed to read msg payload."
> -                         " Read %d instead of %d.\n", r, msg->size);
> +                         " Read %d instead of %d.", r, msg->size);
>              goto fail;
>          }
>      }
> @@ -235,8 +235,8 @@ static int vhost_user_call(struct vhost_dev *dev, u=
nsigned long int request,
>          msg.memory.nregions =3D fd_num;
> =20
>          if (!fd_num) {
> -            error_report("Failed initializing vhost-user memory map\n"
> -                    "consider using -object memory-backend-file share=3D=
on\n");
> +            error_report("Failed initializing vhost-user memory map, "
> +                    "consider using -object memory-backend-file share=3D=
on");

This one is not just dropping a trailing \n, but looks good to me,

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Thanks,
Andreas

>              return -1;
>          }
> =20
> @@ -280,7 +280,7 @@ static int vhost_user_call(struct vhost_dev *dev, u=
nsigned long int request,
>          }
>          break;
>      default:
> -        error_report("vhost-user trying to send unhandled ioctl\n");
> +        error_report("vhost-user trying to send unhandled ioctl");
>          return -1;
>          break;
>      }
> @@ -296,27 +296,27 @@ static int vhost_user_call(struct vhost_dev *dev,=
 unsigned long int request,
> =20
>          if (msg_request !=3D msg.request) {
>              error_report("Received unexpected msg type."
> -                    " Expected %d received %d\n", msg_request, msg.req=
uest);
> +                    " Expected %d received %d", msg_request, msg.reque=
st);
>              return -1;
>          }
> =20
>          switch (msg_request) {
>          case VHOST_USER_GET_FEATURES:
>              if (msg.size !=3D sizeof(m.u64)) {
> -                error_report("Received bad msg size.\n");
> +                error_report("Received bad msg size.");
>                  return -1;
>              }
>              *((__u64 *) arg) =3D msg.u64;
>              break;
>          case VHOST_USER_GET_VRING_BASE:
>              if (msg.size !=3D sizeof(m.state)) {
> -                error_report("Received bad msg size.\n");
> +                error_report("Received bad msg size.");
>                  return -1;
>              }
>              memcpy(arg, &msg.state, sizeof(struct vhost_vring_state));
>              break;
>          default:
> -            error_report("Received unexpected msg type.\n");
> +            error_report("Received unexpected msg type.");
>              return -1;
>              break;
>          }
>=20


--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Jennifer Guild, Dilip Upmanyu,
Graham Norton; HRB 21284 (AG N=FCrnberg)

