Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YS3lc-0001u3-RI
	for mharc-qemu-trivial@gnu.org; Sun, 01 Mar 2015 08:18:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47753)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YS3lZ-0001q2-I6
	for qemu-trivial@nongnu.org; Sun, 01 Mar 2015 08:18:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YS3lY-0008Pg-Dh
	for qemu-trivial@nongnu.org; Sun, 01 Mar 2015 08:18:41 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:46628)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YS3lW-0008OW-5u; Sun, 01 Mar 2015 08:18:38 -0500
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id DC6E61803EC; Sun,  1 Mar 2015 14:18:35 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sun,  1 Mar 2015 14:18:35 +0100
Message-Id: <1425215915-26043-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	QEMU Developer <qemu-devel@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] disas/microblaze: Fix warnings caused by
	missing 'static' attribute
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
X-List-Received-Date: Sun, 01 Mar 2015 13:18:43 -0000

Warnings from the Sparse static analysis tool:

disas/microblaze.c:289:3: warning:
 symbol 'opcodes' was not declared. Should it be static?
disas/microblaze.c:570:6: warning:
 symbol 'register_prefix' was not declared. Should it be static?
disas/microblaze.c:571:6: warning:
 symbol 'special_register_prefix' was not declared. Should it be static?
disas/microblaze.c:572:6: warning:
 symbol 'fsl_register_prefix' was not declared. Should it be static?
disas/microblaze.c:573:6: warning:
 symbol 'pvr_register_prefix' was not declared. Should it be static?

Remove the unused variable special_register_prefix.
The variable pvr_register_prefix was unused, too, but can be used.
Add also 'const' where possible.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

This patch does not pass checkpatch.pl because of a tab used for indentation (as in most code lines).

Regards
Stefan

 disas/microblaze.c |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/disas/microblaze.c b/disas/microblaze.c
index ec91af3..9f2464d 100644
--- a/disas/microblaze.c
+++ b/disas/microblaze.c
@@ -275,7 +275,7 @@ enum microblaze_instr_type {
 
 #define MAX_OPCODES 280
 
-struct op_code_struct {
+static struct op_code_struct {
   const char *name;
   short inst_type; /* registers and immediate values involved */
   short inst_offset_type; /* immediate vals offset from PC? (= 1 for branches) */
@@ -567,10 +567,9 @@ struct op_code_struct {
 };
 
 /* prefix for register names */
-char register_prefix[] = "r";
-char special_register_prefix[] = "spr";
-char fsl_register_prefix[] = "rfsl";
-char pvr_register_prefix[] = "rpvr";
+static const char register_prefix[] = "r";
+static const char fsl_register_prefix[] = "rfsl";
+static const char pvr_register_prefix[] = "rpvr";
 
 
 /* #defines for valid immediate range */
@@ -738,7 +737,9 @@ get_field_special (long instr, struct op_code_struct * op)
    default :
      {
        if ( ((((instr & IMM_MASK) >> IMM_LOW) ^ op->immval_mask) & 0xE000) == REG_PVR_MASK) {
-	 sprintf(tmpstr, "%spvr%d", register_prefix, (unsigned short)(((instr & IMM_MASK) >> IMM_LOW) ^ op->immval_mask) ^ REG_PVR_MASK);
+	  sprintf(tmpstr, "%s%u", pvr_register_prefix,
+                 (unsigned short)(((instr & IMM_MASK) >> IMM_LOW) ^
+                                  op->immval_mask) ^ REG_PVR_MASK);
 	 return(strdup(tmpstr));
        } else {
 	 strcpy(spr, "pc");
-- 
1.7.10.4


