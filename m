Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XyDui-00048k-Ha
	for mharc-qemu-trivial@gnu.org; Tue, 09 Dec 2014 01:04:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45796)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1XyDua-0003zL-CX
	for qemu-trivial@nongnu.org; Tue, 09 Dec 2014 01:04:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1XyDuU-0005km-CA
	for qemu-trivial@nongnu.org; Tue, 09 Dec 2014 01:04:40 -0500
Received: from mail-r83.rz.uni-mannheim.de ([134.155.96.83]:56280)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1XyDuI-0005iW-8h; Tue, 09 Dec 2014 01:04:22 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail-r83.rz.uni-mannheim.de (Postfix) with ESMTP id 17007101221;
	Tue,  9 Dec 2014 07:04:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from mail-r83.rz.uni-mannheim.de ([134.155.96.83])
	by localhost (smtp.mail.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ji97b2qN3NeJ; Tue,  9 Dec 2014 07:04:21 +0100 (CET)
Received: from [192.168.178.35] (p54AC95D5.dip0.t-ipconnect.de
	[84.172.149.213])
	by mail-r83.rz.uni-mannheim.de (Postfix) with ESMTPSA id A38D31011BB;
	Tue,  9 Dec 2014 07:04:20 +0100 (CET)
Message-ID: <548690E3.2090705@weilnetz.de>
Date: Tue, 09 Dec 2014 07:04:19 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: zhanghailiang <zhang.zhanghailiang@huawei.com>, 
 qemu-trivial@nongnu.org
References: <1418103867-11516-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1418103867-11516-1-git-send-email-zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 134.155.96.83
Cc: armbru@redhat.com, qemu-devel@nongnu.org, afaerber@suse.de,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vt82c686: fix coverity
 warning about out-of-bounds write
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
X-List-Received-Date: Tue, 09 Dec 2014 06:04:46 -0000

Am 09.12.2014 um 06:44 schrieb zhanghailiang:
> Refactor superio_ioport_writeb to fix the out of bounds write warning.
>=20
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  hw/isa/vt82c686.c | 39 ++++++++++++++++++---------------------
>  1 file changed, 18 insertions(+), 21 deletions(-)
>=20
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index e0c235c..4516af0 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -50,13 +50,13 @@ typedef struct VT82C686BState {
>  static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t =
data,
>                                    unsigned size)
>  {
> -    int can_write;
>      SuperIOConfig *superio_conf =3D opaque;
> =20
>      DPRINTF("superio_ioport_writeb  address 0x%x  val 0x%x\n", addr, d=
ata);
>      if (addr =3D=3D 0x3f0) {
>          superio_conf->index =3D data & 0xff;
>      } else {
> +        int can_write =3D 1;


IMHO using bool instead of int would be better here (and false, true in
the following code).

>          /* 0x3f1 */
>          switch (superio_conf->index) {
>          case 0x00 ... 0xdf:
> @@ -70,28 +70,25 @@ static void superio_ioport_writeb(void *opaque, hwa=
ddr addr, uint64_t data,
>          case 0xfd ... 0xff:
>              can_write =3D 0;
>              break;
> -        default:
> -            can_write =3D 1;
> -
> -            if (can_write) {
> -                switch (superio_conf->index) {
> -                case 0xe7:
> -                    if ((data & 0xff) !=3D 0xfe) {
> -                        DPRINTF("chage uart 1 base. unsupported yet\n"=
);
> -                    }
> -                    break;
> -                case 0xe8:
> -                    if ((data & 0xff) !=3D 0xbe) {
> -                        DPRINTF("chage uart 2 base. unsupported yet\n"=
);
> -                    }
> -                    break;
> -
> -                default:
> -                    superio_conf->config[superio_conf->index] =3D data=
 & 0xff;
> -                }
> +        case 0xe7:
> +            if ((data & 0xff) !=3D 0xfe) {
> +                DPRINTF("chage uart 1 base. unsupported yet\n");

This text looks strange. Maybe a typo?

> +                can_write =3D 0;
> +            }
> +            break;
> +        case 0xe8:
> +            if ((data & 0xff) !=3D 0xbe) {
> +                DPRINTF("chage uart 2 base. unsupported yet\n");

This text looks strange. Maybe a typo?

> +                can_write =3D 0;
>              }
> +            break;
> +        default:
> +            break;
> +
> +        }
> +        if (can_write) {
> +            superio_conf->config[superio_conf->index] =3D data & 0xff;
>          }
> -        superio_conf->config[superio_conf->index] =3D data & 0xff;
>      }
>  }


Regards
Stefan


