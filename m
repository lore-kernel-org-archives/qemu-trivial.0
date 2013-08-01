Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V4kZJ-0005eh-I8
	for mharc-qemu-trivial@gnu.org; Thu, 01 Aug 2013 00:32:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1V4kZ9-0005QS-4v
	for qemu-trivial@nongnu.org; Thu, 01 Aug 2013 00:32:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1V4kZ2-0002Q3-TF
	for qemu-trivial@nongnu.org; Thu, 01 Aug 2013 00:32:43 -0400
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:48369)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1V4kYp-0002L7-Ss; Thu, 01 Aug 2013 00:32:24 -0400
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id 8C767159C64;
	Thu,  1 Aug 2013 06:32:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (mail-r86.rz.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id acP0pAEeHy8k; Thu,  1 Aug 2013 06:32:27 +0200 (CEST)
Received: from [192.168.178.35] (p54ADAE04.dip0.t-ipconnect.de [84.173.174.4])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPSA id 86E15159C3B; 
	Thu,  1 Aug 2013 06:32:27 +0200 (CEST)
Message-ID: <51F9E4D4.4090405@weilnetz.de>
Date: Thu, 01 Aug 2013 06:32:20 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Richard W.M. Jones" <rjones@redhat.com>
References: <1375305626-26972-1-git-send-email-rjones@redhat.com>
In-Reply-To: <1375305626-26972-1-git-send-email-rjones@redhat.com>
X-Enigmail-Version: 1.4.6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 134.155.96.80
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, afaerber@suse.de
Subject: Re: [Qemu-trivial] [PATCH v3] block/iscsi.c: Fix printf format
	error.
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
X-List-Received-Date: Thu, 01 Aug 2013 04:32:49 -0000

Am 31.07.2013 23:20, schrieb Richard W.M. Jones:
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
>
> This also splits the long line to comply with qemu coding guidelines.
>
> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>  block/iscsi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/block/iscsi.c b/block/iscsi.c
> index 5f28c6a..e7c1c2b 100644
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
> +                         "iscsilun->block_size %u, sector_num %" PRIi6=
4
> +                         ", nb_sectors %d",
>                           iscsilun->block_size, sector_num, nb_sectors)=
;
>              return 0;
>      }

Reviewed-by: Stefan Weil <sw@weilnetz.de>


