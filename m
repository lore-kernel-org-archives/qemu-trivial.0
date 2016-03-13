Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1afCoa-0007ur-6B
	for mharc-qemu-trivial@gnu.org; Sun, 13 Mar 2016 16:40:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mbtamuli@gmail.com>) id 1afBCK-0007fh-Tn
	for qemu-trivial@nongnu.org; Sun, 13 Mar 2016 14:57:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mbtamuli@gmail.com>) id 1afBCJ-0001Rw-BS
	for qemu-trivial@nongnu.org; Sun, 13 Mar 2016 14:57:04 -0400
Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244]:33778)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mbtamuli@gmail.com>)
	id 1afBCE-0001Nz-39; Sun, 13 Mar 2016 14:56:58 -0400
Received: by mail-pa0-x244.google.com with SMTP id q6so12823568pav.0;
	Sun, 13 Mar 2016 11:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=r1YoI8D1IBMk/71AQehS22sEMOpqp26KL0+S9YuPwUY=;
	b=Djk7EPoUKpUXlnuuhHuaHdTWLPNxcMoOR8MpGThkSNEXV5x50Ltze2wef57n6FRCAZ
	axqWlp7rsI+kOUxUILfo5APxQpPozQFFotwb6OMuiYQAYXT/IWvl5sBJF6qo0nd6KSBz
	Va4OxSOk9S3Bi1VF3Gjtqlpp72vnYmzMvetsJlN+cXNTjBQVBDarBrPXXUj6bt8JgiTy
	lGNw5qAWkcsvUFEscqvZm+/rTpOcxAsX/h98+zx9Cy3w3J20axQDtWsRsWoew4YLXoaX
	LL+cnFOeWgqUCFU06xwohxnLcYolgB6iPVuX51Y51pNVYd+OA8yNBo8DnNMIPm7H3H6M
	zEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=r1YoI8D1IBMk/71AQehS22sEMOpqp26KL0+S9YuPwUY=;
	b=B6UYSvbkkeHbsDsHEn1dMS8YdnGP+kKEtIlYZhDkaUv2tFX678PBXyuwrowqeiAFp2
	S5Re3tdJ3PqKTAEQUUw5KRMZoPdj42WC+oa2dgwhBWgCcJvjyoGVD0r9G8hLDwH+OZSX
	uDNh+lrQsFBAMgT6NlsMwLYCT/wyVDUWjetYapP67/E0jEvwp0h5dV5dXPfPgtkbZPNo
	j9A/IOXO1Rx4hx08aJXMyS6erL/luaAzEce2T2jRjIr1YroQ0g4FgNmSfjY9GUERIx9Q
	k7ZM8BBdgPuOVkepZOWMeb2kUI51XgZWPMMCr8Yr4ogfF3qH937bqywHBoalajgD/cFj
	swng==
X-Gm-Message-State: AD7BkJLCd5gn9OhEmpzsEemh0sVM/WWKGIO41OjNCQXalhMt2E4EucB0DnALOstR4DIZig==
X-Received: by 10.66.140.70 with SMTP id re6mr32092508pab.100.1457895416897;
	Sun, 13 Mar 2016 11:56:56 -0700 (PDT)
Received: from localhost.localdomain (us-vpn.mytunneling.com. [192.81.211.71])
	by smtp.gmail.com with ESMTPSA id
	b74sm26611417pfd.24.2016.03.13.11.56.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 11:56:55 -0700 (PDT)
From: Mriyam Tamuli <mbtamuli@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 14 Mar 2016 00:26:16 +0530
Message-Id: <1457895376-22138-1-git-send-email-mbtamuli@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::244
X-Mailman-Approved-At: Sun, 13 Mar 2016 16:40:35 -0400
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Mriyam Tamuli <mbtamuli@gmail.com>, rth@twiddle.net,
	crosthwaite.peter@gmail.com
Subject: [Qemu-trivial] [PATCH 1/5] address_space: replaced function calls
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
X-List-Received-Date: Sun, 13 Mar 2016 18:57:06 -0000

replaced calls named cpu_physical_memory_* with address_space_*

cpus.c
cputlb.c
disas.c
exec.c
---
 cpus.c   |  2 +-
 cputlb.c |  8 ++++----
 disas.c  |  2 +-
 exec.c   | 60 ++++++++++++++++++++++++++++++------------------------------
 4 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/cpus.c b/cpus.c
index bc774e2..d73cd7b 100644
--- a/cpus.c
+++ b/cpus.c
@@ -1662,7 +1662,7 @@ void qmp_pmemsave(int64_t addr, int64_t size, const char *filename,
         l = sizeof(buf);
         if (l > size)
             l = size;
-        cpu_physical_memory_read(addr, buf, l);
+        address_space_read(addr, buf, l);
         if (fwrite(buf, 1, l, f) != l) {
             error_setg(errp, QERR_IO_ERROR);
             goto exit;
diff --git a/cputlb.c b/cputlb.c
index 2f7a166..19aeb6a 100644
--- a/cputlb.c
+++ b/cputlb.c
@@ -222,15 +222,15 @@ void tlb_flush_page_by_mmuidx(CPUState *cpu, target_ulong addr, ...)
    can be detected */
 void tlb_protect_code(ram_addr_t ram_addr)
 {
-    cpu_physical_memory_test_and_clear_dirty(ram_addr, TARGET_PAGE_SIZE,
-                                             DIRTY_MEMORY_CODE);
+    address_space_test_and_clear_dirty(ram_addr, TARGET_PAGE_SIZE,
+                                       DIRTY_MEMORY_CODE);
 }
 
 /* update the TLB so that writes in physical page 'phys_addr' are no longer
    tested for self modifying code */
 void tlb_unprotect_code(ram_addr_t ram_addr)
 {
-    cpu_physical_memory_set_dirty_flag(ram_addr, DIRTY_MEMORY_CODE);
+    address_space_set_dirty_flag(ram_addr, DIRTY_MEMORY_CODE);
 }
 
 static bool tlb_is_dirty_ram(CPUTLBEntry *tlbe)
@@ -416,7 +416,7 @@ void tlb_set_page_with_attrs(CPUState *cpu, target_ulong vaddr,
             /* Write access calls the I/O callback.  */
             te->addr_write = address | TLB_MMIO;
         } else if (memory_region_is_ram(section->mr)
-                   && cpu_physical_memory_is_clean(
+                   && address_space_is_clean(
                         memory_region_get_ram_addr(section->mr) + xlat)) {
             te->addr_write = address | TLB_NOTDIRTY;
         } else {
diff --git a/disas.c b/disas.c
index 05a7a12..c6128e3 100644
--- a/disas.c
+++ b/disas.c
@@ -356,7 +356,7 @@ monitor_read_memory (bfd_vma memaddr, bfd_byte *myaddr, int length,
     CPUDebug *s = container_of(info, CPUDebug, info);
 
     if (monitor_disas_is_physical) {
-        cpu_physical_memory_read(memaddr, myaddr, length);
+        address_space_read(memaddr, myaddr, length);
     } else {
         cpu_memory_rw_debug(s->cpu, memaddr, myaddr, length, 0);
     }
diff --git a/exec.c b/exec.c
index f09dd4e..e266e68 100644
--- a/exec.c
+++ b/exec.c
@@ -991,9 +991,9 @@ static void tlb_reset_dirty_range_all(ram_addr_t start, ram_addr_t length)
 }
 
 /* Note: start and end must be within the same ram block.  */
-bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
-                                              ram_addr_t length,
-                                              unsigned client)
+bool address_space_test_and_clear_dirty(ram_addr_t start,
+                                        ram_addr_t length,
+                                        unsigned client)
 {
     DirtyMemoryBlocks *blocks;
     unsigned long end, page;
@@ -1523,9 +1523,9 @@ int qemu_ram_resize(ram_addr_t base, ram_addr_t newsize, Error **errp)
         return -EINVAL;
     }
 
-    cpu_physical_memory_clear_dirty_range(block->offset, block->used_length);
+    address_space_clear_dirty_range(block->offset, block->used_length);
     block->used_length = newsize;
-    cpu_physical_memory_set_dirty_range(block->offset, block->used_length,
+    address_space_set_dirty_range(block->offset, block->used_length,
                                         DIRTY_CLIENTS_ALL);
     memory_region_set_size(block->mr, newsize);
     if (block->resized) {
@@ -1638,9 +1638,9 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
     ram_list.version++;
     qemu_mutex_unlock_ramlist();
 
-    cpu_physical_memory_set_dirty_range(new_block->offset,
-                                        new_block->used_length,
-                                        DIRTY_CLIENTS_ALL);
+    address_space_set_dirty_range(new_block->offset,
+                                  new_block->used_length,
+                                  DIRTY_CLIENTS_ALL);
 
     if (new_block->host) {
         qemu_ram_setup_dump(new_block->host, new_block->max_length);
@@ -2035,7 +2035,7 @@ MemoryRegion *qemu_ram_addr_from_host(void *ptr, ram_addr_t *ram_addr)
 static void notdirty_mem_write(void *opaque, hwaddr ram_addr,
                                uint64_t val, unsigned size)
 {
-    if (!cpu_physical_memory_get_dirty_flag(ram_addr, DIRTY_MEMORY_CODE)) {
+    if (!address_space_get_dirty_flag(ram_addr, DIRTY_MEMORY_CODE)) {
         tb_invalidate_phys_page_fast(ram_addr, size);
     }
     switch (size) {
@@ -2054,11 +2054,11 @@ static void notdirty_mem_write(void *opaque, hwaddr ram_addr,
     /* Set both VGA and migration bits for simplicity and to remove
      * the notdirty callback faster.
      */
-    cpu_physical_memory_set_dirty_range(ram_addr, size,
-                                        DIRTY_CLIENTS_NOCODE);
+    address_space_set_dirty_range(ram_addr, size,
+                                  DIRTY_CLIENTS_NOCODE);
     /* we remove the notdirty callback only if the code has been
        flushed */
-    if (!cpu_physical_memory_is_clean(ram_addr)) {
+    if (!address_space_is_clean(ram_addr)) {
         tlb_set_dirty(current_cpu, current_cpu->mem_io_vaddr);
     }
 }
@@ -2509,18 +2509,18 @@ static void invalidate_and_set_dirty(MemoryRegion *mr, hwaddr addr,
 {
     uint8_t dirty_log_mask = memory_region_get_dirty_log_mask(mr);
     /* No early return if dirty_log_mask is or becomes 0, because
-     * cpu_physical_memory_set_dirty_range will still call
+     * address_space_set_dirty_range will still call
      * xen_modified_memory.
      */
     if (dirty_log_mask) {
         dirty_log_mask =
-            cpu_physical_memory_range_includes_clean(addr, length, dirty_log_mask);
+            address_space_range_includes_clean(addr, length, dirty_log_mask);
     }
     if (dirty_log_mask & (1 << DIRTY_MEMORY_CODE)) {
         tb_invalidate_phys_range(addr, addr + length);
         dirty_log_mask &= ~(1 << DIRTY_MEMORY_CODE);
     }
-    cpu_physical_memory_set_dirty_range(addr, length, dirty_log_mask);
+    address_space_set_dirty_range(addr, length, dirty_log_mask);
 }
 
 static int memory_access_size(MemoryRegion *mr, unsigned l, hwaddr addr)
@@ -2768,8 +2768,8 @@ MemTxResult address_space_rw(AddressSpace *as, hwaddr addr, MemTxAttrs attrs,
     }
 }
 
-void cpu_physical_memory_rw(hwaddr addr, uint8_t *buf,
-                            int len, int is_write)
+void address_space_rw(hwaddr addr, uint8_t *buf,
+                      int len, int is_write)
 {
     address_space_rw(&address_space_memory, addr, MEMTXATTRS_UNSPECIFIED,
                      buf, len, is_write);
@@ -2780,7 +2780,7 @@ enum write_rom_type {
     FLUSH_CACHE,
 };
 
-static inline void cpu_physical_memory_write_rom_internal(AddressSpace *as,
+static inline void address_space_write_rom_internal(AddressSpace *as,
     hwaddr addr, const uint8_t *buf, int len, enum write_rom_type type)
 {
     hwaddr l;
@@ -2818,10 +2818,10 @@ static inline void cpu_physical_memory_write_rom_internal(AddressSpace *as,
 }
 
 /* used for ROM loading : can write in RAM and ROM */
-void cpu_physical_memory_write_rom(AddressSpace *as, hwaddr addr,
+void address_space_write_rom(AddressSpace *as, hwaddr addr,
                                    const uint8_t *buf, int len)
 {
-    cpu_physical_memory_write_rom_internal(as, addr, buf, len, WRITE_DATA);
+    address_space_write_rom_internal(as, addr, buf, len, WRITE_DATA);
 }
 
 void cpu_flush_icache_range(hwaddr start, int len)
@@ -2836,8 +2836,8 @@ void cpu_flush_icache_range(hwaddr start, int len)
         return;
     }
 
-    cpu_physical_memory_write_rom_internal(&address_space_memory,
-                                           start, NULL, len, FLUSH_CACHE);
+    address_space_write_rom_internal(&address_space_memory,
+                                     start, NULL, len, FLUSH_CACHE);
 }
 
 typedef struct {
@@ -3050,15 +3050,15 @@ void address_space_unmap(AddressSpace *as, void *buffer, hwaddr len,
     cpu_notify_map_clients();
 }
 
-void *cpu_physical_memory_map(hwaddr addr,
-                              hwaddr *plen,
-                              int is_write)
+void *address_space_map(hwaddr addr,
+                        hwaddr *plen,
+                        int is_write)
 {
     return address_space_map(&address_space_memory, addr, plen, is_write);
 }
 
-void cpu_physical_memory_unmap(void *buffer, hwaddr len,
-                               int is_write, hwaddr access_len)
+void address_space_unmap(void *buffer, hwaddr len,
+                         int is_write, hwaddr access_len)
 {
     return address_space_unmap(&address_space_memory, buffer, len, is_write, access_len);
 }
@@ -3398,7 +3398,7 @@ void address_space_stl_notdirty(AddressSpace *as, hwaddr addr, uint32_t val,
 
         dirty_log_mask = memory_region_get_dirty_log_mask(mr);
         dirty_log_mask &= ~(1 << DIRTY_MEMORY_CODE);
-        cpu_physical_memory_set_dirty_range(addr1, 4, dirty_log_mask);
+        address_space_set_dirty_range(addr1, 4, dirty_log_mask);
         r = MEMTX_OK;
     }
     if (result) {
@@ -3689,7 +3689,7 @@ int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
             l = len;
         phys_addr += (addr & ~TARGET_PAGE_MASK);
         if (is_write) {
-            cpu_physical_memory_write_rom(cpu->cpu_ases[asidx].as,
+            address_space_write_rom(cpu->cpu_ases[asidx].as,
                                           phys_addr, buf, l);
         } else {
             address_space_rw(cpu->cpu_ases[asidx].as, phys_addr,
@@ -3729,7 +3729,7 @@ bool target_words_bigendian(void)
 }
 
 #ifndef CONFIG_USER_ONLY
-bool cpu_physical_memory_is_io(hwaddr phys_addr)
+bool address_space_is_io(hwaddr phys_addr)
 {
     MemoryRegion*mr;
     hwaddr l = 1;
-- 
2.5.0


