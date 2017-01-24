Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cW4OG-0005T3-I1
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 11:56:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60728)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cW4OD-0005Qp-Vj
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 11:56:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cW4OD-0007jy-55
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 11:56:14 -0500
Received: from mail-ua0-x234.google.com ([2607:f8b0:400c:c08::234]:33674)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cW4OD-0007jk-0z
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 11:56:13 -0500
Received: by mail-ua0-x234.google.com with SMTP id i68so138252976uad.0
	for <qemu-trivial@nongnu.org>; Tue, 24 Jan 2017 08:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2tSabffdFhe32VWb8jrHKsbAcMakWhPsU0ykdc07J4s=;
	b=E9sNMMaajmghsk6qi5RpI5tgzuPpXmALg7+ot5bxw+VWag89uvdL9mh5EG4gM13MCE
	Ez6k84QdrzaQuQOdVSFSGb8lJgg/YQY2GV/mYIDVupGrnJkZCIIlrcuC13GMBEaq11mP
	Fsg/1wuOD3EAd3U5fVQBnyURNndGpVESmSy+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2tSabffdFhe32VWb8jrHKsbAcMakWhPsU0ykdc07J4s=;
	b=sOVpbMvOU/+TeZpalOouLbhoHO8MfajX7OYo/UIsgLfi5Rux5oBNpJ8A4g3AgJG+7h
	Vme4o6eTbLTVIW8GJzB7r9UFyIgHsm44xZtUl94O2uHr6Jt5oMFR4+7eo/HjPveeybx+
	3W53Uy5e7eEV7VYJNOPuRGBbTaiK0rTqPMMbVA8fYr1l7u5CAZX5lDXOfilRlJZR5HJH
	+kbZl33pVZn9KqWKNnYAbnbCYCBk4b/q1Fo+7kQAztYSq4wI6/qz6Vhgu5NIeUNRYjmT
	Q7ibo99RxpF2b3ci89crjXWfhqmynZJ39aiFsCVasmGmG5IjV6Go5Gr/VJptmyjV8wA7
	fn8A==
X-Gm-Message-State: AIkVDXJ5VwW+KFYLKbe459L3Nl9DgXGoJ4rYD6K3ht6Ri43s4mVN0+y6XgbIAKKkMbjIHmdwmPsoAj4XfBYY2UVK
X-Received: by 10.176.71.87 with SMTP id i23mr18445623uac.144.1485276972274;
	Tue, 24 Jan 2017 08:56:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Tue, 24 Jan 2017 08:55:51 -0800 (PST)
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Jan 2017 16:55:51 +0000
Message-ID: <CAFEAcA8EYZy4C3mmOfZUGUBENvdWOsADMCyG3fyoYAdMa-qBxQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::234
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
X-List-Received-Date: Tue, 24 Jan 2017 16:56:14 -0000

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
> The following changes since commit 3879284d6517dc22529395bdb259f4183b589127:
>
>   Merge remote-tracking branch 'remotes/berrange/tags/pull-qio-2017-01-23-2' into staging (2017-01-23 15:59:09 +0000)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
>
> for you to fetch changes up to bed534dd4032446750ad3e7a806c24d81bc5851b:
>
>   hw/isa/isa-bus: Set category of the "isabus-bridge" device (2017-01-24 12:38:03 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2017-01-24
>

Applied, thanks.

-- PMM

