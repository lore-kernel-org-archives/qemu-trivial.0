Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XbOfQ-00040t-2a
	for mharc-qemu-trivial@gnu.org; Tue, 07 Oct 2014 02:54:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XbOfJ-0003sU-HF
	for qemu-trivial@nongnu.org; Tue, 07 Oct 2014 02:54:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XbOfE-00089D-Nr
	for qemu-trivial@nongnu.org; Tue, 07 Oct 2014 02:54:33 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:51258)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XbOf2-00086w-VI; Tue, 07 Oct 2014 02:54:17 -0400
Received: from 172.24.2.119 (EHLO szxeml409-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AVG14940; Tue, 07 Oct 2014 14:54:02 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml409-hub.china.huawei.com
	(10.82.67.136) with Microsoft SMTP Server id 14.3.158.1; Tue, 7 Oct 2014
	14:53:51 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 7 Oct 2014 14:53:48 +0800
Message-ID: <1412664828-6852-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020201.54338E0A.002F, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: fd8b5e21b028e7070886ea42347d9514
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, luonengjun@huawei.com,
	Gonglei <arei.gonglei@huawei.com>, weidong.huang@huawei.com, mst@redhat.com
Subject: [Qemu-trivial] [PATCH] pcie: change confused comment clearer
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
X-List-Received-Date: Tue, 07 Oct 2014 06:54:38 -0000

From: Gonglei <arei.gonglei@huawei.com>

This comment applies to all functions below it.
It is not appropriate that called capability allocation
functions, change it into capability list management functions.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/pci/pcie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 1babddf..d17bd27 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -529,7 +529,7 @@ bool pcie_cap_is_arifwd_enabled(const PCIDevice *dev)
 }
 
 /**************************************************************************
- * pci express extended capability allocation functions
+ * pci express extended capability list management functions
  * uint16_t ext_cap_id (16 bit)
  * uint8_t cap_ver (4 bit)
  * uint16_t cap_offset (12 bit)
-- 
1.7.12.4



