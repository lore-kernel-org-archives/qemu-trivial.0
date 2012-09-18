Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TE132-00016R-Oh
	for mharc-qemu-trivial@gnu.org; Tue, 18 Sep 2012 12:53:20 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60003)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TE12x-0000qv-0q
	for qemu-trivial@nongnu.org; Tue, 18 Sep 2012 12:53:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TE12w-0000Yj-0L
	for qemu-trivial@nongnu.org; Tue, 18 Sep 2012 12:53:14 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:59588)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1TE12n-0000Mc-Cb; Tue, 18 Sep 2012 12:53:05 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	56F097280032; Tue, 18 Sep 2012 18:53:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Ebb2A5sjnR6y; Tue, 18 Sep 2012 18:53:02 +0200 (CEST)
Received: from [192.168.178.20] (p54AD9BEB.dip.t-dialin.net [84.173.155.235])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	672057280029; Tue, 18 Sep 2012 18:53:02 +0200 (CEST)
Message-ID: <5058A6ED.4040902@weilnetz.de>
Date: Tue, 18 Sep 2012 18:53:01 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1347976422-2859-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1347976422-2859-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/pflash_cfi0[12]: Use
	host-utils.h ctz32()
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
X-List-Received-Date: Tue, 18 Sep 2012 16:53:19 -0000

Am 18.09.2012 15:53, schrieb Peter Maydell:
> Drop the private reimplementation of ctz32() from pflash_cfi0[12]
> in favour of using the standard version from host-utils.h.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/pflash_cfi01.c |   37 +------------------------------------
>   hw/pflash_cfi02.c |   37 +------------------------------------
>   2 files changed, 2 insertions(+), 72 deletions(-)
>
> diff --git a/hw/pflash_cfi01.c b/hw/pflash_cfi01.c
> index d1c7423..00f1cdd 100644
> --- a/hw/pflash_cfi01.c
> +++ b/hw/pflash_cfi01.c
> @@ -41,6 +41,7 @@
>   #include "block.h"
>   #include "qemu-timer.h"
>   #include "exec-memory.h"
> +#include "host-utils.h"
>   
>   #define PFLASH_BUG(fmt, ...) \
>   do { \
> @@ -543,42 +544,6 @@ static const MemoryRegionOps pflash_cfi01_ops_le = {
>       .endianness = DEVICE_NATIVE_ENDIAN,
>   };
>   
> -/* Count trailing zeroes of a 32 bits quantity */
> -static int ctz32 (uint32_t n)
> -{
> -    int ret;
> -
> -    ret = 0;
> -    if (!(n & 0xFFFF)) {
> -        ret += 16;
> -        n = n >> 16;
> -    }
> -    if (!(n & 0xFF)) {
> -        ret += 8;
> -        n = n >> 8;
> -    }
> -    if (!(n & 0xF)) {
> -        ret += 4;
> -        n = n >> 4;
> -    }
> -    if (!(n & 0x3)) {
> -        ret += 2;
> -        n = n >> 2;
> -    }
> -    if (!(n & 0x1)) {
> -        ret++;
> -#if 0 /* This is not necessary as n is never 0 */
> -        n = n >> 1;
> -#endif
> -    }
> -#if 0 /* This is not necessary as n is never 0 */
> -    if (!n)
> -        ret++;
> -#endif
> -
> -    return ret;
> -}
> -
>   pflash_t *pflash_cfi01_register(target_phys_addr_t base,
>                                   DeviceState *qdev, const char *name,
>                                   target_phys_addr_t size,
> diff --git a/hw/pflash_cfi02.c b/hw/pflash_cfi02.c
> index 3e2002e..8cb1549 100644
> --- a/hw/pflash_cfi02.c
> +++ b/hw/pflash_cfi02.c
> @@ -40,6 +40,7 @@
>   #include "qemu-timer.h"
>   #include "block.h"
>   #include "exec-memory.h"
> +#include "host-utils.h"
>   
>   //#define PFLASH_DEBUG
>   #ifdef PFLASH_DEBUG
> @@ -575,42 +576,6 @@ static const MemoryRegionOps pflash_cfi02_ops_le = {
>       .endianness = DEVICE_NATIVE_ENDIAN,
>   };
>   
> -/* Count trailing zeroes of a 32 bits quantity */
> -static int ctz32 (uint32_t n)
> -{
> -    int ret;
> -
> -    ret = 0;
> -    if (!(n & 0xFFFF)) {
> -        ret += 16;
> -        n = n >> 16;
> -    }
> -    if (!(n & 0xFF)) {
> -        ret += 8;
> -        n = n >> 8;
> -    }
> -    if (!(n & 0xF)) {
> -        ret += 4;
> -        n = n >> 4;
> -    }
> -    if (!(n & 0x3)) {
> -        ret += 2;
> -        n = n >> 2;
> -    }
> -    if (!(n & 0x1)) {
> -        ret++;
> -#if 0 /* This is not necessary as n is never 0 */
> -        n = n >> 1;
> -#endif
> -    }
> -#if 0 /* This is not necessary as n is never 0 */
> -    if (!n)
> -        ret++;
> -#endif
> -
> -    return ret;
> -}
> -
>   pflash_t *pflash_cfi02_register(target_phys_addr_t base,
>                                   DeviceState *qdev, const char *name,
>                                   target_phys_addr_t size,

Reviewed-by: Stefan Weil <sw@weilnetz.de>

What about moving the ctz32 function (or even all of host-utils.h) to 
bitops.h?

- sw



