Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cildK-00071k-4Q
	for mharc-qemu-trivial@gnu.org; Tue, 28 Feb 2017 12:32:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47680)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cildI-0006zz-2G
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 12:32:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cildH-00035Z-2q
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 12:32:16 -0500
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:38331)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cildG-000353-TO
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 12:32:15 -0500
Received: by mail-wm0-x22e.google.com with SMTP id u199so17657274wmd.1
	for <qemu-trivial@nongnu.org>; Tue, 28 Feb 2017 09:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YKTm18H4+rLAICYgGLblkS/6+nuASvKk5eQyZoysjMg=;
	b=HkJiUQLR+CQ8hVIIpmc26I2zaD85nq3nN2rIsYKb2GRBS1mUdARDZTdVXJFFbL4SFA
	JOmPiVOt+nBvPiRCfXQFldAkLzSUFaVeyUf367xxyNbmFSo6E6v9yHf08lHXEHjExY8a
	l+GzXyYRHaIDls64H1KDzVoGeY5VLCXn9RxJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YKTm18H4+rLAICYgGLblkS/6+nuASvKk5eQyZoysjMg=;
	b=MjpxQNbFjZ/jV+9vLGuft0r8S0RwbavSr3KzPBN+29sahKA1PVPKYjg7r7kyY2Pay0
	FwX95qFAJ0WFqk64js04Szvate3t7gW+pUOppvcSw82+adKw3hzs6RQAj1mRINHUIvuB
	ExhwB09dBV3z2fgAYOp4lm4LS5mWU4WJ1cg6n7x3IsJwgk1rGnj36/QsqX+dthm3Ap0/
	8q2euSUi6d/RddkM2+wyEU+dskQCeK1vFDOOa6jKcpQkLYSLtfWa3VYpM9YibyQLrSXs
	61yEXAsIv1HCmfYMiYTn24rHvGnIOmScv+HrARcE5G4ZHXK+TejaksxoH5wlzHpSfXAq
	TmLQ==
X-Gm-Message-State: AMke39nP5YsSOlplTIZFvkzsP83AVP5X4t2ZyQmWvb91wi3xLTktZUOM9uEcX1NilaMDz4aDn/JzFqu6xf33F2Zo
X-Received: by 10.28.55.199 with SMTP id e190mr18303828wma.92.1488303133612;
	Tue, 28 Feb 2017 09:32:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Tue, 28 Feb 2017 09:31:53 -0800 (PST)
In-Reply-To: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
References: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Feb 2017 17:31:53 +0000
Message-ID: <CAFEAcA_THnAMM_ugGsOa0+iwMHp-01zvENMaqUxem9KPF36yVg@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22e
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/14] Trivial patches for
 2017-02-28
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
X-List-Received-Date: Tue, 28 Feb 2017 17:32:17 -0000

On 28 February 2017 at 06:44, Michael Tokarev <mjt@tls.msk.ru> wrote:
> This is yet another trivial patches pull request.
> Please consider applying/pulling.
>
> The following changes since commit 8f2d7c341184a95d05476ea3c45dbae2b9ddbe51:
>
>   Merge remote-tracking branch 'remotes/berrange/tags/pull-qcrypto-2017-02-27-1' into staging (2017-02-27 15:33:21 +0000)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
>
> for you to fetch changes up to f5507e0448bd34473af72509297617a783049024:
>
>   syscall: fixed mincore(2) not failing with ENOMEM (2017-02-28 09:03:39 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2017-02-28
>
> ----------------------------------------------------------------

Applied, thanks.

-- PMM

