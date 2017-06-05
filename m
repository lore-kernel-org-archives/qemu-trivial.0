Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHuFr-0002Gn-38
	for mharc-qemu-trivial@gnu.org; Mon, 05 Jun 2017 11:49:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dHuFo-0002Ga-UQ
	for qemu-trivial@nongnu.org; Mon, 05 Jun 2017 11:49:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dHuFo-00023T-4x
	for qemu-trivial@nongnu.org; Mon, 05 Jun 2017 11:49:17 -0400
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:38327)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dHuFn-00022O-Ti
	for qemu-trivial@nongnu.org; Mon, 05 Jun 2017 11:49:16 -0400
Received: by mail-wm0-x22d.google.com with SMTP id n195so79378458wmg.1
	for <qemu-trivial@nongnu.org>; Mon, 05 Jun 2017 08:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J1HSt917QLCZcIAbI0zwlVEbL5nmojP7UOLEJJZDqLw=;
	b=Yzk7TGNlV3ZbGacVclLqAXEydQYYU46koGQcUfv/SED1reDk3P+ynZXKnLBcknR9Sw
	UWQ1wiW8KcnW4uiApDj047YfpqvWRIhhwWDVs6IWwA8p0ZtOHXGnET/A0rsq4LoE8FlS
	rbGZeHNECRRzMz4bEAxOFh5OE5k3koM8ySAd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J1HSt917QLCZcIAbI0zwlVEbL5nmojP7UOLEJJZDqLw=;
	b=ZMRMZ6i8wxsn3fUf0syPBC/JnB9O9qGcblB6Fovlr8ypOdgKUhKBnaxcPazF2GGiBP
	xoaAVCCcp/NBfjz6Lo9zXLLVlut9y9TiiwUMgmVRo3XToEeLU8fq+Y7AhKv6fH1Fxlti
	2Gpf/ATYPDHhi39JIbLVmtDGUgUd7EFZRtX3kC/5YkC1JATpkPtguLZ8eMLY0q9oV9Lx
	RMemrRW1GytwT7QNKFr4+6AayUW5UoFHJ6Kj+iKpgCFAARd4RAQXfn6GXTlmDROJl4w3
	nsYku0jiBm091GED8r/6zKQHm9IFhvbCJ56NzioNqm41BAyguirvEneRP020zdjFSy57
	XDHA==
X-Gm-Message-State: AODbwcAS++24GPg2If9q0bhhzz5xi1/0L4M3DhJtSJsBTU0I2ibT+mss
	am8rMWm3pEgleufAbck+9f8+cG0scaf+
X-Received: by 10.28.230.153 with SMTP id e25mr7658357wmi.41.1496677754586;
	Mon, 05 Jun 2017 08:49:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.55 with HTTP; Mon, 5 Jun 2017 08:48:54 -0700 (PDT)
In-Reply-To: <cover.1496672631.git.mjt@msgid.tls.msk.ru>
References: <cover.1496672631.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jun 2017 16:48:54 +0100
Message-ID: <CAFEAcA80HS0qo7wHdRvvxPEbtbkGrdj3G7fQKoHtDiQzzTQvUQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/21] Trivial patches for
 2017-06-05
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
X-List-Received-Date: Mon, 05 Jun 2017 15:49:18 -0000

On 5 June 2017 at 15:25, Michael Tokarev <mjt@tls.msk.ru> wrote:
> This is a resend of the yesterday's trivial-patches queue, without
> an ivshmem change which broke static build (will take a look at
> that later). The rest is exactly the same, so sending only the
> cover letter.
>
> Thanks,
>
> /mjt
>
> The following changes since commit c6e84fbd447a51e1161d74d71566a5f67b47eac5:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2017-06-02 17:46:22 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
>
> for you to fetch changes up to 03e947f9c2264356aef037e6bf9c496b5deae2d2:
>
>   hw/core: nmi.c can be compiled as common-obj nowadays (2017-06-05 17:23:36 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2017-06-05
>
> ----------------------------------------------------------------

Applied, thanks.

-- PMM

