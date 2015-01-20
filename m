Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YDVbb-0003EK-59
	for mharc-qemu-trivial@gnu.org; Tue, 20 Jan 2015 05:00:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YDVbT-00033T-7V
	for qemu-trivial@nongnu.org; Tue, 20 Jan 2015 05:00:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YDVbP-0006l9-2o
	for qemu-trivial@nongnu.org; Tue, 20 Jan 2015 05:00:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59671)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YDVb8-0006eX-V6; Tue, 20 Jan 2015 04:59:47 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t0K9xQ3Z003023
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 20 Jan 2015 04:59:26 -0500
Received: from blackfin.pond.sub.org (ovpn-116-46.ams2.redhat.com
	[10.36.116.46])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0K9xOad027879
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 20 Jan 2015 04:59:25 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 912B230408B3; Tue, 20 Jan 2015 10:59:23 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 20 Jan 2015 10:59:23 +0100
Message-Id: <1421747963-2860-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, leon.alrae@imgtec.com
Subject: [Qemu-trivial] [PATCH] target-mips: Clean up switch fall through
	after commit fecd264
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
X-List-Received-Date: Tue, 20 Jan 2015 10:00:13 -0000

Commit fecd264 added a number of fall-throughs, but neglected to
properly document them as intentional.  Commit d922445 cleaned that up
for many, but not all cases.  Take care of the remaining ones.

Spotted by Coverity.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 target-mips/translate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target-mips/translate.c b/target-mips/translate.c
index e9d86b2..8abc12b 100644
--- a/target-mips/translate.c
+++ b/target-mips/translate.c
@@ -18729,6 +18729,7 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
     case OPC_SWL:
     case OPC_SWR:
         check_insn_opc_removed(ctx, ISA_MIPS32R6);
+         /* fall through */
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
1.9.3


