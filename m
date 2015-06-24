Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7q9M-0006BI-Ry
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jun 2015 15:15:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1Z7q9I-00068l-Hy
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 15:15:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <th.huth@gmail.com>) id 1Z7q9H-0006wd-8y
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 15:15:52 -0400
Received: from mail-wi0-f178.google.com ([209.85.212.178]:37959)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <th.huth@gmail.com>)
	id 1Z7q9C-0006vs-H9; Wed, 24 Jun 2015 15:15:46 -0400
Received: by wibdq8 with SMTP id dq8so55671496wib.1;
	Wed, 24 Jun 2015 12:15:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=wq13x5rEUkHc22i7qj+SRq2Qx1nfmpn3JRl1l/wM0cE=;
	b=f/LevBSr5CdxwLOrFMX//cBBFh2EPrLCqfTau/GwbqKjqxAJyAD62IB/Q4ID3yX1mg
	OV6V4y3KTYbM/qTBbzoToBrYQUAAdPTelivZk9O8Z9oaQY3ZJazQW3E3kiSb89yaxOoh
	4S3LLO4MFFfQv9mpcLI8FV5oMlaJujXlcITOCtgDgOLIm/UJzg+W1qECBvWxaCN7S6eX
	GUxZGF8wdA3d9jvVaLi0/4mFQk2Ab+WPO19fPaM1T2wmN8aOrV2HxpUqegiZEY84zgdm
	xmI4UdZdNssQbKJ0f/ra64U3XbKFgCd+sx1/Wc0WAv2K57yC8N56mek38Sftg7QGxhCh
	Voow==
X-Received: by 10.180.106.137 with SMTP id gu9mr7809710wib.54.1435173346004;
	Wed, 24 Jun 2015 12:15:46 -0700 (PDT)
Received: from thh440s (p57AEC007.dip0.t-ipconnect.de. [87.174.192.7])
	by mx.google.com with ESMTPSA id wx9sm42001218wjb.6.2015.06.24.12.15.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Jun 2015 12:15:45 -0700 (PDT)
Date: Wed, 24 Jun 2015 21:15:42 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Message-ID: <20150624211542.01e0534b@thh440s>
In-Reply-To: <1435100422-30667-1-git-send-email-laurent@vivier.eu>
References: <1435100422-30667-1-git-send-email-laurent@vivier.eu>
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.22; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.178
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] m68k: is_mem is useless
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
X-List-Received-Date: Wed, 24 Jun 2015 19:15:54 -0000

On Wed, 24 Jun 2015 01:00:22 +0200
Laurent Vivier <laurent@vivier.eu> wrote:

> Remove is_mem as it is never tested anymore since:
> 
>     commit bfa50bc2638d877cf2900712b7503be22e8811cb
>     Author: aliguori <aliguori@c046a42c-6fe2-441c-8c8c-71466251a162>
>     Date:   Tue Nov 18 20:26:41 2008 +0000
> 
>         Remove premature memop TB terminations (Jan Kiszka)
> 
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  target-m68k/translate.c | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/target-m68k/translate.c b/target-m68k/translate.c
> index 96d75bf..ce1fc92 100644
> --- a/target-m68k/translate.c
> +++ b/target-m68k/translate.c
> @@ -129,7 +129,6 @@ typedef struct DisasContext {
>      uint32_t fpcr;
>      struct TranslationBlock *tb;
>      int singlestep_enabled;
> -    int is_mem;
>      TCGv_i64 mactmp;
>      int done_mac;
>  } DisasContext;
> @@ -179,7 +178,6 @@ static inline TCGv gen_load(DisasContext * s, int opsize, TCGv addr, int sign)
>  {
>      TCGv tmp;
>      int index = IS_USER(s);
> -    s->is_mem = 1;
>      tmp = tcg_temp_new_i32();
>      switch(opsize) {
>      case OS_BYTE:
> @@ -209,7 +207,6 @@ static inline TCGv_i64 gen_load64(DisasContext * s, TCGv addr)
>  {
>      TCGv_i64 tmp;
>      int index = IS_USER(s);
> -    s->is_mem = 1;
>      tmp = tcg_temp_new_i64();
>      tcg_gen_qemu_ldf64(tmp, addr, index);
>      gen_throws_exception = gen_last_qop;
> @@ -220,7 +217,6 @@ static inline TCGv_i64 gen_load64(DisasContext * s, TCGv addr)
>  static inline void gen_store(DisasContext *s, int opsize, TCGv addr, TCGv val)
>  {
>      int index = IS_USER(s);
> -    s->is_mem = 1;
>      switch(opsize) {
>      case OS_BYTE:
>          tcg_gen_qemu_st8(val, addr, index);
> @@ -241,7 +237,6 @@ static inline void gen_store(DisasContext *s, int opsize, TCGv addr, TCGv val)
>  static inline void gen_store64(DisasContext *s, TCGv addr, TCGv_i64 val)
>  {
>      int index = IS_USER(s);
> -    s->is_mem = 1;
>      tcg_gen_qemu_stf64(val, addr, index);
>      gen_throws_exception = gen_last_qop;
>  }
> @@ -2227,7 +2222,6 @@ DISAS_INSN(fpu)
>              mask = 0x80;
>              for (i = 0; i < 8; i++) {
>                  if (ext & mask) {
> -                    s->is_mem = 1;
>                      dest = FREG(i, 0);
>                      if (ext & (1 << 13)) {
>                          /* store */
> @@ -2999,7 +2993,6 @@ gen_intermediate_code_internal(M68kCPU *cpu, TranslationBlock *tb,
>      dc->singlestep_enabled = cs->singlestep_enabled;
>      dc->fpcr = env->fpcr;
>      dc->user = (env->sr & SR_S) == 0;
> -    dc->is_mem = 0;
>      dc->done_mac = 0;
>      lj = -1;
>      num_insns = 0;

Reviewed-by: Thomas Huth <huth@tuxfamily.org>

