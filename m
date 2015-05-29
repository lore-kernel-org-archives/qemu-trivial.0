Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YyCqE-0006Sk-0c
	for mharc-qemu-trivial@gnu.org; Fri, 29 May 2015 01:28:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39626)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YyCqA-0006MN-On
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 01:28:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YyCq9-0005Ep-Ok
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 01:28:18 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:21636)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YyCq3-0005CP-J9; Fri, 29 May 2015 01:28:12 -0400
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BGS73939; Fri, 29 May 2015 13:28:01 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	SZXEML429-HUB.china.huawei.com (10.82.67.184) with Microsoft SMTP
	Server id 14.3.158.1; Fri, 29 May 2015 13:27:50 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 29 May 2015 13:26:58 +0800
Message-ID: <1432877231-5136-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.5567F8E2.0074, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: e4fa88d5b42bb4f931ffbce4611b2fd6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mjt@tls.msk.ru,
	shannon.zhao@linaro.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH v2 00/13] use qemu_allocate_irq not _irqs for
	single irq
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
X-List-Received-Date: Fri, 29 May 2015 05:28:19 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

These are relevant to misusing qemu_allocate_irqs for requesting single
irq and they cause memory leak. So these patches use qemu_allocate_irq
for single irq to fix these memory leaks.

PS: These patches are split from my previous patchset [1] since they are
relevant to misusing qemu_allocate_irqs for single irq. And for the
reset patches of [1] will respin later.

Thanks,
Shannon

[1] [PATCH 00/29] Fix memory leak relevant to calling qemu_allocate_irqs

changes since v1：
  * split those relevant to misusing qemu_allocate_irqs for single irq

Shannon Zhao (13):
  hw/i386/pc: Fix misusing qemu_allocate_irqs for single irq
  hw/isa/lpc_ich9.c: Fix misusing qemu_allocate_irqs for single irq
  hw/isa/i82378.c: Fix misusing qemu_allocate_irqs for single irq
  hw/timer/arm_timer.c: Fix misusing qemu_allocate_irqs for single irq
  hw/intc/exynos4210_gic.c: Fix memory leak by adjusting order
  hw/sparc/sun4m.c: Fix misusing qemu_allocate_irqs for single irq
  hw/ppc/prep.c: Fix misusing qemu_allocate_irqs for single irq
  hw/lm32/lm32_boards.c: Fix misusing qemu_allocate_irqs for single irq
  hw/lm32/milkymist.c: Fix misusing qemu_allocate_irqs for single irq
  hw/unicore32/puv3.c: Fix misusing qemu_allocate_irqs for single irq
  hw/alpha/typhoon.c: Fix misusing qemu_allocate_irqs for single irq
  hw/arm/nseries.c: Fix misusing qemu_allocate_irqs for single irq
  hw/display/tc6393xb.c: Fix misusing qemu_allocate_irqs for single irq

 hw/alpha/typhoon.c       |  8 ++++----
 hw/arm/nseries.c         |  5 ++---
 hw/display/tc6393xb.c    |  2 +-
 hw/i386/pc.c             |  4 ++--
 hw/i386/pc_piix.c        |  4 +---
 hw/i386/pc_q35.c         |  4 +---
 hw/intc/exynos4210_gic.c |  7 +++----
 hw/isa/i82378.c          |  7 ++-----
 hw/isa/lpc_ich9.c        |  5 +----
 hw/lm32/lm32_boards.c    | 10 ++++------
 hw/lm32/milkymist.c      |  5 ++---
 hw/ppc/prep.c            |  5 ++---
 hw/sparc/sun4m.c         |  6 ++----
 hw/timer/arm_timer.c     |  6 ++----
 hw/unicore32/puv3.c      |  8 ++++----
 include/hw/i386/pc.h     |  2 +-
 16 files changed, 34 insertions(+), 54 deletions(-)

-- 
2.0.4



