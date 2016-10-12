Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buN7s-00047Z-8M
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2016 13:15:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1buN7o-00043U-Bo
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 13:15:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1buN7m-0007TH-1K
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 13:15:27 -0400
Received: from ssl.serverraum.org ([213.133.101.245]:42547)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>)
	id 1buN7f-0007SD-Tf; Wed, 12 Oct 2016 13:15:20 -0400
Received: from mwalle01.kse.adk.loc (unknown [194.25.174.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 269832226B;
	Wed, 12 Oct 2016 19:15:14 +0200 (CEST)
Authentication-Results: ssl.serverraum.org; dmarc=none header.from=walle.cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
	s=mail2016061301; t=1476292514;
	bh=C2YXBYv12cOcMXGnVNmnpBWHmR0GV/uA57AP1oCokdM=;
	h=From:To:Cc:Subject:Date:From;
	b=Li5GjyUtnzccHf7u5OA+0DM06lVNUHK6Sot9T0SSOqTj3dyi/FkrGSjXysWBS8Q7B
	8c+CgKisQB52X19ndtuRgk8NWuV77dkxApHyLH5X16yXLsEf+R5PJtCy9EMAg0YEgS
	5QiJtfDMePYH4RSJLwMAiNCDyLTSGyUOdvfK5eO4=
From: Michael Walle <michael@walle.cc>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Walle <michael@walle.cc>
Date: Wed, 12 Oct 2016 19:15:05 +0200
Message-Id: <1476292505-19542-1-git-send-email-michael@walle.cc>
X-Mailer: git-send-email 2.1.4
X-Virus-Scanned: clamav-milter 0.99.2 at web
X-Virus-Status: Clean
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 213.133.101.245
Subject: [Qemu-trivial] [PATCH] target-lm32: fix LOG_DIS operand order
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Oct 2016 17:15:30 -0000

The order of most opcodes with immediates was wrong (according to the
reference manual) in the (debug) logging. Additionally, one operand for the
andhi instruction was completly wrong. Fix these.

Signed-off-by: Michael Walle <michael@walle.cc>
---
 target-lm32/translate.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/target-lm32/translate.c b/target-lm32/translate.c
index 534c17c..dc64cc6 100644
--- a/target-lm32/translate.c
+++ b/target-lm32/translate.c
@@ -211,7 +211,7 @@ static void dec_and(DisasContext *dc)
 
 static void dec_andhi(DisasContext *dc)
 {
-    LOG_DIS("andhi r%d, r%d, %d\n", dc->r2, dc->r0, dc->imm16);
+    LOG_DIS("andhi r%d, r%d, %d\n", dc->r1, dc->r0, dc->imm16);
 
     tcg_gen_andi_tl(cpu_R[dc->r1], cpu_R[dc->r0], (dc->imm16 << 16));
 }
@@ -274,7 +274,7 @@ static inline void gen_cond_branch(DisasContext *dc, int cond)
 
 static void dec_be(DisasContext *dc)
 {
-    LOG_DIS("be r%d, r%d, %d\n", dc->r0, dc->r1,
+    LOG_DIS("be r%d, r%d, %d\n", dc->r1, dc->r0,
             sign_extend(dc->imm16, 16) * 4);
 
     gen_cond_branch(dc, TCG_COND_EQ);
@@ -282,7 +282,7 @@ static void dec_be(DisasContext *dc)
 
 static void dec_bg(DisasContext *dc)
 {
-    LOG_DIS("bg r%d, r%d, %d\n", dc->r0, dc->r1,
+    LOG_DIS("bg r%d, r%d, %d\n", dc->r1, dc->r0,
             sign_extend(dc->imm16, 16 * 4));
 
     gen_cond_branch(dc, TCG_COND_GT);
@@ -290,7 +290,7 @@ static void dec_bg(DisasContext *dc)
 
 static void dec_bge(DisasContext *dc)
 {
-    LOG_DIS("bge r%d, r%d, %d\n", dc->r0, dc->r1,
+    LOG_DIS("bge r%d, r%d, %d\n", dc->r1, dc->r0,
             sign_extend(dc->imm16, 16) * 4);
 
     gen_cond_branch(dc, TCG_COND_GE);
@@ -298,7 +298,7 @@ static void dec_bge(DisasContext *dc)
 
 static void dec_bgeu(DisasContext *dc)
 {
-    LOG_DIS("bgeu r%d, r%d, %d\n", dc->r0, dc->r1,
+    LOG_DIS("bgeu r%d, r%d, %d\n", dc->r1, dc->r0,
             sign_extend(dc->imm16, 16) * 4);
 
     gen_cond_branch(dc, TCG_COND_GEU);
@@ -306,7 +306,7 @@ static void dec_bgeu(DisasContext *dc)
 
 static void dec_bgu(DisasContext *dc)
 {
-    LOG_DIS("bgu r%d, r%d, %d\n", dc->r0, dc->r1,
+    LOG_DIS("bgu r%d, r%d, %d\n", dc->r1, dc->r0,
             sign_extend(dc->imm16, 16) * 4);
 
     gen_cond_branch(dc, TCG_COND_GTU);
@@ -314,7 +314,7 @@ static void dec_bgu(DisasContext *dc)
 
 static void dec_bne(DisasContext *dc)
 {
-    LOG_DIS("bne r%d, r%d, %d\n", dc->r0, dc->r1,
+    LOG_DIS("bne r%d, r%d, %d\n", dc->r1, dc->r0,
             sign_extend(dc->imm16, 16) * 4);
 
     gen_cond_branch(dc, TCG_COND_NE);
@@ -367,7 +367,7 @@ static inline void gen_compare(DisasContext *dc, int cond)
 static void dec_cmpe(DisasContext *dc)
 {
     if (dc->format == OP_FMT_RI) {
-        LOG_DIS("cmpei r%d, r%d, %d\n", dc->r0, dc->r1,
+        LOG_DIS("cmpei r%d, r%d, %d\n", dc->r1, dc->r0,
                 sign_extend(dc->imm16, 16));
     } else {
         LOG_DIS("cmpe r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
@@ -379,7 +379,7 @@ static void dec_cmpe(DisasContext *dc)
 static void dec_cmpg(DisasContext *dc)
 {
     if (dc->format == OP_FMT_RI) {
-        LOG_DIS("cmpgi r%d, r%d, %d\n", dc->r0, dc->r1,
+        LOG_DIS("cmpgi r%d, r%d, %d\n", dc->r1, dc->r0,
                 sign_extend(dc->imm16, 16));
     } else {
         LOG_DIS("cmpg r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
@@ -391,7 +391,7 @@ static void dec_cmpg(DisasContext *dc)
 static void dec_cmpge(DisasContext *dc)
 {
     if (dc->format == OP_FMT_RI) {
-        LOG_DIS("cmpgei r%d, r%d, %d\n", dc->r0, dc->r1,
+        LOG_DIS("cmpgei r%d, r%d, %d\n", dc->r1, dc->r0,
                 sign_extend(dc->imm16, 16));
     } else {
         LOG_DIS("cmpge r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
@@ -403,7 +403,7 @@ static void dec_cmpge(DisasContext *dc)
 static void dec_cmpgeu(DisasContext *dc)
 {
     if (dc->format == OP_FMT_RI) {
-        LOG_DIS("cmpgeui r%d, r%d, %d\n", dc->r0, dc->r1,
+        LOG_DIS("cmpgeui r%d, r%d, %d\n", dc->r1, dc->r0,
                 zero_extend(dc->imm16, 16));
     } else {
         LOG_DIS("cmpgeu r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
@@ -415,7 +415,7 @@ static void dec_cmpgeu(DisasContext *dc)
 static void dec_cmpgu(DisasContext *dc)
 {
     if (dc->format == OP_FMT_RI) {
-        LOG_DIS("cmpgui r%d, r%d, %d\n", dc->r0, dc->r1,
+        LOG_DIS("cmpgui r%d, r%d, %d\n", dc->r1, dc->r0,
                 zero_extend(dc->imm16, 16));
     } else {
         LOG_DIS("cmpgu r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
@@ -427,7 +427,7 @@ static void dec_cmpgu(DisasContext *dc)
 static void dec_cmpne(DisasContext *dc)
 {
     if (dc->format == OP_FMT_RI) {
-        LOG_DIS("cmpnei r%d, r%d, %d\n", dc->r0, dc->r1,
+        LOG_DIS("cmpnei r%d, r%d, %d\n", dc->r1, dc->r0,
                 sign_extend(dc->imm16, 16));
     } else {
         LOG_DIS("cmpne r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
@@ -539,7 +539,7 @@ static void dec_modu(DisasContext *dc)
 static void dec_mul(DisasContext *dc)
 {
     if (dc->format == OP_FMT_RI) {
-        LOG_DIS("muli r%d, r%d, %d\n", dc->r0, dc->r1,
+        LOG_DIS("muli r%d, r%d, %d\n", dc->r1, dc->r0,
                 sign_extend(dc->imm16, 16));
     } else {
         LOG_DIS("mul r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
@@ -563,7 +563,7 @@ static void dec_mul(DisasContext *dc)
 static void dec_nor(DisasContext *dc)
 {
     if (dc->format == OP_FMT_RI) {
-        LOG_DIS("nori r%d, r%d, %d\n", dc->r0, dc->r1,
+        LOG_DIS("nori r%d, r%d, %d\n", dc->r1, dc->r0,
                 zero_extend(dc->imm16, 16));
     } else {
         LOG_DIS("nor r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
@@ -959,7 +959,7 @@ static void dec_wcsr(DisasContext *dc)
 static void dec_xnor(DisasContext *dc)
 {
     if (dc->format == OP_FMT_RI) {
-        LOG_DIS("xnori r%d, r%d, %d\n", dc->r0, dc->r1,
+        LOG_DIS("xnori r%d, r%d, %d\n", dc->r1, dc->r0,
                 zero_extend(dc->imm16, 16));
     } else {
         if (dc->r1 == R_R0) {
@@ -981,7 +981,7 @@ static void dec_xnor(DisasContext *dc)
 static void dec_xor(DisasContext *dc)
 {
     if (dc->format == OP_FMT_RI) {
-        LOG_DIS("xori r%d, r%d, %d\n", dc->r0, dc->r1,
+        LOG_DIS("xori r%d, r%d, %d\n", dc->r1, dc->r0,
                 zero_extend(dc->imm16, 16));
     } else {
         LOG_DIS("xor r%d, r%d, r%d\n", dc->r2, dc->r0, dc->r1);
-- 
2.1.4


