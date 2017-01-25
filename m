Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cWNeK-00023v-6m
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jan 2017 08:30:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cWNeI-00021L-Kp
	for qemu-trivial@nongnu.org; Wed, 25 Jan 2017 08:30:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cWNeH-0001II-R4
	for qemu-trivial@nongnu.org; Wed, 25 Jan 2017 08:30:06 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:33701)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cWNeH-0001Hv-Lw
	for qemu-trivial@nongnu.org; Wed, 25 Jan 2017 08:30:05 -0500
Received: by mail-vk0-x233.google.com with SMTP id k127so133219356vke.0
	for <qemu-trivial@nongnu.org>; Wed, 25 Jan 2017 05:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jSGuvl5h2tvgLvAN8D7w5U+EogatWkwhu1zpFDxJ5BM=;
	b=Nrq90Bt8eq2Y+SU1L7eLNVXV586XCjg6hT+wVOQmFFY/9EqIDZotCd56QJ4EWOi90h
	0AsSDZ8h361OKDcS8Af7p92dT72TOR/Abog5nAoM69p8V9BOJ9WDnEy8+a7i+CRqIcEg
	yqxwEfQkP9eOer1NroRmAb3vIZCuJ4julyZyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jSGuvl5h2tvgLvAN8D7w5U+EogatWkwhu1zpFDxJ5BM=;
	b=AimgkyOxoKnyMwFS9YCO7FOBRmKuIfTuMvk+SQPCX3DkDqWbnmxvCl+YCPf2LU3mXN
	FdALBXQzji5V/92aDO8Gex2bbBVqC0FQ+xA8mfIUToKer1GeP8+FnDyv8PSWzklxseFT
	uiUxT2WZ7sOcfxI8cx5VsrwOn58UbsfQd+jwb+FE4mR3czzokXXOxIq2txdH5Lx3noMK
	FRpIpIYG8CfxVIMNGvTG4s745F+6+UHoM2sHkGVQrQRhbv1qfF0t+5OBNh9EPW0iJFej
	Tes0xgZIU9g23fXA6yWD1obnm/EpOaRXZgqvi7tytSiNrABPtVBPdNj4UwnkhsD4XiZ5
	bLFQ==
X-Gm-Message-State: AIkVDXJEZQDjmnErR2Xt80JGoObUTC3QScukWmTynVAElmQhygstq4BysCqv5zvkZsVBz02V8HCKMUHfxeBg8OlZ
X-Received: by 10.31.28.193 with SMTP id c184mr18150306vkc.173.1485351003444; 
	Wed, 25 Jan 2017 05:30:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Wed, 25 Jan 2017 05:29:42 -0800 (PST)
In-Reply-To: <cover.1485289633.git.mjt@msgid.tls.msk.ru>
References: <cover.1485289633.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 25 Jan 2017 13:29:42 +0000
Message-ID: <CAFEAcA_GLZt4sUGasgd6YWcxHZUWA8DOBem-yqHYTVi6PJARVw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/31] Trivial patches for
 2017-01-24
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
X-List-Received-Date: Wed, 25 Jan 2017 13:30:07 -0000

On 24 January 2017 at 20:29, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Rebased, yes it was a trivial merge conflict (a trivial patch
> changed comment in a removed section of a file). The same as
> before, with the merge conflict fixed and an r-b added.
>
> Not resending other stuff, just the cover letter.
>
> Thanks,
>
> /mjt
>
> The following changes since commit a9e404600a9bd1e6a26431fc89e5069092e67f14:
>
>   Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20170124' into staging (2017-01-24 17:26:26 +0000)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
>
> for you to fetch changes up to 5658ffa39aae034458231bc4abfee57637b88c6e:
>
>   hw/isa/isa-bus: Set category of the "isabus-bridge" device (2017-01-24 23:26:54 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2017-01-24
>

Applied, thanks.

-- PMM

