Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QFT6a-0001tR-VM
	for mharc-qemu-trivial@gnu.org; Thu, 28 Apr 2011 11:26:12 -0400
Received: from eggs.gnu.org ([140.186.70.92]:52820)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT6V-0001ij-AH
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:26:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT6R-0007g5-L0
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:26:07 -0400
Received: from moutng.kundenserver.de ([212.227.17.8]:63439)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT6I-0007dW-8x; Thu, 28 Apr 2011 11:25:54 -0400
Received: from flocke.fritz.box (p5086FD13.dip.t-dialin.net [80.134.253.19])
	by mrelayeu.kundenserver.de (node=mrbap3) with ESMTP (Nemesis)
	id 0MPoeo-1QBdX03Qyw-0054We; Thu, 28 Apr 2011 17:20:49 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1M-0002Bo-1K; Thu, 28 Apr 2011 17:20:48 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu, 28 Apr 2011 17:20:38 +0200
Message-Id: <1304004042-8334-14-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
References: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
X-Provags-ID: V02:K0:Qkx/timBLVxrvZS6ogXRABrNLSTjr7nyqAxXYZvkInG
	e11M/snTjj65AU4+Rq51YO15dlvXIUsCpJkkSxkXi0JeEttxEW
	WnZBgWFiSEC71JX3Fou3hmSK/Z/0x3ockvZZVfcc1t2O9FFMxk
	V0gl93y37y7lBYQrrsDaQo5RK7GcJWiMmANG0GMDR6oNeeVMUi
	8vGhSGjOFqDlE1bKyqYaNxiY/mxHr41U14FGCXSRE8MXrIUs5X vN4nfiamHapTi
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.17.8
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH 14/18] Fix typos in comments and code
	(occured -> occurred and related)
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
X-List-Received-Date: Thu, 28 Apr 2011 15:26:11 -0000

The code changed here is an unused data type name (evt_flush_occurred).

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 block.c                |    2 +-
 block/qcow2-refcount.c |    2 +-
 cpu-all.h              |    2 +-
 cpu-exec.c             |    2 +-
 hw/bt.h                |    2 +-
 hw/pcie.c              |    2 +-
 hw/pcie.h              |    2 +-
 hw/pflash_cfi02.c      |    2 +-
 target-arm/translate.c |    6 +++---
 target-m68k/helper.c   |    2 +-
 10 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/block.c b/block.c
index f731c7a..e346c1e 100644
--- a/block.c
+++ b/block.c
@@ -747,7 +747,7 @@ DeviceState *bdrv_get_attached(BlockDriverState *bs)
  * Run consistency checks on an image
  *
  * Returns 0 if the check could be completed (it doesn't mean that the image is
- * free of errors) or -errno when an internal error occured. The results of the
+ * free of errors) or -errno when an internal error occurred. The results of the
  * check are stored in res.
  */
 int bdrv_check(BlockDriverState *bs, BdrvCheckResult *res)
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index 915d85a..d62dc1c 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1063,7 +1063,7 @@ fail:
  * Checks an image for refcount consistency.
  *
  * Returns 0 if no errors are found, the number of errors in case the image is
- * detected as corrupted, and -errno when an internal error occured.
+ * detected as corrupted, and -errno when an internal error occurred.
  */
 int qcow2_check_refcounts(BlockDriverState *bs, BdrvCheckResult *res)
 {
diff --git a/cpu-all.h b/cpu-all.h
index 0bae6df..7fd0a50 100644
--- a/cpu-all.h
+++ b/cpu-all.h
@@ -792,7 +792,7 @@ extern CPUState *cpu_single_env;
 #define CPU_INTERRUPT_FIQ    0x10 /* Fast interrupt pending.  */
 #define CPU_INTERRUPT_HALT   0x20 /* CPU halt wanted */
 #define CPU_INTERRUPT_SMI    0x40 /* (x86 only) SMI interrupt pending */
-#define CPU_INTERRUPT_DEBUG  0x80 /* Debug event occured.  */
+#define CPU_INTERRUPT_DEBUG  0x80 /* Debug event occurred.  */
 #define CPU_INTERRUPT_VIRQ   0x100 /* virtual interrupt pending.  */
 #define CPU_INTERRUPT_NMI    0x200 /* NMI pending. */
 #define CPU_INTERRUPT_INIT   0x400 /* INIT pending. */
diff --git a/cpu-exec.c b/cpu-exec.c
index 2cdcdc5..1b20f7b 100644
--- a/cpu-exec.c
+++ b/cpu-exec.c
@@ -509,7 +509,7 @@ int cpu_exec(CPUState *env1)
                        jump normally, then does the exception return when the
                        CPU tries to execute code at the magic address.
                        This will cause the magic PC value to be pushed to
-                       the stack if an interrupt occured at the wrong time.
+                       the stack if an interrupt occurred at the wrong time.
                        We avoid this by disabling interrupts when
                        pc contains a magic address.  */
                     if (interrupt_request & CPU_INTERRUPT_HARD
diff --git a/hw/bt.h b/hw/bt.h
index 4a702ad..3797254 100644
--- a/hw/bt.h
+++ b/hw/bt.h
@@ -1441,7 +1441,7 @@ typedef struct {
 #define EVT_FLUSH_OCCURRED		0x11
 typedef struct {
     uint16_t	handle;
-} __attribute__ ((packed)) evt_flush_occured;
+} __attribute__ ((packed)) evt_flush_occurred;
 #define EVT_FLUSH_OCCURRED_SIZE 2
 
 #define EVT_ROLE_CHANGE			0x12
diff --git a/hw/pcie.c b/hw/pcie.c
index 9de6149..39607bf 100644
--- a/hw/pcie.c
+++ b/hw/pcie.c
@@ -176,7 +176,7 @@ static void hotplug_event_notify(PCIDevice *dev)
 }
 
 /*
- * A PCI Express Hot-Plug Event has occured, so update slot status register
+ * A PCI Express Hot-Plug Event has occurred, so update slot status register
  * and notify OS of the event if necessary.
  *
  * 6.7.3 PCI Express Hot-Plug Events
diff --git a/hw/pcie.h b/hw/pcie.h
index bc909e2..a213fba 100644
--- a/hw/pcie.h
+++ b/hw/pcie.h
@@ -40,7 +40,7 @@ typedef enum {
      *
      * Not all the bits of slot control register match with the ones of
      * slot status. Not some bits of slot status register is used to
-     * show status, not to report event occurence.
+     * show status, not to report event occurrence.
      * So such bits must be masked out when checking the software
      * notification condition.
      */
diff --git a/hw/pflash_cfi02.c b/hw/pflash_cfi02.c
index 14bbc34..8fdafe6 100644
--- a/hw/pflash_cfi02.c
+++ b/hw/pflash_cfi02.c
@@ -367,7 +367,7 @@ static void pflash_write (pflash_t *pfl, target_phys_addr_t offset,
     case 4:
         switch (pfl->cmd) {
         case 0xA0:
-            /* Ignore writes while flash data write is occuring */
+            /* Ignore writes while flash data write is occurring */
             /* As we suppose write is immediate, this should never happen */
             return;
         case 0x80:
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 3119137..59190f6 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -1331,7 +1331,7 @@ static inline int gen_iwmmxt_shift(uint32_t insn, uint32_t mask, TCGv dest)
     return 0;
 }
 
-/* Disassemble an iwMMXt instruction.  Returns nonzero if an error occured
+/* Disassemble an iwMMXt instruction.  Returns nonzero if an error occurred
    (ie. an undefined instruction).  */
 static int disas_iwmmxt_insn(CPUState *env, DisasContext *s, uint32_t insn)
 {
@@ -2335,7 +2335,7 @@ static int disas_iwmmxt_insn(CPUState *env, DisasContext *s, uint32_t insn)
     return 0;
 }
 
-/* Disassemble an XScale DSP instruction.  Returns nonzero if an error occured
+/* Disassemble an XScale DSP instruction.  Returns nonzero if an error occurred
    (ie. an undefined instruction).  */
 static int disas_dsp_insn(CPUState *env, DisasContext *s, uint32_t insn)
 {
@@ -2681,7 +2681,7 @@ static TCGv gen_load_and_replicate(DisasContext *s, TCGv addr, int size)
     return tmp;
 }
 
-/* Disassemble a VFP instruction.  Returns nonzero if an error occured
+/* Disassemble a VFP instruction.  Returns nonzero if an error occurred
    (ie. an undefined instruction).  */
 static int disas_vfp_insn(CPUState * env, DisasContext *s, uint32_t insn)
 {
diff --git a/target-m68k/helper.c b/target-m68k/helper.c
index 514b039..faa8c42 100644
--- a/target-m68k/helper.c
+++ b/target-m68k/helper.c
@@ -714,7 +714,7 @@ void HELPER(macsats)(CPUState *env, uint32_t acc)
     if (env->macsr & MACSR_V) {
         env->macsr |= MACSR_PAV0 << acc;
         if (env->macsr & MACSR_OMC) {
-            /* The result is saturated to 32 bits, despite overflow occuring
+            /* The result is saturated to 32 bits, despite overflow occurring
                at 48 bits.  Seems weird, but that's what the hardware docs
                say.  */
             result = (result >> 63) ^ 0x7fffffff;
-- 
1.7.2.5


