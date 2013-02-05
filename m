Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U2hOY-0000c3-EN
	for mharc-qemu-trivial@gnu.org; Tue, 05 Feb 2013 07:13:02 -0500
Received: from eggs.gnu.org ([208.118.235.92]:37475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1U2hOS-0000M0-I1
	for qemu-trivial@nongnu.org; Tue, 05 Feb 2013 07:12:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1U2hOO-0000em-VL
	for qemu-trivial@nongnu.org; Tue, 05 Feb 2013 07:12:56 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:60628)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1U2hOJ-0000b7-Ov; Tue, 05 Feb 2013 07:12:47 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	671787280030; Tue,  5 Feb 2013 13:12:45 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 8TBFXOdIwI5Z; Tue,  5 Feb 2013 13:12:45 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 0BB1D7280046; Tue,  5 Feb 2013 13:12:45 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Tue,  5 Feb 2013 13:12:43 +0100
Message-Id: <1360066363-19595-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Paul Brook <paul@codesourcery.com>
Subject: [Qemu-trivial] [PATCH] target-m68k: Fix comment
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
X-List-Received-Date: Tue, 05 Feb 2013 12:13:00 -0000

* spelling fix ito -> into
* reorder to match load/store

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-m68k/translate.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-m68k/translate.c b/target-m68k/translate.c
index e763195..3f1478c 100644
--- a/target-m68k/translate.c
+++ b/target-m68k/translate.c
@@ -574,7 +574,7 @@ static inline TCGv gen_ea_once(CPUM68KState *env, DisasContext *s,
     return gen_ldst(s, opsize, tmp, val, what);
 }
 
-/* Generate code to load/store a value ito/from an EA.  If VAL > 0 this is
+/* Generate code to load/store a value from/into an EA.  If VAL > 0 this is
    a write otherwise it is a read (0 == sign extend, -1 == zero extend).
    ADDRP is non-null for readwrite operands.  */
 static TCGv gen_ea(CPUM68KState *env, DisasContext *s, uint16_t insn,
-- 
1.7.10.4


