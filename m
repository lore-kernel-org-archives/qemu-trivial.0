Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VM2la-0002L9-07
	for mharc-qemu-trivial@gnu.org; Tue, 17 Sep 2013 17:25:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VM2lU-0002Es-7p
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 17:25:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VM2lL-0004iT-W1
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 17:24:56 -0400
Received: from mail-lb0-f181.google.com ([209.85.217.181]:41093)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VM2lL-0004i8-Oq
	for qemu-trivial@nongnu.org; Tue, 17 Sep 2013 17:24:47 -0400
Received: by mail-lb0-f181.google.com with SMTP id u14so5781629lbd.26
	for <qemu-trivial@nongnu.org>; Tue, 17 Sep 2013 14:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=wvX4ug6w8XGfrwq64tw5Xvo07hk6Z5x6YtBdezOsNhc=;
	b=a1f2kQ64mZRc9FjOYv9ZDgrZH5QnPoTV7AsM78nVzhYOKyRQJNso72tcDN++9WLgSB
	NBemLtH942NVof27A/7t1hoG114vELkNTsL+YBEGYHXt0dWXaAiBvuI8dvjEGEi28lnD
	A+FbA9MZP8NDAB5clLzCqG2aN4ibf9TSSoXiUa4wq3T/mVVD/4lrXgbhH6EyLkKo0/EX
	qhRbpX4k80C2oWDo26+evrofrFtU6B+SnAlIqu0Zgbuwj1qaefG0HNnBr7Qm9APF9Qbw
	tnJoP8sxIGttzxILQewCX/e2PTvmLXJqVQu2hQICITm5UOJnHYvb/jUGsCK3nE1HJCLL
	Z9kg==
X-Gm-Message-State: ALoCoQkYRckXZQ4Hm+t7mTLfnwYPVFdF5tammeKTyWhtTStXCYMaqrUUuoxteebJ7gpsgOrhfwCD
X-Received: by 10.112.198.39 with SMTP id iz7mr12527588lbc.24.1379453086739;
	Tue, 17 Sep 2013 14:24:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.161.232 with HTTP; Tue, 17 Sep 2013 14:24:26 -0700 (PDT)
In-Reply-To: <1379437402-30804-1-git-send-email-sw@weilnetz.de>
References: <1379437402-30804-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Sep 2013 22:24:26 +0100
Message-ID: <CAFEAcA-GzhJUud44EC14zyi0JEwYAer-wHuE9SyE5rzubOUdMA@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.181
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>,
	qemu-devel <qemu-devel@nongnu.org>, Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] cpu-exec: Fix compiler
	warning (-Werror=clobbered)
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
X-List-Received-Date: Tue, 17 Sep 2013 21:25:01 -0000

On 17 September 2013 18:03, Stefan Weil <sw@weilnetz.de> wrote:
> could you please review this patch which removes code added by you earlier?
> I have run tests with the old code and assertions to see whether the values
> were really smashed. They never were, and from the documentation of setjmp
> I'd not expect that they ever might be.

We had a discussion about this back in 2011. Any compiler which needs
these statements is definitely buggy -- the C standard mandates that
they're not needed. Unfortunately Jan never said what compiler he
was using; obviously the ones the rest of us were using at the time
didn't have the bug.
http://patchwork.ozlabs.org/patch/102980/ has the discussion.

-- PMM

