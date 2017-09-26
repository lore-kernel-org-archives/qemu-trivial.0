Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwx3d-0002hy-OJ
	for mharc-qemu-trivial@gnu.org; Tue, 26 Sep 2017 17:06:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55706)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dwx3a-0002gU-VE
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 17:06:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dwx3a-0005ZA-6m
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 17:06:18 -0400
Received: from mail-wr0-x234.google.com ([2a00:1450:400c:c0c::234]:50161)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dwx3Z-0005YT-WF
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 17:06:18 -0400
Received: by mail-wr0-x234.google.com with SMTP id h16so18509wrf.6
	for <qemu-trivial@nongnu.org>; Tue, 26 Sep 2017 14:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U4b9lBhO3WyKimkd+rESaoJca3Suee7M28laLy+igSE=;
	b=i+XFK8u7RV3QhxAXwcj0YLIG3sujVZ6KzcJMuO6quXN7sd2CvFAeSxl0z/Tf9M82/s
	S9UDP1zvPqiPSKz1L0xtMFdjKiEzgFm3fzk2KmVXPr20usoR0+e9zo1M+a5gfYZqs1+7
	sX21cIG/oH0cUh9UwlsHMjYBXLp2IZbCTkKu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U4b9lBhO3WyKimkd+rESaoJca3Suee7M28laLy+igSE=;
	b=Efu8VaxBDY7sE7ESykhVxaVk+cv9PQ/J63fmy6TE95vVtNL7JjoH/QJ9ZqxFKwCu9X
	OBnIC/UhnnSfHsOtkOI8kXSS3jQZMXDv4PN8AvkpYVk2+XCKT/DTMoX+UiwPKPOjUOSC
	LvauH4jcKH8ew44iVe4BntvrUTPagVS/mEfui+d3ZQ5TqDHc4ZG7Tg/WiufIkUBl+ig2
	F3gruXdKzXlfkLCt2EUbnPUZymt6X7pw7AlXo86irASiVATCz4XOmebzZ4HBxnl0z/D6
	4j3N2UdvoXVOetdSds0b7aDZuGuH+Q41cZGaj7MhAuu7iVHu+pZpfiJs+/dqZGRHX9zS
	zwFA==
X-Gm-Message-State: AHPjjUgkEGe6ZbrxBL+uU4TnlBLTNclD1ORIlO5SIUp70F8FfljcXv+t
	O0fUfi1QCFRy3jjrBzq74pL066ToH4GFmrNf+dJnOw==
X-Google-Smtp-Source: AOwi7QCPrqzJy7sa3zmlkId/2zRSIFqCQBmpD+NE45jhCPUsgpQV+uuajjpem8dP4AGqeV49aWLXAb9Xb8SleWXTUTQ=
X-Received: by 10.223.134.174 with SMTP id 43mr11364824wrx.173.1506459976764; 
	Tue, 26 Sep 2017 14:06:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Tue, 26 Sep 2017 14:05:56 -0700 (PDT)
In-Reply-To: <cover.1506406399.git.mjt@msgid.tls.msk.ru>
References: <cover.1506406399.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Sep 2017 22:05:56 +0100
Message-ID: <CAFEAcA-RPHGo3-6ASrfFq5hoWLm_ETPLqOXAaLHr8MSStxTb=A@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::234
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/29] Trivial patches for
 2017-09-26
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
X-List-Received-Date: Tue, 26 Sep 2017 21:06:20 -0000

On 26 September 2017 at 07:14, Michael Tokarev <mjt@tls.msk.ru> wrote:
> This is a resend of yesterday's pull request, with two patches
> removed:
>   filter-mirror: segfault when specifying non existent device
>     (causes testsuite to fail)
>   dma/i82374: avoid double creation of i82374 device
>     (better version is in the work)
>
> and with one patch with additional R-b line:
>   remove trailing whitespace from qemu-options.hx
>
> Not resending any patches, just the cover letter.
>
> Please consider applying.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 1e3ee834083227f552179f6e43902cba5a866e6b:
>
>   Merge remote-tracking branch 'remotes/thibault/tags/samuel-thibault' into staging (2017-09-25 20:31:24 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
>
> for you to fetch changes up to 35deebb2327227d8c5f4816476befb06f6329de6:
>
>   hw/isa/pc87312: Mark the device with user_creatable = false (2017-09-26 09:11:23 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2017-09-26


Applied, thanks.

-- PMM

