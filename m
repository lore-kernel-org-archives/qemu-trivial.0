Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guL8F-0005S4-D6
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 12:49:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36060)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guL8C-0005PF-P5
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 12:49:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guL8B-0004zS-LU
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 12:49:04 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:37166)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guL8B-0004xP-DU
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 12:49:03 -0500
Received: by mail-ot1-x344.google.com with SMTP id b3so11962499otp.4
	for <qemu-trivial@nongnu.org>; Thu, 14 Feb 2019 09:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qP4rrjmv0MXaaQehvxhFJAQ4MnwbEpcOo/q2XxIvzKM=;
	b=oWVEm1/MWqa8g4fTqew/nJQK3Lj8NZMtRnSfweTecj6HCKoJCffKbff4yj3LaRxC/P
	78Y0Ybdkjo5g7c8gkPNiSTsUI28znmuCxk9b6EdJjLmrex6RjPu+3AyhJQxtSifneOW/
	EriG94IluYGOmN3ur3tjfam6OtoJ7S2Q86Xmb4vZiTX8j/o7TSohec+YxTshZ777T6MH
	mYT2Spz9GqRDRn//czqvk/k/Syj2U5xlnoKKXu8JfTasBObNzmm7Gf0bxYdejc2O4MC/
	3nJyI+7KUUdEzI5eOJS1yLfg/XX5EyT48CT33BYv1w7SQ0LMd5ok2wwDaxzoJQxx6ExR
	qbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qP4rrjmv0MXaaQehvxhFJAQ4MnwbEpcOo/q2XxIvzKM=;
	b=c9S964bXbx1/NbRiOc+ALo5qEj7Z0mUlEriqkfKiztRN8l82vb7L3dQCgPOSNO5ubO
	p7hKQ+kPJ5OHsRrolHDuQW3evzi3o5RLSGkj1JiN4Ez7eezzzMj3mcm1X1UqC+yF/Db0
	u99fzFO4DaxnSsAZWJIEB/RdPu2Bkp3HYQPPftnCtGpKqtfCMViyB05AkvlzmvauGi4j
	qyEQJpq4eZnAzwR/Qlis1xWgaatyG2wBke1YIzquolM+V0j0eK+oh7DU2aaBgjsyp+Yq
	j0+m/qdQZNp4oB9GKFHEQ1XVgihzts3vDhnPdPRymCf4ugiPhnRwcZRdHt3nk30Zns5V
	2OaA==
X-Gm-Message-State: AHQUAuZU+4vnjBvouVb+rT9ldRbcCetawzclf46iAurxLOjlOG4FB7iZ
	mG4SiuDWerBABjwFgrJMTCFLEctVm1nKncrSUhCmIhDXYoI=
X-Google-Smtp-Source: AHgI3IZtlzfzrq6VzJapVSgrqw4bpIHfc1Zz9YR1W2W7/qtYNJiG9xpxvkUUXFdnQskugiuNTSE//cLr346iuOiOzI0=
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr3257816oth.317.1550166542192; 
	Thu, 14 Feb 2019 09:49:02 -0800 (PST)
MIME-Version: 1.0
References: <1550008033-26540-1-git-send-email-sandra@codesourcery.com>
In-Reply-To: <1550008033-26540-1-git-send-email-sandra@codesourcery.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Feb 2019 17:48:50 +0000
Message-ID: <CAFEAcA8eFexmymsaur-DtgYdKcyJB0ia7dW_vp358hbySsyBDw@mail.gmail.com>
To: Sandra Loosemore <sandra@codesourcery.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gdbstub: Send a reply to
 the vKill packet.
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
X-List-Received-Date: Thu, 14 Feb 2019 17:49:06 -0000

On Tue, 12 Feb 2019 at 21:52, Sandra Loosemore <sandra@codesourcery.com> wrote:
>
> Per the GDB remote protocol documentation
>
> https://sourceware.org/gdb/current/onlinedocs/gdb/Packets.html#index-vKill-packet
>
> the debug stub is expected to send a reply to the 'vKill' packet.  At
> least some versions of GDB crash if the gdb stub simply exits without
> sending a reply.  This patch fixes QEMU's gdb stub to conform to the
> expected behavior.
>
> Note that QEMU's existing handling of the legacy 'k' packet is
> correct: in that case GDB does not expect a reply, and QEMU does not
> send one.
>
> Signed-off-by: Sandra Loosemore <sandra@codesourcery.com>

Thanks, applied to target-arm.next.

As an aside, do you know if there is any kind of test suite for
the remote protocol that implementors of a debug stub can use to
check that they're conforming to it?

-- PMM

