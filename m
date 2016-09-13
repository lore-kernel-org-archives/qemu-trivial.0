Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bjrqt-0002ZR-5g
	for mharc-qemu-trivial@gnu.org; Tue, 13 Sep 2016 13:50:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bjrqq-0002W9-G9
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 13:50:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bjrqm-0004Ik-Rp
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 13:50:31 -0400
Received: from mail-vk0-f48.google.com ([209.85.213.48]:32865)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bjrqm-0004Ht-EQ
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 13:50:28 -0400
Received: by mail-vk0-f48.google.com with SMTP id f76so191510320vke.0
	for <qemu-trivial@nongnu.org>; Tue, 13 Sep 2016 10:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KYQ04O30zI3a4uiB4ubfrrT4WnQpSBjECIrxNM6wV6w=;
	b=RN4A+YAL0X8UFCAnjpwJzFhuknR6EgBMWYNxzp0Aimx5DYh7v7jMe1dyOXlOpgNgJp
	pM7zbwttgf/1WTmp4HlosE7T1m9O1kxCI4n7L1OQWc7REpBPkKu5U0dssQWF2ul9ntOI
	rLO9MmcT/xy8903KBnX8c92eYx44t5lK2wO+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KYQ04O30zI3a4uiB4ubfrrT4WnQpSBjECIrxNM6wV6w=;
	b=CluKbHZKxpFkiNdvIsawvm4WC9FW0oO8EBpk/r4n2EljwK5atu3axaa/fy7VAgdtdT
	QYMBKv0e/cB9PXBHKAZb5+0X59+N6LaaxrdS/hWTcGr9ZTOopyG7fheb1+Dr2fkphsHW
	picHhrq8vuoWesG5Yi68hvqBi4rDYcCepctBuvX10GgLTSNlt02/ssvhKJH5HRXwsbb3
	TRlgbSPRXAYhDUKEYB1U9+vlX26tFNnYI2olmBTWcNNnMwOm5TxKeDHD4UUxeRLxYHZn
	XFFz+mw/UiHUtC1WLdqHVvcb2zP0c/C5c+cdELtKfGHhq1f0zuCJtl5YQTHB01DwtFJq
	Nygw==
X-Gm-Message-State: AE9vXwNJLxzdsZSJsL2Bx5WDcjIQbr3l0mFbqFMf7+tVV9Ff7dIaFbkqYUaKfFW6535erUQpzmRr3QWgIp+9k9m+
X-Received: by 10.31.81.134 with SMTP id f128mr1764053vkb.139.1473788967889;
	Tue, 13 Sep 2016 10:49:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.9.131 with HTTP; Tue, 13 Sep 2016 10:49:07 -0700 (PDT)
In-Reply-To: <cover.1473782118.git.mjt@msgid.tls.msk.ru>
References: <cover.1473782118.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Sep 2016 18:49:07 +0100
Message-ID: <CAFEAcA-sY4w5z3=VfQtLRB2gqQsQo1EzS+YdrrYK88ZrfVsFKQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.48
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/16] Trivial patches for
 2016-09-13
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
X-List-Received-Date: Tue, 13 Sep 2016 17:50:33 -0000

On 13 September 2016 at 17:04, Michael Tokarev <mjt@tls.msk.ru> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
>
> Hello.  After quite some delay, I'm sening pull request for
> the trivial-patches tree for patches which has been in the
> tree since before version 2.7.  I planned to send the pull
> request before, but had no good internet access during whole
> August (while being at vacation).
>
> Please note this pull request tag is signed with my new gpg
> subkey (while main gpg key is the same): old key has been
> revoked due to some risk of it being compromised.
>
> Also I had to reinstall my machine from scratch, and redo
> all the scripts, so this pull request might look a bit
> different from all previous ones.  In particular, I now
> use single (signed) fixed tag instead of tagging each pull
> request with its own date-based tag.
>
> Thanks,
>
> /mjt
>
> The following changes since commit fa9701240951093907076db0943f96972a396ef5:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/pull-vga-20160913-1' into staging (2016-09-13 13:56:35 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
>
> for you to fetch changes up to eb83c2030aa037b4c6037bfa3cbe181343dc6a8b:
>
>   hw/net/e1000e: Fix compiler warning (2016-09-13 18:12:34 +0300)
>
> - ----------------------------------------------------------------
> trivial patches for 2016-09-13
>
> - ----------------------------------------------------------------

Applied, thanks.

-- PMM

