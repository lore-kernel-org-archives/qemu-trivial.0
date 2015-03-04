Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTINQ-0006Rz-TD
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 18:06:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52673)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTINO-0006LK-Ah
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 18:06:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTINN-0005RG-8C
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 18:06:50 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58306)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTIN7-0005Ma-K5; Wed, 04 Mar 2015 18:06:33 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 51EB140985;
	Thu,  5 Mar 2015 02:06:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1C9AC974;
	Wed,  4 Mar 2015 20:07:11 +0300 (MSK)
Received: (nullmailer pid 17567 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:58 +0300
Message-Id: <243a613ed15721291c5454bb8962c01a040eb652.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 41/47] disas/microblaze: Fix warnings caused
	by missing 'static' attribute
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
X-List-Received-Date: Wed, 04 Mar 2015 23:06:51 -0000

From: Stefan Weil <sw@weilnetz.de>

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
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 disas/microblaze.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/disas/microblaze.c b/disas/microblaze.c
index ec91af3..c14ab89 100644
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
2.1.4


