Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YusSp-0000Ix-93
	for mharc-qemu-trivial@gnu.org; Tue, 19 May 2015 21:06:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60036)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1YusSn-0000In-Lq
	for qemu-trivial@nongnu.org; Tue, 19 May 2015 21:06:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1YusSj-0004B4-AQ
	for qemu-trivial@nongnu.org; Tue, 19 May 2015 21:06:25 -0400
Received: from mail-pa0-f47.google.com ([209.85.220.47]:36559)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1YusSj-0004Aq-57
	for qemu-trivial@nongnu.org; Tue, 19 May 2015 21:06:21 -0400
Received: by pabts4 with SMTP id ts4so46301016pab.3
	for <qemu-trivial@nongnu.org>; Tue, 19 May 2015 18:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=xrR02BxD0ZXyFqaLplelyDSQLL6s3RvFbDwfOAQwoF8=;
	b=amCRSvzrPwrwmKybQ4ZvliI+BddzxgNH/1486XYe8af7rY2lyUTw0fTFh1FbrDS/vp
	Ja64Lghh6EmsBN/F5AZZFjQT2QOyp2j4ne8ZEQmn+JUkYmktaGVjJKU3Yqm8ORcI9FUw
	z+TtBAubW7y5besEpKtVHIG3tCxJuVHPYBvERNQ0OPCzG7PfQED/+zSt7/hRo1rJ3uYt
	qWyPZ/nGiEjvfsoz6G1uA4iO7D0cIJgEWyCmw1z1hAkyUEUysMK0XYB2xB8udoPskVWA
	mKpvFpK5RG+5OIyT8SBZL+sJ01xVLrV/MNp+bFev5I+hvY/qzJ3wIXJMLe2Orux+NbnC
	Dz5Q==
X-Gm-Message-State: ALoCoQmnq4dMi0ZqclFyAcTwfqG59ByEE+J0RbEugt5xfopZ13Qiy4eO4Fts4WorjOee7vJjcByu
X-Received: by 10.70.6.161 with SMTP id c1mr58593663pda.76.1432083979492;
	Tue, 19 May 2015 18:06:19 -0700 (PDT)
Received: from [10.13.29.54] ([180.150.152.123])
	by mx.google.com with ESMTPSA id
	fk10sm14296349pab.18.2015.05.19.18.06.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 May 2015 18:06:18 -0700 (PDT)
Message-ID: <555BDE05.9010100@linaro.org>
Date: Wed, 20 May 2015 09:06:13 +0800
From: Shannon Zhao <shannon.zhao@linaro.org>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: qemu-devel@nongnu.org
References: <1431397521-2316-1-git-send-email-shannon.zhao@linaro.org>
In-Reply-To: <1431397521-2316-1-git-send-email-shannon.zhao@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.47
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	zhaoshenglong@huawei.com, christoffer.dall@linaro.org
Subject: Re: [Qemu-trivial] [PATCH 0/6] Blank property cleanup
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
X-List-Received-Date: Wed, 20 May 2015 01:06:26 -0000

Ping...

On 2015/5/12 10:25, shannon.zhao@linaro.org wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
> 
> After [1]"s390-virtio: use common features" and [2]"virtio: Move host
> features to backends" applied, there are some Property arrays which only
> contain the list terminator DEFINE_PROP_END_OF_LIST. This patchset
> removes those arrays and other meaningless Property arrays and also adds
> comma after DEFINE_PROP_END_OF_LIST().
> 
> [1] http://lists.gnu.org/archive/html/qemu-devel/2015-05/msg00259.html
> [2] http://lists.gnu.org/archive/html/qemu-devel/2015-04/threads.html
> 
> Shannon Zhao (6):
>   hw/s390x/s390-virtio-bus: Remove meaningless blank Property
>   hw/virtio/virtio-balloon: Remove meaningless blank Property
>   hw/virtio/virtio-pci: Remove meaningless blank Property
>   hw/gpio/zaurus: Remove meaningless blank Property
>   hw/arm/spitz: Remove meaningless blank Property
>   Add comma after DEFINE_PROP_END_OF_LIST()
> 
>  hw/arm/spitz.c                     |  5 -----
>  hw/audio/intel-hda.c               |  2 +-
>  hw/char/virtio-serial-bus.c        |  2 +-
>  hw/core/platform-bus.c             |  2 +-
>  hw/dma/i82374.c                    |  2 +-
>  hw/gpio/zaurus.c                   |  5 -----
>  hw/i386/kvm/ioapic.c               |  2 +-
>  hw/i386/xen/xen_pvdevice.c         |  2 +-
>  hw/ide/mmio.c                      |  2 +-
>  hw/ipack/ipack.c                   |  2 +-
>  hw/isa/pc87312.c                   |  2 +-
>  hw/misc/arm11scu.c                 |  2 +-
>  hw/misc/macio/cuda.c               |  2 +-
>  hw/misc/macio/macio.c              |  2 +-
>  hw/nvram/mac_nvram.c               |  2 +-
>  hw/pci-bridge/ioh3420.c            |  2 +-
>  hw/pci-bridge/xio3130_downstream.c |  2 +-
>  hw/pci-host/prep.c                 |  2 +-
>  hw/pci-host/versatile.c            |  2 +-
>  hw/pci/pci.c                       |  2 +-
>  hw/pci/pcie_port.c                 |  4 ++--
>  hw/s390x/s390-virtio-bus.c         | 15 ---------------
>  hw/timer/a9gtimer.c                |  2 +-
>  hw/timer/arm_mptimer.c             |  2 +-
>  hw/usb/bus.c                       |  2 +-
>  hw/virtio/virtio-balloon.c         |  5 -----
>  hw/virtio/virtio-pci.c             |  5 -----
>  target-arm/cpu.c                   |  2 +-
>  target-i386/cpu.c                  |  4 ++--
>  tests/test-qdev-global-props.c     |  2 +-
>  30 files changed, 27 insertions(+), 62 deletions(-)
> 

-- 
Shannon

