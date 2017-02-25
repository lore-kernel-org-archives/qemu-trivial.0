Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1chf0E-0006g3-AH
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2017 11:15:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1chf0B-0006dy-Vg
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2017 11:15:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1chf0B-0002xG-8Z
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2017 11:15:19 -0500
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:38543)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1chf0B-0002wa-33
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2017 11:15:19 -0500
Received: by mail-wm0-x233.google.com with SMTP id r141so34502755wmg.1
	for <qemu-trivial@nongnu.org>; Sat, 25 Feb 2017 08:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pJ3W4h4oXpfMuqDl0h6HpXimmYOhnPkTPdaoU7cESvM=;
	b=CvxBGbjAC9qJC8dZ/C8AtvniSXb4gWPBhU7DqIgEZ89wRcQFcNVC0laTbaVaZgp7ly
	pNi+VIf+RXQdok66VAMehb8z3h/JQ+h9J8bDGAzlhzUC6GX1sYI/3CPiWioZu/Dl/CoY
	yjv4hy6gRdW0ta9OoFQzCAhi2xvaGHKhPWUfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pJ3W4h4oXpfMuqDl0h6HpXimmYOhnPkTPdaoU7cESvM=;
	b=B4hmI9XJUUxwuzLmd3fRnhqbvPYUDFQGj8bwSXInKLhDVE/gFDnPgvJUZm2epgzO85
	gCxIWhReJ1fwhrYvpM/xH7qERIWdmewW/YLBjjY/z+zVQKrc9BlrESmah3SNx8uWZ0Xf
	RzVcAAqMXH3VQTC8Ef7lNm7/Y19FrTMwflygNA7s08o4rEsa9+9mKaOVq3yVHd+7NASi
	ZiC3EFJTM/wrduFnl1qbqCd9YP3miTTWM3+kls0+iauV0eCnd3mwWqpR2KWIk5oskWvU
	EL/ijNHPdle7xhn4G59a/ska3JgQ+BOEHIIzX4CoDIqJdnLHfTO55QtXoT05afWiNRz9
	o3UQ==
X-Gm-Message-State: AMke39lvo2dYll/vbrgBHgRlczHiVX8Zx3Kvknc8TMMgIrj8GE5Gw5bVmks002S4H1kDqXAvUoqDK4vHjWbLYKPA
X-Received: by 10.28.55.199 with SMTP id e190mr6707296wma.92.1488039318107;
	Sat, 25 Feb 2017 08:15:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Sat, 25 Feb 2017 08:14:57 -0800 (PST)
In-Reply-To: <alpine.BSF.2.20.1702242123280.76443@zero.eik.bme.hu>
References: <cover.1487522123.git.balaton@eik.bme.hu>
	<4bed0ec61e74992657933af970366a9e2636589a.1487522123.git.balaton@eik.bme.hu>
	<CAFEAcA-KW64ar8dER9V7x87BzH0G_uQstqXFoA2kuf2j3Hc4WQ@mail.gmail.com>
	<alpine.BSF.2.20.1702242123280.76443@zero.eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 Feb 2017 16:14:57 +0000
Message-ID: <CAFEAcA9pjHt_vx10V-+H7j2_hc8gkMmJLfbYvSR2Z8dj4cguCw@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 04/10] sm501: Add emulation
 of chip connected via PCI
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
X-List-Received-Date: Sat, 25 Feb 2017 16:15:21 -0000

On 24 February 2017 at 20:25, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> On Fri, 24 Feb 2017, Peter Maydell wrote:
>> Dropping the requirement for a base addr is not really the same
>> change as adding the PCI device.
>
>
> This is needed for PCI device because the base is not accessible before
> something maps the BARs of the device so I had to use something else that is
> known. So this change is part of making it a PCI device but I could make
> this a separate patch if you think that's better. Should I split it off or
> can leave it here?

I would split it off.

thanks
-- PMM

