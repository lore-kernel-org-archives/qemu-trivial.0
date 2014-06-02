Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WrRSa-0006tO-VP
	for mharc-qemu-trivial@gnu.org; Mon, 02 Jun 2014 08:35:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47582)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WrRSU-0006tC-BJ
	for qemu-trivial@nongnu.org; Mon, 02 Jun 2014 08:35:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WrRSN-0004Wu-GC
	for qemu-trivial@nongnu.org; Mon, 02 Jun 2014 08:35:22 -0400
Received: from mail-lb0-f174.google.com ([209.85.217.174]:56992)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WrRSN-0004Wd-8z
	for qemu-trivial@nongnu.org; Mon, 02 Jun 2014 08:35:15 -0400
Received: by mail-lb0-f174.google.com with SMTP id n15so2510393lbi.33
	for <qemu-trivial@nongnu.org>; Mon, 02 Jun 2014 05:35:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Oor3xVWBopJpHRfjwaqD/Wu5+KaWwF4TXdPNX5DPmDk=;
	b=IRlrWjIvE1a351h2hm4bg+jBrlvL41PKPUEjy6rmHU4uEs08P0lzyS09IDBxfs9C7C
	zO82QYlsy/EqnlTx6yNVF1rx02tGD0Ty/jmFKb6oi4NIozz1/2xYXbDaRspB3ZQHGACh
	4tywZPnI/IB/kPsqY2yJZGRgsa4JlTn5IjkVqgwdhCyZob1VuuV3MNDb35A53UZZukk1
	jPfG0h3h2tJNtYLqxwtMJtPKpES5YOkd1fakYblwP1ki7azdYvCwXzCHHfxJq19wlkSk
	oXK+TmovdmcL/Y1ydBX7onWkyQVOUWQd49fs0DA3dRqpADPJBrNH+PR43SYitZQUwhnY
	Z48w==
X-Gm-Message-State: ALoCoQnSII+XHQUlbLRxbn+BqGbpT9E2cgY6+aClmwUi/qaVq1pBiz3NyQjU52OfDqR0qvOonwV5
X-Received: by 10.152.203.236 with SMTP id kt12mr27381372lac.8.1401712514163; 
	Mon, 02 Jun 2014 05:35:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Mon, 2 Jun 2014 05:34:54 -0700 (PDT)
In-Reply-To: <538C692E.9090000@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
	<1401088811-22923-22-git-send-email-mjt@msgid.tls.msk.ru>
	<CAFEAcA9wDmQmed6YNrFy5jyRTN2mCD3JOnk=f-eiqxGx5iycXA@mail.gmail.com>
	<538C692E.9090000@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Jun 2014 13:34:54 +0100
Message-ID: <CAFEAcA9s-YtGD=4rWLLFVpW8_Mebr-g0eZR9vRsybLfY0=DZOg@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.174
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Le Tan <tamlokveer@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 21/23] bsd-user: replace
 fprintf(stderr, ...) with error_report()
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
X-List-Received-Date: Mon, 02 Jun 2014 12:35:28 -0000

On 2 June 2014 13:08, Michael Tokarev <mjt@tls.msk.ru> wrote:
> I applied it and actually tried to compile-check it, on kFreeBSD.
> Compile went successfully, and I was satisfied, until I figured
> that my kFreeBSD test script only builds qemu-system.  So I went
> back and enabled this, and actually found the issue and even
> fixed it locally, by adding the #includes.  While doing this, I
> wondered, why such a basic/common subsystem is not included in
> there to start with, and so isn't used?  Maybe this is something
> which shouldn't be done?

I think it's not inherently wrong to use the error-reporting
infrastructure -- the *-user targets historically were very
much "only use the CPU emulation stuff", but they've gradually
accumulated more use of generic QEMU utility routines, especially
with the advent of QOM. But if we want to do that then we should
probably start with the linux-user code, which gets much more
testing, and only convert bsd-user when we're happy that it
doesn't have any unexpected issues. (Especially since bsd-user
as it stands is badly broken; I'd like to encourage the BSD folks
who are currently working on landing fixes and improvements to
it, so I'd prefer not to give them unnecessary extra rebasing
and merge-conflict resolution work by churning the current
mainline code too much.)

>> In short, I think we need to revert this commit
>> (1fba509527beb).
>
> Yes, that's what I think too.  Should I send a formal patch
> submission, or is `git revert' easy enough?  Even with my
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> if needed?

I'll just do a git-revert, with your acked-by, and push it
to master.

thanks
-- PMM

