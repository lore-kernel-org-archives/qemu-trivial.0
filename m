Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZV3iN-0007S9-IM
	for mharc-qemu-trivial@gnu.org; Thu, 27 Aug 2015 16:24:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZV3iK-0007P0-JP
	for qemu-trivial@nongnu.org; Thu, 27 Aug 2015 16:24:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZV3iJ-00052n-QW
	for qemu-trivial@nongnu.org; Thu, 27 Aug 2015 16:24:00 -0400
Received: from mail-wi0-x233.google.com ([2a00:1450:400c:c05::233]:38199)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZV3iH-00052I-Gq; Thu, 27 Aug 2015 16:23:57 -0400
Received: by wicgk12 with SMTP id gk12so2957035wic.1;
	Thu, 27 Aug 2015 13:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fey9WbUMzaD9MbetM0EsnJh6SUGT55zMd3L/BHZI/r0=;
	b=wTbYAztmU2IrxlATOoyCKQqIpK4z5SIcHNC4QzUd8b6q9M5Mj25O8DAYx5pkFrk46A
	TXwpPGloTRxIfPZcZedfvKRmekzaEbFNh+glgtqMyCCACl9IHLRih0yRW8C8qfZZtsXx
	oOjdO2WLc14Re7GBJD9Bj4fYZ3qeoK6J7PcOs0S/Afm5X1SZL0sae/IPgE41tDY3dyHz
	ApzS9aEK2JCEKH3nPSk+Mg3cP081qz7/R9zIpV3Ulu+rlplKR7ehRgIN4rgm9kzh6o9o
	ptTzZDVoyV87Zj6imqY+8MVz9kzUhSTNf9cA17Dvmj6jz4Bn+BfgNnG66UVeQVJbiW4J
	azzA==
MIME-Version: 1.0
X-Received: by 10.180.108.136 with SMTP id hk8mr391891wib.47.1440707036845;
	Thu, 27 Aug 2015 13:23:56 -0700 (PDT)
Received: by 10.28.0.215 with HTTP; Thu, 27 Aug 2015 13:23:56 -0700 (PDT)
In-Reply-To: <1440703987-29012-7-git-send-email-lvivier@redhat.com>
References: <1440703987-29012-1-git-send-email-lvivier@redhat.com>
	<1440703987-29012-7-git-send-email-lvivier@redhat.com>
Date: Thu, 27 Aug 2015 13:23:56 -0700
Message-ID: <CAPokK=pMG7AP-g+3Z58943JYuVmdQF2-mN==u+=_Chi4Rwprvg@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::233
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 6/9] arm: clarify the use
	of muldiv64()
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
X-List-Received-Date: Thu, 27 Aug 2015 20:24:01 -0000

On Thu, Aug 27, 2015 at 12:33 PM, Laurent Vivier <lvivier@redhat.com> wrote:
> muldiv64() is used to convert microseconds into CPU ticks.
>
> But it is not clear and not commented. This patch uses macro
> to clearly identify what is used: time, CPU frequency and ticks.
> For an elapsed time and a given frequency, we compute how many ticks
>  we have.
>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>

> ---
> v2: replace "arm: remove muldiv64()"
>  target-arm/helper.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/target-arm/helper.c b/target-arm/helper.c
> index 7df1f06..4455761 100644
> --- a/target-arm/helper.c
> +++ b/target-arm/helper.c
> @@ -12,6 +12,8 @@
>  #include <zlib.h> /* For crc32 */
>  #include "exec/semihost.h"
>
> +#define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
> +
>  #ifndef CONFIG_USER_ONLY
>  static inline bool get_phys_addr(CPUARMState *env, target_ulong address,
>                                   int access_type, ARMMMUIdx mmu_idx,
> @@ -678,8 +680,8 @@ void pmccntr_sync(CPUARMState *env)
>  {
>      uint64_t temp_ticks;
>
> -    temp_ticks = muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
> -                          get_ticks_per_sec(), 1000000);
> +    temp_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> +                          ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
>
>      if (env->cp15.c9_pmcr & PMCRD) {
>          /* Increment once every 64 processor clock cycles */
> @@ -717,8 +719,8 @@ static uint64_t pmccntr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>          return env->cp15.c15_ccnt;
>      }
>
> -    total_ticks = muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
> -                           get_ticks_per_sec(), 1000000);
> +    total_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> +                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
>
>      if (env->cp15.c9_pmcr & PMCRD) {
>          /* Increment once every 64 processor clock cycles */
> @@ -738,8 +740,8 @@ static void pmccntr_write(CPUARMState *env, const ARMCPRegInfo *ri,
>          return;
>      }
>
> -    total_ticks = muldiv64(qemu_clock_get_us(QEMU_CLOCK_VIRTUAL),
> -                           get_ticks_per_sec(), 1000000);
> +    total_ticks = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL),
> +                           ARM_CPU_FREQ, NANOSECONDS_PER_SECOND);
>
>      if (env->cp15.c9_pmcr & PMCRD) {
>          /* Increment once every 64 processor clock cycles */
> --
> 2.1.0
>
>

