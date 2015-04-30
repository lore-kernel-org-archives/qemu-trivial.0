Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynrux-000170-E5
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 13:06:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ynrup-0000t5-FF
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 13:06:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ynrry-0004D6-2L
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 13:03:32 -0400
Received: from mail-ig0-f172.google.com ([209.85.213.172]:38090)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ynrrx-0004Cp-UW
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 13:03:25 -0400
Received: by igbhj9 with SMTP id hj9so19237991igb.1
	for <qemu-trivial@nongnu.org>; Thu, 30 Apr 2015 10:03:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yURoZoDTk/CQkjZZP6OO+29DYOyseglopprME9SXZcs=;
	b=kVkem/gtqgLVE9I+5Hs7j2JyRswQGr/fY2K4lP9Hqo7Ed2uXTc6FUaKn25740Nx137
	LanDJibSoDGPduxiybP4yqVIZDd9lnSL5ABsY2FSXWp/frLd4+IAhAE/VQb/x4U/2PjA
	IuvrhMtRTVJX9rhr7w7aHWLBqpVa1/ocQYUja+f7fx7ihmULBNTPbaOU7u5CSWh5XlPW
	yJztRmSUncI+ARmKa5iHQeT+fDM1o9SiPCYy9HFzpDfZQo3RsHWzY/3n9GfcYYcVjjbt
	HJEEpxHzmXTxQfjXUyRvhHWx05lLG0N/TiBnYAKVAPqIz2qruIu9eKhVX5OOh1VsT4oN
	YyLg==
X-Gm-Message-State: ALoCoQlskA9b1b8ZT1Cqt3nU5+GQ9i72u5IfkLndP+aQhmln5Ry4RbENLdVL45XSgRKdi9AELUhZ
X-Received: by 10.50.109.138 with SMTP id hs10mr4976815igb.48.1430413405495;
	Thu, 30 Apr 2015 10:03:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.136.220 with HTTP; Thu, 30 Apr 2015 10:03:05 -0700 (PDT)
In-Reply-To: <cover.1430399271.git.mjt@msgid.tls.msk.ru>
References: <cover.1430399271.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2015 18:03:05 +0100
Message-ID: <CAFEAcA9jkEPjaOHxz5uNWkuVW21CAQ8XKQhgGTyOrUzbLbg5RQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.172
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/42] Trivial patches for
	2015-04-30
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
X-List-Received-Date: Thu, 30 Apr 2015 17:06:28 -0000

On 30 April 2015 at 14:10, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Another attempt, now without the problematic ARRAY_SIZE removal,
> but with additional patch removing the unused cpu_get_pc(), and
> with additional Reviewed-by.
>
> Resending only the newly added patch, not whole series.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 06feaacfb4cfef10cc0c93d97df7bfc8a71dbc7e:
>
>   Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (2015-04-30 12:04:11 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-04-30
>
> for you to fetch changes up to 553029351bac9f5b4f9ea72793e55f02e7677ec2:
>
>   openrisc: cpu: Remove unused cpu_get_pc (2015-04-30 16:06:18 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2015-04-30
>

Applied, thanks.

-- PMM

