Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TJWDu-0003mA-Fp
	for mharc-qemu-trivial@gnu.org; Wed, 03 Oct 2012 17:11:18 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TJWDr-0003cj-CD
	for qemu-trivial@nongnu.org; Wed, 03 Oct 2012 17:11:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TJWDq-00076k-Ce
	for qemu-trivial@nongnu.org; Wed, 03 Oct 2012 17:11:15 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:55716)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TJWDm-00075T-BL; Wed, 03 Oct 2012 17:11:10 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	B29737280032; Wed,  3 Oct 2012 23:11:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id qDT84Qw6MjTc; Wed,  3 Oct 2012 23:11:08 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 2D73F728003B; Wed,  3 Oct 2012 23:11:08 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Wed,  3 Oct 2012 23:11:02 +0200
Message-Id: <1349298662-16666-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-stable@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-trivial] [PATCH] qemu-barrier: Fix compiler version check for
	future gcc versions
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
X-List-Received-Date: Wed, 03 Oct 2012 21:11:16 -0000

The current check will give a wrong result for gcc-5.x with x < 4.
Using QEMU_GNUC_PREREQ is simpler and fixes that issue.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

With current gcc versions (gcc-4.x) there is no problem.
Nevertheless, I suggest to fix this in stable versions, too.

Regards

Stefan Weil

 qemu-barrier.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-barrier.h b/qemu-barrier.h
index 7e11197..16f0942 100644
--- a/qemu-barrier.h
+++ b/qemu-barrier.h
@@ -19,7 +19,7 @@
  * mfence on 32 bit as well, e.g. if built with -march=pentium-m.
  * However, on i386, there seem to be known bugs as recently as 4.3.
  * */
-#if defined(__GNUC__) && __GNUC__ >= 4 && __GNUC_MINOR__ >= 4
+#if QEMU_GNUC_PREREQ(4, 4)
 #define smp_mb() __sync_synchronize()
 #else
 #define smp_mb() asm volatile("lock; addl $0,0(%%esp) " ::: "memory")
-- 
1.7.10


