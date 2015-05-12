Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ys14t-0007Bv-7f
	for mharc-qemu-trivial@gnu.org; Mon, 11 May 2015 23:41:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Yrzsz-0008K3-1Q
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 22:25:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Yrzsv-0007lP-MJ
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 22:25:32 -0400
Received: from mail-pa0-f51.google.com ([209.85.220.51]:35077)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <shannon.zhao@linaro.org>) id 1Yrzsv-0007l7-8m
	for qemu-trivial@nongnu.org; Mon, 11 May 2015 22:25:29 -0400
Received: by pabtp1 with SMTP id tp1so126755795pab.2
	for <qemu-trivial@nongnu.org>; Mon, 11 May 2015 19:25:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ypKAWpqBuLUHOT6ymKeBKewDC7pGqKckUHAx7prJqac=;
	b=mIqEgVmd40pKxTwTOLGyItruIyLDklSfnf3vk0oex9abYBG7T4KVZ0ejDSCfMRKavm
	6wZlxB1iNsg6x/ffVasQTR2HU9wb4TPKcdLXyV+m3DLZOBUstOMv+U7RVMWW/tEDgK0x
	QXkofhQc2OdNcUd9o+hakFNoszi0mc+DOw1cH+yaskc2Ci5w7zI7ETBCsG60Fmkn44Ug
	g7lfPNtNsNP8BD/YsLZWVistBpv6jmGMWETb4jUWMrEqJiD8LrxIo4O+JhB2RJtnetnF
	19SpqxxwCciTb1Uo7qaZ25FJJBicbt08rFsZbGf31YkfedLy8NQREH5XrnpB4KEHhC1G
	kShA==
X-Gm-Message-State: ALoCoQlpNgR0YoRGSZhOyxwjygjWvZwor8vhIZZxmqXga/T5tIVXbD5IxKBUaCGaifE6g7fvUK2X
X-Received: by 10.70.101.200 with SMTP id fi8mr23820220pdb.161.1431397528145; 
	Mon, 11 May 2015 19:25:28 -0700 (PDT)
Received: from localhost ([180.150.141.243])
	by mx.google.com with ESMTPSA id t9sm14416582pas.3.2015.05.11.19.25.26
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 May 2015 19:25:27 -0700 (PDT)
From: shannon.zhao@linaro.org
To: qemu-devel@nongnu.org
Date: Tue, 12 May 2015 10:25:15 +0800
Message-Id: <1431397521-2316-1-git-send-email-shannon.zhao@linaro.org>
X-Mailer: git-send-email 1.9.5.msysgit.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.51
X-Mailman-Approved-At: Mon, 11 May 2015 23:41:53 -0400
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	zhaoshenglong@huawei.com, christoffer.dall@linaro.org
Subject: [Qemu-trivial] [PATCH 0/6] Blank property cleanup
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
X-List-Received-Date: Tue, 12 May 2015 02:25:35 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

After [1]"s390-virtio: use common features" and [2]"virtio: Move host
features to backends" applied, there are some Property arrays which only
contain the list terminator DEFINE_PROP_END_OF_LIST. This patchset
removes those arrays and other meaningless Property arrays and also adds
comma after DEFINE_PROP_END_OF_LIST().

[1] http://lists.gnu.org/archive/html/qemu-devel/2015-05/msg00259.html
[2] http://lists.gnu.org/archive/html/qemu-devel/2015-04/threads.html

Shannon Zhao (6):
  hw/s390x/s390-virtio-bus: Remove meaningless blank Property
  hw/virtio/virtio-balloon: Remove meaningless blank Property
  hw/virtio/virtio-pci: Remove meaningless blank Property
  hw/gpio/zaurus: Remove meaningless blank Property
  hw/arm/spitz: Remove meaningless blank Property
  Add comma after DEFINE_PROP_END_OF_LIST()

 hw/arm/spitz.c                     |  5 -----
 hw/audio/intel-hda.c               |  2 +-
 hw/char/virtio-serial-bus.c        |  2 +-
 hw/core/platform-bus.c             |  2 +-
 hw/dma/i82374.c                    |  2 +-
 hw/gpio/zaurus.c                   |  5 -----
 hw/i386/kvm/ioapic.c               |  2 +-
 hw/i386/xen/xen_pvdevice.c         |  2 +-
 hw/ide/mmio.c                      |  2 +-
 hw/ipack/ipack.c                   |  2 +-
 hw/isa/pc87312.c                   |  2 +-
 hw/misc/arm11scu.c                 |  2 +-
 hw/misc/macio/cuda.c               |  2 +-
 hw/misc/macio/macio.c              |  2 +-
 hw/nvram/mac_nvram.c               |  2 +-
 hw/pci-bridge/ioh3420.c            |  2 +-
 hw/pci-bridge/xio3130_downstream.c |  2 +-
 hw/pci-host/prep.c                 |  2 +-
 hw/pci-host/versatile.c            |  2 +-
 hw/pci/pci.c                       |  2 +-
 hw/pci/pcie_port.c                 |  4 ++--
 hw/s390x/s390-virtio-bus.c         | 15 ---------------
 hw/timer/a9gtimer.c                |  2 +-
 hw/timer/arm_mptimer.c             |  2 +-
 hw/usb/bus.c                       |  2 +-
 hw/virtio/virtio-balloon.c         |  5 -----
 hw/virtio/virtio-pci.c             |  5 -----
 target-arm/cpu.c                   |  2 +-
 target-i386/cpu.c                  |  4 ++--
 tests/test-qdev-global-props.c     |  2 +-
 30 files changed, 27 insertions(+), 62 deletions(-)

-- 
2.1.0


