Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yx406-0001LY-Jb
	for mharc-qemu-trivial@gnu.org; Mon, 25 May 2015 21:49:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yx404-0001LE-MV
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 21:49:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yx400-00033t-DZ
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 21:49:48 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:24349)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yx3zz-00033P-RK; Mon, 25 May 2015 21:49:44 -0400
Received: from 172.24.2.119 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BGN88729; Tue, 26 May 2015 09:46:28 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml427-hub.china.huawei.com (10.82.67.182) with Microsoft SMTP
	Server id 14.3.158.1; Tue, 26 May 2015 09:46:16 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 26 May 2015 09:46:04 +0800
Message-ID: <1432604767-5964-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.5563D074.009F, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: f619119595e3087e9c7a22ccf1175dd4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH v2 0/3] Fix memory leak spotted by valgrind
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
X-List-Received-Date: Tue, 26 May 2015 01:49:49 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

These patches fix memmory leak spotted by valgrind.

changes since v1:
  * use qemu_allocate_irq instead of qemu_allocate_irqs for allocating
    one irq (Paolo)
  * Add review-by from Igor for PATCH 3/3

Shannon Zhao (3):
  hw/i386/pc_piix: Fix memory leak
  hw/ide/pci: Fix memory leak
  hw/i386/acpi-build: decref after use

 hw/i386/acpi-build.c | 1 +
 hw/i386/pc_piix.c    | 7 ++++---
 hw/ide/pci.c         | 5 +----
 3 files changed, 6 insertions(+), 7 deletions(-)

-- 
2.0.4



