Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YngqW-0000Sp-40
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 01:17:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YngqP-0000D3-KX
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:17:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YngqO-0006EJ-OR
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:17:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59208)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YngqH-0006Bi-Qk; Thu, 30 Apr 2015 01:16:57 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1389B42B8E;
	Thu, 30 Apr 2015 08:16:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 5903A950;
	Thu, 30 Apr 2015 08:08:58 +0300 (MSK)
Received: (nullmailer pid 4306 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:20 +0300
Message-Id: <adea543c8034ef0b70479c8d92f7976af91ab35a.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Chih-Min Chao <cmchao@gmail.com>
Subject: [Qemu-trivial] [PULL 07/42] hw/display : remove 'struct' from
	'typedef QXL struct'
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
X-List-Received-Date: Thu, 30 Apr 2015 05:17:06 -0000

From: Chih-Min Chao <cmchao@gmail.com>

Signed-off-by: Chih-Min Chao <cmchao@gmail.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/qxl.c   | 2 +-
 ui/spice-display.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index b6d65b9..0cd314c 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -696,7 +696,7 @@ static inline void qxl_push_free_res(PCIQXLDevice *d, int flush)
 
 /* called from spice server thread context only */
 static void interface_release_resource(QXLInstance *sin,
-                                       struct QXLReleaseInfoExt ext)
+                                       QXLReleaseInfoExt ext)
 {
     PCIQXLDevice *qxl = container_of(sin, PCIQXLDevice, ssd.qxl);
     QXLReleaseRing *ring;
diff --git a/ui/spice-display.c b/ui/spice-display.c
index e293ec2..9c63132 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -539,7 +539,7 @@ static void interface_get_init_info(QXLInstance *sin, QXLDevInitInfo *info)
     info->n_surfaces = ssd->num_surfaces;
 }
 
-static int interface_get_command(QXLInstance *sin, struct QXLCommandExt *ext)
+static int interface_get_command(QXLInstance *sin, QXLCommandExt *ext)
 {
     SimpleSpiceDisplay *ssd = container_of(sin, SimpleSpiceDisplay, qxl);
     SimpleSpiceUpdate *update;
@@ -566,7 +566,7 @@ static int interface_req_cmd_notification(QXLInstance *sin)
 }
 
 static void interface_release_resource(QXLInstance *sin,
-                                       struct QXLReleaseInfoExt rext)
+                                       QXLReleaseInfoExt rext)
 {
     SimpleSpiceDisplay *ssd = container_of(sin, SimpleSpiceDisplay, qxl);
     SimpleSpiceUpdate *update;
@@ -589,7 +589,7 @@ static void interface_release_resource(QXLInstance *sin,
     }
 }
 
-static int interface_get_cursor_command(QXLInstance *sin, struct QXLCommandExt *ext)
+static int interface_get_cursor_command(QXLInstance *sin, QXLCommandExt *ext)
 {
     SimpleSpiceDisplay *ssd = container_of(sin, SimpleSpiceDisplay, qxl);
     int ret;
-- 
2.1.4


