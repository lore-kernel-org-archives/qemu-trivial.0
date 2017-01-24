Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cW4rY-0003La-35
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 12:26:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cW4rW-0003K5-5N
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 12:26:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cW4rV-0001Qa-CG
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 12:26:30 -0500
Received: from mail-ua0-x230.google.com ([2607:f8b0:400c:c08::230]:35078)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cW4rV-0001QL-8D
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 12:26:29 -0500
Received: by mail-ua0-x230.google.com with SMTP id y9so139734587uae.2
	for <qemu-trivial@nongnu.org>; Tue, 24 Jan 2017 09:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=u2xnOEwZEAjySZ80+7bmE3NHvE8mIpFzs2QX1yaahiQ=;
	b=gsxjJm2yfpXDJFiFuBYCSUWVcIvqCEbIC7hnftmWkMMeQG8GqcM67VOH6BlpMpw9Dg
	iiWv+BDbaZ5PcPD6iwCpmLenjRFaG1LHDYR0LTpvz+ft2VLMlfI0G2hMFE7sj0II57k4
	TUWOrTgWtoh6fQPCR7TXzy7WlAEG0zKCM9Dho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=u2xnOEwZEAjySZ80+7bmE3NHvE8mIpFzs2QX1yaahiQ=;
	b=gOZIM1VTjrmozZkG6zXVfaafYV+2kscsd99/nljNQM78AoqDeBqNvOXDmMhCAsXkLa
	9dzwuKIDnPZoRNG8z+3w81XsQ4uECJOKY2jDeK6vnKkQZSUZApyNCss+FS3BMqZfaByY
	BdmEXuvtUFTIHOZ4USQsLUbTnB6IhE97o2MsbFHoLcF14/uEhSHizfwzHwPULPLUM6Lv
	IArOHhcXf+4xAFsGdG2B8HssM/mFOKWUkj+DRzl5gTVqD0vtGGq8ZFRI5WJTtMK8we+B
	Sz2E5jn9NCZLPZ+elCstNbIILGDyPEfNo87bf7ZBWu4/07zMvP0fhv/99o3MZYHITW77
	a4Ug==
X-Gm-Message-State: AIkVDXIoA0K1Ox6dJLAPf2n23ZfHp6uFMuLtQWGFwomeBA4iB1lztO09L2GnsK0TftIjl2T0/olmbN3k7fm9RCRr
X-Received: by 10.159.39.233 with SMTP id b96mr19107589uab.86.1485278788656;
	Tue, 24 Jan 2017 09:26:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 24 Jan 2017 09:26:08 -0800 (PST)
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Jan 2017 17:26:08 +0000
Message-ID: <CAFEAcA-eXHbKc081aVe5MxXpTTvdYE++TU61iYLboSAtFYTknQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::230
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/31] Trivial patches for
 2017-01-24
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
X-List-Received-Date: Tue, 24 Jan 2017 17:26:31 -0000

On 24 January 2017 at 09:39, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Hi!
> This is a next trivial-patches pull request after a long while.
> We had a new release (2.8), new year holidays and other stuff.
> So here we go now with whatever has been collected so far.
>
> Please consider applying.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 3879284d6517dc22529395bdb259f4183b5891=
27:
>
>   Merge remote-tracking branch 'remotes/berrange/tags/pull-qio-2017-01-23=
-2' into staging (2017-01-23 15:59:09 +0000)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
>
> for you to fetch changes up to bed534dd4032446750ad3e7a806c24d81bc5851b:
>
>   hw/isa/isa-bus: Set category of the "isabus-bridge" device (2017-01-24 =
12:38:03 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2017-01-24
>
> ----------------------------------------------------------------

This failed to build, all targets:

/home/petmay01/linaro/qemu-for-merges/arch_init.c:95:5: error: no
previous prototype for =E2=80=98qemu_read_default_config_files=E2=80=99
[-Werror=3Dmissing-prototypes]

I suspect this may be the result of merge conflicts getting
wrongly resolved -- can you rebase and resend, please?

thanks
-- PMM

