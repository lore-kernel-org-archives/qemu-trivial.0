Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7St4-0002ty-S4
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 14:25:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z7St2-0002tQ-Di
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 14:25:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z7Ssz-0006f8-4R
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 14:25:32 -0400
Received: from mail-vn0-f44.google.com ([209.85.216.44]:44172)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z7Ssz-0006eA-0v
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 14:25:29 -0400
Received: by vnbg7 with SMTP id g7so2843576vnb.11
	for <qemu-trivial@nongnu.org>; Tue, 23 Jun 2015 11:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7om/AvvuvqQaTN1V5oLM/SL3xcenFhLkWc39NRZMf4s=;
	b=OHyuIhz+Iusa9kqgqpEATmpmdqwcF0SNK9TFIbWfhlLnM2ls/KZzBFxK8LVDjUgJ6B
	Ad1VmKYgIhE97o6LneTDzRM11IQrTYb1d1dmcLG6y2jEy+YOS/9sld35UAunp56DLLSP
	92qEGTDdsVC1UlehG2A5k7y+X1RK0uFCSxRvkz8A+LeIeWzPue7f0daVmZnzWnAtSZLK
	Z2tsPBfuiXT7zyTDKzEDOWyIhnFYophTq+Cw48CgZtc2fK2stI58Yt3ZdaOuMMcN7Y6v
	NJqKwTinkM9gzPWjOKmO4ZACET9HB8gQvyGBX/fTkLQtQPDCF2rPuhK4baB+Z0C6LQ1m
	W/dA==
X-Gm-Message-State: ALoCoQn8NUqoYB6WitjGwghPtQD995BiNnvhXwcNjPL9mwl0buuwVPUo69GzCRFFQ5xm21ji9E81
X-Received: by 10.52.52.133 with SMTP id t5mr33325530vdo.56.1435083928560;
	Tue, 23 Jun 2015 11:25:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Tue, 23 Jun 2015 11:25:09 -0700 (PDT)
In-Reply-To: <cover.1435080226.git.mjt@msgid.tls.msk.ru>
References: <cover.1435080226.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Jun 2015 19:25:09 +0100
Message-ID: <CAFEAcA-FGyn+WmtV5guO+socwwrKY5VdT401zGu=kUxjDKz71g@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.44
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/21] Trivial patches for
	2015-06-23
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
X-List-Received-Date: Tue, 23 Jun 2015 18:25:33 -0000

On 23 June 2015 at 18:25, Michael Tokarev <mjt@tls.msk.ru> wrote:
> ..and another, with a typo fix with rebasing of the configure --help
> changes (missing space) :)
>
> /mjt
>
> The following changes since commit 6966b2a07190004e18ede33ce50a65009b36f3a6:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/pull-input-20150623-1' into staging (2015-06-23 13:32:50 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-06-23
>
> for you to fetch changes up to 3de3d698d942d1116152417f882c897b26b44e41:
>
>   util/qemu-sockets: improve ai_flag hints for ipv6 hosts (2015-06-23 20:23:39 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2015-06-23
>

Applied, thanks.

-- PMM

