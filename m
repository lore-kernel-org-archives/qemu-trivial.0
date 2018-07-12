Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fdi6h-0004Rz-OE
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jul 2018 16:22:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stweil@ub-blade-01.bib.uni-mannheim.de>)
	id 1fdi6g-0004RR-0K
	for qemu-trivial@nongnu.org; Thu, 12 Jul 2018 16:22:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stweil@ub-blade-01.bib.uni-mannheim.de>)
	id 1fdi6f-0002zp-BM
	for qemu-trivial@nongnu.org; Thu, 12 Jul 2018 16:22:30 -0400
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80]:33229)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stweil@ub-blade-01.bib.uni-mannheim.de>)
	id 1fdi6b-000261-0x; Thu, 12 Jul 2018 16:22:25 -0400
Received: from localhost (localhost [127.0.0.1])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTP id 0839310280C;
	Thu, 12 Jul 2018 21:45:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at uni-mannheim.de
Received: from smtp.mail.uni-mannheim.de ([134.155.96.80])
	by localhost (mail-r83.rz.uni-mannheim.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id GBExjAjHikMn; Thu, 12 Jul 2018 21:45:02 +0200 (CEST)
Received: from ub-blade-01.bib.uni-mannheim.de
	(ub-blade-01.bib.uni-mannheim.de [134.155.36.5])
	by smtp.mail.uni-mannheim.de (Postfix) with ESMTPS id D932F1027EF;
	Thu, 12 Jul 2018 21:45:02 +0200 (CEST)
Received: from stweil by ub-blade-01.bib.uni-mannheim.de with local (Exim 4.89)
	(envelope-from <stweil@ub-blade-01.bib.uni-mannheim.de>)
	id 1fdhWQ-0006yS-O9; Thu, 12 Jul 2018 21:45:02 +0200
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Stefan Weil <sw@weilnetz.de>
Date: Thu, 12 Jul 2018 21:44:54 +0200
Message-Id: <20180712194454.26765-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 134.155.96.80
Subject: [Qemu-trivial] [PATCH] accel: Fix typo and grammar in comment
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
X-List-Received-Date: Thu, 12 Jul 2018 20:22:31 -0000

The typo was found by codespell.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 accel/tcg/translate-all.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 49d77fad44..1571987113 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1795,7 +1795,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tb->jmp_dest[0] = (uintptr_t)NULL;
     tb->jmp_dest[1] = (uintptr_t)NULL;
 
-    /* init original jump addresses wich has been set during tcg_gen_code() */
+    /* init original jump addresses which have been set during tcg_gen_code() */
     if (tb->jmp_reset_offset[0] != TB_JMP_RESET_OFFSET_INVALID) {
         tb_reset_jump(tb, 0);
     }
-- 
2.11.0


