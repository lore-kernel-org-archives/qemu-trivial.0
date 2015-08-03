Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMBq9-0005pU-CI
	for mharc-qemu-trivial@gnu.org; Mon, 03 Aug 2015 05:15:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpu-0005Pf-NP
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpq-0003Ib-Up
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:10 -0400
Received: from mail-wi0-f174.google.com ([209.85.212.174]:32851)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMBpq-0003Gm-PI
	for qemu-trivial@nongnu.org; Mon, 03 Aug 2015 05:15:06 -0400
Received: by wicmv11 with SMTP id mv11so127065675wic.0
	for <qemu-trivial@nongnu.org>; Mon, 03 Aug 2015 02:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=fpBZ8yOG2dhlhiqFIs5vF0I5QaJmCP2GT3T3/KF1Yks=;
	b=BS6OikXlzSy9GAbVURHOOdidlT3W1j2m5u7Qpk1r/iNrOMPbKelBBsBSzUhxs4Y1C3
	VPDRdmvsa5bxYs2YDjTlBYoY0+j2udztKIBl+Dc7w99IwVCPM9ZrBG/l7tkFiWWfc9sL
	hBkuakPoePZ6y3yhlcMNTiKL6LefCsTI11YU53Gh1eFM2OrmKRXgyLfsTFoA5UU7GcSw
	1D3glxAAGTqetDYt47PNEMJ80Lrg/bF3UztiqMNzGb7Q6sj85nymNqn5M+9LaKQrYg3e
	rhsHxsDVofhumEeOps3ZQyaTIn8Fqsz67KvvMKlJ5jzzJInKkbrbqdR9fxZvIASaKcX8
	WSiA==
X-Gm-Message-State: ALoCoQnzuuFmj9ju4MfF/vh3szizuACf9P/BWi7s3GRj6wFNX9PxAfmpPtOJnwzXZ0UHyjIeIqNS
X-Received: by 10.180.94.7 with SMTP id cy7mr29695066wib.79.1438593306307;
	Mon, 03 Aug 2015 02:15:06 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	m4sm21812180wjb.37.2015.08.03.02.15.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Aug 2015 02:15:04 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id D7ED53E08A5;
	Mon,  3 Aug 2015 10:15:00 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  3 Aug 2015 10:14:49 +0100
Message-Id: <1438593291-27109-10-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.174
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	crosthwaitepeter@gmail.com, pbonzini@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, rth@twiddle.net
Subject: [Qemu-trivial] [PATCH v4 09/11] target-arm: dfilter support for
	in_asm, op, opt_op
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
X-List-Received-Date: Mon, 03 Aug 2015 09:15:13 -0000

Each individual architecture needs to use the qemu_log_in_addr_range()
feature for enabling in_asm and marking blocks for op/opt_op output.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target-arm/translate-a64.c | 6 ++++--
 target-arm/translate.c     | 6 ++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 689f2be..0b0f4ae 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -11026,7 +11026,8 @@ void gen_intermediate_code_internal_a64(ARMCPU *cpu,
             gen_io_start();
         }
 
-        if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP | CPU_LOG_TB_OP_OPT))) {
+        if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP | CPU_LOG_TB_OP_OPT) &&
+                     qemu_log_in_addr_range(dc->pc))) {
             tcg_gen_debug_insn_start(dc->pc);
         }
 
@@ -11131,7 +11132,8 @@ done_generating:
     gen_tb_end(tb, num_insns);
 
 #ifdef DEBUG_DISAS
-    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)) {
+    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM) &&
+        qemu_log_in_addr_range(pc_start)) {
         qemu_log("----------------\n");
         qemu_log("IN: %s\n", lookup_symbol(pc_start));
         log_target_disas(cs, pc_start, dc->pc - pc_start,
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 69ac18c..c914be0 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -11316,7 +11316,8 @@ static inline void gen_intermediate_code_internal(ARMCPU *cpu,
         if (num_insns + 1 == max_insns && (tb->cflags & CF_LAST_IO))
             gen_io_start();
 
-        if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP | CPU_LOG_TB_OP_OPT))) {
+        if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP | CPU_LOG_TB_OP_OPT)) &&
+            qemu_log_in_addr_range(dc->pc)) {
             tcg_gen_debug_insn_start(dc->pc);
         }
 
@@ -11489,7 +11490,8 @@ done_generating:
     gen_tb_end(tb, num_insns);
 
 #ifdef DEBUG_DISAS
-    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)) {
+    if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM) &&
+        qemu_log_in_addr_range(pc_start)) {
         qemu_log("----------------\n");
         qemu_log("IN: %s\n", lookup_symbol(pc_start));
         log_target_disas(cs, pc_start, dc->pc - pc_start,
-- 
2.5.0


