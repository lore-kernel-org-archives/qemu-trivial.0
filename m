Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XyDbd-00010O-VY
	for mharc-qemu-trivial@gnu.org; Tue, 09 Dec 2014 00:45:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XyDbX-0000xt-0r
	for qemu-trivial@nongnu.org; Tue, 09 Dec 2014 00:45:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XyDbS-0007gU-7A
	for qemu-trivial@nongnu.org; Tue, 09 Dec 2014 00:44:58 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:55230)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XyDbR-0007g7-IC; Tue, 09 Dec 2014 00:44:54 -0500
Received: from 172.24.2.119 (EHLO szxeml403-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDS70615; Tue, 09 Dec 2014 13:44:43 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml403-hub.china.huawei.com
	(10.82.67.35) with Microsoft SMTP Server id 14.3.158.1; Tue, 9 Dec 2014
	13:44:32 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Tue, 9 Dec 2014 13:44:27 +0800
Message-ID: <1418103867-11516-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-devel@nongnu.org, zhanghailiang <zhang.zhanghailiang@huawei.com>,
	peter.huangpeng@huawei.com, afaerber@suse.de, armbru@redhat.com
Subject: [Qemu-trivial] [PATCH] vt82c686: fix coverity warning about
	out-of-bounds write
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
X-List-Received-Date: Tue, 09 Dec 2014 05:45:04 -0000

Refactor superio_ioport_writeb to fix the out of bounds write warning.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 hw/isa/vt82c686.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index e0c235c..4516af0 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -50,13 +50,13 @@ typedef struct VT82C686BState {
 static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
                                   unsigned size)
 {
-    int can_write;
     SuperIOConfig *superio_conf = opaque;
 
     DPRINTF("superio_ioport_writeb  address 0x%x  val 0x%x\n", addr, data);
     if (addr == 0x3f0) {
         superio_conf->index = data & 0xff;
     } else {
+        int can_write = 1;
         /* 0x3f1 */
         switch (superio_conf->index) {
         case 0x00 ... 0xdf:
@@ -70,28 +70,25 @@ static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
         case 0xfd ... 0xff:
             can_write = 0;
             break;
-        default:
-            can_write = 1;
-
-            if (can_write) {
-                switch (superio_conf->index) {
-                case 0xe7:
-                    if ((data & 0xff) != 0xfe) {
-                        DPRINTF("chage uart 1 base. unsupported yet\n");
-                    }
-                    break;
-                case 0xe8:
-                    if ((data & 0xff) != 0xbe) {
-                        DPRINTF("chage uart 2 base. unsupported yet\n");
-                    }
-                    break;
-
-                default:
-                    superio_conf->config[superio_conf->index] = data & 0xff;
-                }
+        case 0xe7:
+            if ((data & 0xff) != 0xfe) {
+                DPRINTF("chage uart 1 base. unsupported yet\n");
+                can_write = 0;
+            }
+            break;
+        case 0xe8:
+            if ((data & 0xff) != 0xbe) {
+                DPRINTF("chage uart 2 base. unsupported yet\n");
+                can_write = 0;
             }
+            break;
+        default:
+            break;
+
+        }
+        if (can_write) {
+            superio_conf->config[superio_conf->index] = data & 0xff;
         }
-        superio_conf->config[superio_conf->index] = data & 0xff;
     }
 }
 
-- 
1.7.12.4



