Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxwee-00030B-Np
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:11:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58541)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweL-0002QY-In
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:11:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YxweF-0003i1-EC
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:11:01 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:45232)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxwe3-0003RW-My; Thu, 28 May 2015 08:10:44 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COP98084; Thu, 28 May 2015 20:10:27 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:09:50 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:08:23 +0800
Message-ID: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mjt@tls.msk.ru,
	shannon.zhao@linaro.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH 00/29] Fix memory leak relevant to calling
	qemu_allocate_irqs
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
X-List-Received-Date: Thu, 28 May 2015 12:11:06 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Before I sent some patches to fix memory leak spotted by valgrind and
those are relevant to qemu_allocate_irqs. Then I find all the places
calling this function through code searching and test by valgrind to
check whether they have memory leak. These patches fix these memory leaks.

Sorry that maybe the names of the patches are vertiginous while I could
not find out better names and I try to sort them out.

Thanks,
Shannon

Shannon Zhao (29):
  hw/ide/ahci.c: Fix memory leak spotted by valgrind
  hw/ide/cmd646.c: Fix memory leak spotted by valgrind
  hw/i386/pc: Fix memory leak spotted by valgrind
  hw/i386/pc_q35.c: Fix memory leak spotted by valgrind
  hw/isa/lpc_ich9.c: Fix memory leak spotted by valgrind
  hw/isa/i82378.c: Fix memory leak spotted by valgrind
  hw/timer/arm_timer.c: Fix memory leak spotted by valgrind
  hw/intc/exynos4210_gic.c: Fix memory leak spotted by valgrind
  hw/sparc/leon3.c: Fix memory leak spotted by valgrind
  hw/sparc/sun4m.c: Fix memory leak spotted by valgrind
  hw/ppc/mac_oldworld.c: Fix memory leak spotted by valgrind
  hw/ppc/ppc440_bamboo.c: Fix memory leak spotted by valgrind
  hw/ppc/prep.c: Fix memory leak spotted by valgrind
  hw/mips/mips_int.c: Fix memory leak spotted by valgrind
  hw/mips/mips_jazz.c: Fix memory leak spotted by valgrind
  hw/lm32/lm32_boards.c: Fix memory leak spotted by valgrind
  hw/lm32/milkymist.c: Fix memory leak spotted by valgrind
  hw/m68k/mcf5206.c: Fix memory leak spotted by valgrind
  hw/openrisc/pic_cpu.c: Fix memory leak spotted by valgrind
  hw/unicore32/puv3.c: Fix memory leak spotted by valgrind
  hw/sh4/r2d.c: Fix memory leak spotted by valgrind
  hw/alpha/typhoon.c: Fix memory leak spotted by valgrind
  hw/arm/nseries.c: Fix memory leak spotted by valgrind
  hw/arm/omap_sx1.c: Fix memory leak spotted by valgrind
  hw/arm/palm.c: Fix memory leak spotted by valgrind
  hw/arm/spitz.c: Fix memory leak spotted by valgrind
  hw/arm/tosa.c: Fix memory leak spotted by valgrind
  hw/display/tc6393xb.c: Fix memory leak spotted by valgrind
  hw/s390x/sclpcpu.c: Fix memory leak spotted by valgrind

 hw/alpha/typhoon.c       |  4 ++--
 hw/arm/nseries.c         |  4 ++--
 hw/arm/omap_sx1.c        |  2 +-
 hw/arm/palm.c            |  1 +
 hw/arm/spitz.c           |  6 +++++-
 hw/arm/tosa.c            |  1 +
 hw/display/tc6393xb.c    |  2 +-
 hw/dma/rc4030.c          |  2 +-
 hw/i386/pc.c             |  4 ++--
 hw/i386/pc_piix.c        |  4 +---
 hw/i386/pc_q35.c         |  5 ++---
 hw/ide/ahci.c            |  1 +
 hw/ide/cmd646.c          |  1 +
 hw/intc/exynos4210_gic.c |  7 +++----
 hw/isa/i82378.c          |  6 +++---
 hw/isa/lpc_ich9.c        |  5 +----
 hw/lm32/lm32_boards.c    | 12 ++++++------
 hw/lm32/milkymist.c      |  6 +++---
 hw/m68k/mcf5206.c        | 10 ++++++++--
 hw/mips/mips_int.c       |  1 +
 hw/mips/mips_jazz.c      | 15 ++++++++++++++-
 hw/openrisc/pic_cpu.c    |  1 +
 hw/ppc/mac_oldworld.c    |  1 +
 hw/ppc/ppc440_bamboo.c   | 15 +++++++++++++++
 hw/ppc/prep.c            |  6 +++---
 hw/s390x/sclpcpu.c       |  9 ++++++---
 hw/sh4/r2d.c             | 10 ++++++++++
 hw/sparc/leon3.c         |  9 ++++++++-
 hw/sparc/sun4m.c         | 10 ++++++----
 hw/timer/arm_timer.c     |  1 +
 hw/unicore32/puv3.c      |  8 ++++----
 include/hw/i386/pc.h     |  2 +-
 include/hw/m68k/mcf.h    |  3 +--
 33 files changed, 117 insertions(+), 57 deletions(-)

-- 
2.0.4



