Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c8Bg9-0002EF-ER
	for mharc-qemu-trivial@gnu.org; Sat, 19 Nov 2016 14:52:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1c8Bg6-0002Cf-Tq
	for qemu-trivial@nongnu.org; Sat, 19 Nov 2016 14:52:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1c8Bg5-0005ck-K8
	for qemu-trivial@nongnu.org; Sat, 19 Nov 2016 14:51:58 -0500
Received: from [2a03:4000:1::4e2f:c7ac:d] (port=51876 helo=mail.weilnetz.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1c8Bg0-0005bX-QD; Sat, 19 Nov 2016 14:51:53 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id E609A11822A7;
	Sat, 19 Nov 2016 20:51:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 4oqg0o0tivO4; Sat, 19 Nov 2016 20:51:49 +0100 (CET)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
	by mail.weilnetz.de (Postfix) with ESMTP id 9C37311822AB;
	Sat, 19 Nov 2016 20:51:05 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 7E8B44677CA; Sat, 19 Nov 2016 20:51:05 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
	Stefan Weil <sw@weilnetz.de>
Date: Sat, 19 Nov 2016 20:50:55 +0100
Message-Id: <20161119195055.19941-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.10.2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2a03:4000:1::4e2f:c7ac:d
Subject: [Qemu-trivial] [PATCH for-2.8] target-*: Fix typos found by
 codespell
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
X-List-Received-Date: Sat, 19 Nov 2016 19:52:00 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 target-i386/translate.c   | 2 +-
 target-m68k/translate.c   | 6 +++---
 target-ppc/cpu.h          | 2 +-
 target-ppc/excp_helper.c  | 2 +-
 target-ppc/int_helper.c   | 2 +-
 target-ppc/mmu-hash64.c   | 2 +-
 target-s390x/cpu_models.c | 2 +-
 target-s390x/cpu_models.h | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target-i386/translate.c b/target-i386/translate.c
index 324103c..d8ca6df 100644
--- a/target-i386/translate.c
+++ b/target-i386/translate.c
@@ -6701,7 +6701,7 @@ static target_ulong disas_insn(CPUX86State *env, DisasContext *s,
         if (s->prefix & PREFIX_LOCK) {
             switch (op) {
             case 0: /* bt */
-                /* Needs no atomic ops; we surpressed the normal
+                /* Needs no atomic ops; we suppressed the normal
                    memory load for LOCK above so do it now.  */
                 gen_op_ld_v(s, ot, cpu_T0, cpu_A0);
                 break;
diff --git a/target-m68k/translate.c b/target-m68k/translate.c
index 9ad974f..cab2d58 100644
--- a/target-m68k/translate.c
+++ b/target-m68k/translate.c
@@ -1579,7 +1579,7 @@ DISAS_INSN(negx)
 
     gen_flush_flags(s); /* compute old Z */
 
-    /* Perform substract with borrow.
+    /* Perform subtract with borrow.
      * (X, N) =  -(src + X);
      */
 
@@ -2067,7 +2067,7 @@ static inline void gen_subx(DisasContext *s, TCGv src, TCGv dest, int opsize)
 
     gen_flush_flags(s); /* compute old Z */
 
-    /* Perform substract with borrow.
+    /* Perform subtract with borrow.
      * (X, N) = dest - (src + X);
      */
 
@@ -2077,7 +2077,7 @@ static inline void gen_subx(DisasContext *s, TCGv src, TCGv dest, int opsize)
     gen_ext(QREG_CC_N, QREG_CC_N, opsize, 1);
     tcg_gen_andi_i32(QREG_CC_X, QREG_CC_X, 1);
 
-    /* Compute signed-overflow for substract.  */
+    /* Compute signed-overflow for subtract.  */
 
     tcg_gen_xor_i32(QREG_CC_V, QREG_CC_N, dest);
     tcg_gen_xor_i32(tmp, dest, src);
diff --git a/target-ppc/cpu.h b/target-ppc/cpu.h
index 1c90adb..f65d318 100644
--- a/target-ppc/cpu.h
+++ b/target-ppc/cpu.h
@@ -2234,7 +2234,7 @@ enum {
     PPC_INTERRUPT_CDOORBELL,      /* Critical doorbell interrupt          */
     PPC_INTERRUPT_DOORBELL,       /* Doorbell interrupt                   */
     PPC_INTERRUPT_PERFM,          /* Performance monitor interrupt        */
-    PPC_INTERRUPT_HMI,            /* Hypervisor Maintainance interrupt    */
+    PPC_INTERRUPT_HMI,            /* Hypervisor Maintenance interrupt     */
     PPC_INTERRUPT_HDOORBELL,      /* Hypervisor Doorbell interrupt        */
 };
 
diff --git a/target-ppc/excp_helper.c b/target-ppc/excp_helper.c
index 93369d4..678e125 100644
--- a/target-ppc/excp_helper.c
+++ b/target-ppc/excp_helper.c
@@ -139,7 +139,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         }
     }
 
-    /* Exception targetting modifiers
+    /* Exception targeting modifiers
      *
      * LPES0 is supported on POWER7/8
      * LPES1 is not supported (old iSeries mode)
diff --git a/target-ppc/int_helper.c b/target-ppc/int_helper.c
index 9ac204a..5d4a571 100644
--- a/target-ppc/int_helper.c
+++ b/target-ppc/int_helper.c
@@ -155,7 +155,7 @@ target_ulong helper_cnttzw(target_ulong t)
 /* if x = 0xab, returns 0xababababababababa */
 #define pattern(x) (((x) & 0xff) * (~(target_ulong)0 / 0xff))
 
-/* substract 1 from each byte, and with inverse, check if MSB is set at each
+/* subtract 1 from each byte, and with inverse, check if MSB is set at each
  * byte.
  * i.e. ((0x00 - 0x01) & ~(0x00)) & 0x80
  *      (0xFF & 0xFF) & 0x80 = 0x80 (zero found)
diff --git a/target-ppc/mmu-hash64.c b/target-ppc/mmu-hash64.c
index fdb7a78..4f5d9f6 100644
--- a/target-ppc/mmu-hash64.c
+++ b/target-ppc/mmu-hash64.c
@@ -691,7 +691,7 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
 
     /* Note on LPCR usage: 970 uses HID4, but our special variant
      * of store_spr copies relevant fields into env->spr[SPR_LPCR].
-     * Similarily we filter unimplemented bits when storing into
+     * Similarly we filter unimplemented bits when storing into
      * LPCR depending on the MMU version. This code can thus just
      * use the LPCR "as-is".
      */
diff --git a/target-s390x/cpu_models.c b/target-s390x/cpu_models.c
index c1e729d..a4d46f3 100644
--- a/target-s390x/cpu_models.c
+++ b/target-s390x/cpu_models.c
@@ -38,7 +38,7 @@
     }
 
 /*
- * CPU definiton list in order of release. For now, base features of a
+ * CPU definition list in order of release. For now, base features of a
  * following release are always a subset of base features of the previous
  * release. Same is correct for the other feature sets.
  * A BC release always follows the corresponding EC release.
diff --git a/target-s390x/cpu_models.h b/target-s390x/cpu_models.h
index 136a602..b76ea54 100644
--- a/target-s390x/cpu_models.h
+++ b/target-s390x/cpu_models.h
@@ -23,7 +23,7 @@ typedef struct S390CPUDef {
     uint8_t gen;            /* hw generation identification */
     uint16_t type;          /* cpu type identification */
     uint8_t ec_ga;          /* EC GA version (on which also the BC is based) */
-    uint8_t mha_pow;        /* Maximum Host Adress Power, mha = 2^pow-1 */
+    uint8_t mha_pow;        /* Maximum Host Address Power, mha = 2^pow-1 */
     uint32_t hmfai;         /* hypervisor-managed facilities */
     /* base/min features, must never be changed between QEMU versions */
     S390FeatBitmap base_feat;
-- 
2.10.2


