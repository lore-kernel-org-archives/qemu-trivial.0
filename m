Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c092Z-0001wo-Be
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:25:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c092W-0001sr-6D
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:25:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c092U-0007u5-3R
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:25:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36816)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c092P-0007ri-Vd; Fri, 28 Oct 2016 11:25:46 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5A85043737;
	Fri, 28 Oct 2016 18:25:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id B38C7B52;
	Fri, 28 Oct 2016 18:18:57 +0300 (MSK)
Received: (nullmailer pid 6056 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Walle <michael@walle.cc>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 28 Oct 2016 18:18:37 +0300
Message-Id: <19f846b19f4bb5ef187da057d40f0507e3842625.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 06/23] target-lm32: disable asm logging via
 LOG_DIS()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Oct 2016 15:25:53 -0000

From: Michael Walle <michael@walle.cc>

The lm32 target already has a disassembler which logs the assembly
instructions with "-d in_asm". Therefore, turn of the LOG_DIS() macro to
prevent logging the assembly instructions twice. Also turn the macro in a
one which is always compiled to catch any errors while the macro is turned
off.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-lm32/translate.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/target-lm32/translate.c b/target-lm32/translate.c
index fa8416a..792637f 100644
--- a/target-lm32/translate.c
+++ b/target-lm32/translate.c
@@ -33,12 +33,14 @@
 #include "exec/log.h"
 
 
-#define DISAS_LM32 1
-#if DISAS_LM32
-#  define LOG_DIS(...) qemu_log_mask(CPU_LOG_TB_IN_ASM, ## __VA_ARGS__)
-#else
-#  define LOG_DIS(...) do { } while (0)
-#endif
+#define DISAS_LM32 0
+
+#define LOG_DIS(...) \
+    do { \
+        if (DISAS_LM32) { \
+            qemu_log_mask(CPU_LOG_TB_IN_ASM, ## __VA_ARGS__); \
+        } \
+    } while (0)
 
 #define EXTRACT_FIELD(src, start, end) \
             (((src) >> start) & ((1 << (end - start + 1)) - 1))
-- 
2.1.4


