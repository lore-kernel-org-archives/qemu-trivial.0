Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGt5Y-00022T-Lb
	for mharc-qemu-trivial@gnu.org; Tue, 03 Sep 2013 12:04:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VGt5Q-0001xg-75
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 12:04:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VGt5K-0005vv-20
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 12:04:12 -0400
Received: from mail-la0-f48.google.com ([209.85.215.48]:34924)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VGt5J-0005vQ-OZ
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 12:04:05 -0400
Received: by mail-la0-f48.google.com with SMTP id er20so4820923lab.35
	for <qemu-trivial@nongnu.org>; Tue, 03 Sep 2013 09:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=StNGgVkBiskF8+2iWcYAJeWDlGxD/di/m4DO+ph1pbc=;
	b=JBJ/qjIqVIkpc7JwD5TLED9CUQPH8ip9r3GnwnUEL4inab+T+ijUhmJAUMoQVYoCT3
	mFnaYB85mKedmHKPNb8CS+3Gut4llTq3ohp2LCgQbTqNkKL8TdlYUXhK7yue4vXwH89Z
	spVzPcUPwBID+jOVebYRcqER+sudNFzwYcbsFeCHYa7EFzgQzmpxMFRcQg2FaxM5VWUT
	MJsiB+HFUeKLWDqBbPneShajy6KfmhH2QRru6Ly1DoWDAEJELA0xz1VzQtcsH1mQlycQ
	g4bvnra5PPchLrkOJiZkx2qjNaFgnTKXb2lx14oRKMxlTcVZgux71ykF2tpjCNmQLNGu
	yPlg==
X-Gm-Message-State: ALoCoQklHFkYzun7o++IYo3662o2iis7HHROE7/PGZ3LPAopgZBp06BHVS+GNXdflcCNMhS25IPC
X-Received: by 10.152.87.143 with SMTP id ay15mr27158312lab.2.1378224244699;
	Tue, 03 Sep 2013 09:04:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.169.70 with HTTP; Tue, 3 Sep 2013 09:03:44 -0700 (PDT)
In-Reply-To: <1378223912.3246.36.camel@ul30vt.home>
References: <1378196857-27541-1-git-send-email-aik@ozlabs.ru>
	<CAFEAcA8Jp=SQsC3RpxahF1RFRtX2nHOS2690XiT9Jnpn0jGk_g@mail.gmail.com>
	<5225AC9A.2090601@ozlabs.ru> <5225BD32.8030001@siemens.com>
	<52260025.3050704@ozlabs.ru>
	<CAFEAcA8b26fm17sUZ=aUeETVD9q2AahkXQDLQWuRJGM9JMMqkQ@mail.gmail.com>
	<5226048E.2090004@ozlabs.ru> <1378223912.3246.36.camel@ul30vt.home>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2013 17:03:44 +0100
Message-ID: <CAFEAcA_MN9jv3QnHGm1785kp2aqKgO1k-R_3QmR39094FbwsZQ@mail.gmail.com>
To: Alex Williamson <alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.48
Cc: kvm-devel <kvm@vger.kernel.org>, Gleb Natapov <gleb@redhat.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>, Jan Kiszka <jan.kiszka@siemens.com>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-headers: update to
	3.11
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
X-List-Received-Date: Tue, 03 Sep 2013 16:04:18 -0000

On 3 September 2013 16:58, Alex Williamson <alex.williamson@redhat.com> wrote:
> I was under the impression that we were only ever updating linux-headers
> from mainline, never from kvm-next.

Looking at the git history, it's variable. Four of the
last 10 updates were from somewhere other than mainline.
In any case this is the kind of policy decision that
means updates should go via the QEMU KVM maintainers :-)

-- PMM

