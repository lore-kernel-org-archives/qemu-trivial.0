Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJKdT-0001YH-I0
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 06:57:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XJKdN-0001Y3-Im
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 06:57:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XJKdI-0002Sm-T5
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 06:57:53 -0400
Received: from mail-la0-f50.google.com ([209.85.215.50]:61220)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XJKdI-0002Sc-Ld
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 06:57:48 -0400
Received: by mail-la0-f50.google.com with SMTP id pi18so4352474lab.23
	for <qemu-trivial@nongnu.org>; Mon, 18 Aug 2014 03:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QYCexntfklu+VhJePgddC5nsVFRxlHhGGGL7pDexTgQ=;
	b=ekvJWxMAAWA8ycYAOE7b+Zf2UABFm+8Zqud6OKOfQIraFLMEbd6f6bggd0HKaSfLVG
	pfsZL0TTLU/0gui+d/A6VAQnPvjUKcMZYxJwTzm8/0kRSTRFnk3hkC/J3kIRTDb17iVA
	o7i7pyONzxMR0NBxbJEyI3HzhJg/QdStXNytQuI52LTYe/icL9DY9ZxFeYxc5ctPDzkV
	webv8lZLTXajW0kYrQmomWI66sMBrwcu4YR5UKyhiOwpZ80pBxqCYesXxzyK0WUi14Ki
	cBYGVGnOZY8FqiRUFuV01MHRUDeC7nuBXHfzHt6kNNrDjxDtqYWCdA3B/uHPJvVx+abS
	iOnA==
X-Gm-Message-State: ALoCoQloqq8njWByDaM/FjC0/scF3rexD+HObFZlYgXHZ9CUpP3a0IkXK8KUiHLoYFz/ftNXHSfz
X-Received: by 10.112.5.170 with SMTP id t10mr17254670lbt.64.1408359467499;
	Mon, 18 Aug 2014 03:57:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Mon, 18 Aug 2014 03:57:27 -0700 (PDT)
In-Reply-To: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Aug 2014 11:57:27 +0100
Message-ID: <CAFEAcA_eywOhVTtpeyBhhbm9d27+8dtyMgvv+gianTrf2aRXWA@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.50
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/20] Trivial patches for
	2014-08-15
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
X-List-Received-Date: Mon, 18 Aug 2014 10:57:58 -0000

On 15 August 2014 16:14, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's another trivial-patches pull request, with patches accumulated
> since the previous one which has been processed today.
>
> This time, there's a bunch of changes by Gonglei removing "Yoda
> conditions" and updating docs/comments, irq zero initing patches
> by Peter Crosthwaite, and some other small fixes.
>
> Please consider pulling/applying.
>
> Thanks,
>
> /mjt
>
> The following changes since commit f083201667fddd51055c2ac67f67221e82298a35:
>
>   Merge remote-tracking branch 'remotes/mjt/tags/trivial-patches-2014-08-09' into staging (2014-08-15 13:41:55 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-2014-08-15
>
> for you to fetch changes up to 5edbdbcdf882e4220adc7dbf433351077cd1fbbc:
>
>   ivshmem: check the value returned by fstat() (2014-08-15 19:12:58 +0400)
>
> ----------------------------------------------------------------
> trivial patches for 2014-08-15
>
> ----------------------------------------------------------------

Applied, thanks.

-- PMM

