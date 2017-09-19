Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1duJdJ-0004s2-Gg
	for mharc-qemu-trivial@gnu.org; Tue, 19 Sep 2017 10:36:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Yongbok.Kim@imgtec.com>) id 1duJdH-0004pr-Hx
	for qemu-trivial@nongnu.org; Tue, 19 Sep 2017 10:36:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Yongbok.Kim@imgtec.com>) id 1duJdB-0001ca-BC
	for qemu-trivial@nongnu.org; Tue, 19 Sep 2017 10:36:15 -0400
Received: from mailapp01.imgtec.com ([195.59.15.196]:20906)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Yongbok.Kim@imgtec.com>)
	id 1duJcz-0001R2-Hr; Tue, 19 Sep 2017 10:35:57 -0400
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id A8B5D42680EDD;
	Tue, 19 Sep 2017 15:35:46 +0100 (IST)
Received: from [192.168.169.52] (192.168.169.52) by HHMAIL01.hh.imgtec.org
	(10.100.10.21) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 19 Sep 2017 15:35:49 +0100
To: Eric Blake <eblake@redhat.com>, <qemu-devel@nongnu.org>
CC: <qemu-trivial@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
References: <20170919141307.23113-1-eblake@redhat.com>
From: Yongbok Kim <yongbok.kim@imgtec.com>
Message-ID: <1d765929-c654-80d6-b949-87429f4c0aa8@imgtec.com>
Date: Tue, 19 Sep 2017 15:35:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170919141307.23113-1-eblake@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.168.169.52]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 195.59.15.196
Subject: Re: [Qemu-trivial] [PATCH] mips: Improve macro parenthesization
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
X-List-Received-Date: Tue, 19 Sep 2017 14:36:16 -0000



On 19/09/2017 15:13, Eric Blake wrote:
> Although none of the existing macro call-sites were broken,
> it's always better to write macros that properly parenthesize
> arguments that can be complex expressions, so that the intended
> order of operations is not broken.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  target/mips/dsp_helper.c | 56 ++++++++++++++++++++++++------------------------
>  1 file changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/target/mips/dsp_helper.c b/target/mips/dsp_helper.c
> index dc707934ea..f152fea34a 100644
> --- a/target/mips/dsp_helper.c
> +++ b/target/mips/dsp_helper.c
> @@ -45,9 +45,9 @@ typedef union {
>  } DSP64Value;
> 
>  /*** MIPS DSP internal functions begin ***/
> -#define MIPSDSP_ABS(x) (((x) >= 0) ? x : -x)
> -#define MIPSDSP_OVERFLOW_ADD(a, b, c, d) (~(a ^ b) & (a ^ c) & d)
> -#define MIPSDSP_OVERFLOW_SUB(a, b, c, d) ((a ^ b) & (a ^ c) & d)
> +#define MIPSDSP_ABS(x) (((x) >= 0) ? (x) : -(x))
> +#define MIPSDSP_OVERFLOW_ADD(a, b, c, d) (~((a) ^ (b)) & ((a) ^ (c)) & (d))
> +#define MIPSDSP_OVERFLOW_SUB(a, b, c, d) (((a) ^ (b)) & ((a) ^ (c)) & (d))
> 
>  static inline void set_DSPControl_overflow_flag(uint32_t flag, int position,
>                                                  CPUMIPSState *env)
> @@ -1047,47 +1047,47 @@ static inline int32_t mipsdsp_cmpu_lt(uint32_t a, uint32_t b)
> 
>  #define MIPSDSP_SPLIT32_8(num, a, b, c, d)  \
>      do {                                    \
> -        a = (num >> 24) & MIPSDSP_Q0;       \
> -        b = (num >> 16) & MIPSDSP_Q0;       \
> -        c = (num >> 8) & MIPSDSP_Q0;        \
> -        d = num & MIPSDSP_Q0;               \
> +        a = ((num) >> 24) & MIPSDSP_Q0;     \
> +        b = ((num) >> 16) & MIPSDSP_Q0;     \
> +        c = ((num) >> 8) & MIPSDSP_Q0;      \
> +        d = (num) & MIPSDSP_Q0;             \
>      } while (0)
> 
>  #define MIPSDSP_SPLIT32_16(num, a, b)       \
>      do {                                    \
> -        a = (num >> 16) & MIPSDSP_LO;       \
> -        b = num & MIPSDSP_LO;               \
> +        a = ((num) >> 16) & MIPSDSP_LO;     \
> +        b = (num) & MIPSDSP_LO;             \
>      } while (0)
> 
> -#define MIPSDSP_RETURN32_8(a, b, c, d)  ((target_long)(int32_t) \
> -                                         (((uint32_t)a << 24) | \
> -                                         (((uint32_t)b << 16) | \
> -                                         (((uint32_t)c << 8) |  \
> -                                          ((uint32_t)d & 0xFF)))))
> -#define MIPSDSP_RETURN32_16(a, b)       ((target_long)(int32_t) \
> -                                         (((uint32_t)a << 16) | \
> -                                          ((uint32_t)b & 0xFFFF)))
> +#define MIPSDSP_RETURN32_8(a, b, c, d)  ((target_long)(int32_t)         \
> +                                         (((uint32_t)(a) << 24) |       \
> +                                          ((uint32_t)(b) << 16) |       \
> +                                          ((uint32_t)(c) << 8) |        \
> +                                          ((uint32_t)(d) & 0xFF)))
> +#define MIPSDSP_RETURN32_16(a, b)       ((target_long)(int32_t)         \
> +                                         (((uint32_t)(a) << 16) |       \
> +                                          ((uint32_t)(b) & 0xFFFF)))
> 
>  #ifdef TARGET_MIPS64
>  #define MIPSDSP_SPLIT64_16(num, a, b, c, d)  \
>      do {                                     \
> -        a = (num >> 48) & MIPSDSP_LO;        \
> -        b = (num >> 32) & MIPSDSP_LO;        \
> -        c = (num >> 16) & MIPSDSP_LO;        \
> -        d = num & MIPSDSP_LO;                \
> +        a = ((num) >> 48) & MIPSDSP_LO;      \
> +        b = ((num) >> 32) & MIPSDSP_LO;      \
> +        c = ((num) >> 16) & MIPSDSP_LO;      \
> +        d = (num) & MIPSDSP_LO;              \
>      } while (0)
> 
>  #define MIPSDSP_SPLIT64_32(num, a, b)       \
>      do {                                    \
> -        a = (num >> 32) & MIPSDSP_LLO;      \
> -        b = num & MIPSDSP_LLO;              \
> +        a = ((num) >> 32) & MIPSDSP_LLO;    \
> +        b = (num) & MIPSDSP_LLO;            \
>      } while (0)
> 
> -#define MIPSDSP_RETURN64_16(a, b, c, d) (((uint64_t)a << 48) | \
> -                                         ((uint64_t)b << 32) | \
> -                                         ((uint64_t)c << 16) | \
> -                                         (uint64_t)d)
> -#define MIPSDSP_RETURN64_32(a, b)       (((uint64_t)a << 32) | (uint64_t)b)
> +#define MIPSDSP_RETURN64_16(a, b, c, d) (((uint64_t)(a) << 48) |        \
> +                                         ((uint64_t)(b) << 32) |        \
> +                                         ((uint64_t)(c) << 16) |        \
> +                                         (uint64_t)(d))
> +#define MIPSDSP_RETURN64_32(a, b)       (((uint64_t)(a) << 32) | (uint64_t)(b))
>  #endif
> 
>  /** DSP Arithmetic Sub-class insns **/
> 

Reviewed-by: Yongbok Kim <yongbok.kim@imgtec.com>

Regards,
Yongbok

