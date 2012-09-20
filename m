Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TEk4D-00047o-1O
	for mharc-qemu-trivial@gnu.org; Thu, 20 Sep 2012 12:57:33 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TEk43-0003dD-Hg
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2012 12:57:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TEk3x-0000YD-SH
	for qemu-trivial@nongnu.org; Thu, 20 Sep 2012 12:57:23 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:43320)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1TEk3m-0000WK-KJ; Thu, 20 Sep 2012 12:57:06 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	080677280033; Thu, 20 Sep 2012 18:57:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id PUdxazEmxM+I; Thu, 20 Sep 2012 18:57:05 +0200 (CEST)
Received: from flocke.weilnetz.de (p54AD9B9D.dip.t-dialin.net [84.173.155.157])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	826047280032; Thu, 20 Sep 2012 18:57:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1TEk3l-00012n-6N; Thu, 20 Sep 2012 18:57:05 +0200
Message-ID: <505B4AE1.6000505@weilnetz.de>
Date: Thu, 20 Sep 2012 18:57:05 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20120724 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
References: <1346497248-14659-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1346497248-14659-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] pflash_cfi01: Fix warning caused by
	unreachable code
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
X-List-Received-Date: Thu, 20 Sep 2012 16:57:31 -0000

Am 01.09.2012 13:00, schrieb Stefan Weil:
> Report from smatch:
> hw/pflash_cfi01.c:431 pflash_write(180) info: ignoring unreachable code.
>
> Instead of removing the return statement after the switch statement,
> the patch replaces the return statements in the switch statement by
> break statements. Other switch statements in the same code do it also
> like that.
>
> Signed-off-by: Stefan Weil<sw@weilnetz.de>
> ---
>   hw/pflash_cfi01.c |    8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/pflash_cfi01.c b/hw/pflash_cfi01.c
> index d1c7423..56ed33f 100644
> --- a/hw/pflash_cfi01.c
> +++ b/hw/pflash_cfi01.c
> @@ -320,7 +320,7 @@ static void pflash_write(pflash_t *pfl, target_phys_addr_t offset,
>           }
>           pfl->wcycle++;
>           pfl->cmd = cmd;
> -        return;
> +        break;
>       case 1:
>           switch (pfl->cmd) {
>           case 0x10: /* Single Byte Program */
> @@ -375,7 +375,7 @@ static void pflash_write(pflash_t *pfl, target_phys_addr_t offset,
>           default:
>               goto error_flash;
>           }
> -        return;
> +        break;
>       case 2:
>           switch (pfl->cmd) {
>           case 0xe8: /* Block write */
> @@ -406,7 +406,7 @@ static void pflash_write(pflash_t *pfl, target_phys_addr_t offset,
>           default:
>               goto error_flash;
>           }
> -        return;
> +        break;
>       case 3: /* Confirm mode */
>           switch (pfl->cmd) {
>           case 0xe8: /* Block write */
> @@ -422,7 +422,7 @@ static void pflash_write(pflash_t *pfl, target_phys_addr_t offset,
>           default:
>               goto error_flash;
>           }
> -        return;
> +        break;
>       default:
>           /* Should never happen */
>           DPRINTF("%s: invalid write state\n",  __func__);
>    

Ping?


