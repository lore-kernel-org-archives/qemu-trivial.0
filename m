Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSSTG-00082d-P8
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jun 2018 15:27:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1fSSTE-00080I-4f
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 15:27:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1fSSTD-0007B3-7T
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 15:27:16 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:58316
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sw@weilnetz.de>)
	id 1fSST5-00073y-GE; Mon, 11 Jun 2018 15:27:07 -0400
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 21EA2DAD094;
	Mon, 11 Jun 2018 21:27:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ACvWKnoXEzbo; Mon, 11 Jun 2018 21:27:04 +0200 (CEST)
Received: from [192.168.178.24] (p5B15159C.dip0.t-ipconnect.de [91.21.21.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
	bits)) (No client certificate requested)
	by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 96C81DAD093; 
	Mon, 11 Jun 2018 21:27:04 +0200 (CEST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	"open list:VDI" <qemu-block@nongnu.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
	<20180611011501.10235-3-f4bug@amsat.org>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <59507b40-1c5e-8782-1b3b-3690e73563ec@weilnetz.de>
Date: Mon, 11 Jun 2018 21:27:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180611011501.10235-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 02/40] vdi: Use
 definitions from "qemu/units.h"
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jun 2018 19:27:17 -0000

Am 11.06.2018 um 03:14 schrieb Philippe Mathieu-Daud=C3=A9:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  block/vdi.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/block/vdi.c b/block/vdi.c
> index 668af0a828..35b51dc5c5 100644
> --- a/block/vdi.c
> +++ b/block/vdi.c
> @@ -50,6 +50,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qapi/qobject-input-visitor.h"
> @@ -83,9 +84,6 @@
>  /* Command line option for static images. */
>  #define BLOCK_OPT_STATIC "static"
> =20
> -#define KiB     1024
> -#define MiB     (KiB * KiB)
> -
>  #define SECTOR_SIZE 512
>  #define DEFAULT_CLUSTER_SIZE (1 * MiB)
> =20
> @@ -250,7 +248,7 @@ static void vdi_header_print(VdiHeader *header)
>      logout("heads       0x%04x\n", header->heads);
>      logout("sectors     0x%04x\n", header->sectors);
>      logout("sector size 0x%04x\n", header->sector_size);
> -    logout("image size  0x%" PRIx64 " B (%" PRIu64 " MiB)\n",
> +    logout("image size  0x%" PRIx64 " B (%llu MiB)\n",
>             header->disk_size, header->disk_size / MiB);
>      logout("block size  0x%04x\n", header->block_size);
>      logout("block extra 0x%04x\n", header->block_extra);
> @@ -434,7 +432,7 @@ static int vdi_open(BlockDriverState *bs, QDict *op=
tions, int flags,
>          goto fail;
>      } else if (header.block_size !=3D DEFAULT_CLUSTER_SIZE) {
>          error_setg(errp, "unsupported VDI image (block size %" PRIu32
> -                   " is not %u)", header.block_size, DEFAULT_CLUSTER_S=
IZE);
> +                   " is not %llu)", header.block_size, DEFAULT_CLUSTER=
_SIZE);
>          ret =3D -ENOTSUP;
>          goto fail;
>      } else if (header.disk_size >
>=20

Reviewed-by: Stefan Weil <sw@weilnetz.de>

