Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eEW0N-0004O5-Hm
	for mharc-qemu-trivial@gnu.org; Tue, 14 Nov 2017 02:51:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eEW0E-0004Ke-Mz
	for qemu-trivial@nongnu.org; Tue, 14 Nov 2017 02:51:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eEW0D-0002zv-Er
	for qemu-trivial@nongnu.org; Tue, 14 Nov 2017 02:51:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35966)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eEW06-0002sV-Qu; Tue, 14 Nov 2017 02:51:19 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D9370C0587DF;
	Tue, 14 Nov 2017 07:51:17 +0000 (UTC)
Received: from [10.36.116.149] (ovpn-116-149.ams2.redhat.com [10.36.116.149])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D6F7226F4;
	Tue, 14 Nov 2017 07:51:15 +0000 (UTC)
To: Alistair Francis <alistair.francis@xilinx.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: alistair23@gmail.com, armbru@redhat.com
References: <cover.1510612380.git.alistair.francis@xilinx.com>
	<a09d5f8c16c55ae51867267607d7b657e279d1cb.1510612380.git.alistair.francis@xilinx.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <107707f0-68a6-df4a-cc15-79473cf3a841@redhat.com>
Date: Tue, 14 Nov 2017 08:51:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <a09d5f8c16c55ae51867267607d7b657e279d1cb.1510612380.git.alistair.francis@xilinx.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 14 Nov 2017 07:51:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 26/29] hw/timer: Replace
 fprintf(stderr, "*\n" with error_report()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Nov 2017 07:51:31 -0000

On 13.11.2017 23:36, Alistair Francis wrote:
> Replace a large number of the fprintf(stderr, "*\n" calls with
> error_report(). The functions were renamed with these commands and then
> compiler issues where manually fixed.
[...]
> diff --git a/hw/timer/omap_gptimer.c b/hw/timer/omap_gptimer.c
> index ae2dc99832..0f064241d3 100644
> --- a/hw/timer/omap_gptimer.c
> +++ b/hw/timer/omap_gptimer.c
> @@ -18,6 +18,7 @@
>   * with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
>  #include "qemu/osdep.h"
> +#include "qemu/error-report.h"
>  #include "hw/hw.h"
>  #include "qemu/timer.h"
>  #include "hw/arm/omap.h"
> @@ -356,7 +357,7 @@ static void omap_gp_timer_write(void *opaque, hwaddr addr,
>      case 0x10:	/* TIOCP_CFG */
>          s->config = value & 0x33d;
>          if (((value >> 3) & 3) == 3)				/* IDLEMODE */
> -            fprintf(stderr, "%s: illegal IDLEMODE value in TIOCP_CFG\n",
> +            error_report("%s: illegal IDLEMODE value in TIOCP_CFG",
>                              __func__);

Wrong indentation.

>          if (value & 2)						/* SOFTRESET */
>              omap_gp_timer_reset(s);
> @@ -394,11 +395,11 @@ static void omap_gp_timer_write(void *opaque, hwaddr addr,
>          s->ar = (value >> 1) & 1;
>          s->st = (value >> 0) & 1;
>          if (s->inout && s->trigger != gpt_trigger_none)
> -            fprintf(stderr, "%s: GP timer pin must be an output "
> -                            "for this trigger mode\n", __func__);
> +            error_report("%s: GP timer pin must be an output "
> +                         "for this trigger mode", __func__);
>          if (!s->inout && s->capture != gpt_capture_none)
> -            fprintf(stderr, "%s: GP timer pin must be an input "
> -                            "for this capture mode\n", __func__);
> +            error_report("%s: GP timer pin must be an input "
> +                         "for this capture mode", __func__);
>          if (s->trigger == gpt_trigger_none)
>              omap_gp_timer_out(s, s->scpwm);
>          /* TODO: make sure this doesn't overflow 32-bits */
> diff --git a/hw/timer/twl92230.c b/hw/timer/twl92230.c
> index ef116c636c..18880884c6 100644
> --- a/hw/timer/twl92230.c
> +++ b/hw/timer/twl92230.c
> @@ -614,7 +614,7 @@ static void menelaus_write(void *opaque, uint8_t addr, uint8_t value)
>              break;
>          rtc_badness:
>          default:
> -            fprintf(stderr, "%s: bad RTC_UPDATE value %02x\n",
> +            error_report("%s: bad RTC_UPDATE value %02x",
>                              __func__, value);

Wrong indentation.

>              s->status |= 1 << 10;				/* RTCERR */
>              menelaus_update(s);
> diff --git a/hw/timer/xilinx_timer.c b/hw/timer/xilinx_timer.c
> index 59439c05be..a80bba846b 100644
> --- a/hw/timer/xilinx_timer.c
> +++ b/hw/timer/xilinx_timer.c
> @@ -127,7 +127,7 @@ timer_read(void *opaque, hwaddr addr, unsigned int size)
>              break;
>  
>      }
> -    D(fprintf(stderr, "%s timer=%d %x=%x\n", __func__, timer, addr * 4, r));
> +    D(error_report("%s timer=%d %x=%x", __func__, timer, addr * 4, r));
>      return r;
>  }
>  
> @@ -135,7 +135,7 @@ static void timer_enable(struct xlx_timer *xt)
>  {
>      uint64_t count;
>  
> -    D(fprintf(stderr, "%s timer=%d down=%d\n", __func__,
> +    D(error_report("%s timer=%d down=%d", __func__,
>                xt->nr, xt->regs[R_TCSR] & TCSR_UDT));

Wrong indentation.

>      ptimer_stop(xt->ptimer);
> @@ -160,7 +160,7 @@ timer_write(void *opaque, hwaddr addr,
>      addr >>= 2;
>      timer = timer_from_addr(addr);
>      xt = &t->timers[timer];
> -    D(fprintf(stderr, "%s addr=%x val=%x (timer=%d off=%d)\n",
> +    D(error_report("%s addr=%x val=%x (timer=%d off=%d)",
>               __func__, addr * 4, value, timer, addr & 3));
>      /* Further decoding to address a specific timers reg.  */
>      addr &= 3;
> @@ -197,7 +197,7 @@ static void timer_hit(void *opaque)
>  {
>      struct xlx_timer *xt = opaque;
>      struct timerblock *t = xt->parent;
> -    D(fprintf(stderr, "%s %d\n", __func__, xt->nr));
> +    D(error_report("%s %d", __func__, xt->nr));
>      xt->regs[R_TCSR] |= TCSR_TINT;
>  
>      if (xt->regs[R_TCSR] & TCSR_ARHT)
> 

That whole D(...) stuff is kind of ugly (the code is bit-rotting there)
and we should maybe rather replace that with a proper debug error
printing macro?

 Thomas

