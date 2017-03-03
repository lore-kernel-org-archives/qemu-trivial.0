Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjrtb-0002ej-Ln
	for mharc-qemu-trivial@gnu.org; Fri, 03 Mar 2017 13:25:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34358)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjrtY-0002cX-Ro
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:25:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjrtX-0004Gz-WF
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:25:36 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:36093)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjrtX-0004GI-Q9
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:25:35 -0500
Received: by mail-wm0-x22d.google.com with SMTP id n11so21745437wma.1
	for <qemu-trivial@nongnu.org>; Fri, 03 Mar 2017 10:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j+UI49BgHqhvcA3wku2UnzZw1sMf7bZB3a+mc1dMWvA=;
	b=KgSzC9yMhqHA/eLtRsig9OAiHLP6yYAYXnS9f8ZYzH/mq9I5TsKOdINL5nDoZQqmqm
	CQbu7+dxhviRPBet2rmtmWb8kLGul1sEhEjePz4Hl/poY341CtH0Px6iv2CvZ5A2c8vR
	yozzlQJ2g8WjnyYqRMz7wIFhfKGUYT9fWoXY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j+UI49BgHqhvcA3wku2UnzZw1sMf7bZB3a+mc1dMWvA=;
	b=N8v3D+I2/jrQxPCFXWREY0wi72N3C+h2BxvlltTeQNtCol8Axeg34M9Kc8Wuv9YOnn
	aWZoZfb33NEEygS4agrAQhXwXHlCQdWMTVJHKJvNSfx2jv0PPlWlJpamApp604uRN8WB
	LKFRCjLlJ8q6Jf6tMv/ag4gYF9OpsoCzLW5CkZgwV4XRgRP9I/KG6jAsduuFDv+h6pEv
	OsD0eblSoZRdsCIm3AZN8KTX0Fv/jLNUpAlV3o48qJcIZuHKTdKNR1IBOlhUmDAe5iA6
	W5ZJzbCKXOfq3QcA5sO4q/4GC3/sRQtp5DFNUvdpTs1OLFo1EXADmcBlsKpW1BIcZaED
	M/ng==
X-Gm-Message-State: AMke39mVatysYH56rjcTszoCOxvQDOSrlt3XHDwj4jGhiNshOFzvblJtG657+TcJVcFYck14Lwde/SdSntCVggVd
X-Received: by 10.28.157.67 with SMTP id g64mr4142626wme.111.1488565534788;
	Fri, 03 Mar 2017 10:25:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Fri, 3 Mar 2017 10:25:14 -0800 (PST)
In-Reply-To: <edad9d33db70b1408cb4d82e688d0a767aa0a960.1488504063.git.balaton@eik.bme.hu>
References: <cover.1488504063.git.balaton@eik.bme.hu>
	<edad9d33db70b1408cb4d82e688d0a767aa0a960.1488504063.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2017 18:25:14 +0000
Message-ID: <CAFEAcA-vSeTQPyV8RbwGEkvN1n1giu3im9FDQb264EEimsSQmw@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-trivial] [PATCH v3 06/13] sm501: Add emulation of chip
 connected via PCI
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
X-List-Received-Date: Fri, 03 Mar 2017 18:25:37 -0000

On 25 February 2017 at 18:31, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Only the display controller part is created automatically on PCI
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>
> v2: Split off removing dependency on base address to separate patch
> v3: Added reset function and PCI ID constant definitions in pci_ids.h
>
>  hw/display/sm501.c       | 58 ++++++++++++++++++++++++++++++++++++++++++++++++
>  include/hw/pci/pci_ids.h |  3 +++
>  2 files changed, 61 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

