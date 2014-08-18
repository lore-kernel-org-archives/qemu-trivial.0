Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJHqA-0007dZ-4v
	for mharc-qemu-trivial@gnu.org; Mon, 18 Aug 2014 03:58:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48713)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJHq4-0007WO-Be
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 03:58:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJHpz-0001dv-Dv
	for qemu-trivial@nongnu.org; Mon, 18 Aug 2014 03:58:48 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:41577)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XJHpo-0001bW-Sy; Mon, 18 Aug 2014 03:58:33 -0400
Received: from 172.24.2.119 (EHLO szxeml448-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id ATF24829; Mon, 18 Aug 2014 15:58:18 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml448-hub.china.huawei.com
	(10.82.67.191) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 18 Aug 2014 15:58:08 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 18 Aug 2014 15:58:08 +0800
Message-ID: <1408348688-10260-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.53F1B223.007F,ss=1,re=0.000,fgs=0,
	ip=0.0.0.0, so=2013-05-26 15:14:31,
	dmn=2011-05-27 18:58:46
X-Mirapoint-Loop-Id: f4bfe5758613969beb6d16857361a500
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, luonengjun@huawei.com,
	peter.huangpeng@huawei.com, Li Liu <john.liuli@huawei.com>, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH v7] tcg: dump op count into qemu log
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
X-List-Received-Date: Mon, 18 Aug 2014 07:58:53 -0000

fopen() may fail and it does not check its return vaule here,
it is better to dump op count to the normal log file.

Signed-off-by: Li Liu <john.liuli@huawei.com>
Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 tcg/tcg.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index c068990..7a84b87 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2404,12 +2404,10 @@ static int64_t tcg_table_op_count[NB_OPS];
 static void dump_op_count(void)
 {
     int i;
-    FILE *f;
-    f = fopen("/tmp/op.log", "w");
+
     for(i = INDEX_op_end; i < NB_OPS; i++) {
-        fprintf(f, "%s %" PRId64 "\n", tcg_op_defs[i].name, tcg_table_op_count[i]);
+        qemu_log("%s %" PRId64 "\n", tcg_op_defs[i].name, tcg_table_op_count[i]);
     }
-    fclose(f);
 }
 #endif
 
-- 
1.7.12.4



