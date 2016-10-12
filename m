Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buNEQ-0007BB-EN
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2016 13:22:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buNEO-0007AC-MN
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 13:22:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buNEN-0001HX-GM
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 13:22:16 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:36026)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1buNEN-0001HI-BQ
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 13:22:15 -0400
Received: by mail-vk0-x22b.google.com with SMTP id 2so51898503vkb.3
	for <qemu-trivial@nongnu.org>; Wed, 12 Oct 2016 10:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j8tI4NpSiQhOyX/3cXlXVmqTCsElukTjG5E+ztS7dSE=;
	b=T8jwmIp4Zq2tacpAGajC/d6IwlTgum/TkrCyjRGoBWvqmy8+39E+uCNzhx8rt748uR
	C/iIm8vBBWcDae3GqgiO0Ad1zE8zay7KMYA+aaC5aq/u0a6rPFh/av/UQZ/VUIfuGt4j
	t2PU8t2teQQeK3edf9Pu0yaOu6+UqMvQWfId4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j8tI4NpSiQhOyX/3cXlXVmqTCsElukTjG5E+ztS7dSE=;
	b=jDD/iJb8qKNUTApS7NWNoO4NnuXNGKXKtcwGliloZZXcn9MYHo9C+F85jxDnmF9Qw4
	UI1riP1zBIIEO/sc9I0ZAiRztQMev/B3kMXhSCjD+cqiE1VqujhB1hszxVqFtmWr9rym
	zzVs8I5VtLwh66amcEP22TD4e5v2kfoD1LdagjXKiMPWi9G5hcR1uTj42QwSFUkZnOUK
	Lt8bLLjdSIAYa7V8z0a8vRBlrzk0bk833wGwrcvP1NjF2plzHvCTuZ2u1TQvaaGoD7tg
	1uV5GXamKEVBpKd4kT6mPxCDLVZyIcRO+CuTNlcfOArpzSYiZzwwuWZV0TotwNA/iEEt
	juyA==
X-Gm-Message-State: AA6/9RkWTqTZvKp4Np3EuuwzvO093oExmYGN9LJllA2UiSlQ8phXcXaMbpBXT1oB3SUlYUMWWA/5wgOXEEXaUko+
X-Received: by 10.31.0.67 with SMTP id 64mr1263536vka.173.1476292934827; Wed,
	12 Oct 2016 10:22:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Wed, 12 Oct 2016 10:21:54 -0700 (PDT)
In-Reply-To: <03c84be8a07e80bfcbc6692ebdddf3df@walle.cc>
References: <1476289396-10780-1-git-send-email-michael@walle.cc>
	<CAFEAcA_Ofp-OPk0WBr6jyZoGW+==yzU+MT3TMjyavVV1UceSDA@mail.gmail.com>
	<03c84be8a07e80bfcbc6692ebdddf3df@walle.cc>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Oct 2016 18:21:54 +0100
Message-ID: <CAFEAcA-1kG5_ODdgxOA7vVft94kPap4OZ_3BHjYSTOUt0AkVLQ@mail.gmail.com>
To: Michael Walle <michael@walle.cc>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <huth@tuxfamily.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-lm32: fix style issue
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
X-List-Received-Date: Wed, 12 Oct 2016 17:22:17 -0000

On 12 October 2016 at 18:11, Michael Walle <michael@walle.cc> wrote:
> Am 2016-10-12 18:35, schrieb Peter Maydell:
>> but I noticed while doing the review that our LOG_DIS
>> is wrong for the compare-immediates:
>>
>>         LOG_DIS("cmpei r%d, r%d, %d\n", dc->r0, dc->r1,
>>                 sign_extend(dc->imm16, 16));
>>
>> but the processor reference manual says cmpei's mnemonic
>> should have dc->r1 first and dc->r0 second.

> can I drop the DISAS_LM32 macro and just always enable the
> qemu_log_mask(CPU_LOG_TB_IN_ASM)? Looking at other CPUs this is sometimes a
> (debug) compile switch (eg ppc) and sometimes its always enabled (tilegx).

tilegx unconditionally does this logging because there's
no tilegx disassembler in disas/, and so printing log
statements in the decoder is a dubious but low effort way
to achieve the desired effect (that -d in_asm prints the
guest disassembly).

ppc on the other hand has a proper disassembler in disas/,
and so the LOG_DISAS() stuff is just debug-printf stuff
for the purposes of tracking down bugs in the decoder,
and like most of the debug-printf macros in devices it
is not compiled in by default (you turn it on by hand if
you have a bug it might help with), and exactly what is
logged is very much ad-hoc.

But lm32 has a disassembler in disas, so it doesn't need
to emit this stuff for -d in_asm to work, and indeed shouldn't
emit it by default, otherwise all the disassembly would be
printed twice. You can see this bug if you do:

./build/x86-all/lm32-softmmu/qemu-system-lm32  -d in_asm -D
/tmp/lm32.log -M milkymist -serial stdio -kernel
~/test-images/milkymist/flickernoise

as the resulting log looks like:

40000000:       98000000        xor r0, r0, r0
40000004:       d0000000        wcsr r0, 0

0x40000000:  98 00 00 00    xor      r0, r0, r0
0x40000004:  d0 00 00 00    wcsr     ie, r0

isize=8 osize=11
40000008:       d0200000        wcsr r0, 1

0x40000008:  d0 20 00 00    wcsr     im, r0

isize=4 osize=9
4000000c:       78014000        mvhi r1, 16384
40000010:       38210000        ori r1, r1, 0
40000014:       d0e10000        wcsr r1, 7
40000018:       e000003a        bi 232

0x4000000c:  78 01 40 00    orhi     r1, r0, 0x4000
0x40000010:  38 21 00 00    ori      r1, r1, 0x0
0x40000014:  d0 e1 00 00    wcsr     eba, r1
0x40000018:  e0 00 00 3a    bi       40000100

mixing the disassembly from the disassembler
with the debug output from the translate.c code in
a somewhat confusing way.

thanks
-- PMM

