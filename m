Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ua3h7-0003up-En
	for mharc-qemu-trivial@gnu.org; Wed, 08 May 2013 08:42:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43173)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ua3h1-0003m1-GK
	for qemu-trivial@nongnu.org; Wed, 08 May 2013 08:42:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ua3gx-0007O6-BX
	for qemu-trivial@nongnu.org; Wed, 08 May 2013 08:41:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58152)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ua3go-0007MX-9j; Wed, 08 May 2013 08:41:46 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B46E3405C3;
	Wed,  8 May 2013 16:41:44 +0400 (MSK)
Message-ID: <518A4808.40203@msgid.tls.msk.ru>
Date: Wed, 08 May 2013 16:41:44 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Petar Jovanovic <petar.jovanovic@rt-rk.com>
References: <1368011861-57373-1-git-send-email-petar.jovanovic@rt-rk.com>
In-Reply-To: <1368011861-57373-1-git-send-email-petar.jovanovic@rt-rk.com>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, petar.jovanovic@imgtec.com,
	qemu-devel <qemu-devel@nongnu.org>
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
X-List-Received-Date: Wed, 08 May 2013 12:42:03 -0000

08.05.2013 15:17, Petar Jovanovic wrote:
> From: Petar Jovanovic <petar.jovanovic@imgtec.com>
> 
> Corner case for INSV instruction when size=32 has not been correctly
> implemented. The mask for size should be one bit wider, and preparing the
> filter variable should be aware of this case too.
> 
> The test for INSV has been extended to include the case that triggers the
> bug.

This isn't really a good fit for a trivial patch.  Cc'ing qemu-devel
and mips "odd-fixes" maintainer instead.

Thanks!

/mjt

> Signed-off-by: Petar Jovanovic <petar.jovanovic@imgtec.com>
> ---
>  target-mips/dsp_helper.c         |    4 ++--
>  tests/tcg/mips/mips32-dsp/insv.c |   13 +++++++++++++
>  2 files changed, 15 insertions(+), 2 deletions(-)
> 
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
> 


