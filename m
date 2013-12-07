Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VpFb0-0000fK-Qc
	for mharc-qemu-trivial@gnu.org; Sat, 07 Dec 2013 05:58:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <proljc@gmail.com>) id 1VpFay-0000cC-MC
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 05:58:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <proljc@gmail.com>) id 1VpFax-0006NJ-QA
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 05:58:48 -0500
Received: from mail-we0-x234.google.com ([2a00:1450:400c:c03::234]:64737)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <proljc@gmail.com>)
	id 1VpFav-0006Mu-U4; Sat, 07 Dec 2013 05:58:46 -0500
Received: by mail-we0-f180.google.com with SMTP id t61so1660663wes.25
	for <multiple recipients>; Sat, 07 Dec 2013 02:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=aCpWXaLNZ5uV5wEJu+vPK292dKCNAOfERk+hQPCZgQo=;
	b=qCth0Qj4zkpqvqr57VgnG1vQLdeG/SE0qiNzDJPMKSS5pjza6D92pS0By6iNm+2Ysu
	CsOZg1QqUUAMxxML3IU5z/s9AH33/65KrD87Bw2EU7CUiuS9Mt5e4JPfMnvCQStt9Jbe
	6YZJj3JIdFGm68FnOS1hyKRAofJ0TEtIO1F1uEymfHFwKd6BQKYrerD9hiTTMJQorItW
	9t1E3e+LjrYNc3q5P/t9qAE+JL+5qJTcTMeJGCoKyWG179Kn+Z8GNfuyDcUb9Q2+F2+v
	s8kluCTvVzkfgwwKY9tN2NQUM+Vl4ctO9v9FEPhOlfWtEdAPkaEzgnMliqI6lcQVeGTu
	KtqQ==
MIME-Version: 1.0
X-Received: by 10.180.183.72 with SMTP id ek8mr6382788wic.49.1386413924176;
	Sat, 07 Dec 2013 02:58:44 -0800 (PST)
Received: by 10.194.19.3 with HTTP; Sat, 7 Dec 2013 02:58:44 -0800 (PST)
In-Reply-To: <1386404688-17375-1-git-send-email-sw@weilnetz.de>
References: <1386404688-17375-1-git-send-email-sw@weilnetz.de>
Date: Sat, 7 Dec 2013 18:58:44 +0800
Message-ID: <CAJBMM-shhkrYncDEgMVrduGojHth-jMXo3ric5_i+rRJJEYPaQ@mail.gmail.com>
From: Jia Liu <proljc@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::234
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] openrisc: Fix spelling in comment
	(transaltion -> translation)
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
X-List-Received-Date: Sat, 07 Dec 2013 10:58:50 -0000

Hi Stefan,

On Sat, Dec 7, 2013 at 4:24 PM, Stefan Weil <sw@weilnetz.de> wrote:
> I also removed two hyphens in the same comment.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  target-openrisc/translate.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target-openrisc/translate.c b/target-openrisc/translate.c
> index 91c60eb..b381477 100644
> --- a/target-openrisc/translate.c
> +++ b/target-openrisc/translate.c
> @@ -112,7 +112,7 @@ void openrisc_translate_init(void)
>      }
>  }
>
> -/* Writeback SR_F transaltion-space to execution-space.  */
> +/* Writeback SR_F translation space to execution space.  */

Thank you very much!

Reviewed-by: Jia Liu <proljc@gmail.com>

>  static inline void wb_SR_F(void)
>  {
>      int label;
> --
> 1.7.10.4
>

Regards,
Jia

