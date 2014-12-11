Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz8tg-0006nm-Ln
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 13:55:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8tb-0006gx-3J
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:55:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8tW-00020d-KT
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:55:27 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44388)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xz8tM-0001yB-Rw; Thu, 11 Dec 2014 13:55:13 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 20E9641D5A;
	Thu, 11 Dec 2014 21:55:11 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E8AE78D0;
	Thu, 11 Dec 2014 21:16:17 +0300 (MSK)
Received: (nullmailer pid 22989 invoked by uid 1000);
	Thu, 11 Dec 2014 18:16:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Dec 2014 21:16:05 +0300
Message-Id: <b196d969efa3987148994f0f8da79a10ebda7641.1418321644.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
References: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PULL 17/20] vt82c686: fix coverity warning about
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
X-List-Received-Date: Thu, 11 Dec 2014 18:55:31 -0000

From: zhanghailiang <zhang.zhanghailiang@huawei.com>

Refactor superio_ioport_writeb to fix the out of bounds write warning.

In addition, fix two typos: s/chage/change/

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/isa/vt82c686.c | 41 +++++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index e0c235c..223b947 100644
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
+        bool can_write = true;
         /* 0x3f1 */
         switch (superio_conf->index) {
         case 0x00 ... 0xdf:
@@ -68,30 +68,27 @@ static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
         case 0xf7:
         case 0xf9 ... 0xfb:
         case 0xfd ... 0xff:
-            can_write = 0;
+            can_write = false;
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
+                DPRINTF("change uart 1 base. unsupported yet\n");
+                can_write = false;
+            }
+            break;
+        case 0xe8:
+            if ((data & 0xff) != 0xbe) {
+                DPRINTF("change uart 2 base. unsupported yet\n");
+                can_write = false;
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
2.1.3


