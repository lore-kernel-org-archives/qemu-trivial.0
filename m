Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZIQx-0006TL-PC
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2015 08:55:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZZIQu-0006OA-T9
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 08:55:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZZIQu-0006ZF-2G
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 08:55:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52950)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1ZZIQp-0006YR-NB; Tue, 08 Sep 2015 08:55:27 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 5BD2D8EA2F;
	Tue,  8 Sep 2015 12:55:27 +0000 (UTC)
Received: from [10.36.5.129] (vpn1-5-129.ams2.redhat.com [10.36.5.129])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t88CtPlO013263; Tue, 8 Sep 2015 08:55:26 -0400
To: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org
References: <1440703987-29012-1-git-send-email-lvivier@redhat.com>
	<1440703987-29012-8-git-send-email-lvivier@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <55EEDABD.5090305@redhat.com>
Date: Tue, 8 Sep 2015 14:55:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1440703987-29012-8-git-send-email-lvivier@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 7/9] hpet: remove
	muldiv64()
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
X-List-Received-Date: Tue, 08 Sep 2015 12:55:34 -0000

ping ?

On 27/08/2015 21:33, Laurent Vivier wrote:
> hpet defines a clock period in femtoseconds but
> then converts it to nanoseconds to use the internal
> timers.
> 
> We can define the period in nanoseconds and use it
> directly, this allows to remove muldiv64().
> 
> We only need to convert the period to femtoseconds
> to put it in internal hpet capability register.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  hw/timer/hpet.c         | 6 +++---
>  include/hw/timer/hpet.h | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
> index 2bb6221..3037bef 100644
> --- a/hw/timer/hpet.c
> +++ b/hw/timer/hpet.c
> @@ -126,12 +126,12 @@ static uint32_t hpet_time_after64(uint64_t a, uint64_t b)
>  
>  static uint64_t ticks_to_ns(uint64_t value)
>  {
> -    return (muldiv64(value, HPET_CLK_PERIOD, FS_PER_NS));
> +    return value * HPET_CLK_PERIOD;
>  }
>  
>  static uint64_t ns_to_ticks(uint64_t value)
>  {
> -    return (muldiv64(value, FS_PER_NS, HPET_CLK_PERIOD));
> +    return value / HPET_CLK_PERIOD;
>  }
>  
>  static uint64_t hpet_fixup_reg(uint64_t new, uint64_t old, uint64_t mask)
> @@ -758,7 +758,7 @@ static void hpet_realize(DeviceState *dev, Error **errp)
>      /* 64-bit main counter; LegacyReplacementRoute. */
>      s->capability = 0x8086a001ULL;
>      s->capability |= (s->num_timers - 1) << HPET_ID_NUM_TIM_SHIFT;
> -    s->capability |= ((HPET_CLK_PERIOD) << 32);
> +    s->capability |= ((uint64_t)(HPET_CLK_PERIOD * FS_PER_NS) << 32);
>  
>      qdev_init_gpio_in(dev, hpet_handle_legacy_irq, 2);
>      qdev_init_gpio_out(dev, &s->pit_enabled, 1);
> diff --git a/include/hw/timer/hpet.h b/include/hw/timer/hpet.h
> index 773953b..d872909 100644
> --- a/include/hw/timer/hpet.h
> +++ b/include/hw/timer/hpet.h
> @@ -16,9 +16,9 @@
>  #include "qom/object.h"
>  
>  #define HPET_BASE               0xfed00000
> -#define HPET_CLK_PERIOD         10000000ULL /* 10000000 femtoseconds == 10ns*/
> +#define HPET_CLK_PERIOD         10 /* 10 ns*/
>  
> -#define FS_PER_NS 1000000
> +#define FS_PER_NS 1000000       /* 1000000 femtoseconds == 1 ns */
>  #define HPET_MIN_TIMERS         3
>  #define HPET_MAX_TIMERS         32
>  
> 

