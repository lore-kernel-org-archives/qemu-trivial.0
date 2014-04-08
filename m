Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXR7d-0000q4-HK
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 04:11:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60206)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WXR7W-0000jD-F9
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 04:11:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WXR7Q-0000UK-N7
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 04:11:02 -0400
Received: from mail-lb0-f171.google.com ([209.85.217.171]:47713)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WXR7Q-0000Tv-Fc
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 04:10:56 -0400
Received: by mail-lb0-f171.google.com with SMTP id w7so533000lbi.30
	for <qemu-trivial@nongnu.org>; Tue, 08 Apr 2014 01:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ss+3aZB7Nm6+6Aa/Bbrko8ANTVizg0gknjVy1gtU9UQ=;
	b=TQH/7pHbyp6J1pNHa80+JK57EpgTe7gSu2nA9fPjNCHE2UoDMFfLjLmIFE6lCT1Rwb
	oSqUAZV2OB6uZKtqeLiu0UYTqSNUxHkWERb3YKdZDtkcBckVnnAuB9Che3VSApGFx1jZ
	4gXxvvYl2Pw/csgSj97nnF/E2g2t0mSxz0ufGVC+sNTdCfxMt2a2HDOhFGWDk0/lNb8r
	ZGiZebvxVfapgSRrLg05CIPSShubGd69ZeWVpBC1xm/D6lTeGUO/MigCRWvwXs10IXFq
	qaBwR3nCXR9OK1Dx9TSzTLMI3C5Uc5W0DSQ3o/Zo54OvKSeIyudd4bQrg/qNUO3pwQuv
	ys1Q==
X-Gm-Message-State: ALoCoQmKOBvUzf6XA0U+cFXcrFefTMhBE+pi6I1TLEsMekBFMcCAvDlBkOsIGMXiVeXiMveNhZ6G
X-Received: by 10.112.142.68 with SMTP id ru4mr585090lbb.49.1396944654989;
	Tue, 08 Apr 2014 01:10:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.180.233 with HTTP; Tue, 8 Apr 2014 01:10:34 -0700 (PDT)
In-Reply-To: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Apr 2014 09:10:34 +0100
Message-ID: <CAFEAcA941ST_y3k3b5UjTZeKP220WnZE0Bp2Lok4czw58T74_A@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.171
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL for-2.0 00/11] Trivial
	patches for 2014-04-08
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
X-List-Received-Date: Tue, 08 Apr 2014 08:11:07 -0000

On 8 April 2014 08:04, Michael Tokarev <mjt@tls.msk.ru> wrote:
> And there's a series of 3 patches by Peter Maydell which adds casts
> to uint* in a few places.  Those are also quite simple and safe, even
> with quite some disagreement about whenever this is necessary to
> start with -- I mean the int128 change, the other changes are good.
> At least this way we make it consistent with other parts of the code.

I was not expecting those to go in for 2.0...

thanks
-- PMM

