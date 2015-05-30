Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yybc4-0005EQ-Dd
	for mharc-qemu-trivial@gnu.org; Sat, 30 May 2015 03:55:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52020)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yybc2-0005EA-JP
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 03:55:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yybbz-000883-B4
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 03:55:22 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:38788)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yybby-00087Z-JY; Sat, 30 May 2015 03:55:19 -0400
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COS15544; Sat, 30 May 2015 15:55:06 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml431-hub.china.huawei.com (10.82.67.208) with Microsoft SMTP
	Server id 14.3.158.1; Sat, 30 May 2015 15:54:55 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 30 May 2015 15:54:30 +0800
Message-ID: <1432972477-13504-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, mjt@tls.msk.ru,
	shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH v2 0/7] Add a member in MachineState to store
	irq array
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
X-List-Received-Date: Sat, 30 May 2015 07:55:23 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

These are relevant to memory leak in machine init function. Here we add
a member in MachineState to store irq array returned from
qemu_allocate_irqs.

PS. These patches are split from my previous patchset [1] since they are
relevant to MachineState.

Thanks,
Shannon

[1] [PATCH 00/29] Fix memory leak relevant to calling qemu_allocate_irqs

changes since v1：
  * Add a member in MachineState to store irq array [Peter]

Shannon Zhao (7):
  hw/ppc/ppc440_bamboo.c: Add a member in MachineState to store irq
    array
  hw/mips/mips_jazz.c: Store irq array in MachineState to fix memory
    leak
  hw/m68k/an5206.c: Store irq array in MachineState to fix memory leak
  hw/sh4/r2d.c: Store irq array in MachineState to fix memory leak
  hw/arm/palm.c: Store irq array in MachineState to fix memory leak
  hw/arm/spitz.c: Store irq array in MachineState to fix memory leak
  hw/arm/tosa.c: Store irq array in MachineState to fix memory leak

 hw/arm/palm.c          |  6 ++++--
 hw/arm/spitz.c         |  8 +++++---
 hw/arm/tosa.c          | 10 +++++-----
 hw/m68k/an5206.c       |  2 +-
 hw/mips/mips_jazz.c    | 28 ++++++++++++++--------------
 hw/ppc/ppc440_bamboo.c | 17 +++++++++--------
 hw/sh4/r2d.c           | 15 +++++++--------
 include/hw/boards.h    |  1 +
 8 files changed, 46 insertions(+), 41 deletions(-)

-- 
2.0.4



