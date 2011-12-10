Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RZTN8-0006mC-8I
	for mharc-qemu-trivial@gnu.org; Sat, 10 Dec 2011 15:18:14 -0500
Received: from eggs.gnu.org ([140.186.70.92]:33704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1RZTN5-0006dM-NH
	for qemu-trivial@nongnu.org; Sat, 10 Dec 2011 15:18:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>) id 1RZTN4-0007Sc-Ia
	for qemu-trivial@nongnu.org; Sat, 10 Dec 2011 15:18:11 -0500
Received: from mout.web.de ([212.227.15.4]:54664)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andreas.faerber@web.de>)
	id 1RZTN2-0007SI-58; Sat, 10 Dec 2011 15:18:08 -0500
Received: from envy.site ([2.39.114.236]) by smtp.web.de (mrweb001) with
	ESMTPA (Nemesis) id 0LlWVj-1R0PKk3El5-00aS1U;
	Sat, 10 Dec 2011 21:18:06 +0100
Message-ID: <4EE3BE41.4010408@web.de>
Date: Sat, 10 Dec 2011 21:17:05 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <andreas.faerber@web.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1323534931-10853-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1323534931-10853-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8bit
X-Provags-ID: V02:K0:wn3DWMl1LkM38XAFqCpmarjzlIwLagTxvgNs3Idv+Gt
	Os5OZmoJYmWd5fGxlSgtiEYVwfUQPJIGf3MexAvE5U+z42fh/O
	ns7Z98l5zcTybhifmAcHVtbqsnFBHijHFKVcOBHbCV5bVfGDsl
	KlR/GMs6+GgDHOQrFUqMUcpyzseeTcIYxGViqxTT1pwYt3fcTr
	r4eME5Zj1g8nEWoz6qaOQ==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.15.4
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tcg: make tcg_const_ptr
 actually accept a pointer argument
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
X-List-Received-Date: Sat, 10 Dec 2011 20:18:13 -0000

Am 10.12.2011 17:35, schrieb Peter Maydell:
> Make tcg_const_ptr() include a cast so that you can pass it a
> pointer. This allows us to drop the casts we had in all the places
> that use this macro.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Acked-by: Andreas Färber <andreas.faerber@web.de>

At first the use of tcg_target_long seemed wrong to me, in case anyone
else is wondering, but it is in fact the type depending on
TCG_TARGET_REG_BITS not TARGET_LONG_BITS. (I'll have to fix my series.)

Andreas

> ---
> Minor cleanup; I have a patchset cooking that wants to use
> tcg_const_ptr(), which is why I noticed this infelicity.
> 
>  tcg/tcg-op.h |    6 +++---
>  tcg/tcg.h    |    4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tcg/tcg-op.h b/tcg/tcg-op.h
> index 82e04e7..169d3b2 100644
> --- a/tcg/tcg-op.h
> +++ b/tcg/tcg-op.h
> @@ -389,7 +389,7 @@ static inline void tcg_gen_helperN(void *func, int flags, int sizemask,
>                                     TCGArg ret, int nargs, TCGArg *args)
>  {
>      TCGv_ptr fn;
> -    fn = tcg_const_ptr((tcg_target_long)func);
> +    fn = tcg_const_ptr(func);
>      tcg_gen_callN(&tcg_ctx, fn, flags, sizemask, ret,
>                    nargs, args);
>      tcg_temp_free_ptr(fn);
> @@ -405,7 +405,7 @@ static inline void tcg_gen_helper32(void *func, int sizemask, TCGv_i32 ret,
>  {
>      TCGv_ptr fn;
>      TCGArg args[2];
> -    fn = tcg_const_ptr((tcg_target_long)func);
> +    fn = tcg_const_ptr(func);
>      args[0] = GET_TCGV_I32(a);
>      args[1] = GET_TCGV_I32(b);
>      tcg_gen_callN(&tcg_ctx, fn, TCG_CALL_CONST | TCG_CALL_PURE, sizemask,
> @@ -418,7 +418,7 @@ static inline void tcg_gen_helper64(void *func, int sizemask, TCGv_i64 ret,
>  {
>      TCGv_ptr fn;
>      TCGArg args[2];
> -    fn = tcg_const_ptr((tcg_target_long)func);
> +    fn = tcg_const_ptr(func);
>      args[0] = GET_TCGV_I64(a);
>      args[1] = GET_TCGV_I64(b);
>      tcg_gen_callN(&tcg_ctx, fn, TCG_CALL_CONST | TCG_CALL_PURE, sizemask,
> diff --git a/tcg/tcg.h b/tcg/tcg.h
> index 175000f..5c28239 100644
> --- a/tcg/tcg.h
> +++ b/tcg/tcg.h
> @@ -544,7 +544,7 @@ void tcg_add_target_add_op_defs(const TCGTargetOpDef *tdefs);
>  #define TCGV_NAT_TO_PTR(n) MAKE_TCGV_PTR(GET_TCGV_I32(n))
>  #define TCGV_PTR_TO_NAT(n) MAKE_TCGV_I32(GET_TCGV_PTR(n))
>  
> -#define tcg_const_ptr(V) TCGV_NAT_TO_PTR(tcg_const_i32(V))
> +#define tcg_const_ptr(V) TCGV_NAT_TO_PTR(tcg_const_i32((tcg_target_long)(V)))
>  #define tcg_global_reg_new_ptr(R, N) \
>      TCGV_NAT_TO_PTR(tcg_global_reg_new_i32((R), (N)))
>  #define tcg_global_mem_new_ptr(R, O, N) \
> @@ -555,7 +555,7 @@ void tcg_add_target_add_op_defs(const TCGTargetOpDef *tdefs);
>  #define TCGV_NAT_TO_PTR(n) MAKE_TCGV_PTR(GET_TCGV_I64(n))
>  #define TCGV_PTR_TO_NAT(n) MAKE_TCGV_I64(GET_TCGV_PTR(n))
>  
> -#define tcg_const_ptr(V) TCGV_NAT_TO_PTR(tcg_const_i64(V))
> +#define tcg_const_ptr(V) TCGV_NAT_TO_PTR(tcg_const_i64((tcg_target_long)(V)))
>  #define tcg_global_reg_new_ptr(R, N) \
>      TCGV_NAT_TO_PTR(tcg_global_reg_new_i64((R), (N)))
>  #define tcg_global_mem_new_ptr(R, O, N) \


