Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z0Uov-0007tj-LX
	for mharc-qemu-trivial@gnu.org; Thu, 04 Jun 2015 09:04:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53728)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z0Uoo-0007oh-Be
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 09:04:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z0Uok-0005Y5-Tn
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 09:04:22 -0400
Received: from mail-ie0-f180.google.com ([209.85.223.180]:36059)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z0Uok-0005Xc-PL
	for qemu-trivial@nongnu.org; Thu, 04 Jun 2015 09:04:18 -0400
Received: by ieclw1 with SMTP id lw1so35509944iec.3
	for <qemu-trivial@nongnu.org>; Thu, 04 Jun 2015 06:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7B0Yu3OC7W2Zckr/Qw3XAY4Jr/jpmIgTB3Nivo0Q99Y=;
	b=mSfEOCWXhuuXFAzHlatAif+tAgitvjg3WfO4LCJbnbl0YYQMSMyEbIQ46yC/QPZprS
	fb3iqUYrigGUgUR/4/iQ8sKBA1R/wMj2Lb3Dnm6QdAZBt6FXbKr/Bae6/S/rzXEzjWHM
	TBUzGPSZDvpr4ShW+w4ryVRYIWUtqQNOx4/QX76yMV+nF5TL57GRICNJIN7PZ/ABe0xw
	zIq2yhkkt06W9jiv3yo5flkO1jKuHhnalaBl63s0MrPa/iaG8j1n5Ib4Ek8ylTuJXXEA
	vnSm+dv9LI47NlU9TvTuCL3Td9zIm6N23ZPVE8Z1iwiyVdvDbd9vHOuuF+q4yA33rWP3
	UKyg==
X-Gm-Message-State: ALoCoQks/Y69uD72upxa6sjfkcUxtnUPfNQwBCYiUdac8nu8UCFIRVRFZFXADm6HKxI97ZNoovvF
X-Received: by 10.50.41.8 with SMTP id b8mr12032924igl.38.1433423058238; Thu,
	04 Jun 2015 06:04:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.21 with HTTP; Thu, 4 Jun 2015 06:03:57 -0700 (PDT)
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Jun 2015 14:03:57 +0100
Message-ID: <CAFEAcA_QuWUay06TXhmNjYZXJ8sDt=2CNDTD+2Khh5r7m2aXUw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.223.180
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/30] Trivial patches for
	2015-06-03
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
X-List-Received-Date: Thu, 04 Jun 2015 13:04:26 -0000

On 3 June 2015 at 14:08, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's another trivial-patches pull request.
>
> There are many patches in there this time, mostly due to
> work by Shannon Zhao, who has been busy chasing memory
> leaks all over the place.  I haven't applied _all_ of
> his patches yes, there's one series pending with more
> complex patches around qemu_allocate_irqs(), these
> needs some more review.
>
> There's also a fix for CVE-2015-4037 (predictable
> directory name in slirp smb code).
>
> Please consider applying/pulling.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 42d58e7c6760cb9c55627c28ae538e27dcf2f144:
>
>   Merge remote-tracking branch 'remotes/sstabellini/tags/xen-15-06-02-tag' into staging (2015-06-02 16:47:31 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-06-03
>
> for you to fetch changes up to de3852877f1e452321352fdb7e678f079876a41b:
>
>   configure: postfix --extra-cflags to QEMU_CFLAGS (2015-06-03 16:04:39 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2015-06-03

Applied, thanks.

-- PMM

