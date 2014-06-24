Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzTI4-0005PE-ER
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 12:09:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTHx-0005As-0d
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:09:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTHq-000502-QQ
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:09:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55773)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WzTHf-0004w1-3G; Tue, 24 Jun 2014 12:09:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7AA5F44083;
	Tue, 24 Jun 2014 20:09:22 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 570CB6B2;
	Tue, 24 Jun 2014 20:09:22 +0400 (MSK)
Received: (nullmailer pid 15613 invoked by uid 1000);
	Tue, 24 Jun 2014 16:09:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 24 Jun 2014 20:09:08 +0400
Message-Id: <1403626160-15546-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 02/14] Fix new typos (found by codespell)
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
X-List-Received-Date: Tue, 24 Jun 2014 16:09:47 -0000

From: Stefan Weil <sw@weilnetz.de>

* accomodate -> accommodate
* aquiring -> acquiring
* beacuse -> because
* loosing -> losing
* prefering -> preferring
* threshhold -> threshold

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/iscsi.c                  |    2 +-
 hw/input/hid.c                 |    2 +-
 target-arm/helper.c            |    2 +-
 tcg/mips/tcg-target.c          |    4 ++--
 tests/qemu-iotests/common.qemu |    2 +-
 translate-all.c                |    2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index 84aa22a..f3e83e2 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -101,7 +101,7 @@ typedef struct IscsiAIOCB {
 #define ISCSI_CMD_RETRIES ARRAY_SIZE(iscsi_retry_times)
 static const unsigned iscsi_retry_times[] = {8, 32, 128, 512, 2048};
 
-/* this threshhold is a trade-off knob to choose between
+/* this threshold is a trade-off knob to choose between
  * the potential additional overhead of an extra GET_LBA_STATUS request
  * vs. unnecessarily reading a lot of zero sectors over the wire.
  * If a read request is greater or equal than ISCSI_CHECKALLOC_THRES
diff --git a/hw/input/hid.c b/hw/input/hid.c
index 295bdab..9656e90 100644
--- a/hw/input/hid.c
+++ b/hw/input/hid.c
@@ -164,7 +164,7 @@ static void hid_pointer_sync(DeviceState *dev)
 
     if (hs->n == QUEUE_LENGTH-1) {
         /*
-         * Queue full.  We are loosing information, but we at least
+         * Queue full.  We are losing information, but we at least
          * keep track of most recent button state.
          */
         return;
diff --git a/target-arm/helper.c b/target-arm/helper.c
index ed4d2bb..d343856 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -2350,7 +2350,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
             { .name = "ID_AA64DFR0_EL1", .state = ARM_CP_STATE_AA64,
               .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 5, .opc2 = 0,
               .access = PL1_R, .type = ARM_CP_CONST,
-              /* We mask out the PMUVer field, beacuse we don't currently
+              /* We mask out the PMUVer field, because we don't currently
                * implement the PMU. Not advertising it prevents the guest
                * from trying to use it and getting UNDEFs on registers we
                * don't implement.
diff --git a/tcg/mips/tcg-target.c b/tcg/mips/tcg-target.c
index 8855d50..9cce356 100644
--- a/tcg/mips/tcg-target.c
+++ b/tcg/mips/tcg-target.c
@@ -781,7 +781,7 @@ static void tcg_out_brcond2(TCGContext *s, TCGCond cond, TCGReg al, TCGReg ah,
         break;
 
     default:
-        /* Minimize code size by prefering a compare not requiring INV.  */
+        /* Minimize code size by preferring a compare not requiring INV.  */
         if (mips_cmp_map[cond] & MIPS_CMP_INV) {
             cond = tcg_invert_cond(cond);
             b_cond = TCG_COND_EQ;
@@ -810,7 +810,7 @@ static void tcg_out_movcond(TCGContext *s, TCGCond cond, TCGReg ret,
         break;
 
     default:
-        /* Minimize code size by prefering a compare not requiring INV.  */
+        /* Minimize code size by preferring a compare not requiring INV.  */
         if (mips_cmp_map[cond] & MIPS_CMP_INV) {
             cond = tcg_invert_cond(cond);
             m_opc = OPC_MOVZ;
diff --git a/tests/qemu-iotests/common.qemu b/tests/qemu-iotests/common.qemu
index 918af31..ee7ebb4 100644
--- a/tests/qemu-iotests/common.qemu
+++ b/tests/qemu-iotests/common.qemu
@@ -103,7 +103,7 @@ function _send_qemu_cmd()
         count=${qemu_cmd_repeat}
         use_error="no"
     fi
-    # This array element extraction is done to accomodate pathnames with spaces
+    # This array element extraction is done to accommodate pathnames with spaces
     cmd=${@: 1:${#@}-1}
     shift $(($# - 1))
 
diff --git a/translate-all.c b/translate-all.c
index 5425d03..8f7e11b 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -594,7 +594,7 @@ static inline void *alloc_code_gen_buffer(void)
 
 #ifdef __mips__
     if (cross_256mb(buf, tcg_ctx.code_gen_buffer_size)) {
-        /* Try again, with the original still mapped, to avoid re-aquiring
+        /* Try again, with the original still mapped, to avoid re-acquiring
            that 256mb crossing.  This time don't specify an address.  */
         size_t size2, size1 = tcg_ctx.code_gen_buffer_size;
         void *buf2 = mmap(NULL, size1, PROT_WRITE | PROT_READ | PROT_EXEC,
-- 
1.7.10.4


