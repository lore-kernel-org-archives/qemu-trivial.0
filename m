Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wsunz-0004j3-Mv
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jun 2014 10:07:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39155)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Wsunq-0004WS-L2
	for qemu-trivial@nongnu.org; Fri, 06 Jun 2014 10:07:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Wsunj-00007a-5a
	for qemu-trivial@nongnu.org; Fri, 06 Jun 2014 10:07:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:31630)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1WsunO-0008Ua-8Z; Fri, 06 Jun 2014 10:07:02 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s56E70uk007258
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 6 Jun 2014 10:07:01 -0400
Received: from playground.com (ovpn-112-41.ams2.redhat.com [10.36.112.41])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s56E6u4g031924; Fri, 6 Jun 2014 10:06:58 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 Jun 2014 16:06:53 +0200
Message-Id: <1402063613-12400-2-git-send-email-pbonzini@redhat.com>
In-Reply-To: <1402063613-12400-1-git-send-email-pbonzini@redhat.com>
References: <1402063613-12400-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] x86: correctly implement soft reset
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
X-List-Received-Date: Fri, 06 Jun 2014 14:07:38 -0000

Do not do a hard reset for port 92h, keyboard controller, or cf9h soft reset.
These only reset the CPU.

Reviewed-by: Anthony Liguori <aliguori@us.ibm.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 cpus.c                |  9 +++++++++
 hw/i386/pc.c          |  3 ++-
 hw/input/pckbd.c      |  5 +++--
 hw/isa/lpc_ich9.c     | 12 ++++++++++--
 hw/pci-host/piix.c    |  8 ++++++--
 include/sysemu/cpus.h |  1 +
 6 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/cpus.c b/cpus.c
index dd7ac13..822211e 100644
--- a/cpus.c
+++ b/cpus.c
@@ -494,6 +494,15 @@ void hw_error(const char *fmt, ...)
     abort();
 }
 
+void cpu_soft_reset(void)
+{
+    CPUState *cpu;
+
+    CPU_FOREACH(cpu) {
+        cpu_interrupt(cpu, CPU_INTERRUPT_RESET);
+    }
+}
+
 void cpu_synchronize_all_states(void)
 {
     CPUState *cpu;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index e6369d5..346d6b3 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -45,6 +45,7 @@
 #include "kvm_i386.h"
 #include "hw/xen/xen.h"
 #include "sysemu/blockdev.h"
+#include "sysemu/cpus.h"
 #include "hw/block/block.h"
 #include "ui/qemu-spice.h"
 #include "exec/memory.h"
@@ -477,7 +478,7 @@ static void port92_write(void *opaque, hwaddr addr, uint64_t val,
     s->outport = val;
     qemu_set_irq(*s->a20_out, (val >> 1) & 1);
     if ((val & 1) && !(oldval & 1)) {
-        qemu_system_reset_request();
+        cpu_soft_reset();
     }
 }
 
diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 29af3d7..fd87776 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -26,6 +26,7 @@
 #include "hw/i386/pc.h"
 #include "hw/input/ps2.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/cpus.h"
 
 /* debug PC keyboard */
 //#define DEBUG_KBD
@@ -220,7 +221,7 @@ static void outport_write(KBDState *s, uint32_t val)
         qemu_set_irq(*s->a20_out, (val >> 1) & 1);
     }
     if (!(val & 1)) {
-        qemu_system_reset_request();
+        cpu_soft_reset();
     }
 }
 
@@ -299,7 +300,7 @@ static void kbd_write_command(void *opaque, hwaddr addr,
         s->outport &= ~KBD_OUT_A20;
         break;
     case KBD_CCMD_RESET:
-        qemu_system_reset_request();
+        cpu_soft_reset();
         break;
     case KBD_CCMD_NO_OP:
         /* ignore that */
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 51ce12d..e9fde85 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -45,6 +45,7 @@
 #include "hw/pci/pci_bus.h"
 #include "exec/address-spaces.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/cpus.h"
 
 static int ich9_lpc_sci_irq(ICH9LPCState *lpc);
 
@@ -507,8 +508,15 @@ static void ich9_rst_cnt_write(void *opaque, hwaddr addr, uint64_t val,
     ICH9LPCState *lpc = opaque;
 
     if (val & 4) {
-        qemu_system_reset_request();
-        return;
+        /* In a real ICH9, FULL_RST affects whether the hardware goes to S5
+         * for 3-5 seconds, but is not enough alone; you need to set SYS_RST
+         * too.
+         */
+        if (val & 2) {
+            qemu_system_reset_request();
+        } else {
+            cpu_soft_reset();
+        }
     }
     lpc->rst_cnt = val & 0xA; /* keep FULL_RST (bit 3) and SYS_RST (bit 1) */
 }
diff --git a/hw/pci-host/piix.c b/hw/pci-host/piix.c
index ffdc853..1e60172 100644
--- a/hw/pci-host/piix.c
+++ b/hw/pci-host/piix.c
@@ -34,6 +34,7 @@
 #include "sysemu/sysemu.h"
 #include "hw/i386/ioapic.h"
 #include "qapi/visitor.h"
+#include "sysemu/cpus.h"
 
 /*
  * I440FX chipset data sheet.
@@ -587,8 +588,11 @@ static void rcr_write(void *opaque, hwaddr addr, uint64_t val, unsigned len)
     PIIX3State *d = opaque;
 
     if (val & 4) {
-        qemu_system_reset_request();
-        return;
+        if (val & 2) {
+            qemu_system_reset_request();
+        } else {
+            cpu_soft_reset();
+        }
     }
     d->rcr = val & 2; /* keep System Reset type only */
 }
diff --git a/include/sysemu/cpus.h b/include/sysemu/cpus.h
index 6502488..87b9829 100644
--- a/include/sysemu/cpus.h
+++ b/include/sysemu/cpus.h
@@ -7,6 +7,7 @@ void resume_all_vcpus(void);
 void pause_all_vcpus(void);
 void cpu_stop_current(void);
 
+void cpu_soft_reset(void);
 void cpu_synchronize_all_states(void);
 void cpu_synchronize_all_post_reset(void);
 void cpu_synchronize_all_post_init(void);
-- 
1.8.3.1


