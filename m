Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y7Oy3-00046e-Ik
	for mharc-qemu-trivial@gnu.org; Sat, 03 Jan 2015 08:42:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Y7Oy1-00040n-2w
	for qemu-trivial@nongnu.org; Sat, 03 Jan 2015 08:42:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Y7Oy0-0000h6-2y
	for qemu-trivial@nongnu.org; Sat, 03 Jan 2015 08:42:09 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:42698)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Y7Oxy-0000gH-41; Sat, 03 Jan 2015 08:42:06 -0500
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 7068B17FCC2; Sat,  3 Jan 2015 14:42:03 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sat,  3 Jan 2015 14:41:37 +0100
Message-Id: <1420292499-8596-2-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1420292499-8596-1-git-send-email-sw@weilnetz.de>
References: <1420292499-8596-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [Qemu-trivial] [PATCH 1/3] target-tricore: Fix new typos
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
X-List-Received-Date: Sat, 03 Jan 2015 13:42:10 -0000

adress -> address
managment -> management

Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-tricore/csfr.def          |    2 +-
 target-tricore/translate.c       |    2 +-
 target-tricore/tricore-opcodes.h |    4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target-tricore/csfr.def b/target-tricore/csfr.def
index 5b219b4..05c45dd 100644
--- a/target-tricore/csfr.def
+++ b/target-tricore/csfr.def
@@ -90,7 +90,7 @@ A(0xE200, CPM0, TRICORE_FEATURE_13)
 A(0xE280, CPM1, TRICORE_FEATURE_13)
 A(0xE300, CPM2, TRICORE_FEATURE_13)
 A(0xE380, CPM3, TRICORE_FEATURE_13)
-/* memory Managment Registers */
+/* memory management registers */
 A(0x8000, MMU_CON, TRICORE_FEATURE_13)
 A(0x8004, MMU_ASI, TRICORE_FEATURE_13)
 A(0x800C, MMU_TVA, TRICORE_FEATURE_13)
diff --git a/target-tricore/translate.c b/target-tricore/translate.c
index dbcf87e..d20922b 100644
--- a/target-tricore/translate.c
+++ b/target-tricore/translate.c
@@ -5022,7 +5022,7 @@ static void decode_32Bit_opc(CPUTriCoreState *env, DisasContext *ctx)
     case OPCM_32_RR_LOGICAL_SHIFT:
         decode_rr_logical_shift(env, ctx);
         break;
-    case OPCM_32_RR_ADRESS:
+    case OPCM_32_RR_ADDRESS:
         decode_rr_address(env, ctx);
         break;
     case OPCM_32_RR_IDIRECT:
diff --git a/target-tricore/tricore-opcodes.h b/target-tricore/tricore-opcodes.h
index 919063e..82bd161 100644
--- a/target-tricore/tricore-opcodes.h
+++ b/target-tricore/tricore-opcodes.h
@@ -503,7 +503,7 @@ enum {
 /* RR Format */
     OPCM_32_RR_LOGICAL_SHIFT                         = 0x0f,
     OPCM_32_RR_ACCUMULATOR                           = 0x0b,
-    OPCM_32_RR_ADRESS                                = 0x01,
+    OPCM_32_RR_ADDRESS                               = 0x01,
     OPCM_32_RR_DIVIDE                                = 0x4b,
     OPCM_32_RR_IDIRECT                               = 0x2d,
 /* RR1 Format */
@@ -1082,7 +1082,7 @@ enum {
     OPC2_32_RR_XOR_LT_U                          = 0x32,
     OPC2_32_RR_XOR_NE                            = 0x30,
 };
-/* OPCM_32_RR_ADRESS                                */
+/* OPCM_32_RR_ADDRESS                               */
 enum {
     OPC2_32_RR_ADD_A                             = 0x01,
     OPC2_32_RR_ADDSC_A                           = 0x60,
-- 
1.7.10.4


