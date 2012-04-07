Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SGQ0E-0002AE-Kp
	for mharc-qemu-trivial@gnu.org; Sat, 07 Apr 2012 03:24:06 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SGQ06-0001k6-Bx
	for qemu-trivial@nongnu.org; Sat, 07 Apr 2012 03:24:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SGQ03-0008K2-D3
	for qemu-trivial@nongnu.org; Sat, 07 Apr 2012 03:23:57 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:38717)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SGPzw-0008Hs-OM; Sat, 07 Apr 2012 03:23:48 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	51F3972800B4; Sat,  7 Apr 2012 09:23:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id FfvdHNjAwSp5; Sat,  7 Apr 2012 09:23:46 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 6689972800B7; Sat,  7 Apr 2012 09:23:45 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat,  7 Apr 2012 09:23:39 +0200
Message-Id: <1333783419-7982-5-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <1333783419-7982-1-git-send-email-sw@weilnetz.de>
References: <1333783419-7982-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>, Alexander Graf <agraf@suse.de>,
	Blue Swirl <blauwirbel@gmail.com>, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH 4/4] Replace Qemu by QEMU in comments
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
X-List-Received-Date: Sat, 07 Apr 2012 07:24:02 -0000

The official spelling is QEMU.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/ivshmem.c                |    2 +-
 hw/pc.c                     |    2 +-
 hw/ppc440_bamboo.c          |    2 +-
 hw/ppce500_mpc8544ds.c      |    2 +-
 hw/ps2.c                    |    2 +-
 hw/sun4m.c                  |   12 ++++++------
 ppc-dis.c                   |    2 +-
 qemu-queue.h                |    2 +-
 target-alpha/cpu.h          |    2 +-
 target-mips/cpu.h           |    2 +-
 target-ppc/cpu.h            |    6 +++---
 target-ppc/helper.c         |    8 ++++----
 target-ppc/kvm.c            |    2 +-
 target-ppc/kvm_ppc.c        |    2 +-
 target-ppc/translate_init.c |   24 ++++++++++++------------
 ui/cocoa.m                  |    2 +-
 ui/spice-display.c          |    2 +-
 17 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/hw/ivshmem.c b/hw/ivshmem.c
index 64e1cd9..b80aa8f 100644
--- a/hw/ivshmem.c
+++ b/hw/ivshmem.c
@@ -565,7 +565,7 @@ static void ivshmem_setup_msi(IVShmemState * s) {
         msix_vector_use(&s->dev, i);
     }
 
-    /* allocate Qemu char devices for receiving interrupts */
+    /* allocate QEMU char devices for receiving interrupts */
     s->eventfd_table = g_malloc0(s->vectors * sizeof(EventfdEntry));
 }
 
diff --git a/hw/pc.c b/hw/pc.c
index 83a1b5b..67f0479 100644
--- a/hw/pc.c
+++ b/hw/pc.c
@@ -776,7 +776,7 @@ static void load_linux(void *fw_cfg,
     }
 
     /* loader type */
-    /* High nybble = B reserved for Qemu; low nybble is revision number.
+    /* High nybble = B reserved for QEMU; low nybble is revision number.
        If this code is substantially changed, you may want to consider
        incrementing the revision. */
     if (protocol >= 0x200)
diff --git a/hw/ppc440_bamboo.c b/hw/ppc440_bamboo.c
index 220c81d..f0a3ae4 100644
--- a/hw/ppc440_bamboo.c
+++ b/hw/ppc440_bamboo.c
@@ -1,5 +1,5 @@
 /*
- * Qemu PowerPC 440 Bamboo board emulation
+ * QEMU PowerPC 440 Bamboo board emulation
  *
  * Copyright 2007 IBM Corporation.
  * Authors:
diff --git a/hw/ppce500_mpc8544ds.c b/hw/ppce500_mpc8544ds.c
index 5ee8cb3..22aee23 100644
--- a/hw/ppce500_mpc8544ds.c
+++ b/hw/ppce500_mpc8544ds.c
@@ -1,5 +1,5 @@
 /*
- * Qemu PowerPC MPC8544DS board emualtion
+ * QEMU PowerPC MPC8544DS board emulation
  *
  * Copyright (C) 2009 Freescale Semiconductor, Inc. All rights reserved.
  *
diff --git a/hw/ps2.c b/hw/ps2.c
index b1a67bc..f93cd24 100644
--- a/hw/ps2.c
+++ b/hw/ps2.c
@@ -88,7 +88,7 @@ typedef struct {
 typedef struct {
     PS2State common;
     int scan_enabled;
-    /* Qemu uses translated PC scancodes internally.  To avoid multiple
+    /* QEMU uses translated PC scancodes internally.  To avoid multiple
        conversions we do the translation (if any) in the PS/2 emulation
        not the keyboard controller.  */
     int translate;
diff --git a/hw/sun4m.c b/hw/sun4m.c
index 7bcbf37..2befbfe 100644
--- a/hw/sun4m.c
+++ b/hw/sun4m.c
@@ -932,8 +932,8 @@ static void sun4m_hw_init(const struct sun4m_hwdef *hwdef, ram_addr_t RAM_size,
 
     slavio_serial_ms_kbd_init(hwdef->ms_kb_base, slavio_irq[14],
                               display_type == DT_NOGRAPHIC, ESCC_CLOCK, 1);
-    // Slavio TTYA (base+4, Linux ttyS0) is the first Qemu serial device
-    // Slavio TTYB (base+0, Linux ttyS1) is the second Qemu serial device
+    // Slavio TTYA (base+4, Linux ttyS0) is the first QEMU serial device
+    // Slavio TTYB (base+0, Linux ttyS1) is the second QEMU serial device
     escc_init(hwdef->serial_base, slavio_irq[15], slavio_irq[15],
               serial_hds[0], serial_hds[1], ESCC_CLOCK, 1);
 
@@ -1581,8 +1581,8 @@ static void sun4d_hw_init(const struct sun4d_hwdef *hwdef, ram_addr_t RAM_size,
 
     slavio_serial_ms_kbd_init(hwdef->ms_kb_base, sbi_irq[12],
                               display_type == DT_NOGRAPHIC, ESCC_CLOCK, 1);
-    // Slavio TTYA (base+4, Linux ttyS0) is the first Qemu serial device
-    // Slavio TTYB (base+0, Linux ttyS1) is the second Qemu serial device
+    // Slavio TTYA (base+4, Linux ttyS0) is the first QEMU serial device
+    // Slavio TTYB (base+0, Linux ttyS1) is the second QEMU serial device
     escc_init(hwdef->serial_base, sbi_irq[12], sbi_irq[12],
               serial_hds[0], serial_hds[1], ESCC_CLOCK, 1);
 
@@ -1762,8 +1762,8 @@ static void sun4c_hw_init(const struct sun4c_hwdef *hwdef, ram_addr_t RAM_size,
 
     slavio_serial_ms_kbd_init(hwdef->ms_kb_base, slavio_irq[1],
                               display_type == DT_NOGRAPHIC, ESCC_CLOCK, 1);
-    // Slavio TTYA (base+4, Linux ttyS0) is the first Qemu serial device
-    // Slavio TTYB (base+0, Linux ttyS1) is the second Qemu serial device
+    // Slavio TTYA (base+4, Linux ttyS0) is the first QEMU serial device
+    // Slavio TTYB (base+0, Linux ttyS1) is the second QEMU serial device
     escc_init(hwdef->serial_base, slavio_irq[1],
               slavio_irq[1], serial_hds[0], serial_hds[1],
               ESCC_CLOCK, 1);
diff --git a/ppc-dis.c b/ppc-dis.c
index ffdbec1..bc98cbe 100644
--- a/ppc-dis.c
+++ b/ppc-dis.c
@@ -5152,7 +5152,7 @@ powerpc_dialect (struct disassemble_info *info)
   return dialect;
 }
 
-/* Qemu default */
+/* QEMU default */
 int
 print_insn_ppc (bfd_vma memaddr, struct disassemble_info *info)
 {
diff --git a/qemu-queue.h b/qemu-queue.h
index 74d7122..9288cd8 100644
--- a/qemu-queue.h
+++ b/qemu-queue.h
@@ -1,7 +1,7 @@
 /*      $NetBSD: queue.h,v 1.52 2009/04/20 09:56:08 mschuett Exp $ */
 
 /*
- * Qemu version: Copy from netbsd, removed debug code, removed some of
+ * QEMU version: Copy from netbsd, removed debug code, removed some of
  * the implementations.  Left in singly-linked lists, lists, simple
  * queues, and tail queues.
  */
diff --git a/target-alpha/cpu.h b/target-alpha/cpu.h
index 6c5d28b..74bf7f7 100644
--- a/target-alpha/cpu.h
+++ b/target-alpha/cpu.h
@@ -276,7 +276,7 @@ struct CPUAlphaState {
     target_ulong t0, t1;
 #endif
 
-    /* Those resources are used only in Qemu core */
+    /* Those resources are used only in QEMU core */
     CPU_COMMON
 
     int error_code;
diff --git a/target-mips/cpu.h b/target-mips/cpu.h
index 7430aa5..257c4c4 100644
--- a/target-mips/cpu.h
+++ b/target-mips/cpu.h
@@ -418,7 +418,7 @@ struct CPUMIPSState {
     /* We waste some space so we can handle shadow registers like TCs. */
     TCState tcs[MIPS_SHADOW_SET_MAX];
     CPUMIPSFPUContext fpus[MIPS_FPU_MAX];
-    /* Qemu */
+    /* QEMU */
     int error_code;
     uint32_t hflags;    /* CPU State */
     /* TMASK defines different execution modes */
diff --git a/target-ppc/cpu.h b/target-ppc/cpu.h
index ca6f1cb..e7fb364 100644
--- a/target-ppc/cpu.h
+++ b/target-ppc/cpu.h
@@ -233,10 +233,10 @@ enum {
     POWERPC_EXCP_DTLBE    = 93, /* Data TLB error                            */
     /* EOL                                                                   */
     POWERPC_EXCP_NB       = 96,
-    /* Qemu exceptions: used internally during code translation              */
+    /* QEMU exceptions: used internally during code translation              */
     POWERPC_EXCP_STOP         = 0x200, /* stop translation                   */
     POWERPC_EXCP_BRANCH       = 0x201, /* branch instruction                 */
-    /* Qemu exceptions: special cases we want to stop translation            */
+    /* QEMU exceptions: special cases we want to stop translation            */
     POWERPC_EXCP_SYNC         = 0x202, /* context synchronizing instruction  */
     POWERPC_EXCP_SYSCALL_USER = 0x203, /* System call in user mode only      */
     POWERPC_EXCP_STCX         = 0x204 /* Conditional stores in user mode     */
@@ -1041,7 +1041,7 @@ struct CPUPPCState {
     /* opcode handlers */
     opc_handler_t *opcodes[0x40];
 
-    /* Those resources are used only in Qemu core */
+    /* Those resources are used only in QEMU core */
     target_ulong hflags;      /* hflags is a MSR & HFLAGS_MASK         */
     target_ulong hflags_nmsr; /* specific hflags, not coming from MSR */
     int mmu_idx;         /* precomputed MMU index to speed up mem accesses */
diff --git a/target-ppc/helper.c b/target-ppc/helper.c
index 39dcc27..e13b749 100644
--- a/target-ppc/helper.c
+++ b/target-ppc/helper.c
@@ -365,7 +365,7 @@ void ppc6xx_tlb_store (CPUPPCState *env, target_ulong EPN, int way, int is_code,
     tlb = &env->tlb.tlb6[nr];
     LOG_SWTLB("Set TLB %d/%d EPN " TARGET_FMT_lx " PTE0 " TARGET_FMT_lx
               " PTE1 " TARGET_FMT_lx "\n", nr, env->nb_tlb, EPN, pte0, pte1);
-    /* Invalidate any pending reference in Qemu for this virtual address */
+    /* Invalidate any pending reference in QEMU for this virtual address */
     __ppc6xx_tlb_invalidate_virt(env, EPN, is_code, 1);
     tlb->pte0 = pte0;
     tlb->pte1 = pte1;
@@ -729,7 +729,7 @@ void ppc_slb_invalidate_all (CPUPPCState *env)
             slb->esid &= ~SLB_ESID_V;
             /* XXX: given the fact that segment size is 256 MB or 1TB,
              *      and we still don't have a tlb_flush_mask(env, n, mask)
-             *      in Qemu, we just invalidate all TLBs
+             *      in QEMU, we just invalidate all TLBs
              */
             do_invalidate = 1;
         }
@@ -752,7 +752,7 @@ void ppc_slb_invalidate_one (CPUPPCState *env, uint64_t T0)
 
         /* XXX: given the fact that segment size is 256 MB or 1TB,
          *      and we still don't have a tlb_flush_mask(env, n, mask)
-         *      in Qemu, we just invalidate all TLBs
+         *      in QEMU, we just invalidate all TLBs
          */
         tlb_flush(env, 1);
     }
@@ -2319,7 +2319,7 @@ void ppc_tlb_invalidate_one (CPUPPCState *env, target_ulong addr)
     case POWERPC_MMU_2_06:
         /* tlbie invalidate TLBs for all segments */
         /* XXX: given the fact that there are too many segments to invalidate,
-         *      and we still don't have a tlb_flush_mask(env, n, mask) in Qemu,
+         *      and we still don't have a tlb_flush_mask(env, n, mask) in QEMU,
          *      we just invalidate all TLBs
          */
         tlb_flush(env, 1);
diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c
index 724f4c7..d929213 100644
--- a/target-ppc/kvm.c
+++ b/target-ppc/kvm.c
@@ -470,7 +470,7 @@ void kvm_arch_pre_run(CPUPPCState *env, struct kvm_run *run)
     int r;
     unsigned irq;
 
-    /* PowerPC Qemu tracks the various core input pins (interrupt, critical
+    /* PowerPC QEMU tracks the various core input pins (interrupt, critical
      * interrupt, reset, etc) in PPC-specific env->irq_input_state. */
     if (!cap_interrupt_level &&
         run->ready_for_interrupt_injection &&
diff --git a/target-ppc/kvm_ppc.c b/target-ppc/kvm_ppc.c
index 24fc6bc..a2e49cd 100644
--- a/target-ppc/kvm_ppc.c
+++ b/target-ppc/kvm_ppc.c
@@ -31,7 +31,7 @@ void kvmppc_init(void)
 {
     /* XXX The only reason KVM yields control back to qemu is device IO. Since
      * an idle guest does no IO, qemu's device model will never get a chance to
-     * run. So, until Qemu gains IO threads, we create this timer to ensure
+     * run. So, until QEMU gains IO threads, we create this timer to ensure
      * that the device model gets a chance to run. */
     kvmppc_timer_rate = get_ticks_per_sec() / 10;
     kvmppc_timer = qemu_new_timer_ns(vm_clock, &kvmppc_timer_hack, NULL);
diff --git a/target-ppc/translate_init.c b/target-ppc/translate_init.c
index 367eefa..b1f8785 100644
--- a/target-ppc/translate_init.c
+++ b/target-ppc/translate_init.c
@@ -1796,17 +1796,17 @@ static void gen_spr_440 (CPUPPCState *env)
 static void gen_spr_40x (CPUPPCState *env)
 {
     /* Cache */
-    /* not emulated, as Qemu do not emulate caches */
+    /* not emulated, as QEMU do not emulate caches */
     spr_register(env, SPR_40x_DCCR, "DCCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* not emulated, as Qemu do not emulate caches */
+    /* not emulated, as QEMU do not emulate caches */
     spr_register(env, SPR_40x_ICCR, "ICCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0x00000000);
-    /* not emulated, as Qemu do not emulate caches */
+    /* not emulated, as QEMU do not emulate caches */
     spr_register(env, SPR_BOOKE_ICDBDR, "ICDBDR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, SPR_NOACCESS,
@@ -1974,7 +1974,7 @@ static void gen_spr_401_403 (CPUPPCState *env)
                  SPR_NOACCESS, &spr_write_tbu,
                  0x00000000);
     /* Debug */
-    /* not emulated, as Qemu do not emulate caches */
+    /* not emulated, as QEMU do not emulate caches */
     spr_register(env, SPR_403_CDBCR, "CDBCR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -2012,12 +2012,12 @@ static void gen_spr_401 (CPUPPCState *env)
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_40x_sler,
                  0x00000000);
-    /* not emulated, as Qemu never does speculative access */
+    /* not emulated, as QEMU never does speculative access */
     spr_register(env, SPR_40x_SGR, "SGR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0xFFFFFFFF);
-    /* not emulated, as Qemu do not emulate caches */
+    /* not emulated, as QEMU do not emulate caches */
     spr_register(env, SPR_40x_DCWR, "DCWR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -3436,12 +3436,12 @@ static void init_proc_403GCX (CPUPPCState *env)
     gen_spr_403_real(env);
     gen_spr_403_mmu(env);
     /* Bus access control */
-    /* not emulated, as Qemu never does speculative access */
+    /* not emulated, as QEMU never does speculative access */
     spr_register(env, SPR_40x_SGR, "SGR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0xFFFFFFFF);
-    /* not emulated, as Qemu do not emulate caches */
+    /* not emulated, as QEMU do not emulate caches */
     spr_register(env, SPR_40x_DCWR, "DCWR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -3488,12 +3488,12 @@ static void init_proc_405 (CPUPPCState *env)
     gen_spr_40x(env);
     gen_spr_405(env);
     /* Bus access control */
-    /* not emulated, as Qemu never does speculative access */
+    /* not emulated, as QEMU never does speculative access */
     spr_register(env, SPR_40x_SGR, "SGR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
                  0xFFFFFFFF);
-    /* not emulated, as Qemu do not emulate caches */
+    /* not emulated, as QEMU do not emulate caches */
     spr_register(env, SPR_40x_DCWR, "DCWR",
                  SPR_NOACCESS, SPR_NOACCESS,
                  &spr_read_generic, &spr_write_generic,
@@ -9442,13 +9442,13 @@ static void init_ppc_proc (CPUPPCState *env, const ppc_def_t *def)
     }
     if (env->irq_inputs == NULL) {
         fprintf(stderr, "WARNING: no internal IRQ controller registered.\n"
-                " Attempt Qemu to crash very soon !\n");
+                " Attempt QEMU to crash very soon !\n");
     }
 #endif
     if (env->check_pow == NULL) {
         fprintf(stderr, "WARNING: no power management check handler "
                 "registered.\n"
-                " Attempt Qemu to crash very soon !\n");
+                " Attempt QEMU to crash very soon !\n");
     }
 }
 
diff --git a/ui/cocoa.m b/ui/cocoa.m
index 0711205..e7d6e89 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -772,7 +772,7 @@ QemuCocoaView *cocoaView;
               modalForWindow:normalWindow modalDelegate:self
               didEndSelector:@selector(openPanelDidEnd:returnCode:contextInfo:) contextInfo:NULL];
     } else {
-        // or Launch Qemu, with the global args
+        // or launch QEMU, with the global args
         [self startEmulationWithArgc:gArgc argv:(char **)gArgv];
     }
 }
diff --git a/ui/spice-display.c b/ui/spice-display.c
index cb8a7ad..5418eb3 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -219,7 +219,7 @@ static SimpleSpiceUpdate *qemu_spice_create_update(SimpleSpiceDisplay *ssd)
 /*
  * Called from spice server thread context (via interface_release_ressource)
  * We do *not* hold the global qemu mutex here, so extra care is needed
- * when calling qemu functions.  Qemu interfaces used:
+ * when calling qemu functions.  QEMU interfaces used:
  *    - g_free (underlying glibc free is re-entrant).
  */
 void qemu_spice_destroy_update(SimpleSpiceDisplay *sdpy, SimpleSpiceUpdate *update)
-- 
1.7.9


