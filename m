Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGmvY-0002o2-OI
	for mharc-qemu-trivial@gnu.org; Tue, 03 Sep 2013 05:29:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VGmvS-0002lp-N3
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 05:29:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VGmvM-0001ar-Ds
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 05:29:30 -0400
Received: from mail-la0-f42.google.com ([209.85.215.42]:50275)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VGmvM-0001aZ-7z
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 05:29:24 -0400
Received: by mail-la0-f42.google.com with SMTP id ep20so4487383lab.1
	for <qemu-trivial@nongnu.org>; Tue, 03 Sep 2013 02:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qkmKbfqNjONecpQSkwg7APC+VxFkkBzS5FRVs6c4K+4=;
	b=h3rFl/VztoFkk3Sbv8fVuStOw4rtyURZgVa2wtR1YPDIWypnZnZRDg+7ow7qVSJmF8
	ZB4J6WmD7Ij/9h0uuEuqoykvEoSSgYVowaxnhfrXPFSmG/yCKch91o9AUkofSzi6a1MB
	yuJq4UNZ8MnRk/QmDPfzWx3sEZMNs+12f3SIg22lZVDdDR/t4MyrMtGWC6S4tw886JjN
	jzCe61kWEzo3zOSNoXtccIq8LFY61AhSmz1BH947a2ktP5Jq5liqdUBbJaXHFRP95/MO
	Z7Fs0YqDGkH4pvS43o6hJ/EQG+tQX5k0gMPt7tPsOPU99snuNMYOurA3ktVED9dgthyc
	UwEQ==
X-Gm-Message-State: ALoCoQkzLfADWNAwWeVUmu/vxZYkx+mYWTt1oRIuUnNTM32Ha9ab2VvIno4717ysJN5GFpXY9mZD
X-Received: by 10.152.116.7 with SMTP id js7mr25694546lab.11.1378200563107;
	Tue, 03 Sep 2013 02:29:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.169.70 with HTTP; Tue, 3 Sep 2013 02:29:03 -0700 (PDT)
In-Reply-To: <1378196857-27541-1-git-send-email-aik@ozlabs.ru>
References: <1378196857-27541-1-git-send-email-aik@ozlabs.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2013 10:29:03 +0100
Message-ID: <CAFEAcA8Jp=SQsC3RpxahF1RFRtX2nHOS2690XiT9Jnpn0jGk_g@mail.gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.42
Cc: kvm-devel <kvm@vger.kernel.org>, Gleb Natapov <gleb@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
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
X-List-Received-Date: Tue, 03 Sep 2013 09:29:35 -0000

On 3 September 2013 09:27, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>
> I need this update as VFIO on PPC64/pseries got in upstream kernel
> and this is required by VFIO-SPAPR bits in QEMU. Others may find this
> update useful too :)
> ---
>  linux-headers/asm-arm64/kvm.h       | 168 ++++++++++++++++++++++++++++++++++++
>  linux-headers/asm-arm64/kvm_para.h  |   1 +
>  linux-headers/asm-mips/kvm.h        |  81 +++++++++--------
>  linux-headers/linux/kvm.h           |   3 +
>  linux-headers/linux/vfio.h          |  42 ++++++++-
>  linux-headers/linux/virtio_config.h |   3 +
>  6 files changed, 254 insertions(+), 44 deletions(-)
>  create mode 100644 linux-headers/asm-arm64/kvm.h
>  create mode 100644 linux-headers/asm-arm64/kvm_para.h

I think this should go in via the KVM tree, not trivial.

thanks
-- PMM

