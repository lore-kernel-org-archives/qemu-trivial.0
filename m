Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzTRe-0007yZ-EM
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 12:19:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTRY-0007m7-7i
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:19:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTRT-0001Xp-AI
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:19:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40227)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WzTRG-0001Nw-IR; Tue, 24 Jun 2014 12:19:18 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EC9CB4407E;
	Tue, 24 Jun 2014 20:19:16 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D37106B4;
	Tue, 24 Jun 2014 20:09:22 +0400 (MSK)
Received: (nullmailer pid 15625 invoked by uid 1000);
	Tue, 24 Jun 2014 16:09:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 24 Jun 2014 20:09:14 +0400
Message-Id: <1403626160-15546-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 08/14] tcg: mark tcg_out* and tcg_patch* with
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
X-List-Received-Date: Tue, 24 Jun 2014 16:19:41 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The tcg_out* and tcg_patch* functions are utility routines that may or
may not be used by a particular backend; mark them with the 'unused'
attribute to suppress spurious warnings if they aren't used.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tcg/tcg.c |   20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 815eec1..c068990 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -124,19 +124,20 @@ static TCGRegSet tcg_target_available_regs[2];
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
@@ -147,7 +148,8 @@ static inline void tcg_out16(TCGContext *s, uint16_t v)
     }
 }
 
-static inline void tcg_patch16(tcg_insn_unit *p, uint16_t v)
+static __attribute__((unused)) inline void tcg_patch16(tcg_insn_unit *p,
+                                                       uint16_t v)
 {
     if (TCG_TARGET_INSN_UNIT_SIZE == 2) {
         *p = v;
@@ -158,7 +160,7 @@ static inline void tcg_patch16(tcg_insn_unit *p, uint16_t v)
 #endif
 
 #if TCG_TARGET_INSN_UNIT_SIZE <= 4
-static inline void tcg_out32(TCGContext *s, uint32_t v)
+static __attribute__((unused)) inline void tcg_out32(TCGContext *s, uint32_t v)
 {
     if (TCG_TARGET_INSN_UNIT_SIZE == 4) {
         *s->code_ptr++ = v;
@@ -169,7 +171,8 @@ static inline void tcg_out32(TCGContext *s, uint32_t v)
     }
 }
 
-static inline void tcg_patch32(tcg_insn_unit *p, uint32_t v)
+static __attribute__((unused)) inline void tcg_patch32(tcg_insn_unit *p,
+                                                       uint32_t v)
 {
     if (TCG_TARGET_INSN_UNIT_SIZE == 4) {
         *p = v;
@@ -180,7 +183,7 @@ static inline void tcg_patch32(tcg_insn_unit *p, uint32_t v)
 #endif
 
 #if TCG_TARGET_INSN_UNIT_SIZE <= 8
-static inline void tcg_out64(TCGContext *s, uint64_t v)
+static __attribute__((unused)) inline void tcg_out64(TCGContext *s, uint64_t v)
 {
     if (TCG_TARGET_INSN_UNIT_SIZE == 8) {
         *s->code_ptr++ = v;
@@ -191,7 +194,8 @@ static inline void tcg_out64(TCGContext *s, uint64_t v)
     }
 }
 
-static inline void tcg_patch64(tcg_insn_unit *p, uint64_t v)
+static __attribute__((unused)) inline void tcg_patch64(tcg_insn_unit *p,
+                                                       uint64_t v)
 {
     if (TCG_TARGET_INSN_UNIT_SIZE == 8) {
         *p = v;
-- 
1.7.10.4


