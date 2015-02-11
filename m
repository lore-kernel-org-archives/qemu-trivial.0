Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLOfe-0003qA-7P
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 23:13:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YLOfS-0003Zt-56
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 23:12:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YLOfM-0004Ea-FF
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 23:12:50 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:30222)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YLOfL-0004Dt-TC; Tue, 10 Feb 2015 23:12:44 -0500
Received: from 172.24.2.119 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BBU12380; Wed, 11 Feb 2015 12:12:42 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml432-hub.china.huawei.com
	(10.82.67.209) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 11 Feb 2015 12:12:30 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 11 Feb 2015 12:12:04 +0800
Message-ID: <1423627934-11676-2-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1423627934-11676-1-git-send-email-arei.gonglei@huawei.com>
References: <1423627934-11676-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.54DAD6BA.0092, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 09a9b79fef870e0ed1c02c7b6ced6242
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH 01/11] block: remove superfluous '\n' around
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
X-List-Received-Date: Wed, 11 Feb 2015 04:12:51 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 block/archipelago.c | 6 +++---
 hw/block/nand.c     | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

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
-- 
1.7.12.4



