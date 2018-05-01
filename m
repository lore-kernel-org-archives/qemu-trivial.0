Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fDXHx-00055u-Fh
	for mharc-qemu-trivial@gnu.org; Tue, 01 May 2018 11:33:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40638)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fDXGc-0004Rv-Kw
	for qemu-trivial@nongnu.org; Tue, 01 May 2018 11:33:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fDXFK-00071H-EE
	for qemu-trivial@nongnu.org; Tue, 01 May 2018 11:32:34 -0400
Received: from mail-ot0-x231.google.com ([2607:f8b0:4003:c0f::231]:44580)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fDXFK-00070I-19
	for qemu-trivial@nongnu.org; Tue, 01 May 2018 11:31:14 -0400
Received: by mail-ot0-x231.google.com with SMTP id g7-v6so13290982otj.11
	for <qemu-trivial@nongnu.org>; Tue, 01 May 2018 08:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hl9ncGIhfxkLU86gsQZr9AFARLKKHM1A5MvQgrADpdw=;
	b=LL7uu09AAUMLpemnJuJInek0UvVPiTl4A9TbqTMkZ4OS2H/s/KX+FxWfSWyRKYqbrY
	eZFLyCLo5QzYD0fQdJkJGa6iWaAVsGMGPauym0XOXXgYK0yoszsDjEkWtJ4Pt2ubI1wR
	yMNPmenNACr0rQfJ5PSEnX03yc8VDKlU8a6S0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hl9ncGIhfxkLU86gsQZr9AFARLKKHM1A5MvQgrADpdw=;
	b=V55DXzXBwMzItnIMb1Yw5095cfLSNwxwb99RZ4tO2Hxv45gp3ca3/yXUa6IgLX68lK
	JiYC3dO5zkiNwxG6QEt3+15Yt4hW62+OJIj8Ktzk7oKmutNSRStoFrPjY1gtYXiVQEqO
	imq8sWon1jzB7e6QcgNfVsM37tjbtWtYziBaeVRc2ChSWQW4jYYul7VPMEHWYxYtqvJr
	kmFmrt1dH4rQtQ2WuKDYUf2v4DJfSOwbfebI0Vos3fCnM7odUu405yL61Vn8pEccdQ3P
	dlboRfIicPgmtGguIyBPyUhNrtdPrcrXF0Q8V1rHmDZFPkhI3uGF2CKZURK/2wniFb1F
	NVGg==
X-Gm-Message-State: ALQs6tD8TJXIsxX09YcFfdMta9l5F6QFNOKDHbXZI/+iBLZkgTzoIH9p
	PvpGWlTN8WjuhO/qfVSL5caYqpkh60TeBlmfeBNEbA==
X-Google-Smtp-Source: AB8JxZoN36e+2guXOmFu2zO9g/GqiW8w5FON4yifekdFywkrncEoVHhXQ21Jn8T4Fn9l4Hgx0S+MDwVSpYgffjXag1w=
X-Received: by 2002:a9d:2842:: with SMTP id
	h2-v6mr12205723otd.210.1525188673256; 
	Tue, 01 May 2018 08:31:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP;
	Tue, 1 May 2018 08:30:52 -0700 (PDT)
In-Reply-To: <20180501135547.12414-1-laurent@vivier.eu>
References: <20180501135547.12414-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 May 2018 16:30:52 +0100
Message-ID: <CAFEAcA9K2QmEXzfX-Vkk+0MyhYe7s4RfgJBemSXT0Jif-OYAeg@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Thomas Huth <huth@tuxfamily.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::231
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 0/4] M68k for 2.13 patches
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
X-List-Received-Date: Tue, 01 May 2018 15:33:57 -0000

On 1 May 2018 at 14:55, Laurent Vivier <laurent@vivier.eu> wrote:
> The following changes since commit c2c768500f17fc8cdcfa44d169f089953bb22748:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-2.13-pull-request' into staging (2018-04-30 10:43:41 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu-m68k.git tags/m68k-for-2.13-pull-request
>
> for you to fetch changes up to 83dc62f6ed6b4f2afce71d579a630441cca0957c:
>
>   hw/m68k/mcf5208: Fix trivial typo in board description (2018-05-01 15:37:54 +0200)
>
> ----------------------------------------------------------------
> Some fixes for m68k CPU emulation
> including the trivial one from Thomas for mcf5208 (m68k hardware)
> ----------------------------------------------------------------
>
> Laurent Vivier (2):
>   m68k: Fix floatx80_lognp1 (Coverity CID1390587)
>   m68k: remove dead code (Coverity CID1390617)
>
> Pavel Dovgalyuk (1):
>   m68k: fix subx mem, mem instruction
>
> Thomas Huth (1):
>   hw/m68k/mcf5208: Fix trivial typo in board description
>

Applied, thanks.

-- PMM

