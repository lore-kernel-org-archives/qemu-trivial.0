Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRFhM-0002c8-Hk
	for mharc-qemu-trivial@gnu.org; Fri, 27 Feb 2015 02:51:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRFhI-0002Qh-5x
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 02:50:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRFhC-0007WF-7K
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 02:50:56 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:38301)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YRFhB-0007Va-DP; Fri, 27 Feb 2015 02:50:50 -0500
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHS92355; Fri, 27 Feb 2015 15:50:40 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml431-hub.china.huawei.com
	(10.82.67.208) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 27 Feb 2015 15:50:28 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 27 Feb 2015 15:50:14 +0800
Message-ID: <1425023419-12244-5-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
References: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, peter.huangpeng@huawei.com,
	armbru@redhat.com
Subject: [Qemu-trivial] [PATCH 4/9] macio: fix possible memory leak
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
X-List-Received-Date: Fri, 27 Feb 2015 07:50:57 -0000

From: Gonglei <arei.gonglei@huawei.com>

If ret = macio_initfn_ide() is less than 0, the timer_memory
will leak the memory it points to.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/misc/macio/macio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/misc/macio/macio.c b/hw/misc/macio/macio.c
index e0f1e88..bf96844 100644
--- a/hw/misc/macio/macio.c
+++ b/hw/misc/macio/macio.c
@@ -273,7 +273,7 @@ static int macio_newworld_initfn(PCIDevice *d)
     MacIOState *s = MACIO(d);
     NewWorldMacIOState *ns = NEWWORLD_MACIO(d);
     SysBusDevice *sysbus_dev;
-    MemoryRegion *timer_memory = g_new(MemoryRegion, 1);
+    MemoryRegion *timer_memory = NULL;
     int i;
     int cur_irq = 0;
     int ret = macio_common_initfn(d);
@@ -301,6 +301,7 @@ static int macio_newworld_initfn(PCIDevice *d)
     }
 
     /* Timer */
+    timer_memory = g_new(MemoryRegion, 1);
     memory_region_init_io(timer_memory, OBJECT(s), &timer_ops, NULL, "timer",
                           0x1000);
     memory_region_add_subregion(&s->bar, 0x15000, timer_memory);
-- 
1.7.12.4



