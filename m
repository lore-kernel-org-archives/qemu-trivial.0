Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1Bob-0006Dt-7Q
	for mharc-qemu-trivial@gnu.org; Mon, 31 Oct 2016 08:35:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39377)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c1BoY-0006CF-PB
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2016 08:35:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1c1BoY-000266-4Q
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2016 08:35:46 -0400
Received: from mail-ua0-x22c.google.com ([2607:f8b0:400c:c08::22c]:35227)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1c1BoX-00025u-Va
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2016 08:35:46 -0400
Received: by mail-ua0-x22c.google.com with SMTP id 12so102489592uas.2
	for <qemu-trivial@nongnu.org>; Mon, 31 Oct 2016 05:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+u3DoKKMBaqAehCnxFqiO+CGN/wdMGz7xUZZvbbrIkE=;
	b=Pq9qhgOtoF6oLxjAhE6I3K+o/4EeuiNKr0Iv0BI5L7qHvE3B7yAKbk6CbZq6DJRr7B
	33VQ6f4Q3d4x8RRWg9vjobdVkMulplLEiCXQatVIsIzbk7OXZBQBWFV1kvmGWWt7shfu
	otQgYGS7dFap6D1lpU+RyA/Ai7de/ZtdSyKsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+u3DoKKMBaqAehCnxFqiO+CGN/wdMGz7xUZZvbbrIkE=;
	b=FX9397s/gfd8qqMaHkRxSGRGZf/jPqT6ApjGFuoAXyeU8AYn3HJThuUG6En8ftc+cJ
	yz6nkv768/U9QwI5yqAPMZUTYDQDNQTp7ESfM/9b2nmaM5r0f7y28J2FSFayucdyimUj
	j1YJ7NlP/VVgH8RrFqDmvZJZhC52ZQ70c15TrqyIqwIwNLKQ8pGtQRigeusHbfOSHmap
	T50ThhOayC8yIPAwhOsmPnSO6W0TAMuMnd8j1ALTOpzb8ue3LrNd2K9hPR3D6tVqN22T
	FP0JsEcZEmoQeu2U5U28AM4gcIMBmxRI5x3HRrTLnp3w/TIWCNkJzOC4Oj+V0J2oPvGu
	P/Uw==
X-Gm-Message-State: ABUngvcG+AmfpkNiGVy0MRNFJLLRxU0wSsZ8akV6IfaXcjHC1YmyzAengY3fOoI2PgTCLixBT1kEFn92NBbpXLSi
X-Received: by 10.176.86.205 with SMTP id c13mr2705020uab.175.1477917345257;
	Mon, 31 Oct 2016 05:35:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Mon, 31 Oct 2016 05:35:24 -0700 (PDT)
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Oct 2016 12:35:24 +0000
Message-ID: <CAFEAcA828ieGQcDbxC9EU_R6WMMjsT7rqBQXtfpVQoB=sBrgww@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22c
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/23] Trivial patches for
 2016-10-28
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Oct 2016 12:35:47 -0000

On 28 October 2016 at 16:18, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's a next pull request for the trivial patches tree.
> Nothing exciting is in there this time, small things
> here and there.
>
> Thanks,
>
> /mjt
>
> The following changes since commit fd209e4a773dd5a7fea79eaaffd276ebcb99e92a:
>
>   Merge remote-tracking branch 'remotes/jnsnow/tags/ide-pull-request' into staging (2016-10-28 14:29:50 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
>
> for you to fetch changes up to 630b210b9abbf362905a2096c22c5eb1d6224e77:
>
>   Fix build for less common build directories names (2016-10-28 18:17:24 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2016-10-28
>

Applied, thanks.

-- PMM

