Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLXtL-0004Ig-7w
	for mharc-qemu-trivial@gnu.org; Sun, 24 Aug 2014 09:31:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXtE-00045S-56
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:31:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXt9-0004HZ-QE
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:31:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54314)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XLXsw-0004FN-8Z; Sun, 24 Aug 2014 09:31:06 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8A3BD44A04;
	Sun, 24 Aug 2014 17:31:04 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 39B716E3;
	Sun, 24 Aug 2014 17:31:04 +0400 (MSK)
Received: (nullmailer pid 30075 invoked by uid 1000);
	Sun, 24 Aug 2014 13:31:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun, 24 Aug 2014 17:30:53 +0400
Message-Id: <1408887062-30022-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Li Liu <john.liuli@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PULL 02/11] tcg: dump op count into qemu log
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
X-List-Received-Date: Sun, 24 Aug 2014 13:31:28 -0000

From: zhanghailiang <zhang.zhanghailiang@huawei.com>

fopen() may fail and it does not check its return vaule here,
it is better to dump op count to the normal log file.

Signed-off-by: Li Liu <john.liuli@huawei.com>
Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tcg/tcg.c |    6 ++----
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
1.7.10.4


