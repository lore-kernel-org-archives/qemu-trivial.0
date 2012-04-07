Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SGY2G-0003YD-Ja
	for mharc-qemu-trivial@gnu.org; Sat, 07 Apr 2012 11:58:44 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SGY2D-0003OT-Mv
	for qemu-trivial@nongnu.org; Sat, 07 Apr 2012 11:58:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SGY2B-0000n5-TV
	for qemu-trivial@nongnu.org; Sat, 07 Apr 2012 11:58:41 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:37547)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SGY28-0000mO-Oy; Sat, 07 Apr 2012 11:58:36 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	4445172800B2; Sat,  7 Apr 2012 17:58:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id sXC9RGsYfUNK; Sat,  7 Apr 2012 17:58:34 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id E1E7F72800B3; Sat,  7 Apr 2012 17:58:34 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat,  7 Apr 2012 17:58:33 +0200
Message-Id: <1333814314-23222-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH (rebased) 1/2] Add QEMU_NORETURN to function
	cpu_resume_from_signal
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
X-List-Received-Date: Sat, 07 Apr 2012 15:58:43 -0000

cpu_resume_from_signal terminates by calling longjmp.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 exec-all.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/exec-all.h b/exec-all.h
index a6d6519..4758d88 100644
--- a/exec-all.h
+++ b/exec-all.h
@@ -86,7 +86,7 @@ int cpu_gen_code(CPUArchState *env, struct TranslationBlock *tb,
                  int *gen_code_size_ptr);
 int cpu_restore_state(struct TranslationBlock *tb,
                       CPUArchState *env, uintptr_t searched_pc);
-void cpu_resume_from_signal(CPUArchState *env1, void *puc);
+void QEMU_NORETURN cpu_resume_from_signal(CPUArchState *env1, void *puc);
 void cpu_io_recompile(CPUArchState *env, void *retaddr);
 TranslationBlock *tb_gen_code(CPUArchState *env, 
                               target_ulong pc, target_ulong cs_base, int flags,
-- 
1.7.9


