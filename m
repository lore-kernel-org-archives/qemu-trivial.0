Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TmOLm-0007OB-Ja
	for mharc-qemu-trivial@gnu.org; Sat, 22 Dec 2012 07:38:46 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TmOLi-0007Bj-Fk
	for qemu-trivial@nongnu.org; Sat, 22 Dec 2012 07:38:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TmOLd-0006Zi-2w
	for qemu-trivial@nongnu.org; Sat, 22 Dec 2012 07:38:42 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:43830)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TmOLQ-0006YR-3j; Sat, 22 Dec 2012 07:38:24 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	03D237280049; Sat, 22 Dec 2012 13:38:22 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 9UX3S1EOSbrZ; Sat, 22 Dec 2012 13:38:21 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 81AE7728004C; Sat, 22 Dec 2012 13:38:21 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sat, 22 Dec 2012 13:38:19 +0100
Message-Id: <1356179899-1268-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] target-mips: Remove semicolon from macro
	definition
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
X-List-Received-Date: Sat, 22 Dec 2012 12:38:45 -0000

Macro RESTORE_FLUSH_MODE is similar to RESTORE_ROUNDING_MODE
but included a semicolon.

The code which uses that macro also includes a semicolon,
so the result was an empty statement.

Remove the superfluous semicolon from the macro definition.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

Note:

After the patch, the modified line is shorter, but still longer than
required by the coding conventions.

 target-mips/op_helper.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
index e85edce..e3ab05c 100644
--- a/target-mips/op_helper.c
+++ b/target-mips/op_helper.c
@@ -2175,7 +2175,7 @@ static unsigned int ieee_rm[] = {
     set_float_rounding_mode(ieee_rm[env->active_fpu.fcr31 & 3], &env->active_fpu.fp_status)
 
 #define RESTORE_FLUSH_MODE \
-    set_flush_to_zero((env->active_fpu.fcr31 & (1 << 24)) != 0, &env->active_fpu.fp_status);
+    set_flush_to_zero((env->active_fpu.fcr31 & (1 << 24)) != 0, &env->active_fpu.fp_status)
 
 target_ulong helper_cfc1(CPUMIPSState *env, uint32_t reg)
 {
-- 
1.7.10.4


