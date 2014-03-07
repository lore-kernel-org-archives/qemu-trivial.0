Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WLxTC-0004X3-J6
	for mharc-qemu-trivial@gnu.org; Fri, 07 Mar 2014 11:17:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59744)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1WLxT6-0004ON-Jc
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 11:17:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1WLxT2-0000Pz-2f
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 11:17:52 -0500
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:57839 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1WLxSk-0000MZ-I0; Fri, 07 Mar 2014 11:17:30 -0500
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1WLxSt-0008WG-Hh; Fri, 07 Mar 2014 17:17:39 +0100
References: <1394187082-31986-1-git-send-email-sw@weilnetz.de>
	<871tyecixy.fsf@linaro.org> <5319BE2C.7040801@weilnetz.de>
	<5319C21A.6010705@suse.de> <5319C768.2000903@weilnetz.de>
	<CAFEAcA8nbPodctcDPXUjxZz4+0WeeUP=24DxuLeyU9OsBT=Vew@mail.gmail.com>
User-agent: mu4e 0.9.9.6pre2; emacs 24.3.50.11
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
In-reply-to: <CAFEAcA8nbPodctcDPXUjxZz4+0WeeUP=24DxuLeyU9OsBT=Vew@mail.gmail.com>
Date: Fri, 07 Mar 2014 16:17:53 +0000
Message-ID: <87y50maspa.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-stable <qemu-stable@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests: Fix 'make test' for
	i686 hosts (buildregression))
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
X-List-Received-Date: Fri, 07 Mar 2014 16:17:57 -0000


Peter Maydell <peter.maydell@linaro.org> writes:

> On 7 March 2014 13:19, Stefan Weil <sw@weilnetz.de> wrote:
>> test-i386 does some calculations and prints the results (see source code
>> tests/tcg/test-i386.c). If the user mode emulation of QEMU works, it
>> should not matter whether that executable runs native or emulated and
>> both outputs be identical. They aren't - that's why I think we have a
>> TCG problem to solve.
>
> I think TCG x86 FPU emulation has been a bit dodgy since
> forever; it's a fair amount of work to go through and
> fix everything up to be bitwise exact results versus
> hardware and I think that nobody's cared enough about x86
> emulation to do that...

IIRC the behaviour is different depending on how much x87 vs SIMD FP you
go through. FWIW the Transitive translator was able to do most FP ops
with generated code (certainly on SPARC->x86_64) and only go to softfloat
for some things. But you did need to disable the x87 to do it.

But I get the impression that FP performance is currently "good enough"
for what QEMU gets used for.

-- 
Alex Bennée


