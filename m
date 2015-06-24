Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7YU8-0000S6-JX
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 20:24:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52914)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Z7YU5-0000OX-Uh
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 20:24:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Z7YU1-0004sV-NQ
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 20:24:09 -0400
Received: from mail-yk0-f173.google.com ([209.85.160.173]:32948)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1Z7YU1-0004sJ-HK
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 20:24:05 -0400
Received: by ykdt186 with SMTP id t186so15333367ykd.0
	for <qemu-trivial@nongnu.org>; Tue, 23 Jun 2015 17:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=4KnmadGbBUxp9iGmcA1lGp3WxCsR3yHy5fFlylkuSHQ=;
	b=GAzXEwwiQWrBoVrVqSbUFZvw94jUXzvVhUTWIdLzA1gDEdkGnXsxC+l2aXagn7bpe8
	yX/EGA7rOc8Ezz4ThflMVNzykinKfa1kjTjb/r4xAIhFSeh/8o/HCqwViQublh3lq/Po
	vs5naDTL3OrSSPkI8PwRyQp3WIeeB/ex7eG+6C09Cqnec9RBeoIXBPtOlcUY3+5f1ePE
	QPWUonknGkVGe4cqYAQ8FVB9bcjBHkqOQ4Wp7MgdShgvvWcFfxBd5pxUfjLymDazm93+
	fzTr89WUsnGIc282vSrCKumzjfhwCuySXh44I3zkP2NEuLt4FIb2YJu7JqL8DNqFgLt3
	PyyQ==
X-Gm-Message-State: ALoCoQl6+mSGYVouysKVwghYrl0wqWGWwu5hlPpf1LypNcFi8MZoWohbPKAr32f7Dd4UEC4oKz4u
MIME-Version: 1.0
X-Received: by 10.13.204.142 with SMTP id o136mr45438150ywd.171.1435105445203; 
	Tue, 23 Jun 2015 17:24:05 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.37.50.201 with HTTP; Tue, 23 Jun 2015 17:24:05 -0700 (PDT)
In-Reply-To: <1435100422-30667-1-git-send-email-laurent@vivier.eu>
References: <1435100422-30667-1-git-send-email-laurent@vivier.eu>
Date: Tue, 23 Jun 2015 17:24:05 -0700
X-Google-Sender-Auth: L6XfZczkXt0fuGcB3EwRQbPmC-U
Message-ID: <CAEgOgz7wRA=S46V8FoseAQ79rgucktbxgkQ_8xyncpQ46MC+SQ@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Laurent Vivier <laurent@vivier.eu>, qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.173
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
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
X-List-Received-Date: Wed, 24 Jun 2015 00:24:11 -0000

cc trivial.

On Tue, Jun 23, 2015 at 4:00 PM, Laurent Vivier <laurent@vivier.eu> wrote:
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
> --
> 2.4.3
>
>

