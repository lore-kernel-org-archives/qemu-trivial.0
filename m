Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z53b6-0000ws-4D
	for mharc-qemu-trivial@gnu.org; Tue, 16 Jun 2015 23:01:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Z53b0-0000t7-80
	for qemu-trivial@nongnu.org; Tue, 16 Jun 2015 23:00:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Z53au-0005qw-Od
	for qemu-trivial@nongnu.org; Tue, 16 Jun 2015 23:00:57 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:52273)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Z53at-0005Pu-PC; Tue, 16 Jun 2015 23:00:52 -0400
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BHU84639; Wed, 17 Jun 2015 11:00:29 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml434-hub.china.huawei.com (10.82.67.225) with Microsoft SMTP
	Server id 14.3.158.1; Wed, 17 Jun 2015 11:00:18 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 17 Jun 2015 10:59:54 +0800
Message-ID: <1434510002-6976-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.5580E2CE.002C, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: e3f2c8bebb84eb666a33d94a331dad4e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH v3 0/8] Add a member in MachineState to store
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
X-List-Received-Date: Wed, 17 Jun 2015 03:01:00 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

These are relevant to memory leak in machine init function. Here we add
a member in MachineState to store irq array returned from
qemu_allocate_irqs.

PS. These patches are split from my previous patchset [1] since they are
relevant to MachineState.

Thanks,
Shannon

[1] [PATCH 00/29] Fix memory leak relevant to calling qemu_allocate_irqs

changes since v2：
  * Rebased on QEMU upstream
  * Add a member in MachineState first, then fix the memory leak [mjt]

changes since v1：
  * Add a member in MachineState to store irq array [Peter]

Shannon Zhao (8):
  include/hw/boards.h: Add a member in MachineState to store irq array
  hw/ppc/ppc440_bamboo.c: Store irq array in MachineState to fix memory
    leak
  hw/sparc/leon3.c: Store irq array in MachineState to fix memory leak
  hw/m68k/an5206.c: Store irq array in MachineState to fix memory leak
  hw/sh4/r2d.c: Store irq array in MachineState to fix memory leak
  hw/arm/palm.c: Store irq array in MachineState to fix memory leak
  hw/arm/spitz.c: Store irq array in MachineState to fix memory leak
  hw/arm/tosa.c: Store irq array in MachineState to fix memory leak

 hw/arm/palm.c          |  6 ++++--
 hw/arm/spitz.c         |  8 +++++---
 hw/arm/tosa.c          | 10 +++++-----
 hw/m68k/an5206.c       |  2 +-
 hw/ppc/ppc440_bamboo.c |  1 +
 hw/sh4/r2d.c           |  1 +
 hw/sparc/leon3.c       |  1 +
 include/hw/boards.h    |  1 +
 8 files changed, 19 insertions(+), 11 deletions(-)

-- 
2.0.4



