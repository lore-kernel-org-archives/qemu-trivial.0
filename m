Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T8dRx-0003p8-QU
	for mharc-qemu-trivial@gnu.org; Mon, 03 Sep 2012 16:40:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T8dRv-0003hA-1S
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 16:40:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1T8dRu-00054K-3B
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 16:40:46 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:43852)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1T8dRq-00053X-FP; Mon, 03 Sep 2012 16:40:42 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	B747B7280029; Mon,  3 Sep 2012 22:40:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 1jq5yCMYVgU7; Mon,  3 Sep 2012 22:40:41 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 5C976728002B; Mon,  3 Sep 2012 22:40:41 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Mon,  3 Sep 2012 22:40:40 +0200
Message-Id: <1346704840-9522-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: [Qemu-trivial] [PATCH] kvm: Fix warning from static code analysis
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
X-List-Received-Date: Mon, 03 Sep 2012 20:40:48 -0000

Report from smatch:

kvm-all.c:1373 kvm_init(135) warn:
 variable dereferenced before check 's' (see line 1360)

's' cannot by NULL (it was alloced using g_malloc0), so there is no need
to check it here.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 kvm-all.c |   12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/kvm-all.c b/kvm-all.c
index 34b02c1..20b980d 100644
--- a/kvm-all.c
+++ b/kvm-all.c
@@ -1370,13 +1370,11 @@ int kvm_init(void)
     return 0;
 
 err:
-    if (s) {
-        if (s->vmfd >= 0) {
-            close(s->vmfd);
-        }
-        if (s->fd != -1) {
-            close(s->fd);
-        }
+    if (s->vmfd >= 0) {
+        close(s->vmfd);
+    }
+    if (s->fd != -1) {
+        close(s->fd);
     }
     g_free(s);
 
-- 
1.7.10


