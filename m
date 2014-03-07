Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WM0FY-0005TP-Ba
	for mharc-qemu-trivial@gnu.org; Fri, 07 Mar 2014 14:16:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WM0FV-0005OQ-HQ
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 14:16:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WM0FU-0006P0-Bs
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 14:16:01 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:40068
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WM0FR-0006NL-Rx; Fri, 07 Mar 2014 14:15:57 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id A906F17FC70; Fri,  7 Mar 2014 20:15:54 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri,  7 Mar 2014 20:15:53 +0100
Message-Id: <1394219753-26106-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] libvixl: Fix format strings for several
	int64_t values
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
X-List-Received-Date: Fri, 07 Mar 2014 19:16:03 -0000

"%d" or "%x" won't work on hosts where int values are smaller than 64 bit.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 disas/libvixl/a64/disasm-a64.cc |   20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/disas/libvixl/a64/disasm-a64.cc b/disas/libvixl/a64/disasm-a64.cc
index 5c6b898..5f172da 100644
--- a/disas/libvixl/a64/disasm-a64.cc
+++ b/disas/libvixl/a64/disasm-a64.cc
@@ -1342,7 +1342,7 @@ int Disassembler::SubstituteImmediateField(Instruction* instr,
         ASSERT(format[5] == 'L');
         AppendToOutput("#0x%" PRIx64, instr->ImmMoveWide());
         if (instr->ShiftMoveWide() > 0) {
-          AppendToOutput(", lsl #%d", 16 * instr->ShiftMoveWide());
+          AppendToOutput(", lsl #%" PRId64, 16 * instr->ShiftMoveWide());
         }
       }
       return 8;
@@ -1391,7 +1391,7 @@ int Disassembler::SubstituteImmediateField(Instruction* instr,
     }
     case 'F': {  // IFPSingle, IFPDouble or IFPFBits.
       if (format[3] == 'F') {  // IFPFbits.
-        AppendToOutput("#%d", 64 - instr->FPScale());
+        AppendToOutput("#%" PRId64, 64 - instr->FPScale());
         return 8;
       } else {
         AppendToOutput("#0x%" PRIx64 " (%.4f)", instr->ImmFP(),
@@ -1412,23 +1412,23 @@ int Disassembler::SubstituteImmediateField(Instruction* instr,
       return 5;
     }
     case 'P': {  // IP - Conditional compare.
-      AppendToOutput("#%d", instr->ImmCondCmp());
+      AppendToOutput("#%" PRId64, instr->ImmCondCmp());
       return 2;
     }
     case 'B': {  // Bitfields.
       return SubstituteBitfieldImmediateField(instr, format);
     }
     case 'E': {  // IExtract.
-      AppendToOutput("#%d", instr->ImmS());
+      AppendToOutput("#%" PRId64, instr->ImmS());
       return 8;
     }
     case 'S': {  // IS - Test and branch bit.
-      AppendToOutput("#%d", (instr->ImmTestBranchBit5() << 5) |
-                            instr->ImmTestBranchBit40());
+      AppendToOutput("#%" PRId64, (instr->ImmTestBranchBit5() << 5) |
+                                  instr->ImmTestBranchBit40());
       return 2;
     }
     case 'D': {  // IDebug - HLT and BRK instructions.
-      AppendToOutput("#0x%x", instr->ImmException());
+      AppendToOutput("#0x%" PRIx64, instr->ImmException());
       return 6;
     }
     default: {
@@ -1598,12 +1598,12 @@ int Disassembler::SubstituteExtendField(Instruction* instr,
       (((instr->ExtendMode() == UXTW) && (instr->SixtyFourBits() == 0)) ||
        (instr->ExtendMode() == UXTX))) {
     if (instr->ImmExtendShift() > 0) {
-      AppendToOutput(", lsl #%d", instr->ImmExtendShift());
+      AppendToOutput(", lsl #%" PRId64, instr->ImmExtendShift());
     }
   } else {
     AppendToOutput(", %s", extend_mode[instr->ExtendMode()]);
     if (instr->ImmExtendShift() > 0) {
-      AppendToOutput(" #%d", instr->ImmExtendShift());
+      AppendToOutput(" #%" PRId64, instr->ImmExtendShift());
     }
   }
   return 3;
@@ -1632,7 +1632,7 @@ int Disassembler::SubstituteLSRegOffsetField(Instruction* instr,
   if (!((ext == UXTX) && (shift == 0))) {
     AppendToOutput(", %s", extend_mode[ext]);
     if (shift != 0) {
-      AppendToOutput(" #%d", instr->SizeLS());
+      AppendToOutput(" #%" PRId64, instr->SizeLS());
     }
   }
   return 9;
-- 
1.7.9.5


