Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WWnpZ-0005SX-2Z
	for mharc-qemu-trivial@gnu.org; Sun, 06 Apr 2014 10:13:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WWnpR-0005Lb-Lk
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 10:13:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WWnpM-00041l-OR
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 10:13:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59390)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WWnpC-0003yN-6P; Sun, 06 Apr 2014 10:13:30 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8C8DC40B67;
	Sun,  6 Apr 2014 18:13:27 +0400 (MSK)
Message-ID: <53416107.1080709@msgid.tls.msk.ru>
Date: Sun, 06 Apr 2014 18:13:27 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1396019577-2013-1-git-send-email-peter.maydell@linaro.org>
	<1396019577-2013-3-git-send-email-peter.maydell@linaro.org>
	<5340FDA3.1080902@msgid.tls.msk.ru>
	<CAFEAcA_uN=+R6UZ6FiRshH2XvSCYBKwcHZu5ugd_02rKeM=yDQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_uN=+R6UZ6FiRshH2XvSCYBKwcHZu5ugd_02rKeM=yDQ@mail.gmail.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
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
X-List-Received-Date: Sun, 06 Apr 2014 14:13:50 -0000

06.04.2014 14:18, Peter Maydell wrote:
> On 6 April 2014 08:09, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> 28.03.2014 19:12, Peter Maydell wrote:
>>> Add casts when we're performing arithmetic on the .hi parts of an
>>> Int128, to avoid undefined behaviour.
>> []
>>>  static inline Int128 int128_sub(Int128 a, Int128 b)
>>>  {
>>> -    return (Int128){ a.lo - b.lo, a.hi - b.hi - (a.lo < b.lo) };
>>> +    return (Int128){ a.lo - b.lo, (uint64_t)a.hi - b.hi - (a.lo < b.lo) };
>>
>> What was wrong with this one?  I don't think casting to unsigned here is
>> a good idea.
> 
> This patch is fixing these three clang sanitizer warnings:
> /home/petmay01/linaro/qemu-from-laptop/qemu/include/qemu/int128.h:81:40:
> runtime error: signed integer overflow: 0 - -9223372036854775808
> cannot be represented in type 'long'

Int128 is defined as { uint64_t lo, int64_t hi }, so the second half is
signed (because Int128 should be able to represent negative numbers too).

-9223372036854775808 is 0x8000000000000000 -- which is only sign bit = 1.

uint64_t - int64_t is already somewhat undefined - should the second
int be treated as unsigned too? (I'm sorry I don't really remember the
C specs in there).

But more to the point - the new behavour, while "defined", is just as
arbitrary as the old "undefined" behavour.  On overflow we can get either
truncated or negative result, neither of which is right.

> /home/petmay01/linaro/qemu-from-laptop/qemu/include/qemu/int128.h:81:47:
> runtime error: signed integer overflow: -9223372036854775808 - 1
> cannot be represented in type 'long'
> /home/petmay01/linaro/qemu-from-laptop/qemu/include/qemu/int128.h:56:47:
> runtime error: left shift of negative value -9223372036854775807
> 
> of which the first two are in this function.
> 
> Note that int128_add() already has a cast.
> 
> The alternative would be to say that Int128 should have
> undefined behaviour on underflow/overflow and the test
> code is wrong, but that doesn't seem very useful to me.

It is still arbitrary.

But whole thing looks more like an attempt to shut up a bogus compiler warning
really.  It is not correct either way because there's just no correct way,
because the end behavour is undefined in hardware, and we _are_ emulating
hardware here.

Yes, int128_add() has a cast already, and it is just as arbitrary as this one.

So.. maybe for consistency with _add(), maybe to shut up useless warning, maybe
to have something to base units-tests on (arbitrary but defined), this can be
applied... I think :)

So, applied to -trivial ;)

Thanks,

/mjt

