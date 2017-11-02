Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eAHDD-0008NX-7H
	for mharc-qemu-trivial@gnu.org; Thu, 02 Nov 2017 11:15:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eAHDA-0008Kj-K5
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 11:15:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eAHD9-0002Wa-LI
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 11:15:16 -0400
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:45204)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eAHD9-0002Vo-Eq
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 11:15:15 -0400
Received: by mail-wr0-x242.google.com with SMTP id y9so5343424wrb.2
	for <qemu-trivial@nongnu.org>; Thu, 02 Nov 2017 08:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pvnajjDwjsCnmpowPW8kzvvEecqqGNFAIGqe3wysGVk=;
	b=de2242Tsp3/UU6fYcFCnazlyP0lGm8GtJVHG7ja15dbtdWpChI/Q7iEzcMW6XGLCnW
	kqRnpGJ85Ow0qInnmqTbA9zTkCpdDC0swypIaA0Z9Y4foGLDnMdp8/xOenLXFFexLyiz
	+E3BiQnOJNjMnL9pw2fpPIrSHgkDCexbXnAAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pvnajjDwjsCnmpowPW8kzvvEecqqGNFAIGqe3wysGVk=;
	b=EymYVX8pPO986ce1jvVlGKO42/Hs5ycjMIHbo19Wg98GO134BXpwkMr8rWkAxwdGt7
	1eJjIHSF2x/HJku3ZIShyllqrv/E8TEnhiHCU9zmS5LjPMffPQhEU0V/KX9uvt5aUOvg
	6y+IgGZg3+vhzpozQtKUFXtGR9kYW8f+2PY111J7UUpZugOnrn5ecDi6q6czDZE9GxLc
	LvZ5nPHCTz86KX6n+MPns2XnXheXvCokEzwvFoPDWS3Lp0i9BehojHlMXo7aj6sF14zG
	eqsWEKa+wAOoJmF3gGEItrftHtwYN+dfV0RrCgzgakeTZWi1mPT+icX6dREkoWu6wCyO
	h+Eg==
X-Gm-Message-State: AMCzsaV+o+vubLBQInNvoHWu4pOfrxWxqKOwqoNu37cSjGET/qeid1l1
	XIuUXawOOfJ4I3WPnXTcK7ghvOAHibFX6BvppiOgNA==
X-Google-Smtp-Source: ABhQp+Thc74sSNy2f34uoKuaoViQMBqDqcEj40LnIaDXY79Bxo5zPYKLfyD0Ckbj+sT2AUZkIny4uI9Vt8rOnsyTxWU=
X-Received: by 10.223.157.11 with SMTP id k11mr3405367wre.281.1509635714393;
	Thu, 02 Nov 2017 08:15:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 2 Nov 2017 08:14:53 -0700 (PDT)
In-Reply-To: <d0aa7605-c262-273f-7fab-94e72f202aa7@gmx.com>
References: <20170903164952.26760-1-n54@gmx.com>
	<20170911171639.22005-1-n54@gmx.com>
	<CAFEAcA-wNp2T7BGih1O3-Tq1+OrYNnM1VqAneM3QfXrd5u9ZPg@mail.gmail.com>
	<d0aa7605-c262-273f-7fab-94e72f202aa7@gmx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Nov 2017 15:14:53 +0000
Message-ID: <CAFEAcA-E9TEay9xbeE9tZCHFvSLrE8R4V2ZttzEwoQN8JQzX9Q@mail.gmail.com>
To: Kamil Rytarowski <n54@gmx.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Jonathan Perkin <jperkin@joyent.com>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Tribble <peter.tribble@gmail.com>, 
	=?UTF-8?Q?Antonio_Huete_Jim=C3=A9nez?= <tuxillo@quantumachine.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Discover openpty(3)
 dynamically in configure
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
X-List-Received-Date: Thu, 02 Nov 2017 15:15:18 -0000

On 28 October 2017 at 18:07, Kamil Rytarowski <n54@gmx.com> wrote:
> I've naively expected that once a build on a certain OS will be fixed,
> it will be functional for longer period (at least few weeks). In one
> month qemu has been broken on DragonFly and SmartOS so they are not just
> broken in tests, but also in the basic build.

Yep; things do break if they're not tested, which is why I think
we have to have a host system being in our regular build/test
process in order to be able to call it supported.

> Because there is need to fix the SmartOS build in order to improve this
> openpty(3) patch, I'm resigning from it. I also resign from helping
> DragonFly port.
>
> I will focus entirely on the bits that I registered as a maintainer.
>
> I leave the decisions and steps about support of these platforms to
> other volunteers and qemu core maintainers.

Thanks for your efforts with the BSD porting work; we appreciate
it.

thanks
-- PMM

