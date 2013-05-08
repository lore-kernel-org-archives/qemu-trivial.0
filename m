Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ua7ZI-0000tW-1h
	for mharc-qemu-trivial@gnu.org; Wed, 08 May 2013 12:50:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1Ua7ZE-0000tL-Qg
	for qemu-trivial@nongnu.org; Wed, 08 May 2013 12:50:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1Ua7ZD-0002NF-CV
	for qemu-trivial@nongnu.org; Wed, 08 May 2013 12:50:12 -0400
Received: from hall.aurel32.net ([2001:470:1f15:c4f::1]:58153)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1Ua7ZC-0002M8-Vj
	for qemu-trivial@nongnu.org; Wed, 08 May 2013 12:50:11 -0400
Received: from aurel32 by hall.aurel32.net with local (Exim 4.72)
	(envelope-from <aurelien@aurel32.net>)
	id 1Ua7Z9-0000uD-Kg; Wed, 08 May 2013 18:50:07 +0200
Date: Wed, 8 May 2013 18:50:07 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Petar Jovanovic <petar.jovanovic@rt-rk.com>
Message-ID: <20130508165006.GC31148@hall.aurel32.net>
References: <1368011861-57373-1-git-send-email-petar.jovanovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1368011861-57373-1-git-send-email-petar.jovanovic@rt-rk.com>
X-Mailer: Mutt 1.5.20 (2009-06-14)
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Aurelien Jarno <aurelien@aurel32.net>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:470:1f15:c4f::1
Cc: qemu-trivial@nongnu.org, petar.jovanovic@imgtec.com
Subject: Re: [Qemu-trivial] [PATCH] target-mips: fix incorrect behaviour for
	INSV
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
X-List-Received-Date: Wed, 08 May 2013 16:50:15 -0000

On Wed, May 08, 2013 at 01:17:40PM +0200, Petar Jovanovic wrote:
> From: Petar Jovanovic <petar.jovanovic@imgtec.com>
> 
> Corner case for INSV instruction when size=32 has not been correctly
> implemented. The mask for size should be one bit wider, and preparing the
> filter variable should be aware of this case too.
> 
> The test for INSV has been extended to include the case that triggers the
> bug.
> 
> Signed-off-by: Petar Jovanovic <petar.jovanovic@imgtec.com>
> ---
>  target-mips/dsp_helper.c         |    4 ++--
>  tests/tcg/mips/mips32-dsp/insv.c |   13 +++++++++++++
>  2 files changed, 15 insertions(+), 2 deletions(-)

Thanks for the patch. I have applied it, as it is correct and we are in
the freeze period. However please find a few comments below that might
need a follow-up patch.

> diff --git a/target-mips/dsp_helper.c b/target-mips/dsp_helper.c
> index 805247d..9212789 100644
> --- a/target-mips/dsp_helper.c
> +++ b/target-mips/dsp_helper.c
> @@ -2921,7 +2921,7 @@ target_ulong helper_##name(CPUMIPSState *env, target_ulong rs,  \
>          return rt;                                              \
>      }                                                           \
>                                                                  \
> -    filter = ((int32_t)0x01 << size) - 1;                       \
> +    filter = ((int64_t)0x01 << size) - 1;                       \

maybe using (1LL << size) would make the code easier to read.

>      filter = filter << pos;                                     \
>      temprs = (rs << pos) & filter;                              \
>      temprt = rt & ~filter;                                      \
> @@ -2930,7 +2930,7 @@ target_ulong helper_##name(CPUMIPSState *env, target_ulong rs,  \
>      return (target_long)(ret_type)temp;                         \
>  }
>  
> -BIT_INSV(insv, 0x1F, 0x1F, int32_t);
> +BIT_INSV(insv, 0x1F, 0x3F, int32_t);
>  #ifdef TARGET_MIPS64
>  BIT_INSV(dinsv, 0x7F, 0x3F, target_long);

This means that the sizefilter argument is constant, so it probably can
be removed.

>  #endif
> diff --git a/tests/tcg/mips/mips32-dsp/insv.c b/tests/tcg/mips/mips32-dsp/insv.c
> index 243b007..9d67469 100644
> --- a/tests/tcg/mips/mips32-dsp/insv.c
> +++ b/tests/tcg/mips/mips32-dsp/insv.c
> @@ -19,5 +19,18 @@ int main()
>          );
>      assert(rt == result);
>  
> +    dsp    = 0x1000;
> +    rt     = 0xF0F0F0F0;
> +    rs     = 0xA5A5A5A5;
> +    result = 0xA5A5A5A5;
> +
> +    __asm
> +        ("wrdsp %2\n\t"
> +         "insv  %0, %1\n\t"
> +         : "+r"(rt)
> +         : "r"(rs), "r"(dsp)
> +        );
> +    assert(rt == result);
> +
>      return 0;
>  }
> -- 
> 1.7.9.5
> 
> 

-- 
Aurelien Jarno	                        GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

