Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UZO1b-0007TU-0v
	for mharc-qemu-trivial@gnu.org; Mon, 06 May 2013 12:12:27 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49466)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1UZO1O-0007Jh-KQ
	for qemu-trivial@nongnu.org; Mon, 06 May 2013 12:12:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1UZO1M-0001VI-UN
	for qemu-trivial@nongnu.org; Mon, 06 May 2013 12:12:14 -0400
Received: from goliath.siemens.de ([192.35.17.28]:17902)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1UZO1I-0001Te-L5; Mon, 06 May 2013 12:12:08 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.13.6/8.13.6) with ESMTP id r46GC6tA021276;
	Mon, 6 May 2013 18:12:06 +0200
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id r46GC6j2011726;
	Mon, 6 May 2013 18:12:06 +0200
Message-ID: <5187D656.2090501@siemens.com>
Date: Mon, 06 May 2013 18:12:06 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 192.35.17.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH] memory: Rename readable flag to romd_mode
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
X-List-Received-Date: Mon, 06 May 2013 16:12:20 -0000

"Readable" is a very unfortunate name for this flag because even a
rom_device region will always be readable from the guest POV. What
differs is the mapping, just like the comments had to explain already.
Also, readable could currently be understood as being a generic region
flag, but it only applies to rom_device regions.

So name the flag and the function to modify it after the original term
"ROMD" which could also be interpreted as "ROM direct", i.e. ROM mode
with direct access. In any case, the scope if the flag is clearer now.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

Depends on "memory: Replace open-coded memory_region_is_romd", but I
don't think this patch is "trivial" as well, though it is just renaming
things. Just in case, I'm CCing the trivial list as well.

Paolo, or would you open a memory branch so that related stuff can flow
through one queue?

 hw/block/pflash_cfi01.c |    6 +++---
 hw/block/pflash_cfi02.c |    2 +-
 include/exec/memory.h   |   22 +++++++++++-----------
 memory.c                |   30 +++++++++++++++---------------
 4 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 3ff20e0..63d7c99 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -105,7 +105,7 @@ static void pflash_timer (void *opaque)
     DPRINTF("%s: command %02x done\n", __func__, pfl->cmd);
     /* Reset flash */
     pfl->status ^= 0x80;
-    memory_region_rom_device_set_readable(&pfl->mem, true);
+    memory_region_rom_device_set_romd(&pfl->mem, true);
     pfl->wcycle = 0;
     pfl->cmd = 0;
 }
@@ -281,7 +281,7 @@ static void pflash_write(pflash_t *pfl, hwaddr offset,
 
     if (!pfl->wcycle) {
         /* Set the device in I/O access mode */
-        memory_region_rom_device_set_readable(&pfl->mem, false);
+        memory_region_rom_device_set_romd(&pfl->mem, false);
     }
 
     switch (pfl->wcycle) {
@@ -458,7 +458,7 @@ static void pflash_write(pflash_t *pfl, hwaddr offset,
                   "\n", __func__, offset, pfl->wcycle, pfl->cmd, value);
 
  reset_flash:
-    memory_region_rom_device_set_readable(&pfl->mem, true);
+    memory_region_rom_device_set_romd(&pfl->mem, true);
 
     pfl->wcycle = 0;
     pfl->cmd = 0;
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 9a7fa70..5f25246 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -111,7 +111,7 @@ static void pflash_setup_mappings(pflash_t *pfl)
 
 static void pflash_register_memory(pflash_t *pfl, int rom_mode)
 {
-    memory_region_rom_device_set_readable(&pfl->orig_mem, rom_mode);
+    memory_region_rom_device_set_romd(&pfl->orig_mem, rom_mode);
     pfl->rom_mode = rom_mode;
 }
 
diff --git a/include/exec/memory.h b/include/exec/memory.h
index 9e88320..ed8a7ee 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -126,7 +126,7 @@ struct MemoryRegion {
     ram_addr_t ram_addr;
     bool subpage;
     bool terminates;
-    bool readable;
+    bool romd_mode;
     bool ram;
     bool readonly; /* For RAM regions */
     bool enabled;
@@ -355,16 +355,16 @@ uint64_t memory_region_size(MemoryRegion *mr);
 bool memory_region_is_ram(MemoryRegion *mr);
 
 /**
- * memory_region_is_romd: check whether a memory region is ROMD
+ * memory_region_is_romd: check whether a memory region is in ROMD mode
  *
- * Returns %true is a memory region is ROMD and currently set to allow
+ * Returns %true is a memory region is a ROM device and currently set to allow
  * direct reads.
  *
  * @mr: the memory region being queried
  */
 static inline bool memory_region_is_romd(MemoryRegion *mr)
 {
-    return mr->rom_device && mr->readable;
+    return mr->rom_device && mr->romd_mode;
 }
 
 /**
@@ -502,18 +502,18 @@ void memory_region_reset_dirty(MemoryRegion *mr, hwaddr addr,
 void memory_region_set_readonly(MemoryRegion *mr, bool readonly);
 
 /**
- * memory_region_rom_device_set_readable: enable/disable ROM readability
+ * memory_region_rom_device_set_romd: enable/disable ROMD mode
  *
  * Allows a ROM device (initialized with memory_region_init_rom_device() to
- * to be marked as readable (default) or not readable.  When it is readable,
- * the device is mapped to guest memory.  When not readable, reads are
- * forwarded to the #MemoryRegion.read function.
+ * set to ROMD mode (default) or MMIO mode.  When it is in ROMD mode, the
+ * device is mapped to guest memory and satisfies read access directly.
+ * When in MMIO mode, reads are forwarded to the #MemoryRegion.read function.
+ * Writes are always handled by the #MemoryRegion.write function.
  *
  * @mr: the memory region to be updated
- * @readable: whether reads are satisified directly (%true) or via callbacks
- *            (%false)
+ * @romd_mode: whether the region in in ROMD mode or not
  */
-void memory_region_rom_device_set_readable(MemoryRegion *mr, bool readable);
+void memory_region_rom_device_set_romd(MemoryRegion *mr, bool romd_mode);
 
 /**
  * memory_region_set_coalescing: Enable memory coalescing for the region.
diff --git a/memory.c b/memory.c
index 75ca281..81c39dd 100644
--- a/memory.c
+++ b/memory.c
@@ -213,7 +213,7 @@ struct FlatRange {
     hwaddr offset_in_region;
     AddrRange addr;
     uint8_t dirty_log_mask;
-    bool readable;
+    bool romd_mode;
     bool readonly;
 };
 
@@ -236,7 +236,7 @@ static bool flatrange_equal(FlatRange *a, FlatRange *b)
     return a->mr == b->mr
         && addrrange_equal(a->addr, b->addr)
         && a->offset_in_region == b->offset_in_region
-        && a->readable == b->readable
+        && a->romd_mode == b->romd_mode
         && a->readonly == b->readonly;
 }
 
@@ -276,7 +276,7 @@ static bool can_merge(FlatRange *r1, FlatRange *r2)
                                 r1->addr.size),
                      int128_make64(r2->offset_in_region))
         && r1->dirty_log_mask == r2->dirty_log_mask
-        && r1->readable == r2->readable
+        && r1->romd_mode == r2->romd_mode
         && r1->readonly == r2->readonly;
 }
 
@@ -532,7 +532,7 @@ static void render_memory_region(FlatView *view,
             fr.offset_in_region = offset_in_region;
             fr.addr = addrrange_make(base, now);
             fr.dirty_log_mask = mr->dirty_log_mask;
-            fr.readable = mr->readable;
+            fr.romd_mode = mr->romd_mode;
             fr.readonly = readonly;
             flatview_insert(view, i, &fr);
             ++i;
@@ -552,7 +552,7 @@ static void render_memory_region(FlatView *view,
         fr.offset_in_region = offset_in_region;
         fr.addr = addrrange_make(base, remain);
         fr.dirty_log_mask = mr->dirty_log_mask;
-        fr.readable = mr->readable;
+        fr.romd_mode = mr->romd_mode;
         fr.readonly = readonly;
         flatview_insert(view, i, &fr);
     }
@@ -801,7 +801,7 @@ void memory_region_init(MemoryRegion *mr,
     mr->enabled = true;
     mr->terminates = false;
     mr->ram = false;
-    mr->readable = true;
+    mr->romd_mode = true;
     mr->readonly = false;
     mr->rom_device = false;
     mr->destructor = memory_region_destructor_none;
@@ -1121,11 +1121,11 @@ void memory_region_set_readonly(MemoryRegion *mr, bool readonly)
     }
 }
 
-void memory_region_rom_device_set_readable(MemoryRegion *mr, bool readable)
+void memory_region_rom_device_set_romd(MemoryRegion *mr, bool romd_mode)
 {
-    if (mr->readable != readable) {
+    if (mr->romd_mode != romd_mode) {
         memory_region_transaction_begin();
-        mr->readable = readable;
+        mr->romd_mode = romd_mode;
         memory_region_update_pending |= mr->enabled;
         memory_region_transaction_commit();
     }
@@ -1649,9 +1649,9 @@ static void mtree_print_mr(fprintf_function mon_printf, void *f,
                    base + mr->addr
                    + (hwaddr)int128_get64(mr->size) - 1,
                    mr->priority,
-                   mr->readable ? 'R' : '-',
-                   !mr->readonly && !(mr->rom_device && mr->readable) ? 'W'
-                                                                      : '-',
+                   mr->romd_mode ? 'R' : '-',
+                   !mr->readonly && !(mr->rom_device && mr->romd_mode) ? 'W'
+                                                                       : '-',
                    mr->name,
                    mr->alias->name,
                    mr->alias_offset,
@@ -1664,9 +1664,9 @@ static void mtree_print_mr(fprintf_function mon_printf, void *f,
                    base + mr->addr
                    + (hwaddr)int128_get64(mr->size) - 1,
                    mr->priority,
-                   mr->readable ? 'R' : '-',
-                   !mr->readonly && !(mr->rom_device && mr->readable) ? 'W'
-                                                                      : '-',
+                   mr->romd_mode ? 'R' : '-',
+                   !mr->readonly && !(mr->rom_device && mr->romd_mode) ? 'W'
+                                                                       : '-',
                    mr->name);
     }
 
-- 
1.7.3.4

