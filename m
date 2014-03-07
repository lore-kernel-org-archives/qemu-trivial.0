Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WLuwE-0007vU-9R
	for mharc-qemu-trivial@gnu.org; Fri, 07 Mar 2014 08:35:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WLuw6-0007ln-RV
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 08:35:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WLuw1-00036I-RK
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 08:35:38 -0500
Received: from mail-la0-f51.google.com ([209.85.215.51]:43167)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WLuw1-000368-KD
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 08:35:33 -0500
Received: by mail-la0-f51.google.com with SMTP id pv20so2832929lab.10
	for <qemu-trivial@nongnu.org>; Fri, 07 Mar 2014 05:35:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RQ1TRg6NLBlGnM5A/vm0AdmWbSulzGnokRM7Ux7+c6I=;
	b=H0Pav1yhQqY9Ho44V7+nFDpkNvgWS+q1FXksl1U1uU/qXPAsCA8bMR3DyFBpvef3FI
	aQMYppt0xIqA+Lfb7joESs8Tf1Yr00z8aNUwQbBhuFluBy3OcJFzb+G4IckHdpgnx6y4
	ZJEX30Nl/SaZnXub6XD5FaJq6HTtpxs6lBLfBCfqzrZitHQwrZglRo2MK/wbMH1ho0sm
	pimMbKQa9Pw9bj+NnwroRUMDR0qU7c/8qvB1xLCgdRS1GRfgmJcnWR8+9+FEWIPjWGey
	VbPFN9vDVnLECX1Zlsj35mCLTHER403LjT8irrTZycJAatgowraCjpAaMFjoUxsc7CUo
	674A==
X-Gm-Message-State: ALoCoQk3audZPez405R4t0QNg9Z0JmRmxl49gsyHUP8Q3LMP4fNM3aRT+6+/L7e40UnZD/qpP9W8
X-Received: by 10.152.23.9 with SMTP id i9mr1335321laf.56.1394199332609; Fri,
	07 Mar 2014 05:35:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.118.34 with HTTP; Fri, 7 Mar 2014 05:35:12 -0800 (PST)
In-Reply-To: <5319C768.2000903@weilnetz.de>
References: <1394187082-31986-1-git-send-email-sw@weilnetz.de>
	<871tyecixy.fsf@linaro.org> <5319BE2C.7040801@weilnetz.de>
	<5319C21A.6010705@suse.de> <5319C768.2000903@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Mar 2014 13:35:12 +0000
Message-ID: <CAFEAcA8nbPodctcDPXUjxZz4+0WeeUP=24DxuLeyU9OsBT=Vew@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.51
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	qemu-stable <qemu-stable@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests: Fix 'make test' for
	i686 hosts (buildregression))
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Mar 2014 13:35:44 -0000

On 7 March 2014 13:19, Stefan Weil <sw@weilnetz.de> wrote:
> test-i386 does some calculations and prints the results (see source code
> tests/tcg/test-i386.c). If the user mode emulation of QEMU works, it
> should not matter whether that executable runs native or emulated and
> both outputs be identical. They aren't - that's why I think we have a
> TCG problem to solve.

I think TCG x86 FPU emulation has been a bit dodgy since
forever; it's a fair amount of work to go through and
fix everything up to be bitwise exact results versus
hardware and I think that nobody's cared enough about x86
emulation to do that...

thanks
-- PMM

