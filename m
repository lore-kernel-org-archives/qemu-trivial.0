Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WWkAZ-00028B-Ek
	for mharc-qemu-trivial@gnu.org; Sun, 06 Apr 2014 06:19:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WWkAS-000282-M5
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 06:19:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WWkAN-0005Wp-Af
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 06:19:12 -0400
Received: from mail-lb0-f181.google.com ([209.85.217.181]:53660)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WWkAN-0005Wf-3A
	for qemu-trivial@nongnu.org; Sun, 06 Apr 2014 06:19:07 -0400
Received: by mail-lb0-f181.google.com with SMTP id c11so3851695lbj.12
	for <qemu-trivial@nongnu.org>; Sun, 06 Apr 2014 03:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MNfB6IR35C35fBdSn+ELwnZJXFtv9XBq0Ejrr35U0to=;
	b=K/XUkGRH6qak6PLTq4QKVJE7G1F8RyrQW48YN4y8mnKxW/s1IKYRgXm7gXc4+IBFhS
	EEZYeIhm3LMviAARqaZPJ1Kq1aByrB96ejxZioATEHCTIqVyZw5mc74PNPkl+ByRykW+
	N10kNM89Vab4p5YuMh7W8azji1Fw7oirTG6Hwzo2KwF9z77Ezfg2sF5+5F+089fZBE1M
	MmcaY3MG6Ff/U4jd4gy1gHuxxzQq+r32EagiO1PBPg8KXuorHWGW6OorHEqy2sX6nRn7
	OROj+j6vvmB1xctGQf3oZn3gzjsirAIBC/oL7KK1HmKCgvquqo8hUsdNf3cLnDsf+7ec
	9g8w==
X-Gm-Message-State: ALoCoQmERZ/CFd8W+hwFi6F0t+oclxELthTlqPWasFJzzAcPaReOxVZg+6a/oe9CIAzcBU0xdqe7
X-Received: by 10.152.205.98 with SMTP id lf2mr86844lac.60.1396779545829; Sun,
	06 Apr 2014 03:19:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.180.233 with HTTP; Sun, 6 Apr 2014 03:18:45 -0700 (PDT)
In-Reply-To: <5340FDA3.1080902@msgid.tls.msk.ru>
References: <1396019577-2013-1-git-send-email-peter.maydell@linaro.org>
	<1396019577-2013-3-git-send-email-peter.maydell@linaro.org>
	<5340FDA3.1080902@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 6 Apr 2014 11:18:45 +0100
Message-ID: <CAFEAcA_uN=+R6UZ6FiRshH2XvSCYBKwcHZu5ugd_02rKeM=yDQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.181
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Richard Henderson <rth@twiddle.net>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
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
X-List-Received-Date: Sun, 06 Apr 2014 10:19:17 -0000

On 6 April 2014 08:09, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 28.03.2014 19:12, Peter Maydell wrote:
>> Add casts when we're performing arithmetic on the .hi parts of an
>> Int128, to avoid undefined behaviour.
> []
>>  static inline Int128 int128_sub(Int128 a, Int128 b)
>>  {
>> -    return (Int128){ a.lo - b.lo, a.hi - b.hi - (a.lo < b.lo) };
>> +    return (Int128){ a.lo - b.lo, (uint64_t)a.hi - b.hi - (a.lo < b.lo) };
>
> What was wrong with this one?  I don't think casting to unsigned here is
> a good idea.

This patch is fixing these three clang sanitizer warnings:
/home/petmay01/linaro/qemu-from-laptop/qemu/include/qemu/int128.h:81:40:
runtime error: signed integer overflow: 0 - -9223372036854775808
cannot be represented in type 'long'
/home/petmay01/linaro/qemu-from-laptop/qemu/include/qemu/int128.h:81:47:
runtime error: signed integer overflow: -9223372036854775808 - 1
cannot be represented in type 'long'
/home/petmay01/linaro/qemu-from-laptop/qemu/include/qemu/int128.h:56:47:
runtime error: left shift of negative value -9223372036854775807

of which the first two are in this function.

Note that int128_add() already has a cast.

The alternative would be to say that Int128 should have
undefined behaviour on underflow/overflow and the test
code is wrong, but that doesn't seem very useful to me.

thanks
-- PMM

