Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TEQJ6-0005v0-RA
	for mharc-qemu-trivial@gnu.org; Wed, 19 Sep 2012 15:51:36 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34096)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TEQJ2-0005h8-Fm
	for qemu-trivial@nongnu.org; Wed, 19 Sep 2012 15:51:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TEQIw-0005R9-Mq
	for qemu-trivial@nongnu.org; Wed, 19 Sep 2012 15:51:32 -0400
Received: from hall.aurel32.net ([88.191.126.93]:42563)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1TEQIq-0005HX-2e; Wed, 19 Sep 2012 15:51:20 -0400
Received: from [2001:470:d4ed:1:2db:dfff:fe14:52d] (helo=ohm.aurel32.net)
	by hall.aurel32.net with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <aurelien@aurel32.net>)
	id 1TEQIh-0004Wd-Q9; Wed, 19 Sep 2012 21:51:11 +0200
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.80)
	(envelope-from <aurelien@aurel32.net>)
	id 1TEQIg-000331-9L; Wed, 19 Sep 2012 21:51:10 +0200
Date: Wed, 19 Sep 2012 21:51:10 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120919195110.GA11273@ohm.aurel32.net>
References: <1347976422-2859-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1347976422-2859-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: Mutt 1.5.21 (2010-09-15)
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 88.191.126.93
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
X-List-Received-Date: Wed, 19 Sep 2012 19:51:34 -0000

On Tue, Sep 18, 2012 at 02:53:42PM +0100, Peter Maydell wrote:
> Drop the private reimplementation of ctz32() from pflash_cfi0[12]
> in favour of using the standard version from host-utils.h.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/pflash_cfi01.c |   37 +------------------------------------
>  hw/pflash_cfi02.c |   37 +------------------------------------
>  2 files changed, 2 insertions(+), 72 deletions(-)
> 
> diff --git a/hw/pflash_cfi01.c b/hw/pflash_cfi01.c
> index d1c7423..00f1cdd 100644
> --- a/hw/pflash_cfi01.c
> +++ b/hw/pflash_cfi01.c
> @@ -41,6 +41,7 @@
>  #include "block.h"
>  #include "qemu-timer.h"
>  #include "exec-memory.h"
> +#include "host-utils.h"
>  
>  #define PFLASH_BUG(fmt, ...) \
>  do { \
> @@ -543,42 +544,6 @@ static const MemoryRegionOps pflash_cfi01_ops_le = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
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
>  pflash_t *pflash_cfi01_register(target_phys_addr_t base,
>                                  DeviceState *qdev, const char *name,
>                                  target_phys_addr_t size,
> diff --git a/hw/pflash_cfi02.c b/hw/pflash_cfi02.c
> index 3e2002e..8cb1549 100644
> --- a/hw/pflash_cfi02.c
> +++ b/hw/pflash_cfi02.c
> @@ -40,6 +40,7 @@
>  #include "qemu-timer.h"
>  #include "block.h"
>  #include "exec-memory.h"
> +#include "host-utils.h"
>  
>  //#define PFLASH_DEBUG
>  #ifdef PFLASH_DEBUG
> @@ -575,42 +576,6 @@ static const MemoryRegionOps pflash_cfi02_ops_le = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
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
>  pflash_t *pflash_cfi02_register(target_phys_addr_t base,
>                                  DeviceState *qdev, const char *name,
>                                  target_phys_addr_t size,

Thanks, applied.

-- 
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

