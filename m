Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WWoXQ-0002ip-4t
	for mharc-qemu-trivial@gnu.org; Sun, 06 Apr 2014 10:59:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WWoXJ-0002iE-4i
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 10:59:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WWoXE-0002JT-6A
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 10:59:05 -0400
Received: from mail-lb0-f179.google.com ([209.85.217.179]:32964)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WWoXD-0002J7-R6
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 10:59:00 -0400
Received: by mail-lb0-f179.google.com with SMTP id p9so3987664lbv.10
	for <qemu-trivial@nongnu.org>; Sun, 06 Apr 2014 07:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=t3H4rL7lvMpTHkJw8EMoJOCDAXKdBNO573lFP1nmQOM=;
	b=DwRdjkz1n0KH9BiVGKhOHM9TAh4O0ttybZ9QqgDyUpuGF8t1Mq2ZGO5X613XbDXPen
	E1BDoJjTu42JvO6VP0Wee0VDViFsGKrgPUCMyrNzwBlE8aBraW8umCnQC5HfrWyAPF83
	M7T/sz1MLzCO1NarSLZ8UONrGel3wuvxG5Fs/4SNmPwjuVAou0NTSF1I7O20QxuI1c1D
	4e/xQ0KmkW8kgcJBz7YLyf/ul6EzruQOPOb2GFVnZSnuz+cHkYjFICovuV6rkSA6tKhG
	PZ/urTA4XDeXcV1B2bxWC0CHsEF0fE7OHFoV9NsOUiKvtqoEyCd6N7LLEcrKcULshFlz
	eTzg==
X-Gm-Message-State: ALoCoQl2s25w8ptEQEPfWZYjSFNkXLljoRR1RrU5VwGDrsmqpdbgXy0vBXiD/pHmmCEnKwMLFtbp
X-Received: by 10.112.118.198 with SMTP id ko6mr16926048lbb.6.1396796338222;
	Sun, 06 Apr 2014 07:58:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.180.233 with HTTP; Sun, 6 Apr 2014 07:58:38 -0700 (PDT)
In-Reply-To: <53416107.1080709@msgid.tls.msk.ru>
References: <1396019577-2013-1-git-send-email-peter.maydell@linaro.org>
	<1396019577-2013-3-git-send-email-peter.maydell@linaro.org>
	<5340FDA3.1080902@msgid.tls.msk.ru>
	<CAFEAcA_uN=+R6UZ6FiRshH2XvSCYBKwcHZu5ugd_02rKeM=yDQ@mail.gmail.com>
	<53416107.1080709@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 6 Apr 2014 15:58:38 +0100
Message-ID: <CAFEAcA8hi3f2G5+uhkVdV0Fb2pJG=WHTyE1JdB4_ERfAiOwDeQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.179
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
X-List-Received-Date: Sun, 06 Apr 2014 14:59:10 -0000

On 6 April 2014 15:13, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 06.04.2014 14:18, Peter Maydell wrote:
>> On 6 April 2014 08:09, Michael Tokarev <mjt@tls.msk.ru> wrote:
>>> 28.03.2014 19:12, Peter Maydell wrote:
>>>> Add casts when we're performing arithmetic on the .hi parts of an
>>>> Int128, to avoid undefined behaviour.
>>> []
>>>>  static inline Int128 int128_sub(Int128 a, Int128 b)
>>>>  {
>>>> -    return (Int128){ a.lo - b.lo, a.hi - b.hi - (a.lo < b.lo) };
>>>> +    return (Int128){ a.lo - b.lo, (uint64_t)a.hi - b.hi - (a.lo < b.lo) };
>>>
>>> What was wrong with this one?  I don't think casting to unsigned here is
>>> a good idea.
>>
>> This patch is fixing these three clang sanitizer warnings:
>> /home/petmay01/linaro/qemu-from-laptop/qemu/include/qemu/int128.h:81:40:
>> runtime error: signed integer overflow: 0 - -9223372036854775808
>> cannot be represented in type 'long'
>
> Int128 is defined as { uint64_t lo, int64_t hi }, so the second half is
> signed (because Int128 should be able to represent negative numbers too).
>
> -9223372036854775808 is 0x8000000000000000 -- which is only sign bit = 1.

Yes, and 0 - this in signed arithmetic is undefined behaviour, which
is why clang is complaining.

> uint64_t - int64_t is already somewhat undefined - should the second
> int be treated as unsigned too? (I'm sorry I don't really remember the
> C specs in there).

This is well defined -- see C99 6.3.1.8 "Usual arithmetic conversions":
the int64_t value is converted to uint64_t and the operation is performed
using unsigned arithmetic (and the result of converting any int64_t to
a uint64_t is a well defined value).

> But more to the point - the new behavour, while "defined", is just as
> arbitrary as the old "undefined" behavour.  On overflow we can get either
> truncated or negative result, neither of which is right.

Currently on overflow we are giving undefined behavour -- that
means the compiler is allowed to return 42, make QEMU segfault,
delete all the user's files, or anything else it feels like. It does not
simply mean "result is unknown" or "result is what you might expect
on a 2s complement arithmetic CPU".

The obvious semantics here are to treat Int128 as a 2s complement
value. This is particularly useful since there is no UInt128, since it
means you can actually treat it as an unsigned 128 bit integer if
you want to (though you wouldn't be able to use the comparison ops,
obviously).

>> /home/petmay01/linaro/qemu-from-laptop/qemu/include/qemu/int128.h:81:47:
>> runtime error: signed integer overflow: -9223372036854775808 - 1
>> cannot be represented in type 'long'
>> /home/petmay01/linaro/qemu-from-laptop/qemu/include/qemu/int128.h:56:47:
>> runtime error: left shift of negative value -9223372036854775807
>>
>> of which the first two are in this function.
>>
>> Note that int128_add() already has a cast.
>>
>> The alternative would be to say that Int128 should have
>> undefined behaviour on underflow/overflow and the test
>> code is wrong, but that doesn't seem very useful to me.
>
> It is still arbitrary.
>
> But whole thing looks more like an attempt to shut up a bogus compiler warning
> really.  It is not correct either way because there's just no correct way,
> because the end behavour is undefined in hardware, and we _are_ emulating
> hardware here.

This seems to be where we differ. This is not a bogus warning:
we're doing undefined behaviour, so either:
 (a) the test code is wrong
 (b) our implementation is wrong

"Leave it alone" is about the only thing that's definitely wrong.

> Yes, int128_add() has a cast already, and it is just as arbitrary as this one.

No, it also is avoiding undefined behaviour.

thanks
-- PMM

