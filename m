Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WpPtz-000894-4P
	for mharc-qemu-trivial@gnu.org; Tue, 27 May 2014 18:31:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45388)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WpPts-000852-RC
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 18:31:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WpPto-0007SP-5w
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 18:31:16 -0400
Received: from mail-la0-f51.google.com ([209.85.215.51]:55144)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WpPtn-0007SA-WE
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 18:31:12 -0400
Received: by mail-la0-f51.google.com with SMTP id gf5so6857491lab.38
	for <qemu-trivial@nongnu.org>; Tue, 27 May 2014 15:31:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=3yjUdel72CLFD38I2fHSjWG7cj7ROjgxDo55O9PXIuE=;
	b=LIE0Ct1ymeotRKVykhkugbROogtyAe/P52HfX+yrR52vf/q+hwlHr2XO2/2m2EalAx
	eYjZ8bE7BK3LLAT7/NFLLtZwjJSBFiQxG9nQCySV2xxbmoHhuP2u1f2UfGuxRGh7t8jm
	ezkqtTGCm7RfhqpDDX3aSMRLO5hD16T97/WULeEAPEh6LasgYtF/ZxjPkN0hw9H0Wf2W
	H+qwTp03N2fY3fjQWjKtTnwxTTdf3j0YQceeMvOiAiL/VcM3IpzlmebH0gXWHZp0t+Ka
	PWpyfD7KejS/5zqk0r8nFD8pj/4KMNm5n+ceN1yPHb5VLHdzOgtSG5FXMCMhdyQw7iU7
	TSpQ==
X-Gm-Message-State: ALoCoQlHZ40JZguB/tmiVEg+DTlFi1OB2URyR6slOPxhgOUKSHWMg0TUY0cnsok8nxXe1Ik3B0yX
X-Received: by 10.112.35.136 with SMTP id h8mr7922718lbj.8.1401229870956; Tue,
	27 May 2014 15:31:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Tue, 27 May 2014 15:30:50 -0700 (PDT)
In-Reply-To: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 May 2014 23:30:50 +0100
Message-ID: <CAFEAcA9vJGGtjJcXwG6YGRx+HttKQQHwubg_ONKczdF9-9G6tA@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.51
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/23] Trivial patches for
	2014-05-26
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
X-List-Received-Date: Tue, 27 May 2014 22:31:21 -0000

On 26 May 2014 08:19, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's another trivial patches pull request.
>
> This time it accumulated 23 patches, in many areas, with a focus,
> for some reason, on libcacard, which received quite some cleanups
> and a fix for a fun bug.
>
> More interesting changes this time are by Peter Maydell, -- these
> are the bswap.h macros renaming and using a subdir in curdir for
> temporaries.
>
> Please consider applying.
>
> /mjt
>
> The following changes since commit 6054d883d6138bfc92c73a7c090c824b64086fd2:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/pull-chardev-2' into staging (2014-05-22 18:14:01 +0100)
>
> are available in the git repository at:
>
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-2014-05-26
>
> for you to fetch changes up to 1687a089f103f9b7a1b4a1555068054cb46ee9e9:
>
>   libcacard: remove useless initializers (2014-05-26 10:41:22 +0400)
>
> ----------------------------------------------------------------
> trivial patches for 2014-05-26
>

Applied, thanks.

-- PMM

