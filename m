Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bIiNQ-0006WW-50
	for mharc-qemu-trivial@gnu.org; Thu, 30 Jun 2016 16:15:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bIiNM-0006Qc-TU
	for qemu-trivial@nongnu.org; Thu, 30 Jun 2016 16:15:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1bIiNI-0007ZN-Px
	for qemu-trivial@nongnu.org; Thu, 30 Jun 2016 16:15:52 -0400
Received: from mx5-phx2.redhat.com ([209.132.183.37]:48373)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1bIiNI-0007Z9-Fn; Thu, 30 Jun 2016 16:15:48 -0400
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx5-phx2.redhat.com (8.14.4/8.14.4) with ESMTP id u5UKFkAf013903;
	Thu, 30 Jun 2016 16:15:46 -0400
Date: Thu, 30 Jun 2016 16:15:46 -0400 (EDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, kraxel@redhat.com,
	peter maydell <peter.maydell@linaro.org>
Message-ID: <209727639.3312728.1467317746061.JavaMail.zimbra@redhat.com>
In-Reply-To: <1467315396-3628-1-git-send-email-jsnow@redhat.com>
References: <1467315396-3628-1-git-send-email-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.4.164.1, 10.5.101.130]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF47 (Linux)/8.0.6_GA_5922)
Thread-Topic: Remove left shifts of negative signed integers
Thread-Index: q3I+JMkSKcaiBuHIfecsRU+O2aAX4w==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.37
Subject: Re: [Qemu-trivial] [PATCH] Remove left shifts of negative signed
 integers
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
X-List-Received-Date: Thu, 30 Jun 2016 20:15:54 -0000



----- Original Message -----
> From: "John Snow" <jsnow@redhat.com>
> To: qemu-devel@nongnu.org
> Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, kraxel@redhat.com, "peter maydell" <peter.maydell@linaro.org>,
> "John Snow" <jsnow@redhat.com>
> Sent: Thursday, June 30, 2016 9:36:36 PM
> Subject: [PATCH] Remove left shifts of negative signed integers
> 
> Another exercise in placating Clang's increasingly strict -Werror mode.
> Technically, this is undefined behavior. In practice, -N<<M is the same
> as -(N<<M).
> 
> Signed-off-by: John Snow <jsnow@redhat.com>

There's been discussions on this in the past; sorry but this is a
super-duper NACK.

GCC correctly puts this warning under -Wextra, and promises not to ever
make use of this facet of undefined behavior.  The only correct patch
is the one that disables the warning for clang, and possibly adds
-fwrapv.  In GCC, -fwrapv correctly silences ubsan's left-shift
and signed-overflow warnings.  In Clang, this is reported at
https://llvm.org/bugs/show_bug.cgi?id=25552.  It's a heavy hammer
but it's the safest options as compiler evolve.

Paolo

> ---
>  hw/audio/fmopl.c      | 2 +-
>  target-i386/monitor.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
> index 731110f..de9338b 100644
> --- a/hw/audio/fmopl.c
> +++ b/hw/audio/fmopl.c
> @@ -69,7 +69,7 @@ static int opl_dbg_maxchip,opl_dbg_chip;
>  /* final output shift , limit minimum and maximum */
>  #define OPL_OUTSB   (TL_BITS+3-16)		/* OPL output final shift 16bit */
>  #define OPL_MAXOUT (0x7fff<<OPL_OUTSB)
> -#define OPL_MINOUT (-0x8000<<OPL_OUTSB)
> +#define OPL_MINOUT (-(0x8000<<OPL_OUTSB))
>  
>  /* -------------------- quality selection --------------------- */
>  
> diff --git a/target-i386/monitor.c b/target-i386/monitor.c
> index fccfe40..94e9871 100644
> --- a/target-i386/monitor.c
> +++ b/target-i386/monitor.c
> @@ -36,7 +36,7 @@ static void print_pte(Monitor *mon, hwaddr addr,
>  {
>  #ifdef TARGET_X86_64
>      if (addr & (1ULL << 47)) {
> -        addr |= -1LL << 48;
> +        addr |= -(1LL << 48);
>      }
>  #endif
>      monitor_printf(mon, TARGET_FMT_plx ": " TARGET_FMT_plx
> --
> 2.5.5
> 
> 

