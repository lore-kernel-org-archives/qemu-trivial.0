Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YBfxR-000622-1H
	for mharc-qemu-trivial@gnu.org; Thu, 15 Jan 2015 03:39:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBfxI-0005pD-Vp
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:39:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBfxF-0002HV-9b
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:39:04 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:37051)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YBfx9-0002Fs-Md; Thu, 15 Jan 2015 03:38:55 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 252F140DB7;
	Thu, 15 Jan 2015 11:38:54 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 8B7AD8C4;
	Thu, 15 Jan 2015 11:30:53 +0300 (MSK)
Received: (nullmailer pid 31349 invoked by uid 1000);
	Thu, 15 Jan 2015 08:30:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 15 Jan 2015 11:30:43 +0300
Message-Id: <37097418be0a722342fc0ef77c2e773359d2cd05.1421310394.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
References: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [Qemu-trivial] [PULL 05/12] target-tricore: Fix new typos
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
X-List-Received-Date: Thu, 15 Jan 2015 08:39:09 -0000

From: Stefan Weil <sw@weilnetz.de>

adress -> address
managment -> management

Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-tricore/csfr.def          | 2 +-
 target-tricore/translate.c       | 2 +-
 target-tricore/tricore-opcodes.h | 4 ++--
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
index 3b83782..def7f4a 100644
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
2.1.4


