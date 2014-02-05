Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WB5iN-0006KV-7Y
	for mharc-qemu-trivial@gnu.org; Wed, 05 Feb 2014 11:52:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WB5iH-0006CD-05
	for qemu-trivial@nongnu.org; Wed, 05 Feb 2014 11:52:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WB5iC-0000v6-4h
	for qemu-trivial@nongnu.org; Wed, 05 Feb 2014 11:52:36 -0500
Received: from mail-lb0-f176.google.com ([209.85.217.176]:61444)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WB5iB-0000v1-SB
	for qemu-trivial@nongnu.org; Wed, 05 Feb 2014 11:52:32 -0500
Received: by mail-lb0-f176.google.com with SMTP id w7so518973lbi.21
	for <qemu-trivial@nongnu.org>; Wed, 05 Feb 2014 08:52:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=jiIaVL2X7FPBYioOFoJm6+ufRvcO7TtZ5sOn/rvp4+Y=;
	b=P0tpQPvTwxvN6j6MZha+a/uFVwGstYfcyCdeF/3i3Ohk0F21DnMkLKIBEol/F0ApOq
	V1sGlqCu07beQA4rgkqs+xSy//PUEnlFwVhakYWCZIrY2Kk617uB2jiVXLg6C3zBv5zI
	0yjaN7Z+JyvFiGDgIrFD0XobA3BVVfrVtOQsmQeI0Grhl/gsq7n3j+0F984Ljh5JHK2z
	CmAH1GFPgoT5jrjij5og7owWm8M8ss4NsTAEiz/rApTtBiXlwizjafX6zG7/VOWp30y6
	SbQb+4XTqccWWduXCbcNeNUsMipoXanHxS0Uq3+oioJEGfZy4Er0jFX+QD5HcYTy6oMx
	0g0A==
X-Gm-Message-State: ALoCoQlGdFr/yexADpf+9zLtwsa9pRmbeoSqUT1Sw1hAH7MN2g/o847+4s+fd6XcKLQvjTVVFBlE
X-Received: by 10.152.4.68 with SMTP id i4mr1794496lai.8.1391619150706; Wed,
	05 Feb 2014 08:52:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.199.162 with HTTP; Wed, 5 Feb 2014 08:52:10 -0800 (PST)
In-Reply-To: <1391357563-1592-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1391357563-1592-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Feb 2014 16:52:10 +0000
Message-ID: <CAFEAcA96-j315Up4vE-AmnKySaWLQGR9zKJ=rsmJdEQdCk9gEQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.176
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 0/7] Trivial patches for
	2014-02-02
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
X-List-Received-Date: Wed, 05 Feb 2014 16:52:41 -0000

On 2 February 2014 16:12, Michael Tokarev <mjt@tls.msk.ru> wrote:
> There's nothing exciting in there, some really small things here and there.
>
> Please pull.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 89e4a51ca9546a7bbe1998c4e3d4a3ac3a0c19be:
>
>   Merge remote-tracking branch 'stefanha/tags/tracing-pull-request' into staging (2014-01-31 11:13:08 +0000)
>
> are available in the git repository at:
>
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-2014-02-02
>
> for you to fetch changes up to b76afd1072e02fe77e09790fbe1e831700976c5f:
>
>   tests/.gitignore: Ignore tests/check-qom-interface (2014-02-01 13:56:31 +0400)

Applied, thanks.

-- PMM

