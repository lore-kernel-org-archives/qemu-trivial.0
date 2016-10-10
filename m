Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1btaHc-0006Mk-HF
	for mharc-qemu-trivial@gnu.org; Mon, 10 Oct 2016 09:06:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1btaHa-0006M4-FW
	for qemu-trivial@nongnu.org; Mon, 10 Oct 2016 09:06:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1btaHY-0004Tt-BO
	for qemu-trivial@nongnu.org; Mon, 10 Oct 2016 09:06:18 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:34563)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1btaHX-0004TZ-Us
	for qemu-trivial@nongnu.org; Mon, 10 Oct 2016 09:06:16 -0400
Received: by mail-vk0-x22a.google.com with SMTP id b186so85735767vkb.1
	for <qemu-trivial@nongnu.org>; Mon, 10 Oct 2016 06:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dF1Vv2t6CAhdUPsqARZg3cakyvJAoDwOkx2b8sBXxVQ=;
	b=fYsk+iB5YrG8y8L852xtzg208OTnbq3i4nKF48mk5oDcb2Kwxb2ff/KgLm0xf4gv+K
	WLyG3GYNBiuJ1TVDfYeE9dXVW2zYKtnBPgksQDUD4aDVhCKY17VNA847bqLc59kJue7Q
	XCXwxdVAJcKHGP3n7OyNxtXiZ1ISQrYg6l4Qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dF1Vv2t6CAhdUPsqARZg3cakyvJAoDwOkx2b8sBXxVQ=;
	b=mwtV0OVvqaIw7VbiYBIIZne1EBT8n/nWrzgXaVEVooMZ7gWJjAfE3Py7b9+0ceMgWI
	jjRNtBgg9MtoH4uAuIkZBj1GzG7wo7QMLjaxldbLlY8lZroYPYzJ4soPUbnfqskfBvly
	sHEbx66dhsYDoCMoz/4r2N8vAszht1pykxiwXajcBbKBZ1nygNyhLVRYBaPuS5HtC0dE
	NeWdg4tsMUPiDcujGpPPcsJ95Gwf6A53+inZj9XlE7SLCG/W8od1iW/UD6JmFDmv6LDn
	catzhQXP0+I7kGlqOVgBapW0NWOO4FAp7hoccF3zx8kDJoMkkoURGbrjacAKuPRLoXxb
	v4Zg==
X-Gm-Message-State: AA6/9RmfdaYHnF1+0udOEXSgUZcVqAx0r301/rPvHnWb6bkLmCCbIipy9rf1t+TGQTrqUlbJd/vBNnkxVYp0Czvh
X-Received: by 10.31.64.75 with SMTP id n72mr19114227vka.170.1476104775503;
	Mon, 10 Oct 2016 06:06:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Mon, 10 Oct 2016 06:05:54 -0700 (PDT)
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Oct 2016 14:05:54 +0100
Message-ID: <CAFEAcA8xugTQqpuu=shRHdeKTX9HbSxXwWvSHUrFBXmvuR9Obw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/26] Trivial patches for
 2016-10-08
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
X-List-Received-Date: Mon, 10 Oct 2016 13:06:19 -0000

On 8 October 2016 at 09:57, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Hi.
>
> Here's another trivial tree pull request.  Really trivial stuff
> all over, and many changes to MAINTAINERS file from Thomas Huth.
>
> Please consider applying.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 48f592118ab42f83a1a7561c4bfd2b72a100f241:
>
>   bsd-user: fix FreeBSD build after d148d90e (2016-10-07 15:17:53 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
>
> for you to fetch changes up to 52cfcb464255b4da5115408e2a6ce3327bbcb9df:
>
>   net/filter-mirror: Fix mirror initial check typo (2016-10-08 11:25:29 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2016-10-08

Applied, thanks.

-- PMM

