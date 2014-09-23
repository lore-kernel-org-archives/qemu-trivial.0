Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XWNwx-0007di-NC
	for mharc-qemu-trivial@gnu.org; Tue, 23 Sep 2014 07:08:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XWNwr-0007UU-DQ
	for qemu-trivial@nongnu.org; Tue, 23 Sep 2014 07:08:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XWNwj-00021M-Qi
	for qemu-trivial@nongnu.org; Tue, 23 Sep 2014 07:07:57 -0400
Received: from mail-lb0-f175.google.com ([209.85.217.175]:49406)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XWNwj-00020M-KV
	for qemu-trivial@nongnu.org; Tue, 23 Sep 2014 07:07:49 -0400
Received: by mail-lb0-f175.google.com with SMTP id w7so2794589lbi.20
	for <qemu-trivial@nongnu.org>; Tue, 23 Sep 2014 04:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=75S63wCy55y89qd+f0U11kRgzofJeYZyp4mDGZ9ZStY=;
	b=NQ6EMCu68g7oUeL7D0pYReioaXFt9bG7tqe3hlLI8e3O/JOaC/51aoa2OMAsX6dnmQ
	bnOCou522UuHHvV17Re8CtydZ8iwXYZT3G+U8tShtenZiuTAYRVBO2689qhsjIS6OaRX
	WNQVGqt40GXgtlgi5z1m5fj7HiqbGHszQ9QsdJTlfI0Y5VMDOzWSx4H6W2KGB6uhkH7C
	P1Lcppwi3N2pUXQebjusVHENKcOUSItjp4+4yfPdYgg6U8QznSygbJS2ZzHvEhFDjVvx
	xWjtsbOF6WQi+oov4FiP9SfC3vI7ieWZwzBPyQzAVfsysytk30A/W134SrSjvoHuB5h3
	IAoQ==
X-Gm-Message-State: ALoCoQla6gEo5grUpwrKTTYHFIjsc5Vo9elL0UllWUqkOeuDENxmBdIpXj1Mc3BvIoeczIaM5+Qz
X-Received: by 10.112.130.101 with SMTP id od5mr8876895lbb.76.1411470463121;
	Tue, 23 Sep 2014 04:07:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Tue, 23 Sep 2014 04:07:23 -0700 (PDT)
In-Reply-To: <1411373477-16938-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1411373477-16938-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Sep 2014 12:07:23 +0100
Message-ID: <CAFEAcA9YQF-S25cWXKP7Xv5vbrkhnbooeVa3=DE-AAJw0W_1tA@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.175
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 0/9] Trivial patches for
	2014-09-22
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
X-List-Received-Date: Tue, 23 Sep 2014 11:08:02 -0000

On 22 September 2014 09:11, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's a next (small) batch of trivial stuff.  Accumulated for over
> 2 weeks, but still quite small.  Random tiny things here and there.
> Please consider pulling/applying.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 07e2863d0271ac6c05206d8ce9e4f4c39b25d3ea:
>
>   exec.c: fix setting 1-byte-long watchpoints (2014-09-19 17:42:16 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-2014-09-22
>
> for you to fetch changes up to 7e3d523883202396ae7ff8bafcc796c86e026adc:
>
>   arch_init: Setting QEMU_ARCH enum straight (2014-09-22 12:09:43 +0400)
>
> ----------------------------------------------------------------
> trivial patches for 2014-09-22
>
> ----------------------------------------------------------------

Applied, thanks.

-- PMM

