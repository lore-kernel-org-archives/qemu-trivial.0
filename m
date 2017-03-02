Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjW1B-0001n7-4G
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 14:04:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjW19-0001mq-Aw
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 14:04:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cjW18-0006HU-Gf
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 14:03:59 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:37350)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cjW18-0006Gy-9N
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 14:03:58 -0500
Received: by mail-wm0-x235.google.com with SMTP id n11so33579335wma.0
	for <qemu-trivial@nongnu.org>; Thu, 02 Mar 2017 11:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=u483a9cGrZC4ifAuvNS9Xx2yKbIoeZBUW24Qv0RUbhw=;
	b=ifxG+/J1DAONyB+3p4ysuz21EGeCHKLkTqHZhrevhJrKe8dAEv3Bs+5nk5tTIARx4h
	gbrxwdu+PPf+EG3rQ61n/Q0FZ3dQ8ysge7IfwUeSk49YEH0W4XgBhos5qKh3NRAH1P7j
	FRNma1mExr7JrGG8w7m04LDV4BjUtneKZNuF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=u483a9cGrZC4ifAuvNS9Xx2yKbIoeZBUW24Qv0RUbhw=;
	b=Swdq0ipI0BEDhVw6rmrv4xgb92j+nK6CMFwIEw9LH83CCWYIA7YUBUxvDXSNygUOhD
	rijCfqQDfSwnoQEHYwjB4pJcMcP0rNr92qeojHuoHwpkzcqsCNlXojQQXY7S62Qfazw0
	Ik11S8r+/k9dAQVUoXCYBAipAjI6q1uAM7cHbCR7FIkRtPd1ulATES9xwKJs6wH5ai7X
	TlAIiHcO7RWVdIDeCos22h1kBPBMelSlFK6Ytjf/L8OqeglDmrIXuwp/G2sRcfVgshV0
	542auHHykj0YpKosHE5k2Udp1Oo7AE1eYELaJtZYkXEIt8rH8afGjvfbmvcZvaSs1/up
	aPPQ==
X-Gm-Message-State: AMke39litdL3u4glBIYH3JM5FiBFrXa7vUNU9jf3ff3G4YviO93xuvpqWZB5AYm/Al2o7eUfFmvFj0Jjbii0H/uE
X-Received: by 10.28.55.199 with SMTP id e190mr9121048wma.92.1488481437070;
	Thu, 02 Mar 2017 11:03:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 2 Mar 2017 11:03:36 -0800 (PST)
In-Reply-To: <CAFEAcA8hgztzBZ=4EK7GR_1V4WnKL_hp-CopC1q5NwxeARkgSA@mail.gmail.com>
References: <cover.1488068248.git.balaton@eik.bme.hu>
	<65f979bc1683c46f74ddb5e931810f4e2b8ea27c.1488068248.git.balaton@eik.bme.hu>
	<CAFEAcA8hgztzBZ=4EK7GR_1V4WnKL_hp-CopC1q5NwxeARkgSA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 2 Mar 2017 19:03:36 +0000
Message-ID: <CAFEAcA_b_iOCBk0dXGNGLve0hM5sLx5qAzq5mvDN-5yARopkdg@mail.gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 02/14] sm501: Use defines
 instead of constants where available
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
X-List-Received-Date: Thu, 02 Mar 2017 19:04:00 -0000

On 2 March 2017 at 18:53, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 7 November 2016 at 09:03, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> I just found a datasheet which says that the power-on-default
> for the misc-control register is 0b0000.0000.0000.00x0.0001.0000.xxx0.0xxx
> which means that the 0x1000 decimal value is correct and setting
> the IRQ_INVERT bit is wrong.
>
> I think the "active=low" bit is referencing the fact that the
> DAC_POWER bit is 1 for "disable" and 0 for "enable".

Actually it's referring to bit 17 (which is an "X" in the reset value
above), which is documented as being set by a GPIO pin on reset,
and having different meanings for SH and SA1110. In this case we're
saying 'reset bit 17 to 0, meaning "SH series CPU, Active Low"'.

Note also that the low bits indicate the bus type which is 000 for
SH and 001 for PCI, etc.

So a better comment here would be:
    /* Bits 17 (SH), 7 (CDR), 6:5 (Test), 2:0 (Bus) are all supposed
     * to be determined at reset by GPIO lines which set config bits.
     * We hardwire them:
     *  SH = 0 : Hitachi Ready Polarity == Active Low
     *  CDR = 0 : do not reset clock divider
     *  TEST = 0 : Normal mode (not testing the silicon)
     *  BUS = 0 : Hitachi SH3/SH4
     */
    s->misc_control = SM501_MISC_DAC_POWER;

...and you'll want to put something in to get the right Bus value
for the PCI version.

thanks
-- PMM

