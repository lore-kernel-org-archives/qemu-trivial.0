Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZZEF0-0006oq-B7
	for mharc-qemu-trivial@gnu.org; Tue, 08 Sep 2015 04:26:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZZEEx-0006ne-Hy
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 04:26:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZZEEs-0005WV-Gj
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 04:26:55 -0400
Received: from mail-yk0-f174.google.com ([209.85.160.174]:35824)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZZEEs-0005WH-D8
	for qemu-trivial@nongnu.org; Tue, 08 Sep 2015 04:26:50 -0400
Received: by ykdu9 with SMTP id u9so31995588ykd.2
	for <qemu-trivial@nongnu.org>; Tue, 08 Sep 2015 01:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=S7V15ElSAklc+WsIpD708PrPQ/UBVNfOEcRsIl4WiKU=;
	b=Xf5Q5Vl8HuSS/OPy+m92PyFnrmBW/r7OAZxmAqyRM0PNgtTTmKzcpz4mlgQ2ZA/G9p
	gVSW8YzVqgyZxgVYillJnmbz4J65eIFAK4ymbKFBUIHlTtUmbu4PocLkqI2NoJ0TH6CC
	088HDgGJncouixj3o2Mf2PJ1dacEpZSZhqa4XZel8DfrhAOuqAHpoXJeG/V6067m3um9
	LABOVPIA6sH9bdtlWCncSFDuQV3tt6dZl6S2DqYTxRfi8LNTwfOWVazcvnK2BFh9DR12
	rIyrlTkNy7PeoMGwuW/PRrLBKRZU+o0pnDPRbH5ZbR8MpMvrWYwaiyHcvxKAG7blKcu8
	RE2A==
X-Gm-Message-State: ALoCoQmn4voJS6R7c5O3iCC1Vc28slNfyxspQ0UZrHo1urW+qrRpS8YSHIaqIHvEyikQ4CT0FDFZ
X-Received: by 10.170.133.144 with SMTP id z138mr26273872ykb.111.1441700810003;
	Tue, 08 Sep 2015 01:26:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Tue, 8 Sep 2015 01:26:30 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1509072243451.7825@citymarket.hu>
References: <alpine.DEB.2.02.1508092307540.14941@citymarket.hu>
	<alpine.DEB.2.02.1509072243451.7825@citymarket.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Sep 2015 09:26:30 +0100
Message-ID: <CAFEAcA8e8zXxZj09NdJ30CGEYbvsuVvdOy823DiTuaqAuwvR5g@mail.gmail.com>
To: Veres Lajos <vlajos@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.174
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] typofixes
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
X-List-Received-Date: Tue, 08 Sep 2015 08:26:56 -0000

On 7 September 2015 at 22:45, Veres Lajos <vlajos@gmail.com> wrote:
> Hi,
>
> Please find attached a couple of typo fixes, mostly in comments/docs.
> (Please cc me directly, I am not on the list.)

That patch includes at least one change to linux-headers/,
which is definitely wrong. Typos in the kernel headers need
to be sent to the kernel list, and we will get them next time
we do a header sync. It also has a change to disas/libvixl,
which is also a bit pointless as that is an external project
which we sync with. Further, it mixes changes to comments and
docs (totally safe) with changes to code function names etc
(needs closer review), and it's pretty huge so it's hard to
review the latter very easily.

MJT: can you drop this patch from the trivial queue, please?

Veres: can you drop the libvixl and linux-headers changes,
and at least split the remainder into docs/comments vs
code changes, and resend the patches to qemu-devel, please?

thanks
-- PMM

