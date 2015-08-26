Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUYiB-0003AZ-IH
	for mharc-qemu-trivial@gnu.org; Wed, 26 Aug 2015 07:17:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZUYi3-0002wy-9O
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 07:17:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZUYi0-000878-QE
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 07:17:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38210)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1ZUYhs-00082y-Tg; Wed, 26 Aug 2015 07:17:29 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 78A4FA9A;
	Wed, 26 Aug 2015 11:17:28 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-4-60.ams2.redhat.com
	[10.36.4.60])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7QBHODr028642; Wed, 26 Aug 2015 07:17:27 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 26 Aug 2015 12:17:13 +0100
Message-Id: <1440587838-25595-3-git-send-email-berrange@redhat.com>
In-Reply-To: <1440587838-25595-1-git-send-email-berrange@redhat.com>
References: <1440587838-25595-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PATCH 2/7] maint: remove / fix many doubled words
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
X-List-Received-Date: Wed, 26 Aug 2015 11:17:45 -0000

Many source files have doubled words (eg "the the", "to to",
and so on). Most of these can simply be removed, but a couple
were actual mis-spellings (eg "to to" instead of "to do").
There was even one triple word score "to to to" :-)

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 block/qcow2-cluster.c         | 4 ++--
 block/qcow2-refcount.c        | 2 +-
 docs/libcacard.txt            | 4 ++--
 docs/multiseat.txt            | 2 +-
 docs/specs/qcow2.txt          | 2 +-
 docs/specs/rocker.txt         | 2 +-
 hw/net/rtl8139.c              | 2 +-
 hw/usb/host-libusb.c          | 2 +-
 hw/vfio/common.c              | 2 +-
 include/block/block.h         | 2 +-
 include/exec/memory.h         | 2 +-
 linux-user/elfload.c          | 2 +-
 migration/rdma.c              | 2 +-
 qemu-doc.texi                 | 2 +-
 qemu-img.texi                 | 2 +-
 qemu-options.hx               | 2 +-
 target-arm/cpu.h              | 4 ++--
 target-arm/helper.c           | 2 +-
 target-arm/translate.c        | 2 +-
 target-lm32/helper.c          | 2 +-
 target-microblaze/translate.c | 2 +-
 target-moxie/helper.c         | 2 +-
 util/bitmap.c                 | 2 +-
 23 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index b43f186..61309ae 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -498,7 +498,7 @@ int qcow2_get_cluster_offset(BlockDriverState *bs, uint64_t offset,
 
     *cluster_offset = 0;
 
-    /* seek the the l2 offset in the l1 table */
+    /* seek to the l2 offset in the l1 table */
 
     l1_index = offset >> l1_bits;
     if (l1_index >= s->l1_size) {
@@ -612,7 +612,7 @@ static int get_cluster_table(BlockDriverState *bs, uint64_t offset,
     uint64_t *l2_table = NULL;
     int ret;
 
-    /* seek the the l2 offset in the l1 table */
+    /* seek to the l2 offset in the l1 table */
 
     l1_index = offset >> (s->l2_bits + s->cluster_bits);
     if (l1_index >= s->l1_size) {
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index b0ee42d..d8f0645 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1294,7 +1294,7 @@ static int realloc_refcount_array(BDRVQcowState *s, void **array,
 /*
  * Increases the refcount for a range of clusters in a given refcount table.
  * This is used to construct a temporary refcount table out of L1 and L2 tables
- * which can be compared the the refcount table saved in the image.
+ * which can be compared to the refcount table saved in the image.
  *
  * Modifies the number of errors in res.
  */
diff --git a/docs/libcacard.txt b/docs/libcacard.txt
index 8db421d..499cf7d 100644
--- a/docs/libcacard.txt
+++ b/docs/libcacard.txt
@@ -327,7 +327,7 @@ and applet.
 
         int vcard_emul_get_login_count(VCard *card);
 
-    This function returns the the number of remaining login attempts for this
+    This function returns the number of remaining login attempts for this
     card. If the card emulator does not know, or the card does not have a
     way of giving this information, this function returns -1.
 
@@ -421,7 +421,7 @@ functions:
       The vcard is the value returned from vcard_new. The type is the
       card type emulator that this card should presented to the guest as.
       The flags are card type emulator specific options. The certs,
-      cert_len, and keys are all arrays of length cert_count. These are the
+      cert_len, and keys are all arrays of length cert_count. These are
       the same of the parameters xxxx_card_init() accepts.
 
    Finally the card is associated with its reader by the call:
diff --git a/docs/multiseat.txt b/docs/multiseat.txt
index ebf2446..807518c 100644
--- a/docs/multiseat.txt
+++ b/docs/multiseat.txt
@@ -135,7 +135,7 @@ configuration:
             TAG+="seat", ENV{ID_AUTOSEAT}="1"
 
 Patch with this rule has been submitted to upstream udev/systemd, was
-accepted and and should be included in the next systemd release (222).
+accepted and should be included in the next systemd release (222).
 So, if your guest has this or a newer version, multiseat will work just
 fine without any manual guest configuration.
 
diff --git a/docs/specs/qcow2.txt b/docs/specs/qcow2.txt
index 121dfc8..f236d8c 100644
--- a/docs/specs/qcow2.txt
+++ b/docs/specs/qcow2.txt
@@ -257,7 +257,7 @@ L2 table entry:
 
               63:   0 for a cluster that is unused or requires COW, 1 if its
                     refcount is exactly one. This information is only accurate
-                    in L2 tables that are reachable from the the active L1
+                    in L2 tables that are reachable from the active L1
                     table.
 
 Standard Cluster Descriptor:
diff --git a/docs/specs/rocker.txt b/docs/specs/rocker.txt
index 1c74351..d2a8262 100644
--- a/docs/specs/rocker.txt
+++ b/docs/specs/rocker.txt
@@ -297,7 +297,7 @@ but not fired.  If only partial credits are returned, the interrupt remains
 masked but the device generates an interrupt, signaling the driver that more
 outstanding work is available.
 
-(* this masking is unrelated to to the MSI-X interrupt mask register)
+(* this masking is unrelated to the MSI-X interrupt mask register)
 
 Endianness
 ----------
diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index edbb61c..78ae4cd 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -43,7 +43,7 @@
  *                                  Added rx/tx buffer reset when enabling rx/tx operation
  *
  *  2010-Feb-04  Frediano Ziglio:   Rewrote timer support using QEMU timer only
- *                                  when strictly needed (required for for
+ *                                  when strictly needed (required for
  *                                  Darwin)
  *  2011-Mar-22  Benjamin Poirier:  Implemented VLAN offloading
  */
diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index 11429f5..5e492fd 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -1429,7 +1429,7 @@ static void usb_host_free_streams(USBDevice *udev, USBEndpoint **eps,
  * still present in the first place.  Attemping to contine where we
  * left off is impossible.
  *
- * What we are going to to to here is emulate a surprise removal of
+ * What we are going to do here is emulate a surprise removal of
  * the usb device passed through, then kick host scan so the device
  * will get re-attached (and re-initialized by the guest) in case it
  * is still present.
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 85ee9b0..6d21311 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -226,7 +226,7 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
     /*
      * Try the mapping, if it fails with EBUSY, unmap the region and try
      * again.  This shouldn't be necessary, but we sometimes see it in
-     * the the VGA ROM space.
+     * the VGA ROM space.
      */
     if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map) == 0 ||
         (errno == EBUSY && vfio_dma_unmap(container, iova, size) == 0 &&
diff --git a/include/block/block.h b/include/block/block.h
index 37916f7..fe4fcc8 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -23,7 +23,7 @@ typedef struct BlockDriverInfo {
     bool is_dirty;
     /*
      * True if unallocated blocks read back as zeroes. This is equivalent
-     * to the the LBPRZ flag in the SCSI logical block provisioning page.
+     * to the LBPRZ flag in the SCSI logical block provisioning page.
      */
     bool unallocated_blocks_are_zero;
     /*
diff --git a/include/exec/memory.h b/include/exec/memory.h
index b18b351..6a5fc9c 100644
--- a/include/exec/memory.h
+++ b/include/exec/memory.h
@@ -324,7 +324,7 @@ void memory_region_unref(MemoryRegion *mr);
  * @owner: the object that tracks the region's reference count
  * @ops: a structure containing read and write callbacks to be used when
  *       I/O is performed on the region.
- * @opaque: passed to to the read and write callbacks of the @ops structure.
+ * @opaque: passed to the read and write callbacks of the @ops structure.
  * @name: used for debugging; not visible to the user or ABI
  * @size: size of the region.
  */
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 1788368..b0a98d5 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -3016,7 +3016,7 @@ static int elf_core_dump(int signr, const CPUArchState *env)
     if (dump_write(fd, &elf, sizeof (elf)) != 0)
         goto out;
 
-    /* fill in in-memory version of notes */
+    /* fill in the in-memory version of notes */
     if (fill_note_info(&info, signr, env) < 0)
         goto out;
 
diff --git a/migration/rdma.c b/migration/rdma.c
index 74876fd..9424834 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -778,7 +778,7 @@ static void qemu_rdma_dump_gid(const char *who, struct rdma_cm_id *id)
  *
  *  If the source VM connects with an IPv4 address without knowing that the
  *  destination has bound to '[::]' the migration will unconditionally fail
- *  unless the management software is explicitly listening on the the IPv4
+ *  unless the management software is explicitly listening on the IPv4
  *  address while using a RoCE-based device.
  *
  *  If the source VM connects with an IPv6 address, then we're OK because we can
diff --git a/qemu-doc.texi b/qemu-doc.texi
index 94af8c0..ed0c755 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -1766,7 +1766,7 @@ Use @code{set architecture i8086} to dump 16 bit code. Then use
 
 Advanced debugging options:
 
-The default single stepping behavior is step with the IRQs and timer service routines off.  It is set this way because when gdb executes a single step it expects to advance beyond the current instruction.  With the IRQs and and timer service routines on, a single step might jump into the one of the interrupt or exception vectors instead of executing the current instruction. This means you may hit the same breakpoint a number of times before executing the instruction gdb wants to have executed.  Because there are rare circumstances where you want to single step into an interrupt vector the behavior can be controlled from GDB.  There are three commands you can query and set the single step behavior:
+The default single stepping behavior is step with the IRQs and timer service routines off.  It is set this way because when gdb executes a single step it expects to advance beyond the current instruction.  With the IRQs and timer service routines on, a single step might jump into the one of the interrupt or exception vectors instead of executing the current instruction. This means you may hit the same breakpoint a number of times before executing the instruction gdb wants to have executed.  Because there are rare circumstances where you want to single step into an interrupt vector the behavior can be controlled from GDB.  There are three commands you can query and set the single step behavior:
 @table @code
 @item maintenance packet qqemu.sstepbits
 
diff --git a/qemu-img.texi b/qemu-img.texi
index 0a1ab35..55c6be3 100644
--- a/qemu-img.texi
+++ b/qemu-img.texi
@@ -103,7 +103,7 @@ First image format
 @item -F
 Second image format
 @item -s
-Strict mode - fail on on different image size or sector allocation
+Strict mode - fail on different image size or sector allocation
 @end table
 
 Parameters to convert subcommand:
diff --git a/qemu-options.hx b/qemu-options.hx
index 77f5853..369ba26 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3147,7 +3147,7 @@ provide cycle accurate emulation.  Modern CPUs contain superscalar out of
 order cores with complex cache hierarchies.  The number of instructions
 executed often has little or no correlation with actual performance.
 
-@option{align=on} will activate the delay algorithm which will try to
+@option{align=on} will activate the delay algorithm which will try
 to synchronise the host clock and the virtual clock. The goal is to
 have a guest running at the real frequency imposed by the shift option.
 Whenever the guest clock is behind the host clock and if
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 2e680da..74f1379 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -172,7 +172,7 @@ typedef struct CPUARMState {
     uint32_t GE; /* cpsr[19:16] */
     uint32_t thumb; /* cpsr[5]. 0 = arm mode, 1 = thumb mode. */
     uint32_t condexec_bits; /* IT bits.  cpsr[15:10,26:25].  */
-    uint64_t daif; /* exception masks, in the bits they are in in PSTATE */
+    uint64_t daif; /* exception masks, in the bits they are in PSTATE */
 
     uint64_t elr_el[4]; /* AArch64 exception link regs  */
     uint64_t sp_el[4]; /* AArch64 banked stack pointers */
@@ -1484,7 +1484,7 @@ bool write_list_to_cpustate(ARMCPU *cpu);
  */
 bool write_cpustate_to_list(ARMCPU *cpu);
 
-/* Does the core conform to the the "MicroController" profile. e.g. Cortex-M3.
+/* Does the core conform to the "MicroController" profile. e.g. Cortex-M3.
    Note the M in older cores (eg. ARM7TDMI) stands for Multiply. These are
    conventional cores (ie. Application or Realtime profile).  */
 
diff --git a/target-arm/helper.c b/target-arm/helper.c
index 1568aa6..04f04a1 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -2094,7 +2094,7 @@ static void vmsa_ttbcr_raw_write(CPUARMState *env, const ARMCPRegInfo *ri,
         }
     }
 
-    /* Update the masks corresponding to the the TCR bank being written
+    /* Update the masks corresponding to the TCR bank being written
      * Note that we always calculate mask and base_mask, but
      * they are only used for short-descriptor tables (ie if EAE is 0);
      * for long-descriptor tables the TCR fields are used differently
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 69ac18c..6a3de30 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -8500,7 +8500,7 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 }
                 /* Perform base writeback before the loaded value to
                    ensure correct behavior with overlapping index registers.
-                   ldrd with base writeback is is undefined if the
+                   ldrd with base writeback is undefined if the
                    destination and index registers overlap.  */
                 if (!(insn & (1 << 24))) {
                     gen_add_datah_offset(s, insn, address_offset, addr);
diff --git a/target-lm32/helper.c b/target-lm32/helper.c
index a88aa5a..e26c133 100644
--- a/target-lm32/helper.c
+++ b/target-lm32/helper.c
@@ -81,7 +81,7 @@ void lm32_watchpoint_insert(CPULM32State *env, int idx, target_ulong address,
 
     switch (wp_type) {
     case LM32_WP_DISABLED:
-        /* nothing to to */
+        /* nothing to do */
         break;
     case LM32_WP_READ:
         flags = BP_CPU | BP_STOP_BEFORE_ACCESS | BP_MEM_READ;
diff --git a/target-microblaze/translate.c b/target-microblaze/translate.c
index f4e969b..e566401 100644
--- a/target-microblaze/translate.c
+++ b/target-microblaze/translate.c
@@ -1027,7 +1027,7 @@ static void dec_load(DisasContext *dc)
     tcg_temp_free(v);
 
     if (ex) { /* lwx */
-        /* no support for for AXI exclusive so always clear C */
+        /* no support for AXI exclusive so always clear C */
         write_carryi(dc, 0);
     }
 
diff --git a/target-moxie/helper.c b/target-moxie/helper.c
index 6c98965..f21e884 100644
--- a/target-moxie/helper.c
+++ b/target-moxie/helper.c
@@ -56,7 +56,7 @@ void helper_raise_exception(CPUMoxieState *env, int ex)
     /* Stash the address where the exception occurred.  */
     cpu_restore_state(cs, GETPC());
     env->sregs[5] = env->pc;
-    /* Jump the the exception handline routine.  */
+    /* Jump to the exception handline routine.  */
     env->pc = env->sregs[1];
     cpu_loop_exit(cs);
 }
diff --git a/util/bitmap.c b/util/bitmap.c
index 300a68e..44f0f48 100644
--- a/util/bitmap.c
+++ b/util/bitmap.c
@@ -14,7 +14,7 @@
 #include "qemu/atomic.h"
 
 /*
- * bitmaps provide an array of bits, implemented using an an
+ * bitmaps provide an array of bits, implemented using an
  * array of unsigned longs.  The number of valid bits in a
  * given bitmap does _not_ need to be an exact multiple of
  * BITS_PER_LONG.
-- 
2.4.3


