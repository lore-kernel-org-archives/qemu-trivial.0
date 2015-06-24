Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7fRO-0005u0-V8
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jun 2015 03:49:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1Z7Yv6-0004sx-HI
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 20:52:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1Z7Yv5-0008Cg-E0
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 20:52:04 -0400
Received: from smtp4-g21.free.fr ([212.27.42.4]:26024)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>)
	id 1Z7Yuz-0008Bs-Aa; Tue, 23 Jun 2015 20:51:57 -0400
Received: from Quad.localdomain (unknown [78.238.229.36])
	by smtp4-g21.free.fr (Postfix) with ESMTPS id 89E7C4C802E;
	Wed, 24 Jun 2015 02:51:55 +0200 (CEST)
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Wed, 24 Jun 2015 02:51:49 +0200
Message-Id: <1435107109-12500-1-git-send-email-laurent@vivier.eu>
X-Mailer: git-send-email 2.4.3
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
	[fuzzy]
X-Received-From: 212.27.42.4
X-Mailman-Approved-At: Wed, 24 Jun 2015 03:49:49 -0400
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Subject: [Qemu-trivial] [PATCH] m68k: remove useless parameter op_size from
	gen_lea_indexed()
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
X-List-Received-Date: Wed, 24 Jun 2015 00:52:05 -0000

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target-m68k/translate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target-m68k/translate.c b/target-m68k/translate.c
index d6c478f..bc83a6e 100644
--- a/target-m68k/translate.c
+++ b/target-m68k/translate.c
@@ -297,8 +297,7 @@ static TCGv gen_addr_index(uint16_t ext, TCGv tmp)
 
 /* Handle a base + index + displacement effective addresss.
    A NULL_QREG base means pc-relative.  */
-static TCGv gen_lea_indexed(CPUM68KState *env, DisasContext *s, int opsize,
-                            TCGv base)
+static TCGv gen_lea_indexed(CPUM68KState *env, DisasContext *s, TCGv base)
 {
     uint32_t offset;
     uint16_t ext;
@@ -529,7 +528,7 @@ static TCGv gen_lea(CPUM68KState *env, DisasContext *s, uint16_t insn,
         return tmp;
     case 6: /* Indirect index + displacement.  */
         reg = AREG(insn, 0);
-        return gen_lea_indexed(env, s, opsize, reg);
+        return gen_lea_indexed(env, s, reg);
     case 7: /* Other */
         switch (insn & 7) {
         case 0: /* Absolute short.  */
@@ -545,7 +544,7 @@ static TCGv gen_lea(CPUM68KState *env, DisasContext *s, uint16_t insn,
             s->pc += 2;
             return tcg_const_i32(offset);
         case 3: /* pc index+displacement.  */
-            return gen_lea_indexed(env, s, opsize, NULL_QREG);
+            return gen_lea_indexed(env, s, NULL_QREG);
         case 4: /* Immediate.  */
         default:
             return NULL_QREG;
-- 
2.4.3


