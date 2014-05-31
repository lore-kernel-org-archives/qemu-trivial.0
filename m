Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wqrw7-0002dy-Vr
	for mharc-qemu-trivial@gnu.org; Sat, 31 May 2014 18:39:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Wqrw1-0002cS-6u
	for qemu-trivial@nongnu.org; Sat, 31 May 2014 18:39:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Wqrvv-00053r-Fb
	for qemu-trivial@nongnu.org; Sat, 31 May 2014 18:39:29 -0400
Received: from mail-lb0-f175.google.com ([209.85.217.175]:37522)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Wqrvv-00050n-8e
	for qemu-trivial@nongnu.org; Sat, 31 May 2014 18:39:23 -0400
Received: by mail-lb0-f175.google.com with SMTP id l4so1762939lbv.34
	for <qemu-trivial@nongnu.org>; Sat, 31 May 2014 15:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=EVHNWavIORe1VR98xo0XtD7B6yUVYpfNgx10AV1tEaQ=;
	b=c4Ej61c96WRcRI/JqN6MJ9uWUIC0VLeqlaY/W7BXRCEmn9TSE/CvdmYJLB3j3+Hwk4
	4llGHh+kvb138urv7eLXahnfdENHTW2T/dsV3ZbRy79d0KNmnL5zyumxFM/01nTVpROL
	DSFsYDtoAYtrPeb170KtmwAijkdiB4zxDTKmGYdrPNRojeYBDzNsxP/+iJkL1L40SMgf
	ijm2Pk4awOIX4Q9k97emER5X77qlpHBcN56ZS0VDHJJXewuJcHeNo2dATrdF8Is2SIlC
	Vu3U1nP16HUokJMvkBJ2rKrWeiFqqsSoCrUa48NBliMXlai/ahWzt80fVs1db0bNGDMf
	6Adg==
X-Gm-Message-State: ALoCoQlSHXG4WhpGHQKwR93jPqhoZoJRlUfZt99VkGNo0lQ8PvaWLGTg2EMDHv2GydnKUbFS7IYe
X-Received: by 10.152.203.236 with SMTP id kt12mr19961752lac.8.1401575960665; 
	Sat, 31 May 2014 15:39:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Sat, 31 May 2014 15:39:00 -0700 (PDT)
In-Reply-To: <1401088811-22923-22-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
	<1401088811-22923-22-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 31 May 2014 23:39:00 +0100
Message-ID: <CAFEAcA9wDmQmed6YNrFy5jyRTN2mCD3JOnk=f-eiqxGx5iycXA@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.175
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Le Tan <tamlokveer@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 21/23] bsd-user: replace
 fprintf(stderr, ...) with error_report()
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
X-List-Received-Date: Sat, 31 May 2014 22:39:34 -0000

On 26 May 2014 08:20, Michael Tokarev <mjt@tls.msk.ru> wrote:
> From: Le Tan <tamlokveer@gmail.com>
>
> Replace fprintf(stderr,...) with error_report() in files bsd-user/*.
> The trailing "\n"s of the @fmt argument have been removed
> because @fmt of error_report() should not contain newline.
>
> Signed-off-by: Le Tan <tamlokveer@gmail.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

Was this patch tested? Building on FreeBSD the compiler
complains:
"warning: implicit declaration of function 'error_report' is invalid in C99"

because none of these bsd-user files include a header which
gives a prototype for error_report. Also, these are just
straightforward reporting of command line errors, and I
think that, like the linux-user code, we should handle
these in the obvious way by printing to stderr. There's no
need to drag in the error-handling framework for this,
especially since user-mode doesn't have the "maybe we
need to send this to the monitor" issues system emulation
does.

In short, I think we need to revert this commit
(1fba509527beb).

thanks
-- PMM

