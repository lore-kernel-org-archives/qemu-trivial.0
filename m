Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TNUMz-0002x7-HG
	for mharc-qemu-trivial@gnu.org; Sun, 14 Oct 2012 16:01:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNUMw-0002u9-TO
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:01:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNUMv-0003Im-Ox
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:01:02 -0400
Received: from mail-la0-f45.google.com ([209.85.215.45]:37016)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TNUMs-0002LR-Fd; Sun, 14 Oct 2012 16:00:58 -0400
Received: by mail-la0-f45.google.com with SMTP id m13so2786709lah.4
	for <multiple recipients>; Sun, 14 Oct 2012 13:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=CZxCA1Mr91AWEZfgQOl6t6NfamybbjBuS1eoWD51+dI=;
	b=WSRGsLja285+9RNRvPbbWY2UJuF7cxa5xIMq0fdq5ls7b5jZw7wn6cBTRZCoruLuuV
	xD3fIDnha4aONYB9EchBT0DZ2JWHP50FKPhYRkKdo/trpziVTk7yF/mbJ2DLFdgsT8rI
	Fqw0T0gtmul/N6HXKkMNqOPVfzwAbXfBW9evcjHtjm35apAXKOY+5QKA22bAJCcK3c8Y
	iDJTK8fVc67/ZPtA2pwBgwpijvAHGHgavBMVoaycwvc6F86TZzYwb1ed1pCVrvQsoSaO
	byFD698ZO/1pzvndjUWfIjc/R8kA60vziGwOrNfh4FlnFVihc6HhOdCkFSkoyg2HYF7C
	7E7Q==
Received: by 10.112.13.173 with SMTP id i13mr3585851lbc.108.1350244857820;
	Sun, 14 Oct 2012 13:00:57 -0700 (PDT)
Received: from localhost.localdomain (blueswirl.broker.freenet6.net.
	[2001:5c0:1000:b::b867])
	by mx.google.com with ESMTPS id r8sm3941759lba.15.2012.10.14.13.00.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 14 Oct 2012 13:00:56 -0700 (PDT)
From: Blue Swirl <blauwirbel@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 14 Oct 2012 19:58:59 +0000
Message-Id: <d3cbc356c90e1ae18a352b9d6978bd56460e655d.1350244587.git.blauwirbel@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.45
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com
Subject: [Qemu-trivial] [PATCH 11/11] exec: make some functions static
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
X-List-Received-Date: Sun, 14 Oct 2012 20:01:04 -0000

Signed-off-by: Blue Swirl <blauwirbel@gmail.com>
---
 cpu-common.h    |    5 -----
 exec-all.h      |    2 --
 exec-obsolete.h |    4 ----
 exec.c          |   19 +++++++++++--------
 4 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/cpu-common.h b/cpu-common.h
index c0d27af..f51ba67 100644
--- a/cpu-common.h
+++ b/cpu-common.h
@@ -39,10 +39,6 @@ typedef uint32_t CPUReadMemoryFunc(void *opaque, target_phys_addr_t addr);
 void qemu_ram_remap(ram_addr_t addr, ram_addr_t length);
 /* This should only be used for ram local to a device.  */
 void *qemu_get_ram_ptr(ram_addr_t addr);
-void *qemu_ram_ptr_length(ram_addr_t addr, ram_addr_t *size);
-/* Same but slower, to use for migration, where the order of
- * RAMBlocks must not change. */
-void *qemu_safe_ram_ptr(ram_addr_t addr);
 void qemu_put_ram_ptr(void *addr);
 /* This should not be used by devices.  */
 int qemu_ram_addr_from_host(void *ptr, ram_addr_t *ram_addr);
@@ -67,7 +63,6 @@ void *cpu_physical_memory_map(target_phys_addr_t addr,
 void cpu_physical_memory_unmap(void *buffer, target_phys_addr_t len,
                                int is_write, target_phys_addr_t access_len);
 void *cpu_register_map_client(void *opaque, void (*callback)(void *opaque));
-void cpu_unregister_map_client(void *cookie);
 
 bool cpu_physical_memory_is_io(target_phys_addr_t phys_addr);
 
diff --git a/exec-all.h b/exec-all.h
index 6516da0..4a8a19b 100644
--- a/exec-all.h
+++ b/exec-all.h
@@ -196,8 +196,6 @@ static inline unsigned int tb_phys_hash_func(tb_page_addr_t pc)
 
 void tb_free(TranslationBlock *tb);
 void tb_flush(CPUArchState *env);
-void tb_link_page(TranslationBlock *tb,
-                  tb_page_addr_t phys_pc, tb_page_addr_t phys_page2);
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
 
 extern TranslationBlock *tb_phys_hash[CODE_GEN_PHYS_HASH_SIZE];
diff --git a/exec-obsolete.h b/exec-obsolete.h
index 286e2f7..d7a88a0 100644
--- a/exec-obsolete.h
+++ b/exec-obsolete.h
@@ -34,14 +34,10 @@ void qemu_ram_free_from_ptr(ram_addr_t addr);
 
 struct MemoryRegion;
 struct MemoryRegionSection;
-void cpu_register_physical_memory_log(struct MemoryRegionSection *section,
-                                      bool readonly);
 
 void qemu_register_coalesced_mmio(target_phys_addr_t addr, ram_addr_t size);
 void qemu_unregister_coalesced_mmio(target_phys_addr_t addr, ram_addr_t size);
 
-int cpu_physical_memory_set_dirty_tracking(int enable);
-
 #define VGA_DIRTY_FLAG       0x01
 #define CODE_DIRTY_FLAG      0x02
 #define MIGRATION_DIRTY_FLAG 0x08
diff --git a/exec.c b/exec.c
index 7899042..4344f2b 100644
--- a/exec.c
+++ b/exec.c
@@ -212,9 +212,12 @@ static PhysPageEntry phys_map = { .ptr = PHYS_MAP_NODE_NIL, .is_leaf = 0 };
 
 static void io_mem_init(void);
 static void memory_map_init(void);
+static void *qemu_safe_ram_ptr(ram_addr_t addr);
 
 static MemoryRegion io_mem_watch;
 #endif
+static void tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
+                         tb_page_addr_t phys_page2);
 
 /* statistics */
 static int tb_flush_count;
@@ -1341,8 +1344,8 @@ static inline void tb_alloc_page(TranslationBlock *tb,
 
 /* add a new TB and link it to the physical page tables. phys_page2 is
    (-1) to indicate that only one page contains the TB. */
-void tb_link_page(TranslationBlock *tb,
-                  tb_page_addr_t phys_pc, tb_page_addr_t phys_page2)
+static void tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
+                         tb_page_addr_t phys_page2)
 {
     unsigned int h;
     TranslationBlock **ptb;
@@ -1851,7 +1854,7 @@ void cpu_physical_memory_reset_dirty(ram_addr_t start, ram_addr_t end,
     }
 }
 
-int cpu_physical_memory_set_dirty_tracking(int enable)
+static int cpu_physical_memory_set_dirty_tracking(int enable)
 {
     int ret = 0;
     in_migration = enable;
@@ -2272,8 +2275,8 @@ static void register_multipage(MemoryRegionSection *section)
                   section_index);
 }
 
-void cpu_register_physical_memory_log(MemoryRegionSection *section,
-                                      bool readonly)
+static void cpu_register_physical_memory_log(MemoryRegionSection *section,
+                                             bool readonly)
 {
     MemoryRegionSection now = *section, remain = *section;
 
@@ -2745,7 +2748,7 @@ void *qemu_get_ram_ptr(ram_addr_t addr)
 /* Return a host pointer to ram allocated with qemu_ram_alloc.
  * Same as qemu_get_ram_ptr but avoid reordering ramblocks.
  */
-void *qemu_safe_ram_ptr(ram_addr_t addr)
+static void *qemu_safe_ram_ptr(ram_addr_t addr)
 {
     RAMBlock *block;
 
@@ -2775,7 +2778,7 @@ void *qemu_safe_ram_ptr(ram_addr_t addr)
 
 /* Return a host pointer to guest's ram. Similar to qemu_get_ram_ptr
  * but takes a size argument */
-void *qemu_ram_ptr_length(ram_addr_t addr, ram_addr_t *size)
+static void *qemu_ram_ptr_length(ram_addr_t addr, ram_addr_t *size)
 {
     if (*size == 0) {
         return NULL;
@@ -3569,7 +3572,7 @@ void *cpu_register_map_client(void *opaque, void (*callback)(void *opaque))
     return client;
 }
 
-void cpu_unregister_map_client(void *_client)
+static void cpu_unregister_map_client(void *_client)
 {
     MapClient *client = (MapClient *)_client;
 
-- 
1.7.2.5


