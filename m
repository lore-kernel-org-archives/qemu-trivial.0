Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKBF6-0008BS-SQ
	for mharc-qemu-trivial@gnu.org; Thu, 12 Sep 2013 14:03:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VKBF0-00082L-TP
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:03:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VKBEv-00084d-CS
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:03:42 -0400
Received: from mail-la0-f49.google.com ([209.85.215.49]:40260)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VKBEv-00084P-5N
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 14:03:37 -0400
Received: by mail-la0-f49.google.com with SMTP id ev20so132567lab.36
	for <qemu-trivial@nongnu.org>; Thu, 12 Sep 2013 11:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vp9Sc0LIPXuD4XQgSVVl0jsJ13TiuEfuLYXnjOTRhoU=;
	b=TPKarwh9ngkalfC0b1StTOCT81uxgCdoJD6caK57y2j2XOkFwKLZmD6JUpSF3jG/qe
	Ob2cl8ovSbG1CzbzeC37uLFyVC8Wtbi1yFeTqbOVEbd8CHotLxudFXGaB9Cti3nOkKEG
	fdvaVp2pNAkbKlDC5V93ns9rmhRkwJXwUcsvqlRADg2pCkP0O0Dg0T/iHNAlBgSeFOwN
	XxRvzJYw9hWMONg1LmwD/TAI2ZVv11OrpW4tqWqKIIEnqQGyAw+AfhHehPhuRq91utB8
	HdzhOnv7Sgf3cjIaiNzzXsjwrNTSgfgiOX2HXGyp1qqIWaNCNl7t7zp185HgShUJriHz
	qg+g==
X-Gm-Message-State: ALoCoQmp675UQRea9+fmCfqD/GKY+g+0DMWgD/8GlABaYdo4Bap0QJIq9j1OGIq6xrk7kRqrAh25
X-Received: by 10.152.10.99 with SMTP id h3mr7192199lab.13.1379009015137; Thu,
	12 Sep 2013 11:03:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.161.232 with HTTP; Thu, 12 Sep 2013 11:03:15 -0700 (PDT)
In-Reply-To: <1379008635-17714-1-git-send-email-sw@weilnetz.de>
References: <1379008635-17714-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Sep 2013 19:03:15 +0100
Message-ID: <CAFEAcA_AxNmn_FP6LD1g=3LB9p=7qfJ7Dm6oGv2Rs5TTLQ42JQ@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.49
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Blue Swirl <blauwirbel@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] *-user: Improve
	documentation for lock_user function
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
X-List-Received-Date: Thu, 12 Sep 2013 18:03:47 -0000

On 12 September 2013 18:57, Stefan Weil <sw@weilnetz.de> wrote:
> Add a missing "function" and replace "and" by "any".
> BSD und Linux use the same documentation here, so fix both.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

