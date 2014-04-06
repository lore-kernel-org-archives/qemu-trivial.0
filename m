Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WWozn-0001hm-41
	for mharc-qemu-trivial@gnu.org; Sun, 06 Apr 2014 11:28:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WWozh-0001gF-7K
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 11:28:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WWoza-0006E5-Pr
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 11:28:25 -0400
Received: from mail-lb0-f182.google.com ([209.85.217.182]:36243)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WWoza-0006Do-J5
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 11:28:18 -0400
Received: by mail-lb0-f182.google.com with SMTP id n15so4026632lbi.27
	for <qemu-trivial@nongnu.org>; Sun, 06 Apr 2014 08:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Vw1M8jpGdQn3sU4z/djWob3x4e6Uo4YquGOYJspkyTQ=;
	b=MXJ8EwE+BopVFhSX+WXSIIG17BAunQP4KYwsR/q3z+ESDNXlTCmcofFVl4SF01X/cV
	Ds0klqDsjGAdSy10HYgMtwaw3xb4xVaOBa7l4Q8SlxB8AOFLIikQoAVyHvpClW9CmZkn
	1gXtYUm2d1b9DCkYGU9KLDJFmHSaeIfoPm0VY7LvXgj2d+9ICcbnNLNBwe7KquhykfMu
	WWcQ90bBs5JMbJXPW4DspBHEmlKcOfDyJDI4V7jyQGsE5GoBz2W9nTi/W7sexn3TVQt3
	S4fhFFqTMGNxEd8cImdTas9gAZ69Ub44n4IsSXkRwRjk7A2cbFs57/YH/lnozs4drJxy
	o9/g==
X-Gm-Message-State: ALoCoQlCoZtnlD+1jlAxhOjEE9w+s04qLw/2tM/fSq0b7ZFTHHo/AC8QIrNdZLlikLNndCwVxVrP
X-Received: by 10.112.30.233 with SMTP id v9mr1769848lbh.35.1396798097130;
	Sun, 06 Apr 2014 08:28:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.180.233 with HTTP; Sun, 6 Apr 2014 08:27:57 -0700 (PDT)
In-Reply-To: <53416107.1080709@msgid.tls.msk.ru>
References: <1396019577-2013-1-git-send-email-peter.maydell@linaro.org>
	<1396019577-2013-3-git-send-email-peter.maydell@linaro.org>
	<5340FDA3.1080902@msgid.tls.msk.ru>
	<CAFEAcA_uN=+R6UZ6FiRshH2XvSCYBKwcHZu5ugd_02rKeM=yDQ@mail.gmail.com>
	<53416107.1080709@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 6 Apr 2014 16:27:57 +0100
Message-ID: <CAFEAcA8sr69XWzFjvBg8VN_ih2O=S78jWrXLrshmQAoWXhTQWw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.182
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Patch Tracking <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH 2/3] int128.h: Avoid undefined behaviours
 involving signed arithmetic
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
X-List-Received-Date: Sun, 06 Apr 2014 15:28:30 -0000

On 6 April 2014 15:13, Michael Tokarev <mjt@tls.msk.ru> wrote:
> It is not correct either way because there's just no correct way,
> because the end behavour is undefined in hardware, and we _are_ emulating
> hardware here.

Incidentally, I'd disagree with that statement on two grounds:
 * in hardware, integer overflow is well defined (at least for all
   the things we emulate) -- the 99% case is "it's 2s complement"
    and we might have a few cases of "exception on overflow",
    as with x86 MININT/-1 and IIRC SPARC or MIPS have
   some "exception on overflow" add/subtract insns. I don't
   know of any h/w daft enough to make signed integer arithmetic
   actually undefined-behaviour.
 * in QEMU we're not actually using Int128 in QEMU for h/w
   emulation -- we just use it for doing address arithmetic in the
   memory subsystem so we don't run into problems with
   overflow and insufficient range in 64 bit integer types.

In any case we can freely define the semantics of this type
in any way we find convenient for ourselves. I think it's much
easier to reason about things if you don't have to deal with
undefined-behaviour cases (if C compilers had a "behave
like a sane 2s complement system for signed arithmetic"
option I'd be advocating for us using it...)

thanks
-- PMM

