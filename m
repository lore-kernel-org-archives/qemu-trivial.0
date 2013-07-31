Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V4cpu-0001Un-Uk
	for mharc-qemu-trivial@gnu.org; Wed, 31 Jul 2013 16:17:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1V4cpn-0001LE-LM
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 16:17:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1V4cph-0002n3-HY
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 16:17:23 -0400
Received: from cantor2.suse.de ([195.135.220.15]:51468 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1V4cYm-0001T3-Ni; Wed, 31 Jul 2013 15:59:48 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id DEABCA3B99;
	Wed, 31 Jul 2013 21:59:47 +0200 (CEST)
Message-ID: <51F96CAE.4050706@suse.de>
Date: Wed, 31 Jul 2013 21:59:42 +0200
From: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Richard W.M. Jones" <rjones@redhat.com>
References: <1375299698-16440-1-git-send-email-rjones@redhat.com>
In-Reply-To: <1375299698-16440-1-git-send-email-rjones@redhat.com>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, sw@weilnetz.de, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] block/iscsi.c: Fix
	printf format error.
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
X-List-Received-Date: Wed, 31 Jul 2013 20:17:30 -0000

Am 31.07.2013 21:41, schrieb Richard W.M. Jones:
> From: "Richard W.M. Jones" <rjones@redhat.com>
>=20
> The error on armv7hl was:
>=20
> block/iscsi.c: In function =E2=80=98is_request_lun_aligned=E2=80=99:
> block/iscsi.c:251:26: error: format =E2=80=98%ld=E2=80=99 expects argum=
ent of type =E2=80=98long int=E2=80=99, but argument 3 has type =E2=80=98=
int64_t=E2=80=99 [-Werror=3Dformat=3D]
>                           iscsilun->block_size, sector_num, nb_sectors)=
;
>                           ^
>=20
> This also splits the long line to comply with qemu coding guidelines.
>=20
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>  block/iscsi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/block/iscsi.c b/block/iscsi.c
> index 5f28c6a..03a1c0a 100644
> --- a/block/iscsi.c
> +++ b/block/iscsi.c
> @@ -247,7 +247,9 @@ static bool is_request_lun_aligned(int64_t sector_n=
um, int nb_sectors,
>  {
>      if ((sector_num * BDRV_SECTOR_SIZE) % iscsilun->block_size ||
>          (nb_sectors * BDRV_SECTOR_SIZE) % iscsilun->block_size) {
> -            error_report("iSCSI misaligned request: iscsilun->block_si=
ze %u, sector_num %ld, nb_sectors %d",
> +            error_report("iSCSI misaligned request: "
> +			 "iscsilun->block_size %u, sector_num %" PRIi64
> +			 ", nb_sectors %d",

Tab-damaged now. ;) scripts/checkpatch.pl complains about both issues -
can be used as commit hook for convenience.

Cheers,
Andreas

>                           iscsilun->block_size, sector_num, nb_sectors)=
;
>              return 0;
>      }
>=20


--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=C3=B6rffer; HRB 16746 AG N=C3=BC=
rnberg

