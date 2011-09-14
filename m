Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R3sJk-0004JO-NE
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2011 12:28:08 -0400
Received: from eggs.gnu.org ([140.186.70.92]:59032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1R3sJh-00045I-BN
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2011 12:28:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1R3sJg-0004D4-2p
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2011 12:28:05 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:40907)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1R3sJZ-0004C2-N9; Wed, 14 Sep 2011 12:27:57 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	9393E7282F9A; Wed, 14 Sep 2011 18:27:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id l6ASnwdAXpj6; Wed, 14 Sep 2011 18:27:55 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 11A127282F9B; Wed, 14 Sep 2011 18:27:55 +0200 (CEST)
From: Stefan Weil <weil@mail.berlios.de>
To: qemu-devel@nongnu.org
Date: Wed, 14 Sep 2011 18:27:54 +0200
Message-Id: <1316017674-16380-1-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH] target-i386: Remove data type CCTable
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
X-List-Received-Date: Wed, 14 Sep 2011 16:28:06 -0000

Remove also two assert statements which were the last remaining users.

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 target-i386/cpu.h       |    5 -----
 target-i386/translate.c |    5 -----
 2 files changed, 0 insertions(+), 10 deletions(-)

diff --git a/target-i386/cpu.h b/target-i386/cpu.h
index 4a6f675..ae36489 100644
--- a/target-i386/cpu.h
+++ b/target-i386/cpu.h
@@ -991,11 +991,6 @@ static inline int cpu_mmu_index (CPUState *env)
 /* translate.c */
 void optimize_flags_init(void);
 
-typedef struct CCTable {
-    int (*compute_all)(void); /* return all the flags */
-    int (*compute_c)(void);  /* return the C flag */
-} CCTable;
-
 #if defined(CONFIG_USER_ONLY)
 static inline void cpu_clone_regs(CPUState *env, target_ulong newsp)
 {
diff --git a/target-i386/translate.c b/target-i386/translate.c
index b966762..b894e97 100644
--- a/target-i386/translate.c
+++ b/target-i386/translate.c
@@ -7641,11 +7641,6 @@ static target_ulong disas_insn(DisasContext *s, target_ulong pc_start)
 
 void optimize_flags_init(void)
 {
-#if TCG_TARGET_REG_BITS == 32
-    assert(sizeof(CCTable) == (1 << 3));
-#else
-    assert(sizeof(CCTable) == (1 << 4));
-#endif
     cpu_env = tcg_global_reg_new_ptr(TCG_AREG0, "env");
     cpu_cc_op = tcg_global_mem_new_i32(TCG_AREG0,
                                        offsetof(CPUState, cc_op), "cc_op");
-- 
1.7.2.5


