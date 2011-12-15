Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RbG3B-0005yW-C8
	for mharc-qemu-trivial@gnu.org; Thu, 15 Dec 2011 13:29:01 -0500
Received: from eggs.gnu.org ([140.186.70.92]:40742)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RbG38-0005sU-Vp
	for qemu-trivial@nongnu.org; Thu, 15 Dec 2011 13:28:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RbG38-0002UW-6B
	for qemu-trivial@nongnu.org; Thu, 15 Dec 2011 13:28:58 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:59857)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RbG35-0002U5-J4; Thu, 15 Dec 2011 13:28:55 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RbG32-0005gp-KO; Thu, 15 Dec 2011 18:28:52 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 15 Dec 2011 18:28:52 +0000
Message-Id: <1323973732-21848-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] Makefile.target: Remove unnecessary
	dependency rules
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
X-List-Received-Date: Thu, 15 Dec 2011 18:29:00 -0000

Remove some dependency rules which aren't necessary (the automatically
generated .d files cover all these). These were leftovers from dyngen
days, when the object files also had a dependency on some generated
files.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 Makefile.target |    6 ------
 1 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/Makefile.target b/Makefile.target
index 8be9b9a..3261383 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -92,12 +92,6 @@ tci-dis.o: QEMU_CFLAGS += -I$(SRC_PATH)/tcg -I$(SRC_PATH)/tcg/tci
 
 $(libobj-y): $(GENERATED_HEADERS)
 
-translate.o: translate.c cpu.h
-
-translate-all.o: translate-all.c cpu.h
-
-tcg/tcg.o: cpu.h
-
 # HELPER_CFLAGS is used for all the code compiled with static register
 # variables
 op_helper.o ldst_helper.o user-exec.o: QEMU_CFLAGS += $(HELPER_CFLAGS)
-- 
1.7.5.4


