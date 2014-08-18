Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJHmk-0006Fb-JF
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 03:55:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJHmf-0006Ah-BX
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 03:55:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJHmb-0000md-1l
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 03:55:17 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:36366)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XJHmQ-0000Sf-M9; Mon, 18 Aug 2014 03:55:04 -0400
Received: from 172.24.2.119 (EHLO SZXEML454-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CAL14709; Mon, 18 Aug 2014 15:54:55 +0800 (CST)
Received: from localhost (10.177.22.69) by SZXEML454-HUB.china.huawei.com
	(10.82.67.197) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 18 Aug 2014 15:54:43 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 18 Aug 2014 15:54:33 +0800
Message-ID: <1408348473-10104-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, marcel.a@redhat.com,
	qemu-trivial@nongnu.org, Li Liu <john.liuli@huawei.com>,
	mst@redhat.com, luonengjun@huawei.com, peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH v7] tests/bios-tables-test: check the value
	returned by fopen()
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
X-List-Received-Date: Mon, 18 Aug 2014 07:55:21 -0000

The function fopen() may fail, so check its return value.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Li Liu <john.liuli@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/bios-tables-test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index 045eb27..feb3b58 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -790,6 +790,11 @@ int main(int argc, char *argv[])
     const char *arch = qtest_get_arch();
     FILE *f = fopen(disk, "w");
     int ret;
+
+    if (!f) {
+        fprintf(stderr, "Couldn't open \"%s\": %s", disk, strerror(errno));
+        return -1;
+    }
     fwrite(boot_sector, 1, sizeof boot_sector, f);
     fclose(f);
 
-- 
1.7.12.4



