Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ufp8U-0007j4-5x
	for mharc-qemu-trivial@gnu.org; Fri, 24 May 2013 06:22:10 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ufp8P-0007gp-Ot
	for qemu-trivial@nongnu.org; Fri, 24 May 2013 06:22:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ufp8J-0005WS-H6
	for qemu-trivial@nongnu.org; Fri, 24 May 2013 06:22:05 -0400
Received: from mail-la0-x231.google.com ([2a00:1450:4010:c03::231]:46143)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ufp8J-0005W5-AC
	for qemu-trivial@nongnu.org; Fri, 24 May 2013 06:21:59 -0400
Received: by mail-la0-f49.google.com with SMTP id fp13so4203266lab.8
	for <qemu-trivial@nongnu.org>; Fri, 24 May 2013 03:21:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=DPAww0k5VfshO/Dz9CHy7iS/JjPIJ8bknL9ZsemhIuE=;
	b=azM4R/YqNWcQdDMPiU2WQPdvF1/tPAT3bO5EQosCfeSW93WgtZjgG9QS2ONjPJSkrU
	HI2NGA13SWGnP5W05jaoQV8H8ZRpIiageh2iM8PdpS9bQQGxnF6Sy9ucoK1kzoygxEDh
	N0AFq1kC5LSSZDGLTABy2ccOookFsqSbQokyK3jMCWNJDjdGyYopI9Aw116mcNrrhZyd
	MSIBdz0xOiqq43uZv3ODj+uukzn0GIdNHXs5lD6Enw61r/AY/EeykpjYupKwMrob1MHF
	EolwUa7tH6B7xIYIaKNOLgWwrZtZ7DYA5SE9GRrQ0PTWxLb11MF7R987c/rUDmwSTZhn
	RgWQ==
X-Received: by 10.112.120.170 with SMTP id ld10mr8567785lbb.31.1369390917530; 
	Fri, 24 May 2013 03:21:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.188.130 with HTTP; Fri, 24 May 2013 03:21:37 -0700 (PDT)
In-Reply-To: <1369390765-32117-1-git-send-email-sw@weilnetz.de>
References: <1369390765-32117-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 May 2013 11:21:37 +0100
Message-ID: <CAFEAcA9G_U4yCjWoBF5hOX+AdrjdL0imb+tDaUBxQS8czCw9qg@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQl2JDRDQnNrvlii9p2fTPiZPW61n0Ezj0nm6lAAEhWeJKJuPFwwta8mxIpkUq+M7z7W3AFX
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::231
Cc: Evgeny Voevodin <e.voevodin@samsung.com>, qemu-trivial@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	Paul Brook <paul@codesourcery.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH] Remove unnecessary break statements
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
X-List-Received-Date: Fri, 24 May 2013 10:22:08 -0000

On 24 May 2013 11:19, Stefan Weil <sw@weilnetz.de> wrote:
> Fix these warnings from cppcheck:
>
> hw/display/cirrus_vga.c:2603:
> hw/sd/sd.c:348:
> hw/timer/exynos4210_mct.c:1033:
> target-arm/translate.c:9886:
> target-s390x/mem_helper.c:518:
> target-unicore32/translate.c:1936:
>  style: Consecutive return, break, continue, goto or throw statements are unnecessary.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

