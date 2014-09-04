Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XPX56-00052D-Oe
	for mharc-qemu-trivial@gnu.org; Thu, 04 Sep 2014 09:28:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38076)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XPX50-0004rZ-29
	for qemu-trivial@nongnu.org; Thu, 04 Sep 2014 09:28:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XPX4t-0000Vy-FZ
	for qemu-trivial@nongnu.org; Thu, 04 Sep 2014 09:28:02 -0400
Received: from mail-lb0-f172.google.com ([209.85.217.172]:43634)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XPX4t-0000Vf-9J
	for qemu-trivial@nongnu.org; Thu, 04 Sep 2014 09:27:55 -0400
Received: by mail-lb0-f172.google.com with SMTP id c11so3291533lbj.3
	for <qemu-trivial@nongnu.org>; Thu, 04 Sep 2014 06:27:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=eiinUfZQx+hhtLTcUawn3WhF6uq++Cp2m+qocgApCPU=;
	b=g1DytCPPKcRSlaPCMflHTBdRT2g3AjOQtjaJisaENmlWscgU3j2VdIKWpfenZALYlc
	62VVoxfHlcdqsaWHCTYWyOOO2eNnIF1qYi8r6G9R9HI7td892BBNLqhJ3R0Odu61peht
	6jl2Q48on8jYSuT3gvwQ84htOmeif4rQVGdZLT4Y/pipzg8+1VYXd14UF2BaBZBF2nhe
	6Mdfuf4OXFeRV0es2CxfU09lL+eVlxos9c2IyBB+4vKphDRzvKm913XW7/UfgPXsr8yE
	U+T7hewswAb9on4ZJIfZ7su2yOw+oz8ad3RFUl+0HM/jtnJ7mQlImEwjt+XORaExKnVy
	IRxA==
X-Gm-Message-State: ALoCoQkMtlaNNqUOpizRA2fxlzTZT7xjG6NYzFQf/s88FyEGZblh8wly6uCjOdaHrR00mfrx6ptc
X-Received: by 10.152.7.177 with SMTP id k17mr4844230laa.10.1409837273963;
	Thu, 04 Sep 2014 06:27:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Thu, 4 Sep 2014 06:27:33 -0700 (PDT)
In-Reply-To: <1409726135-1547-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1409726135-1547-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Sep 2014 14:27:33 +0100
Message-ID: <CAFEAcA9Wq5MSW=4zsRdAn5UsBkM-8Gyjq6pzNvYvdWdDu0UETQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.172
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/10] Trivial patches for
	2014-09-03
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
X-List-Received-Date: Thu, 04 Sep 2014 13:28:07 -0000

On 3 September 2014 07:35, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Here's a next trivial-patches batch.  A few little things here and there.
> Please consider applying.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 30eaca3acdf17d7bcbd1213eb149c02037edfb0b:
>
>   Merge remote-tracking branch 'remotes/spice/tags/pull-spice-20140902-1' into staging (2014-09-02 10:26:10 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-2014-09-03
>
> for you to fetch changes up to 70381662aa97b294f3c81a085ed143f37f0ab0cb:
>
>   slirp: Honour vlan/stack in hostfwd_remove commands (2014-09-02 22:38:16 +0400)
>
> ----------------------------------------------------------------
> trivial patches for 2014-09-03
>

Applied, thanks.

-- PMM

