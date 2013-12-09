Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vq3Eq-0006AB-VL
	for mharc-qemu-trivial@gnu.org; Mon, 09 Dec 2013 10:59:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39514)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1Vq3El-00066l-AC
	for qemu-trivial@nongnu.org; Mon, 09 Dec 2013 10:59:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1Vq3Eg-0004un-FU
	for qemu-trivial@nongnu.org; Mon, 09 Dec 2013 10:59:11 -0500
Received: from hall.aurel32.net ([195.154.112.97]:50841)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1Vq3Eg-0004uW-6P
	for qemu-trivial@nongnu.org; Mon, 09 Dec 2013 10:59:06 -0500
Received: from [2001:470:d4ed:0:ea11:32ff:fea1:831a] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <aurelien@aurel32.net>)
	id 1Vq3EW-0003kD-K7; Mon, 09 Dec 2013 16:58:56 +0100
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.80)
	(envelope-from <aurelien@aurel32.net>)
	id 1Vq3EV-0001UD-Jc; Mon, 09 Dec 2013 16:58:55 +0100
Date: Mon, 9 Dec 2013 16:58:55 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20131209155855.GC5013@ohm.rr44.fr>
References: <1386424088-23196-1-git-send-email-sw@weilnetz.de>
	<1386424088-23196-5-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1386424088-23196-5-git-send-email-sw@weilnetz.de>
X-Mailer: Mutt 1.5.21 (2010-09-15)
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.154.112.97
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v2 4/5] target-mips: Use macro ARRAY_SIZE
	where possible
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
X-List-Received-Date: Mon, 09 Dec 2013 15:59:15 -0000

On Sat, Dec 07, 2013 at 02:48:07PM +0100, Stefan Weil wrote:
> This improves readability and simplifies the code.
> 
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  target-mips/dsp_helper.c |   30 ++++++++++++------------------
>  1 file changed, 12 insertions(+), 18 deletions(-)
> 
> diff --git a/target-mips/dsp_helper.c b/target-mips/dsp_helper.c
> index b088a25..a2f46d9 100644
> --- a/target-mips/dsp_helper.c
> +++ b/target-mips/dsp_helper.c
> @@ -1088,12 +1088,11 @@ static inline int32_t mipsdsp_cmpu_lt(uint32_t a, uint32_t b)
>  target_ulong helper_##name(target_ulong rt, CPUMIPSState *env)             \
>  {                                                                          \
>      DSP32Value dt;                                                         \
> -    unsigned int i, n;                                                     \
> +    unsigned int i;                                                     \
>                                                                             \
> -    n = sizeof(DSP32Value) / sizeof(dt.element[0]);                        \
>      dt.sw[0] = rt;                                                         \
>                                                                             \
> -    for (i = 0; i < n; i++) {                                              \
> +    for (i = 0; i < ARRAY_SIZE(dt.element); i++) {                         \
>          dt.element[i] = mipsdsp_##func(dt.element[i], env);                \
>      }                                                                      \
>                                                                             \
> @@ -1109,12 +1108,11 @@ MIPSDSP32_UNOP_ENV(absq_s_w, sat_abs32, sw)
>  target_ulong helper_##name(target_ulong rt, CPUMIPSState *env)             \
>  {                                                                          \
>      DSP64Value dt;                                                         \
> -    unsigned int i, n;                                                     \
> +    unsigned int i;                                                        \
>                                                                             \
> -    n = sizeof(DSP64Value) / sizeof(dt.element[0]);                        \
>      dt.sl[0] = rt;                                                         \
>                                                                             \
> -    for (i = 0; i < n; i++) {                                              \
> +    for (i = 0; i < ARRAY_SIZE(dt.element); i++) {                         \
>          dt.element[i] = mipsdsp_##func(dt.element[i], env);                \
>      }                                                                      \
>                                                                             \
> @@ -1130,13 +1128,12 @@ MIPSDSP64_UNOP_ENV(absq_s_pw, sat_abs32, sw)
>  target_ulong helper_##name(target_ulong rs, target_ulong rt)               \
>  {                                                                          \
>      DSP32Value ds, dt;                                                     \
> -    unsigned int i, n;                                                     \
> +    unsigned int i;                                                        \
>                                                                             \
> -    n = sizeof(DSP32Value) / sizeof(ds.element[0]);                        \
>      ds.sw[0] = rs;                                                         \
>      dt.sw[0] = rt;                                                         \
>                                                                             \
> -    for (i = 0; i < n; i++) {                                              \
> +    for (i = 0; i < ARRAY_SIZE(ds.element); i++) {                         \
>          ds.element[i] = mipsdsp_##func(ds.element[i], dt.element[i]);      \
>      }                                                                      \
>                                                                             \
> @@ -1159,13 +1156,12 @@ target_ulong helper_##name(target_ulong rs, target_ulong rt,               \
>                             CPUMIPSState *env)                              \
>  {                                                                          \
>      DSP32Value ds, dt;                                                     \
> -    unsigned int i, n;                                                     \
> +    unsigned int i;                                                        \
>                                                                             \
> -    n = sizeof(DSP32Value) / sizeof(ds.element[0]);                        \
>      ds.sw[0] = rs;                                                         \
>      dt.sw[0] = rt;                                                         \
>                                                                             \
> -    for (i = 0 ; i < n ; i++) {                                            \
> +    for (i = 0 ; i < ARRAY_SIZE(ds.element); i++) {                        \
>          ds.element[i] = mipsdsp_##func(ds.element[i], dt.element[i], env); \
>      }                                                                      \
>                                                                             \
> @@ -1192,13 +1188,12 @@ MIPSDSP32_BINOP_ENV(subu_s_qb, satu8_sub, ub);
>  target_ulong helper_##name(target_ulong rs, target_ulong rt)               \
>  {                                                                          \
>      DSP64Value ds, dt;                                                     \
> -    unsigned int i, n;                                                     \
> +    unsigned int i;                                                        \
>                                                                             \
> -    n = sizeof(DSP64Value) / sizeof(ds.element[0]);                        \
>      ds.sl[0] = rs;                                                         \
>      dt.sl[0] = rt;                                                         \
>                                                                             \
> -    for (i = 0 ; i < n ; i++) {                                            \
> +    for (i = 0 ; i < ARRAY_SIZE(ds.element); i++) {                        \
>          ds.element[i] = mipsdsp_##func(ds.element[i], dt.element[i]);      \
>      }                                                                      \
>                                                                             \
> @@ -1215,13 +1210,12 @@ target_ulong helper_##name(target_ulong rs, target_ulong rt,               \
>                             CPUMIPSState *env)                              \
>  {                                                                          \
>      DSP64Value ds, dt;                                                     \
> -    unsigned int i, n;                                                     \
> +    unsigned int i;                                                        \
>                                                                             \
> -    n = sizeof(DSP64Value) / sizeof(ds.element[0]);                        \
>      ds.sl[0] = rs;                                                         \
>      dt.sl[0] = rt;                                                         \
>                                                                             \
> -    for (i = 0 ; i < n ; i++) {                                            \
> +    for (i = 0 ; i < ARRAY_SIZE(ds.element); i++) {                        \
>          ds.element[i] = mipsdsp_##func(ds.element[i], dt.element[i], env); \
>      }                                                                      \
>                                                                             \

Thanks, applied.


-- 
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

