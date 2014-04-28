Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WerUc-0004Qv-M1
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 15:45:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WerUW-0004QO-0i
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 15:45:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WerUR-0005RJ-6i
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 15:45:27 -0400
Received: from mail-la0-f51.google.com ([209.85.215.51]:60351)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WerUQ-0005R4-W4
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 15:45:23 -0400
Received: by mail-la0-f51.google.com with SMTP id gl10so1798080lab.24
	for <qemu-trivial@nongnu.org>; Mon, 28 Apr 2014 12:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KTTu8DYDvj2RLeRYioS705I79nH/LSoyJ+nNqOnn+cI=;
	b=k2pc4bvr/lcniupcBkClX1S4/ZSYRMrnB8/jL9pNrLPadnTXPVqmBklB9nfvb49VbB
	g/O30xwfpzdxgFiP+X7/OnCfgJ9vGZWLzamjc7cwJU+DNBruVWBCEe+nZBEKxgr9xMbN
	cisOdIQG9ga8g8KM4VqPJGvMqy6mKreWoqxxpdhKFP1Fi/7QJ2AAUIUEdNehwMoP/uFC
	kEDS9Rr38yk1oxnL1pACelA14pYGep3BEz8QHgX0fXbZ2QRtkhFWwjduUIJRWntRKMgs
	Cz278KYzp3zYjXaqmmftIfVaGzUg9zTnHmAoGKGxCMrCePr1u6Yd7zZWmsnOQbDV2ufK
	PZMQ==
X-Gm-Message-State: ALoCoQmcdcoUCYHIvnTlEWBMtvxXllUk6eQZ6XEiD72ZfzEydszD2BQiT3xv6hL13nk1bEwqwFJE
X-Received: by 10.112.35.202 with SMTP id k10mr19271876lbj.14.1398714321787;
	Mon, 28 Apr 2014 12:45:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Mon, 28 Apr 2014 12:45:01 -0700 (PDT)
In-Reply-To: <1398713740-24446-1-git-send-email-peter.maydell@linaro.org>
References: <1398713740-24446-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Apr 2014 20:45:01 +0100
Message-ID: <CAFEAcA-HgiJaMb2V6Y88PrQCvHS6g75Z3+VqnHaqkVk4tEstwg@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.51
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests/tcg: Fix compilation
	of test_path
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
X-List-Received-Date: Mon, 28 Apr 2014 19:45:32 -0000

On 28 April 2014 20:35, Peter Maydell <peter.maydell@linaro.org> wrote:
> --- a/tests/tcg/Makefile
> +++ b/tests/tcg/Makefile
> @@ -81,10 +81,10 @@ run-test_path: test_path
>  # rules to compile tests
>
>  test_path: test_path.o
> -       $(CC_I386) $(LDFLAGS) -o $@ $^ $(LIBS)
> +       $(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
>
>  test_path.o: test_path.c
> -       $(CC_I386) $(QEMU_INCLUDES) $(GLIB_CFLAGS) $(CFLAGS) -c -o $@ $^
> +       $(CC) $(QEMU_INCLUDES) $(GLIB_CFLAGS) $(CFLAGS) -c -o $@ $^

In fact we can drop these CC lines altogether (going back
to the situation before commit f62cb1b6d) -- we failed to
notice then that test_path is an oddball, being a host
binary rather than a target binary, unlike all the other
files being compiled in this directory.

(Also means _GNU_SOURCE needs to be removed from the
.c file as otherwise the compiler complains that it's
defined on the command line and in the c file.)

thanks
-- PMM

