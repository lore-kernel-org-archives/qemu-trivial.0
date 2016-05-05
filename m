Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ayLMU-0001ol-40
	for mharc-qemu-trivial@gnu.org; Thu, 05 May 2016 11:38:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayLMM-0001YE-7W
	for qemu-trivial@nongnu.org; Thu, 05 May 2016 11:38:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayLMA-0007D8-JF
	for qemu-trivial@nongnu.org; Thu, 05 May 2016 11:38:32 -0400
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:34792)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ayLM9-0006tP-Cg
	for qemu-trivial@nongnu.org; Thu, 05 May 2016 11:38:26 -0400
Received: by mail-vk0-x22e.google.com with SMTP id m188so30237624vka.1
	for <qemu-trivial@nongnu.org>; Thu, 05 May 2016 08:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vSd9rQKfgpLzDj7ydJNdBnPH49SxDVppNAhVAxWF6h4=;
	b=iCvBdRhK4L9qCRnrdmDRhxltjDVyzkRAMVvwfaT3uOU31YlH+nDvEpEb8Z9M27nw8g
	2NRCDxXRGHrW3eR6CI+CjW2LR/cP7N7K952I8T75Pzy3lUbMRCBuZYewOCM/vTOAwi8C
	hlLx7pQ1wrVI0a6RJVaZNwcgfRdoT9U832xco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vSd9rQKfgpLzDj7ydJNdBnPH49SxDVppNAhVAxWF6h4=;
	b=FIcT5L42lprXJh5y2wKPCgoThizDOgHwS0QyhG0t2/kfecjrlmysHM69UTuy0Lak2g
	qJcAkjS2rWb7JUX8lgl3rvZ5BVP5Dh9RBQ/wqOgN8HujxkCDPTPWuZbkJCz3hYqTvtlg
	DZuaO45TuTCWd1GL4D5RlXrduMNfD1mBhmxOZ1U1jOO2oxfH6ukbOV22bzo164dtWsu5
	TK10pF4gPx1X2JO/PH9K3JmgcFPcUz9jBKt54UseJwInWh5Yd3GQJC5pLpMXMPJ2vqWY
	kAjJnMITo6QPYUyw/B69s7rSVe2iHyEoQ5y+NXFKGcKDmBQsj/D7jWV37/Trx9D3gb22
	xEZA==
X-Gm-Message-State: AOPr4FUNIcBzkKl6EF3miqu/qOWkBY65oS9gMvvyuO5ZraQirD3cnNNOWvWfGr9u5xaBt/0Bnw7Kj3OWDxScQec5
X-Received: by 10.31.70.2 with SMTP id t2mr2439198vka.139.1462462679657; Thu,
	05 May 2016 08:37:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 5 May 2016 08:37:40 -0700 (PDT)
In-Reply-To: <1462316319-4308-1-git-send-email-peter@lekensteyn.nl>
References: <1462316319-4308-1-git-send-email-peter@lekensteyn.nl>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 May 2016 16:37:40 +0100
Message-ID: <CAFEAcA93StM0HME9urYAFKYrhEBxHBCP0+v_RSsSRcvz91=xcg@mail.gmail.com>
To: Peter Wu <peter@lekensteyn.nl>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] gdbstub: avoid busy loop
 while waiting for gdb
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
X-List-Received-Date: Thu, 05 May 2016 15:38:44 -0000

On 3 May 2016 at 23:58, Peter Wu <peter@lekensteyn.nl> wrote:
> While waiting for a gdb response, or while sending an acknowledgement
> there is not much to do, so just mark the socket as non-blocking to
> avoid a busy loop while paused at gdb. This only affects the user-mode
> emulation (qemu-arm -g 1234 ./a.out).
>
> Note that this issue was reported before at
> https://lists.nongnu.org/archive/html/qemu-devel/2013-02/msg02277.html.
>
> While at it, close the gdb client fd on EOF or error while reading.

The commit message says "mark the socket as non-blocking"...

> @@ -1599,8 +1603,6 @@ static void gdb_accept(void)
>      gdb_has_xml = false;
>
>      gdbserver_state = s;
> -
> -    fcntl(fd, F_SETFL, O_NONBLOCK);
>  }

...but the code change is *removing* a call to mark the
socket as non-blocking. Which is correct?

thanks
-- PMM

