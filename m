Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1chHHf-00049T-2D
	for mharc-qemu-trivial@gnu.org; Fri, 24 Feb 2017 09:55:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1chHHc-00047f-MW
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2017 09:55:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1chHHc-0001zL-2x
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2017 09:55:44 -0500
Received: from mail-wm0-x231.google.com ([2a00:1450:400c:c09::231]:38907)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1chHHb-0001ye-SG
	for qemu-trivial@nongnu.org; Fri, 24 Feb 2017 09:55:43 -0500
Received: by mail-wm0-x231.google.com with SMTP id r141so16460107wmg.1
	for <qemu-trivial@nongnu.org>; Fri, 24 Feb 2017 06:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JJ9ZNXWK7gmLPkwxvozo0FDlVh1oadqkEVCm7VJjzAI=;
	b=WSjF7RPCanFRSvKmInJXQL08iLWT9vxZtojiZxKiSC97HVxKpql68P7conJgzFEeVU
	zIqicBY36cE7lmNs7LQw/Y9dJeZRCfAq1wbaOZrdVap1cyAqJhYFzcdjPO9/6d+1b89t
	v/erfLSH5Z567Vh3XLTomdmrU+53Fl/0japPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JJ9ZNXWK7gmLPkwxvozo0FDlVh1oadqkEVCm7VJjzAI=;
	b=hQkBH8DiGEueUWb8Hot5BoqsTA0cLjdC9nfwv4s0CILjGx7lR7gpbLmaE2V3CYjv8I
	DSurjwij3Bact1PtUeI5wcbgquoyH4B0uMoTt8AJoX+P54B73B4rwu4QTvIWQZszFMXn
	q7fM06H16IwkJuLD0XrvxH3o+l24yqjQmQxqD2Dit3UjjZNT6GhylX86eFGNbEXHkcsn
	SpGC7rdTy7V0kj3hnTOZtExKoKycjuT8JOpHsYJPSqQo9Jt+iXS3b1dTEe9D1UQIxMt+
	w8F65In6qadyX7ATjCdspzKOTK9TDPqR1Mri9oPmR7LeH8SkDYkf5nMEMPaJ7TtWoMg/
	aWqg==
X-Gm-Message-State: AMke39nzxi6z9fdkzPW/KL55XzrQnQH7tS+OT5eK1JklBzmNNpn+3Tdhb9Eldbbz32HFU19pgHhUL/J/N8sytf5i
X-Received: by 10.28.157.67 with SMTP id g64mr2932257wme.111.1487948142668;
	Fri, 24 Feb 2017 06:55:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 24 Feb 2017 06:55:21 -0800 (PST)
In-Reply-To: <5077e2a9732e1b9afcb0754e93624b787589ac61.1487522123.git.balaton@eik.bme.hu>
References: <cover.1487522123.git.balaton@eik.bme.hu>
	<5077e2a9732e1b9afcb0754e93624b787589ac61.1487522123.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2017 14:55:21 +0000
Message-ID: <CAFEAcA8gde7GfWhyRLyOB5yL_5zrm4b7tj4pH=GTj=RwZO_4wg@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::231
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 10/10] ppc: Add SM501 device
 in config for ppc and ppcemb targets
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
X-List-Received-Date: Fri, 24 Feb 2017 14:55:45 -0000

On 19 February 2017 at 16:35, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> This is not used by default on any emulated machine yet but it is
> still useful to have it compiled so it can be added from the command
> line for clients that can use it (e.g. MorphOS has no driver for any
> other emulated video cards but can output via SM501)
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>

If this is a generic PCI device then shouldn't it go into
default-configs/pci.mak ?

thanks
-- PMM

