Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V1gYy-0003rD-US
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jul 2013 13:39:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1V1gYw-0003r1-BB
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 13:39:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1V1gYv-0002qL-7R
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 13:39:50 -0400
Received: from mail-lb0-f169.google.com ([209.85.217.169]:46746)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1V1gT6-0000VA-IM
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 13:33:48 -0400
Received: by mail-lb0-f169.google.com with SMTP id d10so6592279lbj.28
	for <qemu-trivial@nongnu.org>; Tue, 23 Jul 2013 10:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=WOzOCDw1q4X1Fq4wOoKqfxn37tqdu9lhd0gNFTGs+qk=;
	b=k/IyRvs87QowhUjl2xETEgwIrTQUWvCOZiEL/G9woynDsKjVM9imEiP99br8sAn0oC
	re8Mb6UbVKi9LTBVlhH6aA3MDX47bx5L22rvNneHhKehXNckMafyrvFKZx6gLY+mFF+Q
	n2QNNcCj/rQYCBrCXbw5/8/rnCnUsrOT6Kae1QC3C+36soldLG7XQNg7UtkyTWJnHORG
	1DcMJ00HrVUR4RQVwfOMM9KnpQD2RwCQmQtXSf4pRX/wIP+BGLDSLVf5mKEVxfPYjEPA
	fsxYacQl/4dmz86qLRCboBaQDy5u4DH9RTGcXO9YmOE5Wi/VUoNH/M3SSAlq2A/tIZ99
	PvZA==
X-Received: by 10.152.4.163 with SMTP id l3mr15234897lal.60.1374600827418;
	Tue, 23 Jul 2013 10:33:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.13.2 with HTTP; Tue, 23 Jul 2013 10:33:27 -0700 (PDT)
In-Reply-To: <51EEBAD6.4020607@msgid.tls.msk.ru>
References: <1374598810-78021-1-git-send-email-petar.jovanovic@rt-rk.com>
	<51EEBAD6.4020607@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Jul 2013 18:33:27 +0100
Message-ID: <CAFEAcA87Vf5OOMNtnNhWMsRBJWr7WG3LBut9b5rW-iC9=n32mg@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQn6D77XIPP8JqgIwd0e8YJvpeLMcI6fh2MwiaH+fX8p1bIMoqjEjCr4goNs3ngLK+Lczs8d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.169
Cc: qemu-trivial@nongnu.org, petar.jovanovic@imgtec.com, riku.voipio@linaro.org,
	Petar Jovanovic <petar.jovanovic@rt-rk.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: correct
 argument number for sys_mremap and sys_splice
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
X-List-Received-Date: Tue, 23 Jul 2013 17:39:51 -0000

On 23 July 2013 18:18, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 23.07.2013 21:00, Petar Jovanovic wrote:
>> From: Petar Jovanovic <petar.jovanovic@imgtec.com>
>>
>> sys_mremap missed 5th argument (new_address), which caused examples that
>> remap to a specific address to fail.
>> sys_splice missed 5th and 6th argument which caused different examples to
>> fail.
>> This change has an effect on MIPS target only.
>
> While splice is obvious and appears to be correct, with mremap I'm not
> this sure.

This table in QEMU corresponds to the table in the kernel
in arch/mips/kernel/scall32-o32.S and should generally have
the same numbers in it.

The fix to mremap corresponds to Linux kernel commit 7dbdf43c
(from 2006); the fix to splice is 08d30879 (from 2008).

> On the other hand, sys_open is also declared as having 3
> arguments while the 3rd one (mode) is also optional,

Yes. All the number-of-arguments param does is cause
the main.c code to fish the extra arguments out of the stack,
since the MIPS 32 bit ABI doesn't have enough registers for
all of them to be in registers. If the argument is optional
and isn't used in this case, it means we've just copied
garbage as the arg6/7/8 param to do_syscall(), which is
exactly the same situation as if the guest ABI put all
syscall args in registers.

> until your last comment which states that the change has only effect
> on MIPS.  Which is quite puzzling to me

It's trivially obvious that it only has effect on MIPS,
because it's patching a piece of code which is inside
an #ifdef TARGET_MIPS guard.

Petar: I think it would be a good idea if you checked
the whole of our table against a recent kernel and made
sure we're in sync for everything, rather than fixing
things one at a time.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

