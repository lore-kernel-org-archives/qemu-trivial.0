Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WtK6u-0002E7-21
	for mharc-qemu-trivial@gnu.org; Sat, 07 Jun 2014 13:08:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WtK6r-0002BH-K2
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 13:08:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WtK6q-0006wo-Ks
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 13:08:49 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:48548)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WtK6o-0006wE-6x; Sat, 07 Jun 2014 13:08:46 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WtK6m-0003gj-5w; Sat, 07 Jun 2014 18:08:44 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat,  7 Jun 2014 18:08:44 +0100
Message-Id: <1402160924-14152-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Richard Henderson <rth@twiddle.net>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] tcg: mark tcg_out* and tcg_patch* with
	attribute 'unused'
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
X-List-Received-Date: Sat, 07 Jun 2014 17:08:50 -0000

The tcg_out* and tcg_patch* functions are utility routines that may or
may not be used by a particular backend; mark them with the 'unused'
attribute to suppress spurious warnings if they aren't used.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Do we want to define a QEMU_UNUSED macro in compiler.h? We don't
seem to have done for the existing uses of this attribute in tree.

 tcg/tcg.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 2c5732d..fe55d05 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -125,19 +125,20 @@ static TCGRegSet tcg_target_available_regs[2];
 static TCGRegSet tcg_target_call_clobber_regs;
 
 #if TCG_TARGET_INSN_UNIT_SIZE == 1
-static inline void tcg_out8(TCGContext *s, uint8_t v)
+static __attribute__((unused)) inline void tcg_out8(TCGContext *s, uint8_t v)
 {
     *s->code_ptr++ = v;
 }
 
-static inline void tcg_patch8(tcg_insn_unit *p, uint8_t v)
+static __attribute__((unused)) inline void tcg_patch8(tcg_insn_unit *p,
+                                                      uint8_t v)
 {
     *p = v;
 }
 #endif
 
 #if TCG_TARGET_INSN_UNIT_SIZE <= 2
-static inline void tcg_out16(TCGContext *s, uint16_t v)
+static __attribute__((unused)) inline void tcg_out16(TCGContext *s, uint16_t v)
 {
     if (TCG_TARGET_INSN_UNIT_SIZE == 2) {
         *s->code_ptr++ = v;
@@ -148,7 +149,8 @@ static inline void tcg_out16(TCGContext *s, uint16_t v)
     }
 }
 
-static inline void tcg_patch16(tcg_insn_unit *p, uint16_t v)
+static __attribute__((unused)) inline void tcg_patch16(tcg_insn_unit *p,
+                                                       uint16_t v)
 {
     if (TCG_TARGET_INSN_UNIT_SIZE == 2) {
         *p = v;
@@ -159,7 +161,7 @@ static inline void tcg_patch16(tcg_insn_unit *p, uint16_t v)
 #endif
 
 #if TCG_TARGET_INSN_UNIT_SIZE <= 4
-static inline void tcg_out32(TCGContext *s, uint32_t v)
+static __attribute__((unused)) inline void tcg_out32(TCGContext *s, uint32_t v)
 {
     if (TCG_TARGET_INSN_UNIT_SIZE == 4) {
         *s->code_ptr++ = v;
@@ -170,7 +172,8 @@ static inline void tcg_out32(TCGContext *s, uint32_t v)
     }
 }
 
-static inline void tcg_patch32(tcg_insn_unit *p, uint32_t v)
+static __attribute__((unused)) inline void tcg_patch32(tcg_insn_unit *p,
+                                                       uint32_t v)
 {
     if (TCG_TARGET_INSN_UNIT_SIZE == 4) {
         *p = v;
@@ -181,7 +184,7 @@ static inline void tcg_patch32(tcg_insn_unit *p, uint32_t v)
 #endif
 
 #if TCG_TARGET_INSN_UNIT_SIZE <= 8
-static inline void tcg_out64(TCGContext *s, uint64_t v)
+static __attribute__((unused)) inline void tcg_out64(TCGContext *s, uint64_t v)
 {
     if (TCG_TARGET_INSN_UNIT_SIZE == 8) {
         *s->code_ptr++ = v;
@@ -192,7 +195,8 @@ static inline void tcg_out64(TCGContext *s, uint64_t v)
     }
 }
 
-static inline void tcg_patch64(tcg_insn_unit *p, uint64_t v)
+static __attribute__((unused)) inline void tcg_patch64(tcg_insn_unit *p,
+                                                       uint64_t v)
 {
     if (TCG_TARGET_INSN_UNIT_SIZE == 8) {
         *p = v;
-- 
1.8.5.4


