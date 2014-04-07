Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXGef-0004bQ-Qd
	for mharc-qemu-trivial@gnu.org; Mon, 07 Apr 2014 17:00:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <avi@cloudius-systems.com>) id 1WXAyQ-0005RN-MA
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 10:56:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <avi@cloudius-systems.com>) id 1WXAyI-00061k-W1
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 10:56:34 -0400
Received: from mail-ee0-f54.google.com ([74.125.83.54]:40073)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <avi@cloudius-systems.com>) id 1WXAyI-00061P-QS
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 10:56:26 -0400
Received: by mail-ee0-f54.google.com with SMTP id d49so735220eek.13
	for <qemu-trivial@nongnu.org>; Mon, 07 Apr 2014 07:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=ssIAr0oCvGqjvKqk4J/1hnoYqqi9gcg3yp78eSjIfFw=;
	b=jptyzpXaKKdo/udaGf4NF5fiZ8Owvg0uRZmb9f5EjDqPMG1V/04jotG6UR6r6xCiER
	1n++8hHknyXwHr33VIWYzj9Jijnq2qRdJz7dS3XypPQ5Lq4vv84+qQygbUNNqRzL2Jrq
	r3lE/K1mxUeKlxzvRnUJ1v692sX63pyGJJHo6YsMZ3ERYSPO21dJOs9rgLrMkLDs3OlW
	jeQbCRd62LS1BQXCew21FgRp+IOFen0UenuV3pDWeBNFKqIQ3H788KmcL88eZqsigHhc
	CEqI91d1fsCtt/k59jx3okTGBMBJdBiITdJ0kwdw9jnn9UfTIsuCYbLcI8juWP4puCW5
	SX/w==
X-Gm-Message-State: ALoCoQm0N8vSfJh0PyHreIg+8IGbRksZ0clByd+8gFcgkIn/6AzDc9/E+XUqOMobRzAfR1ktzCFl
X-Received: by 10.14.9.195 with SMTP id 43mr380755eet.89.1396882585695;
	Mon, 07 Apr 2014 07:56:25 -0700 (PDT)
Received: from augustus.local (84.94.198.183.cable.012.net.il. [84.94.198.183])
	by mx.google.com with ESMTPSA id p8sm42239066eef.26.2014.04.07.07.56.23
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Apr 2014 07:56:25 -0700 (PDT)
Message-ID: <5342BC96.6010204@cloudius-systems.com>
Date: Mon, 07 Apr 2014 17:56:22 +0300
From: Avi Kivity <avi@cloudius-systems.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>
References: <1396019577-2013-1-git-send-email-peter.maydell@linaro.org>	<1396019577-2013-3-git-send-email-peter.maydell@linaro.org>	<5340FDA3.1080902@msgid.tls.msk.ru>
	<CAFEAcA_uN=+R6UZ6FiRshH2XvSCYBKwcHZu5ugd_02rKeM=yDQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_uN=+R6UZ6FiRshH2XvSCYBKwcHZu5ugd_02rKeM=yDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.83.54
X-Mailman-Approved-At: Mon, 07 Apr 2014 17:00:31 -0400
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Patch Tracking <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/3] int128.h: Avoid
 undefined behaviours involving signed arithmetic
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
X-List-Received-Date: Mon, 07 Apr 2014 14:56:40 -0000

On 04/06/2014 01:18 PM, Peter Maydell wrote:
> On 6 April 2014 08:09, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> 28.03.2014 19:12, Peter Maydell wrote:
>>> Add casts when we're performing arithmetic on the .hi parts of an
>>> Int128, to avoid undefined behaviour.
>> []
>>>   static inline Int128 int128_sub(Int128 a, Int128 b)
>>>   {
>>> -    return (Int128){ a.lo - b.lo, a.hi - b.hi - (a.lo < b.lo) };
>>> +    return (Int128){ a.lo - b.lo, (uint64_t)a.hi - b.hi - (a.lo < b.lo) };
>> What was wrong with this one?  I don't think casting to unsigned here is
>> a good idea.
> This patch is fixing these three clang sanitizer warnings:
> /home/petmay01/linaro/qemu-from-laptop/qemu/include/qemu/int128.h:81:40:
> runtime error: signed integer overflow: 0 - -9223372036854775808
> cannot be represented in type 'long'
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
>
>

Isn't the test broken here?  It is trying to add (or shift) -2^127 and 
something else, and the result truly overflows.

A better behaviour would be to abort when this happens.  Int128 was 
designed to avoid silent overflows, not to silently cause breakage.

Not that I think it is necessary, there is no way for the guest to 
trigger an overflow.

