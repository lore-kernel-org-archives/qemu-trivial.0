Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90FDCD5BD5
	for <qemu-trivial@archiver.kernel.org>; Thu, 28 May 2026 09:18:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wSWsK-000119-1p; Thu, 28 May 2026 05:18:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSWsF-0000rl-Se
 for qemu-trivial@nongnu.org; Thu, 28 May 2026 05:17:56 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSWsD-0001v0-TB
 for qemu-trivial@nongnu.org; Thu, 28 May 2026 05:17:55 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-65c0bda7f15so12524647d50.0
 for <qemu-trivial@nongnu.org>; Thu, 28 May 2026 02:17:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779959873; cv=none;
 d=google.com; s=arc-20240605;
 b=N2J0Z/AbevAjwuTOhbeomcUGbmBvRPcrZL3Madjoc10knDNNYZnS9MtA79gIAm7+i3
 +A9YiGqyILIrJe4Lqkqn7o8QI6mJTF+A9DDcB6yt9ybJ7h23fYmlnIjztTuSh5AwdUu4
 VFvnCkTXTVvJhlVXBmrEQ7OVLNvv7bH48ZR9fBf49ExIc3DDk/ztA/uIAhlQd1RmadeP
 avGvGdwScffl5qUv7Bhag7Tq3fTkt4FdkHNr8hesrwtyTWcBt32W+OBsz9PgoV4wujEJ
 9WYZAg+ZHadtvj/2Iweb+ZDGiwG1YGFrStWClCgYAJltlZrJm4wSXxtuQ/qbF7lsTk4d
 vBWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=+BZipBpjvnBsXT09usZPYGe5z3DQXqqT8jDo94YrMeE=;
 fh=gcffyYpJmy2zfYRKVp38Ne7/kzIvOeVLXHBcD5sEMvs=;
 b=hgCBTqnFiOZWGFU3mqYdvd/W9kGECLs7khIBcJgV2qIumr9FiaKpNau5dvje9V4/Qd
 uNAvML47MnV62xjRO+zXVhNHwI4yXDTycweZ+0R231I0j4WKqCUpzfL9S0i+1mBV8wW8
 U4xyrEOLYGzaaHopNty4pYy8JgLUCIhTN7SVS12Yo76tRBif3jtcbXWiNpkM1rkDdBXv
 gC/qMl6ct3YtpPcLM9LDm6WZh/6gRyBUJOnXp2kiSr8wqwZ3QW5uMswOMgn1OcvdJHVI
 pBoDPh/MXAbru1z2FwMjCc378LhMfuUnfWxfuwAkcaaQDbsY1cCkpjgkNCyJaxaEuVMu
 qShg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779959873; x=1780564673; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+BZipBpjvnBsXT09usZPYGe5z3DQXqqT8jDo94YrMeE=;
 b=lqswIzhAaets/SqmT3USErgfFR4GlKDAUjlU66ciI2ruBq6SzusaZWjriqPHCogyEq
 7nt/w9r4kV3nrON5m5vF+YEachIFarQYUo+AYFMoXGeOrXGmDhC/qmmM85a81a+khP0t
 hcf9SoYa/8mpIqZjD7VFckxBm1OVppWqmW/+lsCf2IJm5/beZK+odq3F6DV3hiD2rTtB
 TSaCpw5rBdybYPFKvWrwJegm2Rc9jcLn/4bijCpIiauiWdXeAMkn/RxAMvg/+QETr784
 6+P9/jOrIrSYPyYJ4GMz8E0Oo9JaPl+kbQQNVurx6sNwfKP93K1n3tc4XkAHrYLCTVbm
 hcZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779959873; x=1780564673;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+BZipBpjvnBsXT09usZPYGe5z3DQXqqT8jDo94YrMeE=;
 b=sdkCaFMVSNpTLMXpVpAfsbBiBxIBSiusoJKeqYmeSeUrI+6eYZcbDvLnFCFwAPNzI0
 6FIGdM7NrsYaqsGe207h+m75ryS6g9c0nz9GQeIQvTWImrYPlxMfcGwARIdQe6NSjvYp
 PeWt4DdJZmS/gPwTJuxfWbjCbpApzBDN4hjlWTV9VQwcN41BENvCBiKaS+u8iqU0XYUZ
 kSJA5LbsQszBxVmvEb75gvz0o0zHvymsrOc/GCHsCcloaIXNna0lzD587DGw/SF5yY3E
 DeWeb7eVsSgJNRk8psTcnU2V+lNilxAv+8QqUI3glkaEb2Ot2pkbqxEDeL3dhAxAZBwJ
 z01A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8oIHBZ33/P74tQigVnIW3+s8sx4bjRFoo28pddwQcnE4Rzc7eJlW7nRXjjQMdwZ+uf/jGyE/VqaJZbLVY=@nongnu.org
X-Gm-Message-State: AOJu0YwLOHjEo8EpewOu6jfi1io3HDA3qparfutd79W+APOYeirIMzIv
 FlAuQ8fr9WoXQp2lFNI6aC1cywtkw3wvRTDtOJ3iDflOqiztIAmd2S4Q1DEJEdsswdrrGbrkDMm
 lzIHT/FWL9AOKqEhiTQcxas+r3uS+NvbiQkTbt7mhMA==
X-Gm-Gg: Acq92OHKgxDWn821zKWWZ9OEPEQd3RtaZ1roc7n/zBMLg1/t1qq4BRR3DK5pTItXKr3
 +T7ABqzXnn3bYKtZg5llAiNk2T+gQzhfIWEB6zfPyAA/GK9J1ym6XL5yRocGmkM05wmjjuuHVz6
 gBbzMGgR+F02M1itrbqj+RU6coYgQr8dMThEOaquC+iGyoLazureYr1bze1P98bl+JFD/4QiplN
 4z7+kwSTLcVhBJGhlll5w19FhawUGA42JvHWJtxosJTjjAHKrUHy8K8M+2saG4oQql+fcWIRInn
 bi1zMdi+8ua2S9OFBsy1hSQBr0JocnCGoY8vm4R7PQd8uTFLHvQ+tZsdx5I/xbLA3e8cPZ+RwND
 GlA==
X-Received: by 2002:a05:690e:1306:b0:657:eeac:6ba2 with SMTP id
 956f58d0204a3-65f3f48186dmr19463682d50.46.1779959872611; Thu, 28 May 2026
 02:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260527175705.152301-1-christian.barry@usp.br>
In-Reply-To: <20260527175705.152301-1-christian.barry@usp.br>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 10:17:40 +0100
X-Gm-Features: AVHnY4KWH4MvTMUhzLxy1dB-ftoU7D35r3H2ac72n_hiU4LJCD90u04xoNJ0zIA
Message-ID: <CAFEAcA_t_Rx1CupetKR=aC1U6skFYmo_2oG-PyVYdwfJmb5X6Q@mail.gmail.com>
Subject: Re: [PATCH] disas: sparc: Fix integer overflow in compare_opcodes()
 for loop
To: Christian Barry <christian.barry@usp.br>
Cc: qemu-devel@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 qemu-trivial@nongnu.org, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Eduardo Augusto Cavalcanti <eduardoaugustoabc@ime.usp.br>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

On Wed, 27 May 2026 at 20:56, Christian Barry <christian.barry@usp.br> wrote:
>
> From: Christian Barry <christian.barry@usp.br>
>
> Replaced left-shift of a literal 1 by i inside of two for loops in compare_opcodes() with a call to BIT(i). This makes it so 1 is interpreted as an unsigned long int, preventing overflows.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/2618
>
> Signed-off-by: Christian Barry <christian.barry@usp.br>
> Co-developed-by: Eduardo Augusto Cavalcanti <eduardoaugustoabc@ime.usp.br>
> Signed-off-by: Eduardo Augusto Cavalcanti <eduardoaugustoabc@ime.usp.br>
> ---
>  disas/sparc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/disas/sparc.c b/disas/sparc.c
> index 5689533ce1..6fc057e3a2 100644
> --- a/disas/sparc.c
> +++ b/disas/sparc.c
> @@ -27,6 +27,7 @@
>     see <http://www.gnu.org/licenses/>.  */
>
>  #include "qemu/osdep.h"
> +#include "qemu/bitops.h"
>  #include "disas/dis-asm.h"
>
>  /* The SPARC opcode table (and other related data) is defined in
> @@ -2515,7 +2516,7 @@ compare_opcodes (const void * a, const void * b)
>       another, it is important to order the opcodes in the right order.  */
>    for (i = 0; i < 32; ++i)

The loop boundary is 32, so i is at most 1.

>      {
> -      unsigned long int x = 1 << i;
> +      unsigned long int x = BIT(i);

The loop boundary is 32, so i is at most 31. QEMU uses the
-fwrapv compiler option, so "1 << 31" is well defined,
even though it shifts into the sign bit. It's worth noting
in the commit message that we are not actually fixing any
bug here, we are merely placating somebody's static analyzer.

>        int x0 = (match0 & x) != 0;
>        int x1 = (match1 & x) != 0;
>
> @@ -2525,7 +2526,7 @@ compare_opcodes (const void * a, const void * b)
>
>    for (i = 0; i < 32; ++i)
>      {
> -      unsigned long int x = 1 << i;
> +      unsigned long int x = BIT(i);
>        int x0 = (lose0 & x) != 0;
>        int x1 = (lose1 & x) != 0;

If we're going to bother to change this not-a-bug, it would
be  better to do it the way that upstream binutils did it,
as noted in the gitlab issue: using "1ul".

-- PMM

