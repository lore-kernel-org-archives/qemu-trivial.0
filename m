Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V0FpU-0005ih-R4
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jul 2013 14:55:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1V0FpS-0005iS-M7
	for qemu-trivial@nongnu.org; Fri, 19 Jul 2013 14:54:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1V0FmC-0006w5-MO
	for qemu-trivial@nongnu.org; Fri, 19 Jul 2013 14:51:40 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:45099)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1V0FmC-0006va-CG
	for qemu-trivial@nongnu.org; Fri, 19 Jul 2013 14:51:36 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	434B072809FD; Fri, 19 Jul 2013 20:51:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id MMkdQHYNMPJy; Fri, 19 Jul 2013 20:51:31 +0200 (CEST)
Received: from [192.168.178.35] (p54AD9437.dip0.t-ipconnect.de [84.173.148.55])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	7CD8F72809FC; Fri, 19 Jul 2013 20:51:31 +0200 (CEST)
Message-ID: <51E98AB2.5020000@weilnetz.de>
Date: Fri, 19 Jul 2013 20:51:30 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
References: <1372518648-10862-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1372518648-10862-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.4.6
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] aes: Remove unused code (NDEBUG, u16)
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
X-List-Received-Date: Fri, 19 Jul 2013 18:54:59 -0000

Am 29.06.2013 17:10, schrieb Stefan Weil:
> The current code includes assert.h very early (from qemu-common.h),
> so the definition of NDEBUG was without any effect.
>
> In the initial version from 2004, NDEBUG was used to disable the assertions.
> Those assertions are not in time critical code, so it is no longer
> reasonable to disable them and the definition of NDEBUG can be removed.
>
> Type u16 is also unused and therefore does not need a type definition.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  util/aes.c |    5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/util/aes.c b/util/aes.c
> index 91e97fa..4b4d88e 100644
> --- a/util/aes.c
> +++ b/util/aes.c
> @@ -30,12 +30,7 @@
>  #include "qemu-common.h"
>  #include "qemu/aes.h"
>  
> -#ifndef NDEBUG
> -#define NDEBUG
> -#endif
> -
>  typedef uint32_t u32;
> -typedef uint16_t u16;
>  typedef uint8_t u8;
>  
>  /* This controls loop-unrolling in aes_core.c */


Please apply this patch to the qemu-trivial queue,
and maybe this one, too: http://patchwork.ozlabs.org/patch/257416/.

Thanks,
Stefan


