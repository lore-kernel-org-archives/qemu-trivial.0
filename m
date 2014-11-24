Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XskMX-0004TO-JE
	for mharc-qemu-trivial@gnu.org; Sun, 23 Nov 2014 22:30:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XskMQ-0004SB-Tk
	for qemu-trivial@nongnu.org; Sun, 23 Nov 2014 22:30:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XskMM-0006TA-3P
	for qemu-trivial@nongnu.org; Sun, 23 Nov 2014 22:30:46 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:56409)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XskML-0006Sv-GW; Sun, 23 Nov 2014 22:30:42 -0500
Received: from 172.24.2.119 (EHLO szxeml402-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CCU97032; Mon, 24 Nov 2014 11:30:36 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml402-hub.china.huawei.com
	(10.82.67.32) with Microsoft SMTP Server id 14.3.158.1; Mon, 24 Nov 2014
	11:30:28 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Mon, 24 Nov 2014 11:30:33 +0800
Message-ID: <1416799833-9972-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: pbonzini@redhat.com, zhanghailiang <zhang.zhanghailiang@huawei.com>,
	arei.gonglei@huawei.com, qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH] hw/arm/boot: fix uninitialized scalar
	variable warning reported by coverity
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
X-List-Received-Date: Mon, 24 Nov 2014 03:30:51 -0000

Coverity reports the 'size' may be used uninitialized, but that can't happen,
because the caller has checked "if (binfo->dtb_filename || binfo->get_dtb)"
before call 'load_dtb'.

Here we simply remove the 'if (binfo->get_dtb)' to satisfy coverity.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 hw/arm/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 0014c34..4f515b5 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -352,7 +352,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
             goto fail;
         }
         g_free(filename);
-    } else if (binfo->get_dtb) {
+    } else {
         fdt = binfo->get_dtb(binfo, &size);
         if (!fdt) {
             fprintf(stderr, "Board was unable to create a dtb blob\n");
-- 
1.7.12.4



