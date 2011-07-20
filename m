Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qjbx5-000625-RI
	for mharc-qemu-trivial@gnu.org; Wed, 20 Jul 2011 14:57:00 -0400
Received: from eggs.gnu.org ([140.186.70.92]:60007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Qjbx2-00060u-AG
	for qemu-trivial@nongnu.org; Wed, 20 Jul 2011 14:56:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Qjbwz-0004cA-Ot
	for qemu-trivial@nongnu.org; Wed, 20 Jul 2011 14:56:55 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:37846)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Qjbwr-0004TP-Mi; Wed, 20 Jul 2011 14:56:45 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	42E737282F86; Wed, 20 Jul 2011 20:56:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id DpvDxJl93zHI; Wed, 20 Jul 2011 20:56:38 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id D90857282F87; Wed, 20 Jul 2011 20:56:38 +0200 (CEST)
From: Stefan Weil <weil@mail.berlios.de>
To: qemu-devel@nongnu.org
Date: Wed, 20 Jul 2011 20:56:36 +0200
Message-Id: <1311188196-2867-2-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1311188196-2867-1-git-send-email-weil@mail.berlios.de>
References: <1311188196-2867-1-git-send-email-weil@mail.berlios.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>,
	Blue Swirl <blauwirbel@gmail.com>
Subject: [Qemu-trivial] [PATCH] tcg/mips: Fix regression caused by typo
	(copy + paste bug)
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
X-List-Received-Date: Wed, 20 Jul 2011 18:56:57 -0000

cppcheck reports an error:
qemu/tcg/mips/tcg-target.c:1487: error: Invalid number of character (()

The unpatched code won't compile on mips hosts starting with commit
cea5f9a28faa528b6b1b117c9ab2d8828f473fef.

Cc: Blue Swirl <blauwirbel@gmail.com>
Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 tcg/mips/tcg-target.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tcg/mips/tcg-target.c b/tcg/mips/tcg-target.c
index 12ff9d5..a33d21f 100644
--- a/tcg/mips/tcg-target.c
+++ b/tcg/mips/tcg-target.c
@@ -1484,7 +1484,7 @@ static void tcg_target_qemu_prologue(TCGContext *s)
     }
 
     /* Call generated code */
-    tcg_out_opc_reg(s, OPC_JR, 0, tcg_target_call_iarg_regs[1]), 0);
+    tcg_out_opc_reg(s, OPC_JR, 0, tcg_target_call_iarg_regs[1], 0);
     tcg_out_mov(s, TCG_TYPE_PTR, TCG_AREG0, tcg_target_call_iarg_regs[0]);
     tb_ret_addr = s->code_ptr;
 
-- 
1.7.2.5


