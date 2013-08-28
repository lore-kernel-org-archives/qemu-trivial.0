Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VEavJ-0001hK-E6
	for mharc-qemu-trivial@gnu.org; Wed, 28 Aug 2013 04:16:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VEavD-0001av-Tq
	for qemu-trivial@nongnu.org; Wed, 28 Aug 2013 04:16:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VEav8-00059B-B3
	for qemu-trivial@nongnu.org; Wed, 28 Aug 2013 04:16:11 -0400
Received: from mail-lb0-f172.google.com ([209.85.217.172]:54236)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VEav8-00058w-4l
	for qemu-trivial@nongnu.org; Wed, 28 Aug 2013 04:16:06 -0400
Received: by mail-lb0-f172.google.com with SMTP id v1so3561023lbd.3
	for <qemu-trivial@nongnu.org>; Wed, 28 Aug 2013 01:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=lDYfBJrOAbl+cJGffzM/4WrZlbt0yRSiL0l62hAvEkQ=;
	b=NjlOULtOwEFyT4Rf6v7msWk71cqW7yqLPrlA+UyhiyNQzz6gGmxPu/n0JsvlZ05SB2
	R0M0iGW2RCELjE/GNzY4cnY46Ei5k5PawvhksCjlmst58yotyRt0LmpACPR4DHW+wmUl
	Lw3jTOdB20cun2spr2ihojF1pls0l5Widn/cIFyR1M+WPd4zzAldCHLtlHpYiBPVCqzG
	iJ2hqK94xkOU+N4GeyfsoXDr/de7G4aPAc8Ua4rtxbD315xmNeMXeym1P50PpkmivNle
	9aESgYH9oeN4JvlMWaoo51Ell9liNm+UPGUmYLppF+z2KtfszK6/fI1t3tkB4F2bZQOi
	wuZw==
X-Gm-Message-State: ALoCoQkgYdXMP7lpSQxybpqV8jImYAaJbEk88TN37s9+Qv58NY5PbVQmPOwJ6+tmHJNynTR4DOrX
X-Received: by 10.112.29.17 with SMTP id f17mr48103lbh.45.1377677764305; Wed,
	28 Aug 2013 01:16:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.169.70 with HTTP; Wed, 28 Aug 2013 01:15:44 -0700 (PDT)
In-Reply-To: <1377664796-11698-1-git-send-email-sw@weilnetz.de>
References: <1377664796-11698-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Aug 2013 09:15:44 +0100
Message-ID: <CAFEAcA8uJGphig_gzc2hrJCHejjq1qW-eq7NXScDHWVRRk7KeA@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Paul Brook <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [PATCH] target-arm: Report unimplemented opcodes
	(LOG_UNIMP)
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
X-List-Received-Date: Wed, 28 Aug 2013 08:16:16 -0000

On 28 August 2013 05:39, Stefan Weil <sw@weilnetz.de> wrote:
> These unimplemented opcodes are handled like illegal opcodes, but
> they are used in existing code. We should at least report when they
> are executed.

Yeah, seems reasonable. (There might be other unimplemented
bits lurking too but we can add logging when we find them.)

> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

> When running a QEMU system emulation of an ARM system
> (Raspberry PI), Linux booted, but when I tried to run a
> user session, it terminated without error message.
>
> It took me some time to see that bash got an illegal
> instruction exception. It was caused by ARM opcode 'setend'
> which is not implemented in QEMU's ARM emulation.
> The patch should help detecting similar scenarios in
> the future.
>
> Raspberry PI uses 'setend' in an optimized version of
> memcmp, so lots of other executables also fail with QEMU.
>
> As a workaround, the preloading of that optimized code
> can be removed. Of course an improved QEMU emulation
> would be better.

setend is kinda hard to emulate[*] and it's generally not used
by anything (except this weird memcmp implementation).
I'm inclined to think this "optimized" version of memcmp is a
bad idea -- I think setend is expensive on hardware, and I've
never seen it suggested by any of the toolchain folks who
do work on optimised versions of string routines. OTOH I
haven't run any benchmarks and hopefully whoever wrote
that rpi code did.

[*] not impossible, we already do something on the ppc
that's similar; however I'd really want to take the time to
figure out how to do endianness swapping "properly"
and what qemu does currently before messing with it.

-- PMM

