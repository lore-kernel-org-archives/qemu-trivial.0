Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WdXnZ-0005o5-TC
	for mharc-qemu-trivial@gnu.org; Fri, 25 Apr 2014 00:31:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WdUoT-00029r-Md
	for qemu-trivial@nongnu.org; Thu, 24 Apr 2014 21:22:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WdJWx-0001LN-3w
	for qemu-trivial@nongnu.org; Thu, 24 Apr 2014 09:17:46 -0400
Received: from mail-lb0-f182.google.com ([209.85.217.182]:33282)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WdJWw-0001JX-ST
	for qemu-trivial@nongnu.org; Thu, 24 Apr 2014 09:17:35 -0400
Received: by mail-lb0-f182.google.com with SMTP id l4so2025832lbv.27
	for <qemu-trivial@nongnu.org>; Thu, 24 Apr 2014 06:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ISz1WILKBL6TiqWn/CpddNe66Cr8LMq88Yd4WC1idP8=;
	b=ZVIhwXViGHtr20KYvuq5vS6J0dFxpLtAZ2Yp8oJkdhYzUpQ6SV027LxCyoT0aJuFx+
	Q+Utc9PzqIceijjk14zxsY4UifxoJsmM57LQ1Jc+U6RD4Kt3VLydyCDqcEFL6kZfQwQr
	Ay0YjpfD0zZXkAoYOJgCNurd8X//sLao/bkLrh9f4Y8LQOLQq0/w5mMZD0Wlh3IjGxoq
	zuRAZYUynN108nwLg3/BRgQ8gFbivQBlwZed3IXz5oDa7b97FKqYvi5sOmjxJz7i6HWE
	nqqyQ5IweMmGsVnPLWycQsKuPlEfVyEsseaVtRbej/hIfdygwaUIY44xy10+YmoDsVn7
	D+IQ==
X-Gm-Message-State: ALoCoQkH1VI9oE2bnYkgnBhmmelbpw++mq8VamyBrq8kp+gQfjAb1PKN5j0yjLGI+Q2aX3sqwJI4
X-Received: by 10.112.64.8 with SMTP id k8mr36462lbs.72.1398345452802; Thu, 24
	Apr 2014 06:17:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.180.233 with HTTP; Thu, 24 Apr 2014 06:17:12 -0700 (PDT)
In-Reply-To: <1397803329-241829-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1397803329-241829-1-git-send-email-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Apr 2014 14:17:12 +0100
Message-ID: <CAFEAcA-fMBeCnQRd4R0hhWE+1_0Lkw==va9aUTCRKrq6RAUTqg@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.182
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL] Trivial patches for
	2014-04-18
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
X-List-Received-Date: Fri, 25 Apr 2014 04:31:40 -0000

On 18 April 2014 07:42, Michael Tokarev <mjt@tls.msk.ru> wrote:
> This is the same pull request as has been sent initially for 2.0
> and which we didn't apply.  Except that this time, I fixed one more
> "allows to" case which I overlooked in qemu-options.hx.
>
> I'm not re-sending whole series again, as at has been sent previously,
> will only re-send the changed patch as a reply to this message.
>
> Please consider pulling.
>
> The following changes since commit 2d03b49c3f225994c4b0b46146437d8c887d6774:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20140417-1' into staging (2014-04-17 21:37:26 +0100)
>
> are available in the git repository at:
>
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-2014-04-18

Applied, thanks.

-- PMM

