Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RThbE-0006lQ-O6
	for mharc-qemu-trivial@gnu.org; Thu, 24 Nov 2011 17:16:56 -0500
Received: from eggs.gnu.org ([140.186.70.92]:39839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RThbC-0006cR-CG
	for qemu-trivial@nongnu.org; Thu, 24 Nov 2011 17:16:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RThbB-0004S2-6m
	for qemu-trivial@nongnu.org; Thu, 24 Nov 2011 17:16:54 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:56298)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RThb9-0004Rn-7S; Thu, 24 Nov 2011 17:16:51 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	8A5AC7281889; Thu, 24 Nov 2011 23:16:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id P76lCJBekFkZ; Thu, 24 Nov 2011 23:16:11 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 2E647728188B; Thu, 24 Nov 2011 23:16:11 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Thu, 24 Nov 2011 23:16:10 +0100
Message-Id: <1322172970-20616-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] tci: Make flush_icache_range() inline
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
X-List-Received-Date: Thu, 24 Nov 2011 22:16:55 -0000

This is standard for other tcg targets and improves tci, too.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 tcg/tci/tcg-target.c |    4 ----
 tcg/tci/tcg-target.h |    4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tcg/tci/tcg-target.c b/tcg/tci/tcg-target.c
index 5011c43..f26bec7 100644
--- a/tcg/tci/tcg-target.c
+++ b/tcg/tci/tcg-target.c
@@ -379,10 +379,6 @@ static const char *const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
 };
 #endif
 
-static void flush_icache_range(unsigned long start, unsigned long stop)
-{
-}
-
 static void patch_reloc(uint8_t *code_ptr, int type,
                         tcg_target_long value, tcg_target_long addend)
 {
diff --git a/tcg/tci/tcg-target.h b/tcg/tci/tcg-target.h
index 449373d..c35786c 100644
--- a/tcg/tci/tcg-target.h
+++ b/tcg/tci/tcg-target.h
@@ -157,4 +157,8 @@ void tci_disas(uint8_t opc);
 unsigned long tcg_qemu_tb_exec(CPUState *env, uint8_t *tb_ptr);
 #define tcg_qemu_tb_exec tcg_qemu_tb_exec
 
+static inline void flush_icache_range(unsigned long start, unsigned long stop)
+{
+}
+
 #endif /* TCG_TARGET_H */
-- 
1.7.2.5


