Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUv77-0007K4-Tv
	for mharc-qemu-trivial@gnu.org; Thu, 27 Aug 2015 07:13:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ZUv74-0007EI-Iu
	for qemu-trivial@nongnu.org; Thu, 27 Aug 2015 07:12:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ZUv73-0004Xh-85
	for qemu-trivial@nongnu.org; Thu, 27 Aug 2015 07:12:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58343)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1ZUv6y-0004VA-Ld; Thu, 27 Aug 2015 07:12:52 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id ED2EC461DD;
	Thu, 27 Aug 2015 11:12:51 +0000 (UTC)
Received: from redhat.com (ovpn-116-110.ams2.redhat.com [10.36.116.110])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id t7RBCnSJ006415; Thu, 27 Aug 2015 07:12:50 -0400
Date: Thu, 27 Aug 2015 14:12:49 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20150827140927-mutt-send-email-mst@redhat.com>
References: <1440612338-5912-1-git-send-email-lvivier@redhat.com>
	<1440612338-5912-2-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1440612338-5912-2-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v2 1/7] PCI: remove muldiv64()
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
X-List-Received-Date: Thu, 27 Aug 2015 11:12:59 -0000

On Wed, Aug 26, 2015 at 08:05:32PM +0200, Laurent Vivier wrote:
> Originally, timers were ticks based, and it made sense to
> add ticks to current time to know when to trigger an alarm.
> 
> But since commit:
> 
> 7447545 change all other clock references to use nanosecond resolution accessors
> 
> All timers use nanoseconds and we need to convert ticks to nanoseconds, by
> doing something like:
> 
>     y = muldiv64(x, get_ticks_per_sec(), PCI_FREQUENCY)
> 
> where x is the number of device ticks and y the number of system ticks.
> 
> y is used as nanoseconds in timer functions,
> it works because 1 tick is 1 nanosecond.
> (get_ticks_per_sec() is 10^9)
> 
> But as PCI frequency is 33 MHz, we can also do:
> 
>     y = x * 30; /* 33 MHz PCI period is 30 ns */
> 
> Which is much more simple.
> 
> This implies a 33.333333 MHz PCI frequency,
> but this is correct.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

I think you should split this with a patch per devices.
Otherwise, it's up to net maintainers: pls Cc them all.
And I don't think qemu-trivial is appropriate here.

> ---
>  hw/net/pcnet.c             |  3 +--
>  hw/net/rtl8139.c           | 14 ++++++--------
>  hw/watchdog/wdt_i6300esb.c | 11 +++--------
>  tests/rtl8139-test.c       |  2 +-
>  4 files changed, 11 insertions(+), 19 deletions(-)
> 
> diff --git a/hw/net/pcnet.c b/hw/net/pcnet.c
> index 3437376..0eb3cc4 100644
> --- a/hw/net/pcnet.c
> +++ b/hw/net/pcnet.c
> @@ -670,8 +670,7 @@ static inline hwaddr pcnet_rdra_addr(PCNetState *s, int idx)
>  static inline int64_t pcnet_get_next_poll_time(PCNetState *s, int64_t current_time)
>  {
>      int64_t next_time = current_time +
> -        muldiv64(65536 - (CSR_SPND(s) ? 0 : CSR_POLL(s)),
> -                 get_ticks_per_sec(), 33000000L);
> +                        (65536 - (CSR_SPND(s) ? 0 : CSR_POLL(s))) * 30;
>      if (next_time <= current_time)
>          next_time = current_time + 1;
>      return next_time;
> diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
> index edbb61c..1e119e6 100644
> --- a/hw/net/rtl8139.c
> +++ b/hw/net/rtl8139.c
> @@ -63,7 +63,7 @@
>  /* debug RTL8139 card */
>  //#define DEBUG_RTL8139 1
>  
> -#define PCI_FREQUENCY 33000000L
> +#define PCI_PERIOD 30    /* 30 ns period = 33.333333 Mhz frequency */
>  
>  #define SET_MASKED(input, mask, curr) \
>      ( ( (input) & ~(mask) ) | ( (curr) & (mask) ) )

Pls rename this RTL8139_PCI_PERIOD to avoid namespace pollution.

> @@ -2881,8 +2881,7 @@ static void rtl8139_io_writew(void *opaque, uint8_t addr, uint32_t val)
>  
>  static void rtl8139_set_next_tctr_time(RTL8139State *s)
>  {
> -    const uint64_t ns_per_period =
> -        muldiv64(0x100000000LL, get_ticks_per_sec(), PCI_FREQUENCY);
> +    const uint64_t ns_per_period = (uint64_t)PCI_PERIOD << 32;
>  
>      DPRINTF("entered rtl8139_set_next_tctr_time\n");
>  
> @@ -2900,7 +2899,7 @@ static void rtl8139_set_next_tctr_time(RTL8139State *s)
>      if (!s->TimerInt) {
>          timer_del(s->timer);
>      } else {
> -        uint64_t delta = muldiv64(s->TimerInt, get_ticks_per_sec(), PCI_FREQUENCY);
> +        uint64_t delta = (uint64_t)s->TimerInt * PCI_PERIOD;
>          if (s->TCTR_base + delta <= qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)) {
>              delta += ns_per_period;
>          }
> @@ -3174,8 +3173,8 @@ static uint32_t rtl8139_io_readl(void *opaque, uint8_t addr)
>              break;
>  
>          case Timer:
> -            ret = muldiv64(qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - s->TCTR_base,
> -                           PCI_FREQUENCY, get_ticks_per_sec());
> +            ret = (qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) - s->TCTR_base) /
> +                  PCI_PERIOD;
>              DPRINTF("TCTR Timer read val=0x%08x\n", ret);
>              break;
>  
> @@ -3269,8 +3268,7 @@ static void rtl8139_pre_save(void *opaque)
>      int64_t current_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
>  
>      /* for migration to older versions */
> -    s->TCTR = muldiv64(current_time - s->TCTR_base, PCI_FREQUENCY,
> -                       get_ticks_per_sec());
> +    s->TCTR = (current_time - s->TCTR_base) / PCI_PERIOD;
>      s->rtl8139_mmio_io_addr_dummy = 0;
>  }
>  
> diff --git a/hw/watchdog/wdt_i6300esb.c b/hw/watchdog/wdt_i6300esb.c
> index cfa2b1b..a91c8fd 100644
> --- a/hw/watchdog/wdt_i6300esb.c
> +++ b/hw/watchdog/wdt_i6300esb.c
> @@ -129,14 +129,9 @@ static void i6300esb_restart_timer(I6300State *d, int stage)
>      else
>          timeout <<= 5;
>  
> -    /* Get the timeout in units of ticks_per_sec.
> -     *
> -     * ticks_per_sec is typically 10^9 == 0x3B9ACA00 (30 bits), with
> -     * 20 bits of user supplied preload, and 15 bits of scale, the
> -     * multiply here can exceed 64-bits, before we divide by 33MHz, so
> -     * we use a higher-precision intermediate result.
> -     */
> -    timeout = muldiv64(get_ticks_per_sec(), timeout, 33000000);
> +    /* Get the timeout in nanoseconds. */
> +
> +    timeout = timeout * 30; /* on a PCI bus, 1 tick is 30 ns*/
>  
>      i6300esb_debug("stage %d, timeout %" PRIi64 "\n", d->stage, timeout);
>  
> diff --git a/tests/rtl8139-test.c b/tests/rtl8139-test.c
> index e749be3..ba62851 100644
> --- a/tests/rtl8139-test.c
> +++ b/tests/rtl8139-test.c
> @@ -20,7 +20,7 @@ static void nop(void)
>  {
>  }
>  
> -#define CLK 33000000
> +#define CLK 33333333
>  
>  static QPCIBus *pcibus;
>  static QPCIDevice *dev;
> -- 
> 2.1.0

