Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YroMg-0007NZ-2g
	for mharc-qemu-trivial@gnu.org; Mon, 11 May 2015 10:07:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YroMc-0007F2-81
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 10:07:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YroMW-0000Hq-Kd
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 10:07:22 -0400
Received: from mail-ie0-f176.google.com ([209.85.223.176]:35979)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YroMW-0000Hd-H8
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 10:07:16 -0400
Received: by iecmd7 with SMTP id md7so30848369iec.3
	for <qemu-trivial@nongnu.org>; Mon, 11 May 2015 07:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=J+vQbcOjp01HZ5BN/J+nhESCFImAIbWYzWjecIjnQ9E=;
	b=kTWH2PqFC3XsyaqaZZ/6lcIlybt5cC5hAW5nXFO2aHVn7W5Su1sVRAugiH6T/JcglN
	5tmpPUSsbLIZEbTSiocXh7aAAwXhzH8fgMLPi297MP3bEQSZ7CA4a6Wa1LicD/JkBUjp
	4Y8Iof6hC00g1AvUhch5LJf6uA0v3BavCldivB0cB5t31qqD5YrPvSiviy+bHMHiyo70
	OaVAxTugbsksQmxbfFQhRp5ZD1ulycDNQlqCWGn4MQdQe/h08gNfJIy4LrJ8bU0Pxx60
	8EXUbXVwA6BtLKZ/6fRCv+pn2xbMcqGZlbBKUKQLgeu5l38ALE45HGhaMrdH1mt1A6kY
	EV/g==
X-Gm-Message-State: ALoCoQnEvbX2SfspugcgIw4cXqmWgL7BRYOW+ULzQg0+pXp/v63QNx3uUyLsDfSnBDe/H+GyBkds
X-Received: by 10.50.138.232 with SMTP id qt8mr14345252igb.28.1431353235996;
	Mon, 11 May 2015 07:07:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.136.220 with HTTP; Mon, 11 May 2015 07:06:55 -0700 (PDT)
In-Reply-To: <cover.1431122325.git.mjt@msgid.tls.msk.ru>
References: <cover.1431122325.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 May 2015 15:06:55 +0100
Message-ID: <CAFEAcA9OOEq6GXSUUFWT6ek9xPGroBPc8p=-S3hdKTdGBCH1_A@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.223.176
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 0/5] Trivial patches for
	2015-05-09
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
X-List-Received-Date: Mon, 11 May 2015 14:07:23 -0000

On 8 May 2015 at 23:00, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's a next trivial-patches tree pull request.  There aren't many patches
> this time, but one of them (replacing assert with g_assert) is a build fix.
> Please consider applying.
>
> Thanks,
>
> /mjt
>
> The following changes since commit f8340b360b9bc29d48716ba8aca79df2b9544979:
>
>   hw/ptimer: Do not artificially limit timers when using icount (2015-05-08 17:15:23 +1000)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-05-09
>
> for you to fetch changes up to 0caef8f6df4a9426bd6333ab843ce51ce005d7d0:
>
>   docs: update BLOCK_IMAGE_CORRUPTED documentation (2015-05-08 14:11:10 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2015-05-09
>

Applied, thanks.

-- PMM

