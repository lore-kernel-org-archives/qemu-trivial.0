Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aRDx8-000144-7u
	for mharc-qemu-trivial@gnu.org; Thu, 04 Feb 2016 02:03:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aRDx6-00011h-0M
	for qemu-trivial@nongnu.org; Thu, 04 Feb 2016 02:03:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aRDx3-0001kK-RD
	for qemu-trivial@nongnu.org; Thu, 04 Feb 2016 02:03:39 -0500
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:37127)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aRDx2-0001jV-IS
	for qemu-trivial@nongnu.org; Thu, 04 Feb 2016 02:03:37 -0500
Received: by mail-wm0-x230.google.com with SMTP id l66so103039595wml.0
	for <qemu-trivial@nongnu.org>; Wed, 03 Feb 2016 23:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-type:content-transfer-encoding;
	bh=TBodLK014AY+m9x+D/LIiXgnTU99s2nUgIluC7CQDdU=;
	b=Y1S8q8vRJ6D9visYsF5jaD886BRO/psJkSHydq4u9uXo4gs3Q1uUWP/sRohb4i/bIo
	kanofU3Kh+H7GHEJQPKK5EAEB7C4GHWQ2u3qjyXN+bpB62wvTRPAAcxcMjDy4Xlw481R
	75CAad5qFJLKTbYpMC0tAe/pvVgykiWqoxOlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=TBodLK014AY+m9x+D/LIiXgnTU99s2nUgIluC7CQDdU=;
	b=AQbXzU8FNP0oL6m2JCFwip9H2whn6UyYcwWlkpKnIKYPARIhAFPxQoSrmcIsRUuHwT
	d9lmaNjqQhW9tNHODowlGimhqKVQBt5DRPhxRYzE2YOHpF3CAw9H44aOBflj5y7w72um
	1IwfvNmKczekWstveWhuzLKZUp3mRm948C+u0We85SKYoLLSXaOEnKXbVX7RiimgUdn8
	lt6X/LwvUFuRNDbAOYdWJE53bfSpPHHK0PwtcNEl9d9QUcko2kG+dodyNztbN5O5O6lV
	yxEd4NOqkSjZoD4iUSApE91RSXGemCKsZol2QhCv9GfUkU1/X6CixoNoujSMiSRGl2q6
	9gOQ==
X-Gm-Message-State: AG10YOQRmB156K5UmL5L8/4Xmfyi//NgeZMq2Dak0U+gcZd3CNUPpGbo7j3g9m/FUh9IReSS
X-Received: by 10.28.180.193 with SMTP id d184mr27342045wmf.64.1454569415741; 
	Wed, 03 Feb 2016 23:03:35 -0800 (PST)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	k130sm11303612wmg.6.2016.02.03.23.03.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Feb 2016 23:03:34 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id C095E3E01B2;
	Thu,  4 Feb 2016 07:03:33 +0000 (GMT)
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-12-git-send-email-alex.bennee@linaro.org>
	<20150804123331.GB8960@aurel32.net> <87y4b1oc96.fsf@linaro.org>
	<CAFEAcA-+gzYE3ys6ybmYP0-0j6gd9RgE6amm4=dkjwgZ6rhj1A@mail.gmail.com>
User-agent: mu4e 0.9.17; emacs 25.0.90.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
In-reply-to: <CAFEAcA-+gzYE3ys6ybmYP0-0j6gd9RgE6amm4=dkjwgZ6rhj1A@mail.gmail.com>
Date: Thu, 04 Feb 2016 07:03:33 +0000
Message-ID: <87wpqlneii.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::230
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 11/11] cputlb: modernise
	the debug support
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
X-List-Received-Date: Thu, 04 Feb 2016 07:03:40 -0000


Peter Maydell <peter.maydell@linaro.org> writes:

> On 3 February 2016 at 18:54, Alex Bennée <alex.bennee@linaro.org> wrote:
>> It preserves the old behaviour (and the general behaviour of DEBUG_FOO
>> going to stderr). However I'm happy to make it default to using the log
>> output.
>>
>> It does raise the question of if we should just enable the debugging by
>> default?
>
> Not without thinking carefully about it. This is programmer
> debug code for figuring out what's happening in a performance
> sensitive bit of code. "Just print to stderr" is the classic
> way to do this, and I don't think we should just convert that
> into userfacing trace.

Shall I just go back to the original fprintf output then? I made the
output optional a few review comments back.

>
> There may be useful user facing trace we can do of TLB
> operations but I wouldn't assume that our current debug
> printfs are it.
>
> thanks
> -- PMM


--
Alex Bennée

