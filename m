Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XsrLR-0005ls-2D
	for mharc-qemu-trivial@gnu.org; Mon, 24 Nov 2014 05:58:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41770)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XsrLL-0005lN-4S
	for qemu-trivial@nongnu.org; Mon, 24 Nov 2014 05:58:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XsrLG-0005QX-Ag
	for qemu-trivial@nongnu.org; Mon, 24 Nov 2014 05:58:07 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:51384)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XsrLF-0005Ov-L4; Mon, 24 Nov 2014 05:58:02 -0500
Received: from 172.24.2.119 (EHLO szxeml423-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CCV59186; Mon, 24 Nov 2014 18:57:52 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml423-hub.china.huawei.com
	(10.82.67.162) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 24 Nov 2014 18:50:45 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Mon, 24 Nov 2014 18:50:40 +0800
Message-ID: <1416826240-12368-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, qemu-devel@nongnu.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH v2] hw/arm/boot: fix uninitialized scalar
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
X-List-Received-Date: Mon, 24 Nov 2014 10:58:12 -0000

Coverity reports the 'size' may be used uninitialized, but that can't happen,
because the caller has checked "if (binfo->dtb_filename || binfo->get_dtb)"
before call 'load_dtb'.

Here we simply remove the 'if (binfo->get_dtb)' to satisfy coverity.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
v2:
- add a note to the doc comment for load_dtb (Peter Maydell)
  Thanks for comment.
---
 hw/arm/boot.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 0014c34..e6a3c5b 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -329,6 +329,8 @@ static void set_kernel_args_old(const struct arm_boot_info *info)
  * Returns: the size of the device tree image on success,
  *          0 if the image size exceeds the limit,
  *          -1 on errors.
+ *
+ * Note: Must not be called unless have_dtb(binfo) is true.
  */
 static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
                     hwaddr addr_limit)
@@ -352,7 +354,7 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
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



