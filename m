Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y5jxC-0000SJ-1c
	for mharc-qemu-trivial@gnu.org; Mon, 29 Dec 2014 18:42:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Y5jx9-0000Pn-NY
	for qemu-trivial@nongnu.org; Mon, 29 Dec 2014 18:42:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Y5jx6-0006QA-H2
	for qemu-trivial@nongnu.org; Mon, 29 Dec 2014 18:42:23 -0500
Received: from mail-la0-f44.google.com ([209.85.215.44]:39925)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Y5jx6-0006Q4-9k
	for qemu-trivial@nongnu.org; Mon, 29 Dec 2014 18:42:20 -0500
Received: by mail-la0-f44.google.com with SMTP id gd6so12105054lab.17
	for <qemu-trivial@nongnu.org>; Mon, 29 Dec 2014 15:42:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=geVYs0iCHDKXjArb4h1vqxMlAlEC2bLk5YfixVU3AKQ=;
	b=E2qClJQYuJotUM9+6IhO/4OgNDxyczMMUhVvH+TyNCtA3qANgqnHXRfxk4FzCZCywa
	RcZMTFyQRYTIYsEp/LqIstQ6ke5IR3mn6FxvKWlfZkgvoRGU/Z/7T4xJhK+Q1XvFcTEQ
	/fzss1/dwkfwNER5mL3+GM3MDZLYp8171V7PXNaBGoYpVrmwwCXw07YM7QechjEctuP7
	sv4F0LlMQ1Xotg3cIuCzMz2VS49oxvXaIHCl4JGW0/6Xda/xiDJZG4Mj4+xVh/zjiD/F
	TBK3pTlmztgCioxMfMCZmCU5LRHMkQAJmSs0fWcgD3EQ6D/wPhN15oUpgMHeOo7yBUAc
	/m6g==
X-Gm-Message-State: ALoCoQmms3Bnw30deMYbnDgnLHzH08cZ8PESMgErGFZODXb3q/N1LU3eB+UytuW/3EZiGrWaWag9
X-Received: by 10.152.120.97 with SMTP id lb1mr50811216lab.76.1419896539447;
	Mon, 29 Dec 2014 15:42:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.52.38 with HTTP; Mon, 29 Dec 2014 15:41:59 -0800 (PST)
In-Reply-To: <54A1B945.20509@terremark.com>
References: <1419260640-2922-1-git-send-email-dslutz@verizon.com>
	<54A125E6.4050807@msgid.tls.msk.ru> <54A1B945.20509@terremark.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Dec 2014 23:41:59 +0000
Message-ID: <CAFEAcA-GjRku9rRZr04itDx-bB40=DpdLNf9_V8QfHANiit4GA@mail.gmail.com>
To: Don Slutz <dslutz@verizon.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.44
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] Do not hang on full PTY
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
X-List-Received-Date: Mon, 29 Dec 2014 23:42:24 -0000

On 29 December 2014 at 20:27, Don Slutz <dslutz@verizon.com> wrote:
> I was not sure on this being trivial also, but it looked like it could
> be to me.  The uses of this FD all looked that they handle non-blocking.

Does g_io_channel_read_chars() definitely return G_IO_STATUS_NORMAL
(and not, say, G_IO_STATUS_AGAIN) for an attempted read on a non-blocking
fd with no data? Otherwise pty_chr_read() is going to call
pty_chr_state(chr, 0) which I think means "the other end has hung up"
and will take the fd out of the main loop's poll set.

thanks
-- PMM

