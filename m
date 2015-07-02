Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZAb8m-00012c-4r
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jul 2015 05:50:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZAb8i-00010P-I5
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 05:50:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1ZAb8g-0000CX-Iv
	for qemu-trivial@nongnu.org; Thu, 02 Jul 2015 05:50:40 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:57726)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1ZAb8g-0007rT-1F; Thu, 02 Jul 2015 05:50:38 -0400
Received: from 172.24.2.119 (EHLO szxeml428-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CNZ28099; Thu, 02 Jul 2015 17:49:53 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml428-hub.china.huawei.com (10.82.67.183) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 2 Jul 2015 17:49:45 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 2 Jul 2015 17:49:13 +0800
Message-ID: <1435830563-3072-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH 00/10] fix memory leak
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
X-List-Received-Date: Thu, 02 Jul 2015 09:50:42 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

This patch series are going to fix the memory leak caused by
qemu_allocate_irqs. Patch 1-5 convert the device to QOM and store
the irqs in DeviceState. Patch 6-10 use qemu_allocate_irq instead of
qemu_allocate_irqs.

Shannon Zhao (10):
  hw/ppc/ppc4xx_devs.c: Convert ppcuic to QOM
  include/hw/sparc/grlib.h: Store irqs in DeviceState
  hw/m68k/mcf5206.c: convert m5206_mbar to QOM
  hw/m68k/mcf_intc.c: convert mcf_intc to QOM
  hw/sh4/r2d.c: convert r2d_fpga to QOM
  hw/arm/palm.c: Fix misusing qemu_allocate_irqs
  hw/arm/spitz.c: Fix misusing qemu_allocate_irqs
  hw/arm/tosa.c: Fix misusing qemu_allocate_irqs
  hw/mips/mips_int.c: use qemu_allocate_irq to fix memory leak
  hw/openrisc/pic_cpu.c: use qemu_allocate_irq to fix memory leak

 hw/arm/palm.c            | 24 +++++++++------
 hw/arm/spitz.c           | 23 ++++++++------
 hw/arm/tosa.c            | 13 +++++---
 hw/m68k/an5206.c         |  2 +-
 hw/m68k/mcf5206.c        | 75 ++++++++++++++++++++++++++++++++++++---------
 hw/m68k/mcf5208.c        | 22 +++++++------
 hw/m68k/mcf_intc.c       | 69 +++++++++++++++++++++++++++++++++++------
 hw/mips/mips_int.c       |  5 ++-
 hw/net/mcf_fec.c         | 14 ++++++---
 hw/openrisc/pic_cpu.c    |  4 +--
 hw/ppc/ppc405.h          |  6 ++--
 hw/ppc/ppc405_boards.c   |  6 ++--
 hw/ppc/ppc405_uc.c       | 68 ++++++++++++++++++++--------------------
 hw/ppc/ppc440_bamboo.c   | 19 +++++++-----
 hw/ppc/ppc4xx_devs.c     | 55 ++++++++++++++++++++++++++++-----
 hw/sh4/r2d.c             | 80 ++++++++++++++++++++++++++++++++++++++----------
 hw/sparc/leon3.c         | 10 +++---
 include/hw/m68k/mcf.h    | 11 +++----
 include/hw/ppc/ppc4xx.h  |  4 +--
 include/hw/sparc/grlib.h | 12 +++-----
 20 files changed, 358 insertions(+), 164 deletions(-)

-- 
2.0.4



