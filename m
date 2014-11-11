Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xo7uM-0007oO-P6
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 04:38:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52235)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xo7uG-0007nl-Lq
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 04:38:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xo7uB-0006IS-S6
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 04:38:36 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:20872)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xo7uB-0006I2-68; Tue, 11 Nov 2014 04:38:31 -0500
Received: from 172.24.2.119 (EHLO szxeml460-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CCE46841; Tue, 11 Nov 2014 17:38:23 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml460-hub.china.huawei.com
	(10.82.67.203) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 11 Nov 2014 17:38:12 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 11 Nov 2014 17:37:59 +0800
Message-ID: <1415698679-4264-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>
Subject: [Qemu-trivial] [PATCH] sysbus: Correct SYSTEM_BUS(obj) defines
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
X-List-Received-Date: Tue, 11 Nov 2014 09:38:41 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 include/hw/sysbus.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/sysbus.h b/include/hw/sysbus.h
index 6175bf9..d1f3f00 100644
--- a/include/hw/sysbus.h
+++ b/include/hw/sysbus.h
@@ -10,7 +10,7 @@
 #define QDEV_MAX_PIO 32
 
 #define TYPE_SYSTEM_BUS "System"
-#define SYSTEM_BUS(obj) OBJECT_CHECK(IDEBus, (obj), TYPE_IDE_BUS)
+#define SYSTEM_BUS(obj) OBJECT_CHECK(BusState, (obj), TYPE_SYSTEM_BUS)
 
 typedef struct SysBusDevice SysBusDevice;
 
-- 
1.7.12.4



