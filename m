Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TSQgl-0003aw-7h
	for mharc-qemu-trivial@gnu.org; Sun, 28 Oct 2012 07:05:55 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TSQgf-0003Ql-Q9
	for qemu-trivial@nongnu.org; Sun, 28 Oct 2012 07:05:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TSQgd-00081K-PH
	for qemu-trivial@nongnu.org; Sun, 28 Oct 2012 07:05:49 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:63527)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TSQga-0007pH-TV; Sun, 28 Oct 2012 07:05:45 -0400
Received: by mail-lb0-f173.google.com with SMTP id gj3so2423304lbb.4
	for <multiple recipients>; Sun, 28 Oct 2012 04:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=rq4PG2Vczb1U26N+R7tXu+SakCowBz+S6dVjFBtxCdg=;
	b=RHNI607/b5tUU8spSDQgHlfTHN2qA9r7/EDrheFwJjMcdAFn4EizfBV3+831elKaUo
	gNRONJS0D4XnxAVArO8XYpLDzTpxICCZRQ+CIxV8Imqpb6Ze+/PWlYKXyBjDwlemrFFf
	ADAzcrgSbJrwMDOZkZL1wPZ+jcbpEYrnGBhTaWRrnkfPwBU9igVsMX6kSCxN2pklJQWO
	B6MdOpWkF44Yy5dNUMqCgbQj5Pb0h/cmFKlgDIReO9uFln8X9Pr/xu7Yz19fvJK3roQl
	hntrC/zEsWmN0wb9W/rhLGeAQHatX+271TQoyMZbiHRqTUEDWCXNBolBSs+LjLyM5Knz
	aOog==
Received: by 10.152.124.83 with SMTP id mg19mr24546832lab.6.1351422344344;
	Sun, 28 Oct 2012 04:05:44 -0700 (PDT)
Received: from localhost.localdomain (blueswirl.broker.freenet6.net.
	[2001:5c0:1000:b::b867])
	by mx.google.com with ESMTPS id ft3sm2070067lbb.1.2012.10.28.04.05.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 28 Oct 2012 04:05:43 -0700 (PDT)
From: Blue Swirl <blauwirbel@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 28 Oct 2012 11:04:51 +0000
Message-Id: <b437a772a02f8f2c7b9c7f7a21464cb8a5e4b0ca.1351422116.git.blauwirbel@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1351422116.git.blauwirbel@gmail.com>
References: <cover.1351422116.git.blauwirbel@gmail.com>
In-Reply-To: <cover.1351422116.git.blauwirbel@gmail.com>
References: <cover.1351422116.git.blauwirbel@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com
Subject: [Qemu-trivial] [PATCH v2 6/6] exec: make some functions static
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
X-List-Received-Date: Sun, 28 Oct 2012 11:05:51 -0000

Signed-off-by: Blue Swirl <blauwirbel@gmail.com>
---
 cpu-common.h      |    5 -----
 exec-all.h        |    2 --
 exec.c            |   15 +++++++++------
 memory-internal.h |    2 --
 4 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/cpu-common.h b/cpu-common.h
index 5f93089..d2fbafa 100644
--- a/cpu-common.h
+++ b/cpu-common.h
@@ -39,10 +39,6 @@ typedef uint32_t CPUReadMemoryFunc(void *opaque, hwaddr addr);
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
@@ -67,7 +63,6 @@ void *cpu_physical_memory_map(hwaddr addr,
 void cpu_physical_memory_unmap(void *buffer, hwaddr len,
                                int is_write, hwaddr access_len);
 void *cpu_register_map_client(void *opaque, void (*callback)(void *opaque));
-void cpu_unregister_map_client(void *cookie);
 
 bool cpu_physical_memory_is_io(hwaddr phys_addr);
 
diff --git a/exec-all.h b/exec-all.h
index 2ea0e4f..8db47f5 100644
--- a/exec-all.h
+++ b/exec-all.h
@@ -194,8 +194,6 @@ static inline unsigned int tb_phys_hash_func(tb_page_addr_t pc)
 
 void tb_free(TranslationBlock *tb);
 void tb_flush(CPUArchState *env);
-void tb_link_page(TranslationBlock *tb,
-                  tb_page_addr_t phys_pc, tb_page_addr_t phys_page2);
 void tb_phys_invalidate(TranslationBlock *tb, tb_page_addr_t page_addr);
 
 extern TranslationBlock *tb_phys_hash[CODE_GEN_PHYS_HASH_SIZE];
diff --git a/exec.c b/exec.c
index b0ed593..42cc097 100644
--- a/exec.c
+++ b/exec.c
@@ -188,9 +188,12 @@ static unsigned phys_map_nodes_nb, phys_map_nodes_nb_alloc;
 
 static void io_mem_init(void);
 static void memory_map_init(void);
+static void *qemu_safe_ram_ptr(ram_addr_t addr);
 
 static MemoryRegion io_mem_watch;
 #endif
+static void tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
+                         tb_page_addr_t phys_page2);
 
 /* statistics */
 static int tb_flush_count;
@@ -1349,8 +1352,8 @@ static inline void tb_alloc_page(TranslationBlock *tb,
 
 /* add a new TB and link it to the physical page tables. phys_page2 is
    (-1) to indicate that only one page contains the TB. */
-void tb_link_page(TranslationBlock *tb,
-                  tb_page_addr_t phys_pc, tb_page_addr_t phys_page2)
+static void tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
+                         tb_page_addr_t phys_page2)
 {
     unsigned int h;
     TranslationBlock **ptb;
@@ -1859,7 +1862,7 @@ void cpu_physical_memory_reset_dirty(ram_addr_t start, ram_addr_t end,
     }
 }
 
-int cpu_physical_memory_set_dirty_tracking(int enable)
+static int cpu_physical_memory_set_dirty_tracking(int enable)
 {
     int ret = 0;
     in_migration = enable;
@@ -2741,7 +2744,7 @@ void *qemu_get_ram_ptr(ram_addr_t addr)
 /* Return a host pointer to ram allocated with qemu_ram_alloc.
  * Same as qemu_get_ram_ptr but avoid reordering ramblocks.
  */
-void *qemu_safe_ram_ptr(ram_addr_t addr)
+static void *qemu_safe_ram_ptr(ram_addr_t addr)
 {
     RAMBlock *block;
 
@@ -2771,7 +2774,7 @@ void *qemu_safe_ram_ptr(ram_addr_t addr)
 
 /* Return a host pointer to guest's ram. Similar to qemu_get_ram_ptr
  * but takes a size argument */
-void *qemu_ram_ptr_length(ram_addr_t addr, ram_addr_t *size)
+static void *qemu_ram_ptr_length(ram_addr_t addr, ram_addr_t *size)
 {
     if (*size == 0) {
         return NULL;
@@ -3519,7 +3522,7 @@ void *cpu_register_map_client(void *opaque, void (*callback)(void *opaque))
     return client;
 }
 
-void cpu_unregister_map_client(void *_client)
+static void cpu_unregister_map_client(void *_client)
 {
     MapClient *client = (MapClient *)_client;
 
diff --git a/memory-internal.h b/memory-internal.h
index 1c34b97..1da2400 100644
--- a/memory-internal.h
+++ b/memory-internal.h
@@ -55,8 +55,6 @@ struct MemoryRegionSection;
 void qemu_register_coalesced_mmio(hwaddr addr, ram_addr_t size);
 void qemu_unregister_coalesced_mmio(hwaddr addr, ram_addr_t size);
 
-int cpu_physical_memory_set_dirty_tracking(int enable);
-
 #define VGA_DIRTY_FLAG       0x01
 #define CODE_DIRTY_FLAG      0x02
 #define MIGRATION_DIRTY_FLAG 0x08
-- 
1.7.2.5


