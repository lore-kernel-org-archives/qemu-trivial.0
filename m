Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axb5H-0005NG-JE
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2016 10:13:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axb59-000596-Eo
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 10:13:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axb4x-0002Tu-Ud
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 10:13:42 -0400
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:36322)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axb4w-0002M9-NQ
	for qemu-trivial@nongnu.org; Tue, 03 May 2016 10:13:35 -0400
Received: by mail-vk0-x22f.google.com with SMTP id c189so24708971vkb.3
	for <qemu-trivial@nongnu.org>; Tue, 03 May 2016 07:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BSWyHZJf0Si89QgdP/mr8lw/z9rQ3uPl2KldD1dKqYM=;
	b=VvlnMbgPNLFk27TIfE552h11IbbnI23jsg0EgtS+7nrdX4qOSv3ijLG002AQrotmrr
	ZZMZDaM/4ljd99RQmlHqUZ74SsJ/7XOUS8AEW8hpdctFU64aInoIC+rHS5XzPS12NOEe
	VUcbKy0AO12lUiFdB6SMsVEzChWZ/vloYA0RY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BSWyHZJf0Si89QgdP/mr8lw/z9rQ3uPl2KldD1dKqYM=;
	b=bYlLKyoUTvgFw6WykrlbLIDxiIJejg4iTkcuCQerj9bJbQguCoQJDae/d4vfPRAIt9
	DCYXcUZTLyukNOOrC1ywTPk8iLPsGZfdPucvlQBPFSXHR106581hYS7Y5cHxdHR6YnT3
	aGYOukWsgI6QS8UoAq+I7Eax5sCAsM90pLk1ptLZrBwuPdxU39sAnXtDP4TjHeRifh08
	sjsaOa447sdH6ZrgooAQ6r3P3Ov+DgxBM8CiSJ1PCicQOgezNqo0Fk7x7XxnOiOj7NWU
	Oux45BU1R9qmf9kHVatLTqc8TSLT/eaMtnYcwosRDHPZ6B7pShIvDVeyyDGvHSVe87E2
	S/tQ==
X-Gm-Message-State: AOPr4FUa62Xp1X1BDoUBu0sw4reMFcCkDTWUmYKSs/uQR+KOqVU9AeIr25rOejIc1wIUTh+1yP6swD/Ho9DK9JGH
X-Received: by 10.31.160.148 with SMTP id j142mr982775vke.83.1462284790998;
	Tue, 03 May 2016 07:13:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Tue, 3 May 2016 07:12:51 -0700 (PDT)
In-Reply-To: <CAF4BF-T44ixRn6EVqLvPC7pktEcCO8qQDJJd1UgN8WX6T=Dwcw@mail.gmail.com>
References: <1462237852-61856-1-git-send-email-chrisfriedt@gmail.com>
	<0b165339-9dde-57f8-959d-22122390ca0b@twiddle.net>
	<CAF4BF-T44ixRn6EVqLvPC7pktEcCO8qQDJJd1UgN8WX6T=Dwcw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2016 15:12:51 +0100
Message-ID: <CAFEAcA9=N-o9qobGs9GZCAjHbcPHR4j-FpZWFJmradUXreKFyw@mail.gmail.com>
To: Christopher Friedt <chrisfriedt@gmail.com>
Cc: Richard Henderson <rth@twiddle.net>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Fam Zheng <famz@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2v2] [RESENT-INLINE] Use
 libtool instead of ar to create static libraries on Darwin.
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
X-List-Received-Date: Tue, 03 May 2016 14:13:54 -0000

On 3 May 2016 at 14:50, Christopher Friedt <chrisfriedt@gmail.com> wrote:
> To be honest, if it weren't for the man page for libtool on Mac OS X
> [1] dating all the way back to Snow Leopard saying that libtool is the
> preferred tool on Mac for creating static archives, I'm left wondering
> if this is just a massive oversight / bug in Apple's ld64.

I think it's definitely a bug -- if "ar" and "ld" don't work
together Apple should remove "ar", not just unhelpfully break it.
We probably need to work around the bug anyway though.

thanks
-- PMM

