Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V4c5e-0000IM-8W
	for mharc-qemu-trivial@gnu.org; Wed, 31 Jul 2013 15:29:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1V4c5V-00005C-HO
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 15:29:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1V4c5M-0001mF-SM
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 15:29:33 -0400
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:39853)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1V4c56-0001ex-Un; Wed, 31 Jul 2013 15:29:09 -0400
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id 0C443159E3C;
	Wed, 31 Jul 2013 21:29:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (mail-r86.rz.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id HAGobdvr42uy; Wed, 31 Jul 2013 21:29:13 +0200 (CEST)
Received: from [192.168.178.35] (p54ADA5FB.dip0.t-ipconnect.de
	[84.173.165.251])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPSA id 471EE159E20;
	Wed, 31 Jul 2013 21:29:13 +0200 (CEST)
Message-ID: <51F96582.4070602@weilnetz.de>
Date: Wed, 31 Jul 2013 21:29:06 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Richard W.M. Jones" <rjones@redhat.com>
References: <1375297725-11344-1-git-send-email-rjones@redhat.com>
In-Reply-To: <1375297725-11344-1-git-send-email-rjones@redhat.com>
X-Enigmail-Version: 1.4.6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 134.155.96.80
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block/iscsi.c: Fix printf
	format error.
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
X-List-Received-Date: Wed, 31 Jul 2013 19:29:41 -0000

Am 31.07.2013 21:08, schrieb Richard W.M. Jones:
> From: "Richard W.M. Jones" <rjones@redhat.com>
>
> The error on armv7hl was:
>
> block/iscsi.c: In function =E2=80=98is_request_lun_aligned=E2=80=99:
> block/iscsi.c:251:26: error: format =E2=80=98%ld=E2=80=99 expects argum=
ent of type =E2=80=98long int=E2=80=99, but argument 3 has type =E2=80=98=
int64_t=E2=80=99 [-Werror=3Dformat=3D]
>                           iscsilun->block_size, sector_num, nb_sectors)=
;
>                           ^
> ---
>  block/iscsi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/block/iscsi.c b/block/iscsi.c
> index 5f28c6a..d02b4fc 100644
> --- a/block/iscsi.c
> +++ b/block/iscsi.c
> @@ -247,7 +247,7 @@ static bool is_request_lun_aligned(int64_t sector_n=
um, int nb_sectors,
>  {
>      if ((sector_num * BDRV_SECTOR_SIZE) % iscsilun->block_size ||
>          (nb_sectors * BDRV_SECTOR_SIZE) % iscsilun->block_size) {
> -            error_report("iSCSI misaligned request: iscsilun->block_si=
ze %u, sector_num %ld, nb_sectors %d",
> +            error_report("iSCSI misaligned request: iscsilun->block_si=
ze %u, sector_num %" PRIi64 ", nb_sectors %d",
>                           iscsilun->block_size, sector_num, nb_sectors)=
;
>              return 0;
>      }

Hello Richard,

the fix looks good, but the line is rather long.
It was already too long before, but should now
be split to satisfy the coding style.

Regards,
Stefan


