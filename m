Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHv32-00026H-Cg
	for mharc-qemu-trivial@gnu.org; Thu, 14 Aug 2014 09:26:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43354)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XHpWP-0005TC-6U
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 03:32:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XHpWK-0006QR-IT
	for qemu-trivial@nongnu.org; Thu, 14 Aug 2014 03:32:29 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:5409)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XHpWJ-0006Op-NR; Thu, 14 Aug 2014 03:32:24 -0400
Received: from 172.24.2.119 (EHLO szxeml419-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BYE11833; Thu, 14 Aug 2014 15:30:57 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml419-hub.china.huawei.com
	(10.82.67.158) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 14 Aug 2014 15:30:02 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 14 Aug 2014 15:29:20 +0800
Message-ID: <1408001361-13580-10-git-send-email-zhang.zhanghailiang@huawei.com>
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
Subject: [Qemu-trivial] [PATCH v6 09/10] tcg: check return value of fopen()
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
X-List-Received-Date: Thu, 14 Aug 2014 07:32:33 -0000

From: Li Liu <john.liuli@huawei.com>

Give a warning message if fopen() failed to open the log file.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Li Liu <john.liuli@huawei.com>
---
 tcg/tcg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index c068990..8f50d2a 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2406,6 +2406,10 @@ static void dump_op_count(void)
     int i;
     FILE *f;
     f = fopen("/tmp/op.log", "w");
+    if (f == NULL) {
+        fprintf(stderr, "Failed to open /tmp/op.log\n");
+        return;
+    }
     for(i = INDEX_op_end; i < NB_OPS; i++) {
         fprintf(f, "%s %" PRId64 "\n", tcg_op_defs[i].name, tcg_table_op_count[i]);
     }
-- 
1.7.12.4



