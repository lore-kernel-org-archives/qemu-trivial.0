Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UWr67-00076T-GZ
	for mharc-qemu-trivial@gnu.org; Mon, 29 Apr 2013 12:38:39 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jlarrew@jlarrew.austin.ibm.com>) id 1UWr65-00073j-3y
	for qemu-trivial@nongnu.org; Mon, 29 Apr 2013 12:38:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jlarrew@jlarrew.austin.ibm.com>) id 1UWr60-0005AU-JR
	for qemu-trivial@nongnu.org; Mon, 29 Apr 2013 12:38:37 -0400
Received: from [32.97.110.55] (port=40050 helo=jlarrew.austin.ibm.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jlarrew@jlarrew.austin.ibm.com>)
	id 1UWr5w-00059J-QX; Mon, 29 Apr 2013 12:38:29 -0400
Received: from jlarrew.austin.ibm.com (localhost [127.0.0.1])
	by jlarrew.austin.ibm.com (8.14.5/8.14.5) with ESMTP id r3TFqvJ2017973; 
	Mon, 29 Apr 2013 10:52:57 -0500
Received: (from jlarrew@localhost)
	by jlarrew.austin.ibm.com (8.14.5/8.14.5/Submit) id r3TFquJT017972;
	Mon, 29 Apr 2013 10:52:56 -0500
From: Jesse Larrew <jlarrew@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Apr 2013 10:52:52 -0500
Message-Id: <1367250772-17928-1-git-send-email-jlarrew@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.11.7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 32.97.110.55
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com,
	Jesse Larrew <jlarrew@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH] libqtest: only call fclose() on open files
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
X-List-Received-Date: Mon, 29 Apr 2013 16:38:38 -0000

libqtest.c can segfault when calling fclose() if the pidfile wasn't
opened successfully. This patch fixes the issue.

Signed-off-by: Jesse Larrew <jlarrew@linux.vnet.ibm.com>
---
 tests/libqtest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/libqtest.c b/tests/libqtest.c
index 884f959..879ffe9 100644
--- a/tests/libqtest.c
+++ b/tests/libqtest.c
@@ -99,8 +99,8 @@ static pid_t qtest_qemu_pid(QTestState *s)
         if (fgets(buffer, sizeof(buffer), f)) {
             pid = atoi(buffer);
         }
+        fclose(f);
     }
-    fclose(f);
     return pid;
 }
 
-- 
1.7.11.7


