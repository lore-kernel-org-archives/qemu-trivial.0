Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXEHq-000810-0F
	for mharc-qemu-trivial@gnu.org; Mon, 07 Apr 2014 14:28:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WXEHj-0007rC-58
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 14:28:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WXEHe-0002pA-6M
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 14:28:43 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:33446)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1WXEHT-0002nQ-Vg; Mon, 07 Apr 2014 14:28:28 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 0302017F614; Mon,  7 Apr 2014 20:28:24 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Mon,  7 Apr 2014 20:28:23 +0200
Message-Id: <1396895303-5356-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH] misc: Use cpu_physical_memory_read and
	cpu_physical_memory_write
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
X-List-Received-Date: Mon, 07 Apr 2014 18:28:48 -0000

These functions don't need type casts (as does cpu_physical_memory_rw)
and also make the code better readable.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 cpus.c                     |    2 +-
 hw/i386/kvmvapic.c         |   31 ++++++++++++++-----------------
 hw/intc/apic.c             |    4 ++--
 target-s390x/misc_helper.c |   12 ++++++------
 4 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/cpus.c b/cpus.c
index 1104d61..7bbe153 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1454,7 +1454,7 @@ void qmp_pmemsave(int64_t addr, int64_t size, const char *filename,
         l = sizeof(buf);
         if (l > size)
             l = size;
-        cpu_physical_memory_rw(addr, buf, l, 0);
+        cpu_physical_memory_read(addr, buf, l);
         if (fwrite(buf, 1, l, f) != l) {
             error_set(errp, QERR_IO_ERROR);
             goto exit;
diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
index a1c3d1c..a967b48 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/kvmvapic.c
@@ -124,14 +124,14 @@ static const TPRInstruction tpr_instr[] = {
 
 static void read_guest_rom_state(VAPICROMState *s)
 {
-    cpu_physical_memory_rw(s->rom_state_paddr, (void *)&s->rom_state,
-                           sizeof(GuestROMState), 0);
+    cpu_physical_memory_read(s->rom_state_paddr, &s->rom_state,
+                             sizeof(GuestROMState));
 }
 
 static void write_guest_rom_state(VAPICROMState *s)
 {
-    cpu_physical_memory_rw(s->rom_state_paddr, (void *)&s->rom_state,
-                           sizeof(GuestROMState), 1);
+    cpu_physical_memory_write(s->rom_state_paddr, &s->rom_state,
+                              sizeof(GuestROMState));
 }
 
 static void update_guest_rom_state(VAPICROMState *s)
@@ -311,16 +311,14 @@ static int update_rom_mapping(VAPICROMState *s, CPUX86State *env, target_ulong i
     for (pos = le32_to_cpu(s->rom_state.fixup_start);
          pos < le32_to_cpu(s->rom_state.fixup_end);
          pos += 4) {
-        cpu_physical_memory_rw(paddr + pos - s->rom_state.vaddr,
-                               (void *)&offset, sizeof(offset), 0);
+        cpu_physical_memory_read(paddr + pos - s->rom_state.vaddr,
+                                 &offset, sizeof(offset));
         offset = le32_to_cpu(offset);
-        cpu_physical_memory_rw(paddr + offset, (void *)&patch,
-                               sizeof(patch), 0);
+        cpu_physical_memory_read(paddr + offset, &patch, sizeof(patch));
         patch = le32_to_cpu(patch);
         patch += rom_state_vaddr - le32_to_cpu(s->rom_state.vaddr);
         patch = cpu_to_le32(patch);
-        cpu_physical_memory_rw(paddr + offset, (void *)&patch,
-                               sizeof(patch), 1);
+        cpu_physical_memory_write(paddr + offset, &patch, sizeof(patch));
     }
     read_guest_rom_state(s);
     s->vapic_paddr = paddr + le32_to_cpu(s->rom_state.vapic_vaddr) -
@@ -364,8 +362,8 @@ static int vapic_enable(VAPICROMState *s, X86CPU *cpu)
     }
     vapic_paddr = s->vapic_paddr +
         (((hwaddr)cpu_number) << VAPIC_CPU_SHIFT);
-    cpu_physical_memory_rw(vapic_paddr + offsetof(VAPICState, enabled),
-                           (void *)&enabled, sizeof(enabled), 1);
+    cpu_physical_memory_write(vapic_paddr + offsetof(VAPICState, enabled),
+                              &enabled, sizeof(enabled));
     apic_enable_vapic(cpu->apic_state, vapic_paddr);
 
     s->state = VAPIC_ACTIVE;
@@ -535,7 +533,7 @@ static int patch_hypercalls(VAPICROMState *s)
     uint8_t *rom;
 
     rom = g_malloc(s->rom_size);
-    cpu_physical_memory_rw(rom_paddr, rom, s->rom_size, 0);
+    cpu_physical_memory_read(rom_paddr, rom, s->rom_size);
 
     for (pos = 0; pos < s->rom_size - sizeof(vmcall_pattern); pos++) {
         if (kvm_irqchip_in_kernel()) {
@@ -551,8 +549,7 @@ static int patch_hypercalls(VAPICROMState *s)
         }
         if (memcmp(rom + pos, pattern, 7) == 0 &&
             (rom[pos + 7] == alternates[0] || rom[pos + 7] == alternates[1])) {
-            cpu_physical_memory_rw(rom_paddr + pos + 5, (uint8_t *)patch,
-                                   3, 1);
+            cpu_physical_memory_write(rom_paddr + pos + 5, patch, 3);
             /*
              * Don't flush the tb here. Under ordinary conditions, the patched
              * calls are miles away from the current IP. Under malicious
@@ -760,8 +757,8 @@ static int vapic_post_load(void *opaque, int version_id)
             run_on_cpu(first_cpu, do_vapic_enable, s);
         } else {
             zero = g_malloc0(s->rom_state.vapic_size);
-            cpu_physical_memory_rw(s->vapic_paddr, zero,
-                                   s->rom_state.vapic_size, 1);
+            cpu_physical_memory_write(s->vapic_paddr, zero,
+                                      s->rom_state.vapic_size);
             g_free(zero);
         }
     }
diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index b8c061b..2f40cba 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -98,8 +98,8 @@ static void apic_sync_vapic(APICCommonState *s, int sync_type)
         return;
     }
     if (sync_type & SYNC_FROM_VAPIC) {
-        cpu_physical_memory_rw(s->vapic_paddr, (void *)&vapic_state,
-                               sizeof(vapic_state), 0);
+        cpu_physical_memory_read(s->vapic_paddr, &vapic_state,
+                                 sizeof(vapic_state));
         s->tpr = vapic_state.tpr;
     }
     if (sync_type & (SYNC_TO_VAPIC | SYNC_ISR_IRR_TO_VAPIC)) {
diff --git a/target-s390x/misc_helper.c b/target-s390x/misc_helper.c
index 294b3ed..cdbbb79 100644
--- a/target-s390x/misc_helper.c
+++ b/target-s390x/misc_helper.c
@@ -336,7 +336,7 @@ uint32_t HELPER(stsi)(CPUS390XState *env, uint64_t a0,
             ebcdic_put(sysib.model, "QEMU            ", 16);
             ebcdic_put(sysib.sequence, "QEMU            ", 16);
             ebcdic_put(sysib.plant, "QEMU", 4);
-            cpu_physical_memory_rw(a0, (uint8_t *)&sysib, sizeof(sysib), 1);
+            cpu_physical_memory_write(a0, &sysib, sizeof(sysib));
         } else if ((sel1 == 2) && (sel2 == 1)) {
             /* Basic Machine CPU */
             struct sysib_121 sysib;
@@ -346,7 +346,7 @@ uint32_t HELPER(stsi)(CPUS390XState *env, uint64_t a0,
             ebcdic_put(sysib.sequence, "QEMUQEMUQEMUQEMU", 16);
             ebcdic_put(sysib.plant, "QEMU", 4);
             stw_p(&sysib.cpu_addr, env->cpu_num);
-            cpu_physical_memory_rw(a0, (uint8_t *)&sysib, sizeof(sysib), 1);
+            cpu_physical_memory_write(a0, &sysib, sizeof(sysib));
         } else if ((sel1 == 2) && (sel2 == 2)) {
             /* Basic Machine CPUs */
             struct sysib_122 sysib;
@@ -358,7 +358,7 @@ uint32_t HELPER(stsi)(CPUS390XState *env, uint64_t a0,
             stw_p(&sysib.active_cpus, 1);
             stw_p(&sysib.standby_cpus, 0);
             stw_p(&sysib.reserved_cpus, 0);
-            cpu_physical_memory_rw(a0, (uint8_t *)&sysib, sizeof(sysib), 1);
+            cpu_physical_memory_write(a0, &sysib, sizeof(sysib));
         } else {
             cc = 3;
         }
@@ -375,7 +375,7 @@ uint32_t HELPER(stsi)(CPUS390XState *env, uint64_t a0,
                 ebcdic_put(sysib.plant, "QEMU", 4);
                 stw_p(&sysib.cpu_addr, env->cpu_num);
                 stw_p(&sysib.cpu_id, 0);
-                cpu_physical_memory_rw(a0, (uint8_t *)&sysib, sizeof(sysib), 1);
+                cpu_physical_memory_write(a0, &sysib, sizeof(sysib));
             } else if ((sel1 == 2) && (sel2 == 2)) {
                 /* LPAR CPUs */
                 struct sysib_222 sysib;
@@ -392,7 +392,7 @@ uint32_t HELPER(stsi)(CPUS390XState *env, uint64_t a0,
                 stl_p(&sysib.caf, 1000);
                 stw_p(&sysib.dedicated_cpus, 0);
                 stw_p(&sysib.shared_cpus, 0);
-                cpu_physical_memory_rw(a0, (uint8_t *)&sysib, sizeof(sysib), 1);
+                cpu_physical_memory_write(a0, &sysib, sizeof(sysib));
             } else {
                 cc = 3;
             }
@@ -414,7 +414,7 @@ uint32_t HELPER(stsi)(CPUS390XState *env, uint64_t a0,
                 ebcdic_put(sysib.vm[0].name, "KVMguest", 8);
                 stl_p(&sysib.vm[0].caf, 1000);
                 ebcdic_put(sysib.vm[0].cpi, "KVM/Linux       ", 16);
-                cpu_physical_memory_rw(a0, (uint8_t *)&sysib, sizeof(sysib), 1);
+                cpu_physical_memory_write(a0, &sysib, sizeof(sysib));
             } else {
                 cc = 3;
             }
-- 
1.7.10.4


