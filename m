Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHv33-00027d-8t
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 09:26:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XHpWq-0006BV-02
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 03:33:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XHpWl-0006UJ-3v
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 03:32:55 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:5680)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XHpWg-0006TV-Vo; Thu, 14 Aug 2014 03:32:50 -0400
Received: from 172.24.2.119 (EHLO szxeml419-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BYE11826; Thu, 14 Aug 2014 15:30:57 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml419-hub.china.huawei.com
	(10.82.67.158) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 14 Aug 2014 15:30:00 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 14 Aug 2014 15:29:19 +0800
Message-ID: <1408001361-13580-9-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
In-Reply-To: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
X-Mailman-Approved-At: Thu, 14 Aug 2014 09:26:29 -0400
Cc: kwolf@redhat.com, lkurusa@redhat.com,
	zhanghailiang <zhang.zhanghailiang@huawei.com>, mst@redhat.com,
	qemu-trivial@nongnu.org, jan.kiszka@siemens.com,
	riku.voipio@iki.fi, mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	lcapitulino@redhat.com, stefanha@redhat.com,
	Li Liu <john.liuli@huawei.com>, luonengjun@huawei.com,
	pbonzini@redhat.com, alex.bennee@linaro.org, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH v6 08/10] tests/bios-tables-test: check the
	value returned by fopen()
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
X-List-Received-Date: Thu, 14 Aug 2014 07:33:01 -0000

The function fopen() may fail, so check its return value.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Li Liu <john.liuli@huawei.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/bios-tables-test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index 045eb27..28ec28d 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -790,6 +790,11 @@ int main(int argc, char *argv[])
     const char *arch = qtest_get_arch();
     FILE *f = fopen(disk, "w");
     int ret;
+
+    if (f == NULL) {
+        fprintf(stderr, "Couldn't open \"%s\": %s", disk, strerror(errno));
+        return -1;
+    }
     fwrite(boot_sector, 1, sizeof boot_sector, f);
     fclose(f);
 
-- 
1.7.12.4



