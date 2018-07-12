Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fdiDa-0007N2-1Y
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jul 2018 16:29:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60395)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdiDX-0007JB-5a
	for qemu-trivial@nongnu.org; Thu, 12 Jul 2018 16:29:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdiDW-0000e6-9D
	for qemu-trivial@nongnu.org; Thu, 12 Jul 2018 16:29:35 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:36823)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdiDV-0000dX-Rg
	for qemu-trivial@nongnu.org; Thu, 12 Jul 2018 16:29:34 -0400
Received: by mail-oi0-x243.google.com with SMTP id r16-v6so58265648oie.3
	for <qemu-trivial@nongnu.org>; Thu, 12 Jul 2018 13:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p1cGZaeiWaxX/ktzmdR8afvqdmRuEaROSB2FPDOCZLc=;
	b=YAXlKwMYUH92VgRVJ7WA8pD9sQJvcCIBKIy0V2f4OssbHPVwwuA3qGH9wqYACAatbe
	F7+kFitHuhRJtHBZNslKRVUP/vjF/XEP0NHK7HWCj6IrtNNr0diQSqXbiPCtUFm/1qIw
	D1MGXpqzDslj0cE3eAbeDToY1fIT9iOM1Jz7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p1cGZaeiWaxX/ktzmdR8afvqdmRuEaROSB2FPDOCZLc=;
	b=tXAr3Ap/UZYXke251Mmew0RZVp8Bi6K6AodiqEAHud+C1viE80x41FsdWaZJQnOxft
	mhcJzVvMG6AzzIjiZdFOwM4G3djwlrLz8l2Tcn/AljcgNH1zOgvpOcUYlfiuUgZXtKfw
	y7+GowJCLmV/BEpa9T5jgaNSfoGEsWTEdY9xfkNRoRntDuzQtPKXqpeF6Qy7VH1/+9/e
	JFSrs2qlF7xX7U+jgKJDiZI0PhiNcVcgimKtddNK9/W+Qcxcihx1phh5fwafOyx/6sfz
	obdc891gRyCBykVeicYLDVsWn9zQ68TmO1hras5yITueKgeJHM71V2DgpNOGepOv9V2i
	OmbQ==
X-Gm-Message-State: AOUpUlF2X25KG7e20rrk2IpqL3FAPF3gXgGuOZQt0m8nvgNnND5cbZhK
	vBx9zGEbp7JxFyYNBpSlsmxHYp7kLNpomMQEYiPSlA==
X-Google-Smtp-Source: AAOMgpdzAZuUDRgAvz3xONsD+YXU6WH4cdFSQLBkCyuP+NkzCTbpcY3Cwj3iIwliAgzuad1/pY81ZqCt3jziY1/bh9Y=
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr4262301oih.102.1531427373174; 
	Thu, 12 Jul 2018 13:29:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 13:29:12
	-0700 (PDT)
In-Reply-To: <20180712200152.28569-1-sw@weilnetz.de>
References: <20180712200152.28569-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 21:29:12 +0100
Message-ID: <CAFEAcA-D_Kw33EeMrCg4k=B0yLB8U_X92OC09BQ1JKH4UiYUNQ@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs: Fix some typos (most
 found by codespell)
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
X-List-Received-Date: Thu, 12 Jul 2018 20:29:37 -0000

On 12 July 2018 at 21:01, Stefan Weil <sw@weilnetz.de> wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  docs/COLO-FT.txt                     | 2 +-
>  docs/config/mach-virt-graphical.cfg  | 2 +-
>  docs/config/mach-virt-serial.cfg     | 2 +-
>  docs/config/q35-emulated.cfg         | 2 +-
>  docs/config/q35-virtio-graphical.cfg | 2 +-
>  docs/config/q35-virtio-serial.cfg    | 2 +-
>  docs/interop/vhost-user.txt          | 4 ++--
>  docs/replay.txt                      | 2 +-
>  docs/specs/tpm.txt                   | 2 +-
>  9 files changed, 10 insertions(+), 10 deletions(-)

Hi. A bunch of these are fixed by this patch posted last month
https://patchwork.kernel.org/patch/10459487/

which seems to have got lost because our qemu-trivial
patch process has stalled out. I think we should apply
that and then see what still remains to be fixed
after that.

thanks
-- PMM

