Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b3LSW-0002OV-Ly
	for mharc-qemu-trivial@gnu.org; Thu, 19 May 2016 06:45:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55312)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b3LSU-0002MJ-8E
	for qemu-trivial@nongnu.org; Thu, 19 May 2016 06:45:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b3LSQ-0003JZ-5v
	for qemu-trivial@nongnu.org; Thu, 19 May 2016 06:45:38 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:35538)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b3LSO-0003JF-O4
	for qemu-trivial@nongnu.org; Thu, 19 May 2016 06:45:34 -0400
Received: by mail-vk0-x22d.google.com with SMTP id f66so97525178vkh.2
	for <qemu-trivial@nongnu.org>; Thu, 19 May 2016 03:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GjBIhPKRHJPg0MWJAB6YM4HmdQbNvQti+5xUdXMfpnk=;
	b=YtpYnNlH0e/aNUyvL9zRmnBJ1My2O+WbYyoSBJvCpHZdr8cGz7t415kXiQbGhof5k+
	7DMKL+uIfCKXXUfQQ/oKDyXZOcR83hOEV35c31uJUV6Sfd6mXnEL8SfoI9ByxS+9psSW
	FVhv97en2OCPlOv6PGpaF7wYAAw7at5VKHubw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GjBIhPKRHJPg0MWJAB6YM4HmdQbNvQti+5xUdXMfpnk=;
	b=X3WuLFRLndFjp5/5SmJB8jh1/AOleyAT0b+6sBvB4UJtTVsWMZyvbYbddC7nMsobDa
	2iqodI1Bgb7952nmlc7yX4+8uJ4lDegCkLNExmoUM1UcWKYtRG2+I3m25vRYcLeRvd2g
	zwrKR/c9uUvWdmXKXySYiB+fHy4tIgTklIT2ZlX1aNGcPsHLBodkCczsmkVT/1DFTY/e
	2gY/kDedM+o8++ifLaOU4CFofmlHBZ1t5n3rxFf99LZme18BNL1ZBq48K5zfxmRCACwr
	ODFBOrCPSo/05BG6Qw6Tend/MoOrdSevvN0pKs8joo0cVdDBTVKj/2JiO6NeaV94o8o0
	mTiw==
X-Gm-Message-State: AOPr4FXFe3MgP/l/cfX6LE90WG4jqqHhKtvKS/5TM4Xp1DUYZjPJudvjw8t4VsHeRE2tZOyQq1JeloW84ALribRw
X-Received: by 10.31.92.129 with SMTP id q123mr6794355vkb.92.1463654732170;
	Thu, 19 May 2016 03:45:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 19 May 2016 03:45:12 -0700 (PDT)
In-Reply-To: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
References: <cover.1463573089.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 May 2016 11:45:12 +0100
Message-ID: <CAFEAcA_NH=WsLKLt2Kh-vLmDPAfb3yrPTVQh9JO36bkS61Q=TQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/13] Trivial patches for
 2016-05-18
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
X-List-Received-Date: Thu, 19 May 2016 10:45:39 -0000

On 18 May 2016 at 13:05, Michael Tokarev <mjt@tls.msk.ru> wrote:
> This is first pull request in quite a while.  Accumulating
> only relatively old stuff which hasn't been applied to other
> trees.  More to follow.
>
> Please consider applying.
>
> Thanks,
>
> /mjt
>
> The following changes since commit a257c741491ff1c3c192d13a89c136dd6401c54d:
>
>   Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20160517' into staging (2016-05-17 16:49:11 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2016-05-18
>
> for you to fetch changes up to cb8d4c8f54b8271f642f02382eec29d468bb1c77:
>
>   Fix some typos found by codespell (2016-05-18 15:04:27 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2016-05-18

Applied, thanks.

-- PMM

