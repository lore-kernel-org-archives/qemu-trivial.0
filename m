Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QFT1g-0001Gv-HD
	for mharc-qemu-trivial@gnu.org; Thu, 28 Apr 2011 11:21:08 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48444)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1Z-00014P-KQ
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT1Y-0006j3-6D
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:21:01 -0400
Received: from moutng.kundenserver.de ([212.227.126.186]:52188)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1T-0006ee-Qv; Thu, 28 Apr 2011 11:20:56 -0400
Received: from flocke.fritz.box (p5086FD13.dip.t-dialin.net [80.134.253.19])
	by mrelayeu.kundenserver.de (node=mrbap1) with ESMTP (Nemesis)
	id 0M4B8t-1Py4h92xWd-00r979; Thu, 28 Apr 2011 17:20:49 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1L-0002Bf-U7; Thu, 28 Apr 2011 17:20:47 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu, 28 Apr 2011 17:20:35 +0200
Message-Id: <1304004042-8334-11-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
References: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
X-Provags-ID: V02:K0:VMk69NalTa8/FaJSVv8+9rz6L1npiE+5ocKSsek1x0/
	8/RiYiT92ebjGx60fyKJKQegChnIuim5v5gncWJTEBeNtfkHwr
	a8eaVKzcQ3YXQnqOPoZlfKkD8b78isNfPj9w9Sd8j+8fIBoWdV
	szUx6DA16uNHOPJKSzDqeJ2sZrbm2e0uFKnMN1Za1JH7XT4/45
	ofPfFXmQGhB8BhtYhuui+nQ/8F4xyVFvbagxp7WmtaQtb1zE7p KGO7Wa1Bc3Bx3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.126.186
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH 11/18] Fix typos in comments (interupt ->
	interrupt)
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
X-List-Received-Date: Thu, 28 Apr 2011 15:21:02 -0000

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 cpu-exec.c                   |    2 +-
 hw/mst_fpga.c                |    2 +-
 hw/pl031.c                   |    2 +-
 hw/pl061.c                   |    4 ++--
 target-mips/translate_init.c |    2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/cpu-exec.c b/cpu-exec.c
index 395cd8c..2cdcdc5 100644
--- a/cpu-exec.c
+++ b/cpu-exec.c
@@ -569,7 +569,7 @@ int cpu_exec(CPUState *env1)
                         next_tb = 0;
                     }
 #endif
-                   /* Don't use the cached interupt_request value,
+                   /* Don't use the cached interrupt_request value,
                       do_interrupt may have updated the EXITTB flag. */
                     if (env->interrupt_request & CPU_INTERRUPT_EXITTB) {
                         env->interrupt_request &= ~CPU_INTERRUPT_EXITTB;
diff --git a/hw/mst_fpga.c b/hw/mst_fpga.c
index a04355c..4e47574 100644
--- a/hw/mst_fpga.c
+++ b/hw/mst_fpga.c
@@ -154,7 +154,7 @@ mst_fpga_writeb(void *opaque, target_phys_addr_t addr, uint32_t value)
 	case MST_MSCRD:
 		s->mscrd =  value;
 		break;
-	case MST_INTMSKENA:	/* Mask interupt */
+	case MST_INTMSKENA:	/* Mask interrupt */
 		s->intmskena = (value & 0xFEEFF);
 		qemu_set_irq(s->parent, s->intsetclr & s->intmskena);
 		break;
diff --git a/hw/pl031.c b/hw/pl031.c
index 8c2f9d0..017a313 100644
--- a/hw/pl031.c
+++ b/hw/pl031.c
@@ -161,7 +161,7 @@ static void pl031_write(void * opaque, target_phys_addr_t offset,
         pl031_update(s);
         break;
     case RTC_ICR:
-        /* The PL031 documentation (DDI0224B) states that the interupt is
+        /* The PL031 documentation (DDI0224B) states that the interrupt is
            cleared when bit 0 of the written value is set.  However the
            arm926e documentation (DDI0287B) states that the interrupt is
            cleared when any value is written.  */
diff --git a/hw/pl061.c b/hw/pl061.c
index 2e181f8..372dfc2 100644
--- a/hw/pl061.c
+++ b/hw/pl061.c
@@ -98,7 +98,7 @@ static uint32_t pl061_read(void *opaque, target_phys_addr_t offset)
         return s->isense;
     case 0x408: /* Interrupt both edges */
         return s->ibe;
-    case 0x40c: /* Interupt event */
+    case 0x40c: /* Interrupt event */
         return s->iev;
     case 0x410: /* Interrupt mask */
         return s->im;
@@ -156,7 +156,7 @@ static void pl061_write(void *opaque, target_phys_addr_t offset,
     case 0x408: /* Interrupt both edges */
         s->ibe = value;
         break;
-    case 0x40c: /* Interupt event */
+    case 0x40c: /* Interrupt event */
         s->iev = value;
         break;
     case 0x410: /* Interrupt mask */
diff --git a/target-mips/translate_init.c b/target-mips/translate_init.c
index 590e092..d980216 100644
--- a/target-mips/translate_init.c
+++ b/target-mips/translate_init.c
@@ -38,7 +38,7 @@
 ((1 << CP0C2_M))
 
 /* No config4, no DSP ASE, no large physaddr (PABITS),
-   no external interrupt controller, no vectored interupts,
+   no external interrupt controller, no vectored interrupts,
    no 1kb pages, no SmartMIPS ASE, no trace logic */
 #define MIPS_CONFIG3                                              \
 ((0 << CP0C3_M) | (0 << CP0C3_DSPP) | (0 << CP0C3_LPA) |          \
-- 
1.7.2.5


