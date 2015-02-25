Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQTVj-0006CQ-Dq
	for mharc-qemu-trivial@gnu.org; Tue, 24 Feb 2015 23:23:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQTVW-0005Zq-7V
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 23:23:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQTVV-0006X3-Au
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 23:23:34 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:40050)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YQTVH-0006PA-DP; Tue, 24 Feb 2015 23:23:20 -0500
Received: from 172.24.2.119 (EHLO SZXEML429-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHQ41227; Wed, 25 Feb 2015 12:23:14 +0800 (CST)
Received: from localhost (10.177.19.102) by SZXEML429-HUB.china.huawei.com
	(10.82.67.184) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 25 Feb 2015 12:23:06 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 25 Feb 2015 12:22:27 +0800
Message-ID: <1424838157-5524-2-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1424838157-5524-1-git-send-email-arei.gonglei@huawei.com>
References: <1424838157-5524-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH v2 01/11] block: remove superfluous '\n'
	around error_report/error_setg
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
X-List-Received-Date: Wed, 25 Feb 2015 04:23:39 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
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
index 0155e36..f0cd9ae 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1635,7 +1635,7 @@ static int img_convert(int argc, char **argv)
     if (skip_create) {
         int64_t output_sectors = blk_nb_sectors(out_blk);
         if (output_sectors < 0) {
-            error_report("unable to get output image length: %s\n",
+            error_report("unable to get output image length: %s",
                          strerror(-output_sectors));
             ret = -1;
             goto out;
-- 
1.7.12.4



