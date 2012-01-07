Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RjcRY-0002HC-DE
	for mharc-qemu-trivial@gnu.org; Sat, 07 Jan 2012 15:00:44 -0500
Received: from eggs.gnu.org ([140.186.70.92]:36313)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1RjcRU-000254-1Y
	for qemu-trivial@nongnu.org; Sat, 07 Jan 2012 15:00:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1RjcRT-0000VE-0Y
	for qemu-trivial@nongnu.org; Sat, 07 Jan 2012 15:00:39 -0500
Received: from hall.aurel32.net ([88.191.126.93]:33621)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1RjcRQ-0000Uw-Oc; Sat, 07 Jan 2012 15:00:36 -0500
Received: from [2001:470:d4ed:0:5e26:aff:fe2b:6f5b] (helo=volta.aurel32.net)
	by hall.aurel32.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <aurelien@aurel32.net>)
	id 1RjcRP-0003YR-Sf; Sat, 07 Jan 2012 21:00:35 +0100
Received: from aurel32 by volta.aurel32.net with local (Exim 4.77)
	(envelope-from <aurelien@aurel32.net>)
	id 1RjcRO-00008b-Q3; Sat, 07 Jan 2012 21:00:34 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: qemu-devel@nongnu.org
Date: Sat,  7 Jan 2012 21:00:25 +0100
Message-Id: <1325966426-475-1-git-send-email-aurelien@aurel32.net>
X-Mailer: git-send-email 1.7.7.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 88.191.126.93
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] tcg-arm: fix a typo in comments
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
X-List-Received-Date: Sat, 07 Jan 2012 20:00:42 -0000

ARM still doesn't support 16GB buffers in 32-bit modes, replace the
16GB by 16MB in the comment.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 exec.c               |    2 +-
 tcg/arm/tcg-target.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/exec.c b/exec.c
index b1d6602..7f9f730 100644
--- a/exec.c
+++ b/exec.c
@@ -511,7 +511,7 @@ static void code_gen_alloc(unsigned long tb_size)
         if (code_gen_buffer_size > (512 * 1024 * 1024))
             code_gen_buffer_size = (512 * 1024 * 1024);
 #elif defined(__arm__)
-        /* Keep the buffer no bigger than 16GB to branch between blocks */
+        /* Keep the buffer no bigger than 16MB to branch between blocks */
         if (code_gen_buffer_size > 16 * 1024 * 1024)
             code_gen_buffer_size = 16 * 1024 * 1024;
 #elif defined(__s390x__)
diff --git a/tcg/arm/tcg-target.c b/tcg/arm/tcg-target.c
index 1d32798..5b233f5 100644
--- a/tcg/arm/tcg-target.c
+++ b/tcg/arm/tcg-target.c
@@ -843,7 +843,7 @@ static inline void tcg_out_st8(TCGContext *s, int cond,
 }
 
 /* The _goto case is normally between TBs within the same code buffer,
- * and with the code buffer limited to 16GB we shouldn't need the long
+ * and with the code buffer limited to 16MB we shouldn't need the long
  * case.
  *
  * .... except to the prologue that is in its own buffer.
-- 
1.7.7.3


