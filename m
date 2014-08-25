Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLyOg-0005ax-OR
	for mharc-qemu-trivial@gnu.org; Mon, 25 Aug 2014 13:49:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XLyOb-0005Wy-09
	for qemu-trivial@nongnu.org; Mon, 25 Aug 2014 13:49:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XLyOU-0007D2-5K
	for qemu-trivial@nongnu.org; Mon, 25 Aug 2014 13:49:32 -0400
Received: from mail-lb0-f172.google.com ([209.85.217.172]:62527)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XLyOT-0007Cg-UJ
	for qemu-trivial@nongnu.org; Mon, 25 Aug 2014 13:49:26 -0400
Received: by mail-lb0-f172.google.com with SMTP id w7so41024lbi.17
	for <qemu-trivial@nongnu.org>; Mon, 25 Aug 2014 10:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gdk4CycKGklfoH5p2nrC7mhccJN5dYdGIHO52CwH+dc=;
	b=AlBf2pcxwnqtlwbUoaBbpIGZfGiedAdLaDSJXOxGgEs/byngm05VJEFOFHK5C0KCVa
	AZWBxo0mx4sMIsmNaHhFuI+izTNVKkpcXahrQb+kWogMdqoTnQ95OLBeFkI1hX8k2hgG
	q0GO9x6t+3Ww7KuVEylmtv/hKwyGSDvBTsK1I4PMJi7av/GuxkFM49d+02MeDde+zQyJ
	hYh06YybJqosxKDi6NPxJGmCzaj9q7N/VBNU8uldiIB97DX/m78FJ+m40O9as9Sn3P9o
	WAsjiOqSv2mDTmu0BA03C2MMFQSi2TzgaZD/pdK6CoLrFB7x99r2efSWYGo4r4wEij7L
	EKWQ==
X-Gm-Message-State: ALoCoQnriZmTyAi5vfVM5h/0M0AxyU4GIZqTbBqnuEgHzZxYrKe6S3ZLNJlcScuJjWFrn4k5MaQs
X-Received: by 10.152.9.170 with SMTP id a10mr9501423lab.79.1408988964732;
	Mon, 25 Aug 2014 10:49:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Mon, 25 Aug 2014 10:49:04 -0700 (PDT)
In-Reply-To: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Aug 2014 18:49:04 +0100
Message-ID: <CAFEAcA8OKLd9PAV3ibUmC3e2_Wj7HbG+KpBOLj3T97mdoEmymw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.172
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/11] Trivial patches for
	2014-08-24
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
X-List-Received-Date: Mon, 25 Aug 2014 17:49:37 -0000

On 24 August 2014 14:30, Michael Tokarev <mjt@tls.msk.ru> wrote:
> This time, we've a bunch of trivial stuff all over, including a series from
> zhanghailiang, some minor fixes from Stefan Weil and Peter Crosthwaite,
> and also a bugfix for a rare device - vmxnet3 - reviewed by the author.
>
> Please consider pulling/applying.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 33886ebeec0c0ff6253a49253fae0db44c9ed0f3:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2014-08-22 16:12:51 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-2014-08-24
>
> for you to fetch changes up to 40a87c6c9b11ef9c14e0301f76abf0eb2582f08e:
>
>   vmxnet3: Pad short frames to minimum size (60 bytes) (2014-08-24 17:11:08 +0400)
>
> ----------------------------------------------------------------
> trivial patches for 2014-08-24
>

Applied, thanks.

-- PMM

