Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cZd2y-0002P3-K6
	for mharc-qemu-trivial@gnu.org; Fri, 03 Feb 2017 07:33:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cZd2w-0002Mp-62
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2017 07:32:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cZd2t-0001Gv-7V
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2017 07:32:58 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:38827)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cZd2t-0001G0-2T
	for qemu-trivial@nongnu.org; Fri, 03 Feb 2017 07:32:55 -0500
Received: by mail-wm0-x233.google.com with SMTP id r141so25507902wmg.1
	for <qemu-trivial@nongnu.org>; Fri, 03 Feb 2017 04:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NAr4bo+AuglbO0HLFa75MiHlx5AavVQACjYIIvs2FoE=;
	b=MS2gnbInXXHkc/xZSpdhGHm6Z0jeY/3fiMuqivOrsoaCgmKQF9/AtkHHEVb9zupjOX
	wGpn4X73/vLb4OKoq8JuztGFZiWaCmWjotcxty8ldqQhp1aZnKAJ/VwWIcTQKN6g8NWy
	XlSIkMir6iUNPLmj69HCW59/bjzNwNEWrEsQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NAr4bo+AuglbO0HLFa75MiHlx5AavVQACjYIIvs2FoE=;
	b=jUjq/bzaGqxEFw1YnVnMa9UeeFyl45wZnttEDVHdxbvtBttY0ZIxL1x3uZJVbVh7qY
	K2NID91mn58zj/QicpXX+ommfe/kab4AIUnGgXDAD8pxNbYRI8s0pbCB73DPZx3yi5gs
	cnEEWkmSjk8maGhPmQN2dNN2emJJxK3G1hTTXwM+RYJHh9GzEek5RunhQ3cp7dFNHOUC
	jk4L4X2EDwogPzzNXN2wHcS0Rfrc9c1qgwp/dPjONPm7Tu+D56l+1ozgDHkxdEkGSGdS
	qo380QViUzJ300Ml4bnHkDVrDvGM5xtd7dBafQKr+L7vLOF2Kkzp1r5CJdFfrGQDp92o
	xW5g==
X-Gm-Message-State: AMke39n6aeacFskqZQ28kMG1q3aAOrjYUBD7qG6U3V87sm/wOZHBASNkc0D25pnBum2rkcFUTjyeGAaSh92k/Q5B
X-Received: by 10.28.4.10 with SMTP id 10mr1303087wme.142.1486125173532; Fri,
	03 Feb 2017 04:32:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 3 Feb 2017 04:32:33 -0800 (PST)
In-Reply-To: <20170202195601.11286-1-sw@weilnetz.de>
References: <20170202195601.11286-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2017 12:32:33 +0000
Message-ID: <CAFEAcA81egoo-mgkXxjFOWgP3=aJf=RuXHdApTn+Zt98aXkA4w@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: Richard Henderson <rth@twiddle.net>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-trivial] [PATCH] tci: Remove invalid assertions
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
X-List-Received-Date: Fri, 03 Feb 2017 12:32:59 -0000

On 2 February 2017 at 19:56, Stefan Weil <sw@weilnetz.de> wrote:
> tb_jmp_insn_offset and tb_jmp_reset_offset are pointers
> and cannot be used with ARRAY_SIZE.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  tcg/tci/tcg-target.inc.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/tcg/tci/tcg-target.inc.c b/tcg/tci/tcg-target.inc.c
> index 26ee9b1664..b6a15569f8 100644
> --- a/tcg/tci/tcg-target.inc.c
> +++ b/tcg/tci/tcg-target.inc.c
> @@ -566,7 +566,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
>      case INDEX_op_goto_tb:
>          if (s->tb_jmp_insn_offset) {
>              /* Direct jump method. */
> -            tcg_debug_assert(args[0] < ARRAY_SIZE(s->tb_jmp_insn_offset));
>              /* Align for atomic patching and thread safety */
>              s->code_ptr = QEMU_ALIGN_PTR_UP(s->code_ptr, 4);
>              s->tb_jmp_insn_offset[args[0]] = tcg_current_code_size(s);
> @@ -575,7 +574,6 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
>              /* Indirect jump method. */
>              TODO();
>          }
> -        tcg_debug_assert(args[0] < ARRAY_SIZE(s->tb_jmp_reset_offset));
>          s->tb_jmp_reset_offset[args[0]] = tcg_current_code_size(s);
>          break;
>      case INDEX_op_br:
> --
> 2.11.0

Applied to master as a buildfix; thanks.

-- PMM

