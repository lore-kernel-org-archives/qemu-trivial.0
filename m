Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SrCnI-0002bc-Ba
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jul 2012 14:46:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56423)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SrCnF-0002bC-8Q
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2012 14:46:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SrCnC-0001Xw-7G
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2012 14:46:45 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:35816)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SrCnC-0001Xk-0U
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2012 14:46:42 -0400
Received: by bkcji1 with SMTP id ji1so659125bkc.4
	for <qemu-trivial@nongnu.org>; Tue, 17 Jul 2012 11:46:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=xgu16+sgFA0+00T8mcknuR2Wp0GkCKdHorLc4Jtzsxs=;
	b=n4ga+qa04FGJFHoIekAkoPUYLyUF/Hm8drO/12SM72olvZrSqw0t+zCBVRSm6OrE7T
	7CuZgI+I7u8qTFzDPhdvyBPGNFanl/V45ohfHTvIvjrj4tX1MZ0N+Q5NXgn0HRIKIqke
	uYrbIDf4ZPOBmETVjfMaoxdJF1yzjJIQ+QcR5F5zACmKLBx0zPX++1gEbz1BHkrcMM+Z
	EG8okRVbfqM1mYK5+0z14A6vsM9hcoV3HihsjHRkGz3x6OG+A4d68AXbM2WvibptYIwR
	8UCngevVxHoB1Il7+aSh9F8DAGgOemXnzVC6TfzXkdZEVDB8+c3X/h7RV2tY+0KTGd8L
	XTgg==
MIME-Version: 1.0
Received: by 10.205.117.141 with SMTP id fm13mr1894692bkc.125.1342550800874;
	Tue, 17 Jul 2012 11:46:40 -0700 (PDT)
Received: by 10.204.102.14 with HTTP; Tue, 17 Jul 2012 11:46:40 -0700 (PDT)
In-Reply-To: <5005AFA5.6080101@weilnetz.de>
References: <1342546459-21993-1-git-send-email-i.mitsyanko@samsung.com>
	<5005A904.5000006@samsung.com> <5005AFA5.6080101@weilnetz.de>
Date: Tue, 17 Jul 2012 19:46:40 +0100
Message-ID: <CAFEAcA9t5qDGvOBTL0eb+nRZGdiNBBwqd020Gz+80ovGm3t+hA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQmrdkTM1n9DvNnI849lLNoIVcORv65ViKirRHtzol6dMGkNPtLg7ffKJQDywFdqurTWEPDI
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: Blue Swirl <blauwirbel@gmail.com>, qemu-trivial <qemu-trivial@nongnu.org>,
	Igor Mitsyanko <i.mitsyanko@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: fix ALSA
	configure test
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
X-List-Received-Date: Tue, 17 Jul 2012 18:46:46 -0000

On 17 July 2012 19:32, Stefan Weil <sw@weilnetz.de> wrote:
> Hello Anthony, hello Blue,
>
> these patches fix broken builds, therefore I expected that they
> would be applied fast:
>
> http://patchwork.ozlabs.org/patch/171066/
> http://patchwork.ozlabs.org/patch/171067/
> http://patchwork.ozlabs.org/patch/171081/
> http://patchwork.ozlabs.org/patch/171082/
>
> The first of them fixes the ALSA problem.

I think this is making it clearer that we should back out
the Werror change in favour of something more narrowly
targeted (although we may as well fix these warnings in
test code anyway). Patch to follow...

-- PMM

