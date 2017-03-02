Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjWWR-0002NM-1f
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 14:36:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjWWO-0002MT-E9
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 14:36:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjWWN-0003Hv-QJ
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 14:36:16 -0500
Received: from mail-wr0-x22d.google.com ([2a00:1450:400c:c0c::22d]:33849)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjWWN-0003HU-JX
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 14:36:15 -0500
Received: by mail-wr0-x22d.google.com with SMTP id l37so59958697wrc.1
	for <qemu-trivial@nongnu.org>; Thu, 02 Mar 2017 11:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=AIOxDeKgkjRi6LrqIa6XNPYumMCBLlRZRnXIOQsCpjI=;
	b=Sr6Zub7VaqcjXb3pizoKQ1EbIfPlrBK2C0VdncWMvF4k4CBOcumyvM7DS8Qn9e8j4E
	ptwqs0iHR7rUY/ynlvP82kEH+QcEacxcpWaBKUYpuuR2sB1lnFf8WWJlLkoyadunzX6L
	0Y8y9bKgOZgUAJjNbzf1bZI0Lhe1KTFSScLKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=AIOxDeKgkjRi6LrqIa6XNPYumMCBLlRZRnXIOQsCpjI=;
	b=VrfvjFLv2+IFOOwZhU6d4tyjOHWTjfWbA+3BMT1ZcapsoNv+/Sv6zBPli6G0Yi9CkF
	Ux7kBJ70DAj8+Mpw9NRm0QxiQwc1qIUhyZrYapGAxyeg3bY1VeSKKObyHp7L8F/WqrRV
	+lLG39JHB+vfJrnlSDX+mxbBwuOiMOFcSz+Ww7glwp6vMPO50cNkO8f4juffrYQrQuqp
	dbsAcr7TDhx8T1X+csKDNs/zOgZWZSVAiCgdG+2wqfTFwpacXMxemir/+5XH9LU7LgFD
	AMNydIq2Ds+u6CQ2gpoAyLBXKNGpqQjFinElTyBJYNgAQozbPFY1cJyoqCDcTy2E19QX
	Aobw==
X-Gm-Message-State: AMke39kCyACJr+HJNjzUEyVyPt8ZBsOCFuELTWA5All42WgHk53cc4fNz8KHKPRrLE5RloK+gOdY03k/g+A185fM
X-Received: by 10.223.152.215 with SMTP id w81mr15189614wrb.151.1488483374353; 
	Thu, 02 Mar 2017 11:36:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 11:35:53 -0800 (PST)
In-Reply-To: <69479ddca0f5d2c68bb5d3d050134aa725e74254.1488068248.git.balaton@eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<69479ddca0f5d2c68bb5d3d050134aa725e74254.1488068248.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 19:35:53 +0000
Message-ID: <CAFEAcA9yy6CJWrYNu+ipJ=Wd3fRt-ra343cWGy4Vu1Yfe2hMgA@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22d
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 09/14] sm501: Misc clean
 ups
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
X-List-Received-Date: Thu, 02 Mar 2017 19:36:17 -0000

On 25 February 2017 at 19:19, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> - Rename a variable
> - Move variable declarations out of loop to the beginning in draw_hwc_line
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/display/sm501.c          | 10 +++++-----
>  hw/display/sm501_template.h | 10 ++++------
>  2 files changed, 9 insertions(+), 11 deletions(-

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

