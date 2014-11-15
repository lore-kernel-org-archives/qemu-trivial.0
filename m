Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XpaGY-0006fQ-SF
	for mharc-qemu-trivial@gnu.org; Sat, 15 Nov 2014 05:07:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XpaGR-0006Q2-9Y
	for qemu-trivial@nongnu.org; Sat, 15 Nov 2014 05:07:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XpaGM-0003uz-Ge
	for qemu-trivial@nongnu.org; Sat, 15 Nov 2014 05:07:31 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:47182)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XpaG4-0003iD-2e; Sat, 15 Nov 2014 05:07:11 -0500
Received: from 172.24.2.119 (EHLO szxeml403-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CCJ79969; Sat, 15 Nov 2014 18:06:59 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml403-hub.china.huawei.com
	(10.82.67.35) with Microsoft SMTP Server id 14.3.158.1; Sat, 15 Nov 2014
	18:06:53 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 15 Nov 2014 18:06:43 +0800
Message-ID: <1416046008-7880-5-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
References: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: weidong.huang@huawei.com, zhang.zhanghailiang@huawei.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com, Gonglei <arei.gonglei@huawei.com>,
	pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH 4/9] loader: fix NEGATIVE_RETURNS
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
X-List-Received-Date: Sat, 15 Nov 2014 10:07:36 -0000

From: Gonglei <arei.gonglei@huawei.com>

lseek will return -1 on error, g_malloc0(size) and read(,,size)
paramenters cannot be negative. We should add a check for return
value of lseek().

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/core/loader.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index bbe6eb3..fc15535 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -80,6 +80,13 @@ int load_image(const char *filename, uint8_t *addr)
     if (fd < 0)
         return -1;
     size = lseek(fd, 0, SEEK_END);
+    if (size == -1) {
+        fprintf(stderr, "file %-20s: get size error: %s\n",
+                filename, strerror(errno));
+        close(fd);
+        return -1;
+    }
+
     lseek(fd, 0, SEEK_SET);
     if (read(fd, addr, size) != size) {
         close(fd);
@@ -748,6 +755,12 @@ int rom_add_file(const char *file, const char *fw_dir,
     }
     rom->addr     = addr;
     rom->romsize  = lseek(fd, 0, SEEK_END);
+    if (rom->romsize == -1) {
+        fprintf(stderr, "rom: file %-20s: get size error: %s\n",
+                rom->name, strerror(errno));
+        goto err;
+    }
+
     rom->datasize = rom->romsize;
     rom->data     = g_malloc0(rom->datasize);
     lseek(fd, 0, SEEK_SET);
-- 
1.7.12.4



