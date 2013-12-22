Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vukjz-0008GX-4r
	for mharc-qemu-trivial@gnu.org; Sun, 22 Dec 2013 10:14:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Vukjs-0008G5-Pb
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 10:14:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Vukjn-0006Nn-0f
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 10:14:44 -0500
Received: from mail-pa0-f49.google.com ([209.85.220.49]:58193)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Vukjm-0006NY-Qh
	for qemu-trivial@nongnu.org; Sun, 22 Dec 2013 10:14:38 -0500
Received: by mail-pa0-f49.google.com with SMTP id kx10so4454006pab.36
	for <qemu-trivial@nongnu.org>; Sun, 22 Dec 2013 07:14:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JTkJdjebo1gNBAugvSXXzrpSc8bnJdJzfKeS35tydlQ=;
	b=OPY5A3rdXH4sqaWpskZyy1qcdJFg9k8tWlnPagdvBjI9KAhf1ngzdYf3+ikRqOj/Ra
	lI4Ry4/NsUhUQXokodWRrBDha7xOnQfnEexF3ntrBFqMsS4lyk+6iklrar12D0vu+3BC
	i7M4WvjWVhBYsp9iBN0LWwQKjAiIplLLuL3NRs83MWEFf/rXwJocfxoWsCb4KLHEjSlD
	dqCrQ3WjYgxih2wNBzCcsjD3/UUb3+FkfZDawu96NcPgFa8OU8Ckp5oj0IgzaE4xBHCY
	RAUnH0/RC5yfuVeqSKr6T3Ltpko2n8zNchS/DTBj18M1Uya7JKGWfAhc6NHDu1e+SEpm
	VYkg==
X-Gm-Message-State: ALoCoQnLnA/9JO2pAnqW2klup2vujz9uBgWEAoUaTJZlwd0Ps1axGzTUyk2XcWsRj91r4iyyFL2G
X-Received: by 10.66.119.136 with SMTP id ku8mr20636765pab.121.1387725277424; 
	Sun, 22 Dec 2013 07:14:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.70.82.227 with HTTP; Sun, 22 Dec 2013 07:14:17 -0800 (PST)
In-Reply-To: <1387722749-29348-1-git-send-email-sw@weilnetz.de>
References: <1387722749-29348-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 22 Dec 2013 15:14:17 +0000
Message-ID: <CAFEAcA82four8Wx6dyVvJntoq7_m+S4xNXT6nU3zQ8TNvDRvYA@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.49
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] pxa27x: Reduce size of keyboard matrix
	mapping
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
X-List-Received-Date: Sun, 22 Dec 2013 15:14:49 -0000

On 22 December 2013 14:32, Stefan Weil <sw@weilnetz.de> wrote:
> The row and column values use only a very limited range (-1 ... 7),
> so a byte value is sufficient.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

It's not like we have a ton of pxa2xx keymaps eating up
space, but yeah, this is an OK change.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

