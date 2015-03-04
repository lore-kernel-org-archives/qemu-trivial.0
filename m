Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTClY-0006AL-EX
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 12:07:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTClR-0005xA-M9
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:07:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTClL-0005jE-MS
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:07:17 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40360)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTClG-0005hV-6z; Wed, 04 Mar 2015 12:07:06 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9302D4089D;
	Wed,  4 Mar 2015 20:07:05 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6E83392E;
	Wed,  4 Mar 2015 20:07:05 +0300 (MSK)
Received: (nullmailer pid 17507 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:29 +0300
Message-Id: <475b7a5adf519fa2e38f8b360fe41ffce720733f.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 12/47] block: remove superfluous '\n' around
	error_report/error_setg
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
X-List-Received-Date: Wed, 04 Mar 2015 17:07:22 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/archipelago.c | 6 +++---
 hw/block/nand.c     | 2 +-
 qemu-img.c          | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/archipelago.c b/block/archipelago.c
index a8114b5..855655c 100644
--- a/block/archipelago.c
+++ b/block/archipelago.c
@@ -291,7 +291,7 @@ static int qemu_archipelago_init(BDRVArchipelagoState *s)
 
     ret = qemu_archipelago_xseg_init(s);
     if (ret < 0) {
-        error_report("Cannot initialize XSEG. Aborting...\n");
+        error_report("Cannot initialize XSEG. Aborting...");
         goto err_exit;
     }
 
@@ -645,7 +645,7 @@ static int qemu_archipelago_create_volume(Error **errp, const char *volname,
 
     target = xseg_get_target(xseg, req);
     if (!target) {
-        error_setg(errp, "Cannot get XSEG target.\n");
+        error_setg(errp, "Cannot get XSEG target.");
         goto err_exit;
     }
     memcpy(target, volname, targetlen);
@@ -889,7 +889,7 @@ static BlockAIOCB *qemu_archipelago_aio_rw(BlockDriverState *bs,
     return &aio_cb->common;
 
 err_exit:
-    error_report("qemu_archipelago_aio_rw(): I/O Error\n");
+    error_report("qemu_archipelago_aio_rw(): I/O Error");
     qemu_aio_unref(aio_cb);
     return NULL;
 }
diff --git a/hw/block/nand.c b/hw/block/nand.c
index 1882a0c..61d2cec 100644
--- a/hw/block/nand.c
+++ b/hw/block/nand.c
@@ -393,7 +393,7 @@ static void nand_realize(DeviceState *dev, Error **errp)
         nand_init_2048(s);
         break;
     default:
-        error_setg(errp, "Unsupported NAND block size %#x\n",
+        error_setg(errp, "Unsupported NAND block size %#x",
                    1 << s->page_shift);
         return;
     }
diff --git a/qemu-img.c b/qemu-img.c
index 7ac7f56..6d17755 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1645,7 +1645,7 @@ static int img_convert(int argc, char **argv)
     if (skip_create) {
         int64_t output_sectors = blk_nb_sectors(out_blk);
         if (output_sectors < 0) {
-            error_report("unable to get output image length: %s\n",
+            error_report("unable to get output image length: %s",
                          strerror(-output_sectors));
             ret = -1;
             goto out;
-- 
2.1.4


