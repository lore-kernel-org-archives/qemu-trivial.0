Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFXFs-00013G-9S
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 17:28:52 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TFXFp-0000us-ET
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 17:28:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TFXFo-0001yq-Cw
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 17:28:49 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:33701)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1TFXFl-0001y2-VS; Sat, 22 Sep 2012 17:28:46 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	6ED157280033; Sat, 22 Sep 2012 23:28:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id UlXEKcQYxnqX; Sat, 22 Sep 2012 23:28:43 +0200 (CEST)
Received: from flocke.weilnetz.de (p54ADAD92.dip.t-dialin.net [84.173.173.146])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	86B727280032; Sat, 22 Sep 2012 23:28:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1TFXFj-00017c-7h; Sat, 22 Sep 2012 23:28:43 +0200
Message-ID: <505E2D8B.5060309@weilnetz.de>
Date: Sat, 22 Sep 2012 23:28:43 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20120724 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
References: <1346789659-6824-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1346789659-6824-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] linux-user: Remove redundant null check
 and replace free by g_free
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
X-List-Received-Date: Sat, 22 Sep 2012 21:28:50 -0000

Am 04.09.2012 22:14, schrieb Stefan Weil:
> Report from smatch:
>
> linux-user/syscall.c:3632 do_ioctl_dm(220) info:
>   redundant null check on big_buf calling free()
>
> 'big_buf' was allocated by g_malloc0, therefore free was also
> replaced by g_free.
>
> Signed-off-by: Stefan Weil<sw@weilnetz.de>
> ---
>   linux-user/syscall.c |    4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 1513f08..c3533da 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -3628,9 +3628,7 @@ static abi_long do_ioctl_dm(const IOCTLEntry *ie, uint8_t *buf_temp, int fd,
>           unlock_user(argptr, arg, target_size);
>       }
>   out:
> -    if (big_buf) {
> -        free(big_buf);
> -    }
> +    g_free(big_buf);
>       return ret;
>   }
>

Ping? Maybe qemu-trivial can take that patch, it's trivial enough.
Peter reviewed it, see http://patchwork.ozlabs.org/patch/181669/.

Regards

Stefan



