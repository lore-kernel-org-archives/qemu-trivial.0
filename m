Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W2QNw-0005re-Tj
	for mharc-qemu-trivial@gnu.org; Sun, 12 Jan 2014 14:07:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1W2QNq-0005hw-7E
	for qemu-trivial@nongnu.org; Sun, 12 Jan 2014 14:07:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1W2QNk-0006oX-94
	for qemu-trivial@nongnu.org; Sun, 12 Jan 2014 14:07:42 -0500
Received: from mail-la0-f41.google.com ([209.85.215.41]:42713)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1W2QNk-0006oO-28
	for qemu-trivial@nongnu.org; Sun, 12 Jan 2014 14:07:36 -0500
Received: by mail-la0-f41.google.com with SMTP id mc6so793537lab.28
	for <qemu-trivial@nongnu.org>; Sun, 12 Jan 2014 11:07:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7P2dFKKKS1l5teukF1Hm2iQRursfKd3iDcr/WEGW0vQ=;
	b=SXGQZhDfoe5L2yG673FbV/qYk7d4O2KL8qz/0d2Mc7IC5T9Es6lH0gA6ZQ1s/wmFVY
	YSkEiiJL9VpxXqdJXS3FlrosuI0pviFZgyqesxRcP2WpvNE24DThjNkI5tgtl6CXWNcq
	UMvPeQ3QFRzDcoQL4C/vFBfgMMlfsModC6xHSVEXhX+RfASzHCzZ8crI7OYWvjs3DJwq
	ecfcP3vGs6cXiSzes5uihycza+vWzh+XCKC7+3jU2cL7o3dpX01jGrrljUwz7x6nUAq7
	jyQAD667Xmb2UJ/E5nGbiYiVG+XTJhCOs75ib7We+H2/fQNLomhBMrdgFAoCyrQhbBIT
	ckiQ==
X-Gm-Message-State: ALoCoQmhSnsLj0WFYRcjVqCAV/LbeTtxqJ+0DZrJAKlPQWMul3l6nSA/16QXjkzAbNcOdeMuvRp7
X-Received: by 10.112.135.67 with SMTP id pq3mr2135600lbb.65.1389553655083;
	Sun, 12 Jan 2014 11:07:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.125.3 with HTTP; Sun, 12 Jan 2014 11:07:15 -0800 (PST)
In-Reply-To: <1389432851-11420-3-git-send-email-pavel.zbitskiy@gmail.com>
References: <1389432851-11420-1-git-send-email-pavel.zbitskiy@gmail.com>
	<1389432851-11420-3-git-send-email-pavel.zbitskiy@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 12 Jan 2014 19:07:15 +0000
Message-ID: <CAFEAcA9p1W5=-=e0VqJnKGJrakALT-_BCY-4GevYkd6s8JL29w@mail.gmail.com>
To: pavel.zbitskiy@gmail.com
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.41
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/3] linux-user: fixed
	getsockopt() optlen
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
X-List-Received-Date: Sun, 12 Jan 2014 19:07:48 -0000

On 11 January 2014 09:34,  <pavel.zbitskiy@gmail.com> wrote:
> From: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
>
> optlen parameter of getsockopt() of type socklen_t* was read into
> variable of type socklen_t, that caused zeroing out of upper 4 bytes
> when running s390x on top of x86_64. This patch changes optlen type
> to abi_ulong.

This patch and patch 3 are correct fixes, but shouldn't we be
more generally using abi_ulong for every argument we read from
the guest in do_socketcall() ?

It might be nicer to fix this by having a lookup table of SOCKOP_*
to number-of-arguments, and then hoist the get_user_ual() calls
outside the switch() statement to fill in an 'abi_ulong args[]' array.
Then the individual calls in the switch would just look like
    do_socket(args[0], args[1], args[2]);

thanks
-- PMM

