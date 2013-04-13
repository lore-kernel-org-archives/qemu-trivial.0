Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UR7Kt-0004Cy-JW
	for mharc-qemu-trivial@gnu.org; Sat, 13 Apr 2013 16:46:11 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1UR7Ko-000443-Hp
	for qemu-trivial@nongnu.org; Sat, 13 Apr 2013 16:46:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1UR7Kl-0002rM-W8
	for qemu-trivial@nongnu.org; Sat, 13 Apr 2013 16:46:06 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:44219)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1UR7Kf-0002jy-79; Sat, 13 Apr 2013 16:45:58 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	91B757280042; Sat, 13 Apr 2013 22:45:53 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id ZX-7cq4p_1vD; Sat, 13 Apr 2013 22:45:51 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id BE307728004A; Sat, 13 Apr 2013 22:45:51 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sat, 13 Apr 2013 22:45:50 +0200
Message-Id: <1365885950-27598-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] w64: Fix compiler warnings (wrong format
	specifier)
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
X-List-Received-Date: Sat, 13 Apr 2013 20:46:10 -0000

GetLastError() returns a DWORD value which is unsigned long,
so the correct format specifier is %lu.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

Debian's w32 cross compiler does not complain about the wrong
specifiers, but the w64 cross compiler does.

I'm sorry that I did not notice this before sending the pull
request.


 cpus.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/cpus.c b/cpus.c
index 97e9ab4..3f754c6 100644
--- a/cpus.c
+++ b/cpus.c
@@ -865,7 +865,7 @@ static void qemu_cpu_kick_thread(CPUState *cpu)
         CONTEXT tcgContext;
 
         if (SuspendThread(cpu->hThread) == (DWORD)-1) {
-            fprintf(stderr, "qemu:%s: GetLastError:%d\n", __func__,
+            fprintf(stderr, "qemu:%s: GetLastError:%lu\n", __func__,
                     GetLastError());
             exit(1);
         }
@@ -881,7 +881,7 @@ static void qemu_cpu_kick_thread(CPUState *cpu)
         cpu_signal(0);
 
         if (ResumeThread(cpu->hThread) == (DWORD)-1) {
-            fprintf(stderr, "qemu:%s: GetLastError:%d\n", __func__,
+            fprintf(stderr, "qemu:%s: GetLastError:%lu\n", __func__,
                     GetLastError());
             exit(1);
         }
-- 
1.7.10.4


