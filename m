Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXBIu-0002t8-1L
	for mharc-qemu-trivial@gnu.org; Mon, 07 Apr 2014 11:17:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51005)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WXBIn-0002jI-1E
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 11:17:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WXBIi-0005lK-15
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 11:17:36 -0400
Received: from mail-lb0-f174.google.com ([209.85.217.174]:45739)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WXBIh-0005l4-Qj
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 11:17:31 -0400
Received: by mail-lb0-f174.google.com with SMTP id u14so4850090lbd.5
	for <qemu-trivial@nongnu.org>; Mon, 07 Apr 2014 08:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cGbj41y7Yv74J+Y8yafe8Y3BOO7xR96INkcQoASUgEM=;
	b=JS7v3kcZC7GuWfvxCSHdGsrdTbHCkMUouP/JZHkoNguKj6Ehy7fLqd8RVstRlj8C/1
	jpiVup2z2V23d+3NzzC/uaxx9xF7NJTvQ2D8D42wdSciP2eg0muyxQmpkr5TNlqjeO4s
	SEz80GQfH5dqK+QK4krtIM/QuO8LcfaRKyhug5o1S/ckDYr7vU9jXxZ0MvmVX0qoqrZd
	afCbPwlW7WUjggG6bMvHhbTmuIRo37M2fMm0kSDfBRPn/sgMmdnUqWV2v0ADC4pncrpa
	+aZDQZaIc9IjgKEvRfJU1b7mJDpNLC3++fZ49ty8kH2HF3x75qpXoDW/HWwIBnkaRK2x
	8GfA==
X-Gm-Message-State: ALoCoQnbmhanyKxNtGC3f+YcwDa8EMbNI3QZgyi0/SU3WDpuKC3Usu83jGhjbqh9xJ+SVKnIJzZw
X-Received: by 10.112.89.10 with SMTP id bk10mr428174lbb.64.1396883850652;
	Mon, 07 Apr 2014 08:17:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.180.233 with HTTP; Mon, 7 Apr 2014 08:17:10 -0700 (PDT)
In-Reply-To: <5342BC96.6010204@cloudius-systems.com>
References: <1396019577-2013-1-git-send-email-peter.maydell@linaro.org>
	<1396019577-2013-3-git-send-email-peter.maydell@linaro.org>
	<5340FDA3.1080902@msgid.tls.msk.ru>
	<CAFEAcA_uN=+R6UZ6FiRshH2XvSCYBKwcHZu5ugd_02rKeM=yDQ@mail.gmail.com>
	<5342BC96.6010204@cloudius-systems.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Apr 2014 16:17:10 +0100
Message-ID: <CAFEAcA-dCJ+i+g7F+hxgPr3AZjwOgrWj4X+9dXLvpj56JYQ07A@mail.gmail.com>
To: Avi Kivity <avi@cloudius-systems.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.174
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Patch Tracking <patches@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
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
X-List-Received-Date: Mon, 07 Apr 2014 15:17:41 -0000

On 7 April 2014 15:56, Avi Kivity <avi@cloudius-systems.com> wrote:
> On 04/06/2014 01:18 PM, Peter Maydell wrote:
>> The alternative would be to say that Int128 should have
>> undefined behaviour on underflow/overflow and the test
>> code is wrong, but that doesn't seem very useful to me.

> Isn't the test broken here?  It is trying to add (or shift) -2^127 and
> something else, and the result truly overflows.

Well, the test code is assuming "semantics as per 2s
complement arithmetic" and checking various corner cases.
As I say, we could define that this is invalid and
rewrite the test cases.

thanks
-- PMM

