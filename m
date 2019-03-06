Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h1XsY-0001tA-Ig
	for mharc-qemu-trivial@gnu.org; Wed, 06 Mar 2019 09:50:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h1XsW-0001so-Ge
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 09:50:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1h1XsV-0005GC-MB
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 09:50:40 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:43042)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1h1XsV-00054E-EY
	for qemu-trivial@nongnu.org; Wed, 06 Mar 2019 09:50:39 -0500
Received: by mail-oi1-x243.google.com with SMTP id i8so10037197oib.10
	for <qemu-trivial@nongnu.org>; Wed, 06 Mar 2019 06:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sHZlULoRuYjVTqUi3QR3Iu1vfhnR2lvzEmjlzIl5ky0=;
	b=I9Z86hdvKMmapjL90qkkoVgSGqS9Tm9iP0P0wW9o8xFC+nUEoMTPuFJwKkTYSg+nCP
	mq/A9mCmDR2ifCp4UQkZnPRGVSkkcxhLkXGGnOeHx5043KR56zdSuwL1kcVSVyxJHlmG
	AlgNbxcnm11P2GKoFSv3ylEeACXuqxfMEBcIdSLKnxyFPXwRmjp1IPJ9mOtQ/fDMr9Qr
	fRKRi/YAcyURJMQPnkVVZOqQcQZQuVTLqmlQRpUhPLDsk32IWL64RtmzCED0Zc7JXkTW
	+ZIGVJy9UcbARznVMEntAiOwUrqBc4ztUFauxATR9rkXaNJef9Bvr9+CN9AX4jbKrOOd
	/JKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sHZlULoRuYjVTqUi3QR3Iu1vfhnR2lvzEmjlzIl5ky0=;
	b=PZOEZNsyfGoAbYiXGZu07D+y7RL2uYDzXTA4DOXfv6c+LNzB6rLtuDEHBUwAFMsd2a
	4sn7gY5Mknm7gV0zcFooxetQJZLitBts1ABUYKu4qBPuxxxaVlaBQZXgxiGwOsAG3Rza
	/5BFes7opJsnga6uDaVd7NabtNA/QfUCm7Q1p+elSSP3ETcKPgz4UQe0BnCgWSNBEpkN
	PPHNbfni86kZc/1kPV+7qC0YNOFN9wns9kcLywG3QZVXDEu3uTKMELVN3p3dUebCHYyc
	WNYDb48qv52arekIf3iLb1XlKOETRJWy22Rl1md5klHHbpZqHhiLpAPJGnSMiMWMRRgW
	2iRQ==
X-Gm-Message-State: APjAAAUf1dgPcJYi9eTZAd/4SMc4NeqdZ1l4KdTvRvUDDaUpib4vmTGw
	OsQ/S9rSQMvmJsMl/zu7RFJ/wLVqfOJILZhrt6zFiQ==
X-Google-Smtp-Source: APXvYqzE/aP+mVgKOIFzB91+UxQVBPq+4FTfEg9TWOyl4B/XJ41pBt2fyF4UVDIIus+d2CdR65i6DiR6lYF3+z5X65E=
X-Received: by 2002:aca:fd91:: with SMTP id b139mr1894258oii.170.1551883824139;
	Wed, 06 Mar 2019 06:50:24 -0800 (PST)
MIME-Version: 1.0
References: <20190306110711.309-1-laurent@vivier.eu>
In-Reply-To: <20190306110711.309-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Mar 2019 14:50:12 +0000
Message-ID: <CAFEAcA9pjHpqtBCXZGDXEnzW8=FvnGER_MZkNC0NxZX6ORtwzQ@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Li Zhijian <lizhijian@cn.fujitsu.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>, 
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	Qemu-block <qemu-block@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Halil Pasic <pasic@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Laurent Vivier <lvivier@redhat.com>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
	Riku Voipio <riku.voipio@iki.fi>, qemu-s390x <qemu-s390x@nongnu.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, 
	Zhang Chen <zhangckid@gmail.com>, John Snow <jsnow@redhat.com>, 
	Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
	Pierre Morel <pmorel@linux.ibm.com>, 
	Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/10] Trivial branch patches
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
X-List-Received-Date: Wed, 06 Mar 2019 14:50:41 -0000

On Wed, 6 Mar 2019 at 11:09, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit a3e3b0a7bd5de211a62cdf2d6c12b96d3c403560:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-qapi-2019-03-05' into staging (2019-03-05 19:23:45 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to 0e081fde8a3d80383adf2e802fc0c03af44c5436:
>
>   thunk: fix of malloc to g_new (2019-03-06 11:27:32 +0100)
>
> ----------------------------------------------------------------
> trivial patches pull request (20190206)
>
> - acpi: remove unused functions/variables
> - tests: remove useless architecture checks
> - some typo fixes and documentation update
> - flash_cfi02: fix memory leak
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.0
for any user-visible changes.

-- PMM

