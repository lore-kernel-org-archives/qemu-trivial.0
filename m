Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4Wk-0000eo-VJ
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 01:42:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4Wg-0000W4-Fb
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:42:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4Wb-0004TC-Ct
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:42:26 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44046)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4WT-0004Qh-OU; Tue, 10 Feb 2015 01:42:13 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1902741821;
	Tue, 10 Feb 2015 09:34:44 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id F2C128C9;
	Tue, 10 Feb 2015 09:34:43 +0300 (MSK)
Received: (nullmailer pid 9334 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:33:50 +0300
Message-Id: <b6f3b233eabb4df5d65ae9fbfb3d3c8befea0de7.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 01/46] target-mips: Clean up switch fall
	through after commit fecd264
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
X-List-Received-Date: Tue, 10 Feb 2015 06:42:27 -0000

From: Markus Armbruster <armbru@redhat.com>

Commit fecd264 added a number of fall-throughs, but neglected to
properly document them as intentional.  Commit d922445 cleaned that up
for many, but not all cases.  Take care of the remaining ones.

Spotted by Coverity.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-mips/translate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target-mips/translate.c b/target-mips/translate.c
index e9d86b2..1faeb5d 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -18729,6 +18729,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
     case OPC_SWL:
     case OPC_SWR:
         check_insn_opc_removed(ctx, ISA_MIPS32R6);
+        /* fall through */
     case OPC_SB ... OPC_SH:
     case OPC_SW:
          gen_st(ctx, op, rt, rs, imm);
@@ -18817,6 +18818,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         case OPC_PS_FMT:
             check_cp1_enabled(ctx);
             check_insn_opc_removed(ctx, ISA_MIPS32R6);
+            /* fall through */
         case OPC_S_FMT:
         case OPC_D_FMT:
             check_cp1_enabled(ctx);
@@ -19000,6 +19002,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
     case OPC_LDL ... OPC_LDR:
     case OPC_LLD:
         check_insn_opc_removed(ctx, ISA_MIPS32R6);
+        /* fall through */
     case OPC_LWU:
     case OPC_LD:
         check_insn(ctx, ISA_MIPS3);
@@ -19008,6 +19011,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
         break;
     case OPC_SDL ... OPC_SDR:
         check_insn_opc_removed(ctx, ISA_MIPS32R6);
+        /* fall through */
     case OPC_SD:
         check_insn(ctx, ISA_MIPS3);
         check_mips_64(ctx);
-- 
2.1.4


