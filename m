Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjrvb-0004Cp-T3
	for mharc-qemu-trivial@gnu.org; Fri, 03 Mar 2017 13:27:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35331)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjrvZ-0004C7-PZ
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:27:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjrvY-00057E-Sl
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:27:41 -0500
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:37576)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjrvY-00056a-ND
	for qemu-trivial@nongnu.org; Fri, 03 Mar 2017 13:27:40 -0500
Received: by mail-wm0-x22f.google.com with SMTP id n11so21902978wma.0
	for <qemu-trivial@nongnu.org>; Fri, 03 Mar 2017 10:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=I4AguaczXDiEZ2NYlDEvc9NZgbmk+YL/VriqRTHrqko=;
	b=OxK4uKw5N2lY8dh0a0oese+g7S9ssYU4gdZXWT4EeoB4kCMaqSfoaA3+4X1/vCAzbx
	57JBDv1FOaEoivu8umHcTWsTCfp8XaZ+ez5vfdHke914TjUY82s9Ze/vA/yUmW3LWH3v
	/Y5ZjWgUHie/34LqclvJzuEq40m2/TN26+rNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=I4AguaczXDiEZ2NYlDEvc9NZgbmk+YL/VriqRTHrqko=;
	b=gDqdMU9xGe1FzvOT9ybA5h7BtH9JtIA4PnKfSlc+X73upjlnk5pv2itpq0YUjg5tE9
	PJFGY7bTghBHM0e4sngnz2hb0a2dDpiIK7jc0Ltwp41JsZ5jusa/c0cEwI9BmkPfSrPr
	CkByC8I7M5sRMykEnuQ/9VavDpPFd/WreY3IbPs3Ywp3vmyhaB8H6bMSlALR0PhOvEbb
	wYolnHIgNsBxXvc6HBs5p4Cjf4KXA+SGoSt91wpnQ1zFeMXstPH5CqtL3DebjWtqbZbS
	VHb5GIbsaH+pT2x6uQ2z+5pJjqeqaB5P73Cjas/hd3UbaKQQJS247w8jB09j8OlZKjLK
	o8ZA==
X-Gm-Message-State: AMke39ldzal3huidtHAuMvPfF8N+jlZhnmWwiVewD/9XWDIVvrM5dvBAwa/HSEhYa/dDbyHVzVbEkpY9uNVgq5XU
X-Received: by 10.28.157.67 with SMTP id g64mr4150113wme.111.1488565659756;
	Fri, 03 Mar 2017 10:27:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Fri, 3 Mar 2017 10:27:19 -0800 (PST)
In-Reply-To: <2631f4fa83bdb4ea9da97cb807a8ff1756db1684.1488504063.git.balaton@eik.bme.hu>
References: <cover.1488504063.git.balaton@eik.bme.hu>
	<2631f4fa83bdb4ea9da97cb807a8ff1756db1684.1488504063.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2017 18:27:19 +0000
Message-ID: <CAFEAcA-knxUep+x-svv+e6FaJ51r_6JwhBW20pR_PMF+2618OQ@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22f
Subject: Re: [Qemu-trivial] [PATCH v3 08/13] sm501: Fix hardware cursor
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
X-List-Received-Date: Fri, 03 Mar 2017 18:27:42 -0000

On 4 December 2016 at 18:01, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>
> v3: simplify return expression in get_bpp

In my review on v2 I asked for the commit message to
say clearly what the bugs being fixed here are. It's
a lot easier to review a patch if I know what it's supposed
to be doing rather than having to figure it out from scratch.

thanks
-- PMM

