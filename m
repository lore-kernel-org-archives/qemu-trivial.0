Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RusT5-0002OB-0O
	for mharc-qemu-trivial@gnu.org; Tue, 07 Feb 2012 16:20:51 -0500
Received: from eggs.gnu.org ([140.186.70.92]:39356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RusT0-0002C8-RI
	for qemu-trivial@nongnu.org; Tue, 07 Feb 2012 16:20:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RusSz-00074U-Jn
	for qemu-trivial@nongnu.org; Tue, 07 Feb 2012 16:20:46 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:34648)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1RusSx-000742-8m; Tue, 07 Feb 2012 16:20:43 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	D13FF7280013; Tue,  7 Feb 2012 22:20:39 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id J6RUZOCRJGUz; Tue,  7 Feb 2012 22:20:33 +0100 (CET)
Received: from flocke.weilnetz.de (p5086FDB0.dip.t-dialin.net [80.134.253.176])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	583C87280012; Tue,  7 Feb 2012 22:20:33 +0100 (CET)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1RusSm-0001CQ-NW; Tue, 07 Feb 2012 22:20:32 +0100
Message-ID: <4F3195A0.5040604@weilnetz.de>
Date: Tue, 07 Feb 2012 22:20:32 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111110 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1328648247-30117-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1328648247-30117-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl.c: Fix typo in variable
	name
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
X-List-Received-Date: Tue, 07 Feb 2012 21:20:48 -0000

Am 07.02.2012 21:57, schrieb Peter Maydell:
> Fix a typo in a local variable name.
>
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   vl.c |   10 +++++-----
>   1 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/vl.c b/vl.c
> index 63dd725..c4b3aab 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -2030,7 +2030,7 @@ static int configure_accelerator(void)
>       const char *p = NULL;
>       char buf[10];
>       int i, ret;
> -    bool accel_initalised = 0;
> +    bool accel_initialised = 0;
>       bool init_failed = 0;
>    

Reviewed-by: Stefan Weil <sw@weilnetz.de>


