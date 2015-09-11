Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaMFQ-0004wN-3X
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 07:12:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMFH-0004hK-Ii
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:11:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMFF-0005N1-6L
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:11:55 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53892)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaMF8-0005Je-GF; Fri, 11 Sep 2015 07:11:46 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6BE7741439;
	Fri, 11 Sep 2015 14:11:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 53113A6A;
	Fri, 11 Sep 2015 14:03:53 +0300 (MSK)
Received: (nullmailer pid 22762 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:29 +0300
Message-Id: <b6af097528caba5b23b79db3f1f1fd08fa4fa11e.1441969369.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
References: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PULL 05/26] maint: remove / fix many doubled words
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
X-List-Received-Date: Fri, 11 Sep 2015 11:11:59 -0000

From: "Daniel P. Berrange" <berrange@redhat.com>

Many source files have doubled words (eg "the the", "to to",
and so on). Most of these can simply be removed, but a couple
were actual mis-spellings (eg "to to" instead of "to do").
There was even one triple word score "to to to" :-)

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
@@ -498,7 +498,7 @@ int qcow2_get_cluster_offset(BlockDriverState *bs, ui=
nt64_t offset,
=20
     *cluster_offset =3D 0;
=20
-    /* seek the the l2 offset in the l1 table */
+    /* seek to the l2 offset in the l1 table */
=20
     l1_index =3D offset >> l1_bits;
     if (l1_index >=3D s->l1_size) {
@@ -612,7 +612,7 @@ static int get_cluster_table(BlockDriverState *bs, ui=
nt64_t offset,
     uint64_t *l2_table =3D NULL;
     int ret;
=20
-    /* seek the the l2 offset in the l1 table */
+    /* seek to the l2 offset in the l1 table */
=20
     l1_index =3D offset >> (s->l2_bits + s->cluster_bits);
     if (l1_index >=3D s->l1_size) {
diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index b0ee42d..d8f0645 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -1294,7 +1294,7 @@ static int realloc_refcount_array(BDRVQcowState *s,=
 void **array,
 /*
  * Increases the refcount for a range of clusters in a given refcount ta=
ble.
  * This is used to construct a temporary refcount table out of L1 and L2=
 tables
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
=20
         int vcard_emul_get_login_count(VCard *card);
=20
-    This function returns the the number of remaining login attempts for=
 this
+    This function returns the number of remaining login attempts for thi=
s
     card. If the card emulator does not know, or the card does not have =
a
     way of giving this information, this function returns -1.
=20
@@ -421,7 +421,7 @@ functions:
       The vcard is the value returned from vcard_new. The type is the
       card type emulator that this card should presented to the guest as=
.
       The flags are card type emulator specific options. The certs,
-      cert_len, and keys are all arrays of length cert_count. These are =
the
+      cert_len, and keys are all arrays of length cert_count. These are
       the same of the parameters xxxx_card_init() accepts.
=20
    Finally the card is associated with its reader by the call:
diff --git a/docs/multiseat.txt b/docs/multiseat.txt
index ebf2446..807518c 100644
--- a/docs/multiseat.txt
+++ b/docs/multiseat.txt
@@ -135,7 +135,7 @@ configuration:
             TAG+=3D"seat", ENV{ID_AUTOSEAT}=3D"1"
=20
 Patch with this rule has been submitted to upstream udev/systemd, was
-accepted and and should be included in the next systemd release (222).
+accepted and should be included in the next systemd release (222).
 So, if your guest has this or a newer version, multiseat will work just
 fine without any manual guest configuration.
=20
diff --git a/docs/specs/qcow2.txt b/docs/specs/qcow2.txt
index 121dfc8..f236d8c 100644
--- a/docs/specs/qcow2.txt
+++ b/docs/specs/qcow2.txt
@@ -257,7 +257,7 @@ L2 table entry:
=20
               63:   0 for a cluster that is unused or requires COW, 1 if=
 its
                     refcount is exactly one. This information is only ac=
curate
-                    in L2 tables that are reachable from the the active =
L1
+                    in L2 tables that are reachable from the active L1
                     table.
=20
 Standard Cluster Descriptor:
diff --git a/docs/specs/rocker.txt b/docs/specs/rocker.txt
index 1c74351..d2a8262 100644
--- a/docs/specs/rocker.txt
+++ b/docs/specs/rocker.txt
@@ -297,7 +297,7 @@ but not fired.  If only partial credits are returned,=
 the interrupt remains
 masked but the device generates an interrupt, signaling the driver that =
more
 outstanding work is available.
=20
-(* this masking is unrelated to to the MSI-X interrupt mask register)
+(* this masking is unrelated to the MSI-X interrupt mask register)
=20
 Endianness
 ----------
diff --git a/hw/net/rtl8139.c b/hw/net/rtl8139.c
index fb2c55c..2040618 100644
--- a/hw/net/rtl8139.c
+++ b/hw/net/rtl8139.c
@@ -43,7 +43,7 @@
  *                                  Added rx/tx buffer reset when enabli=
ng rx/tx operation
  *
  *  2010-Feb-04  Frediano Ziglio:   Rewrote timer support using QEMU tim=
er only
- *                                  when strictly needed (required for f=
or
+ *                                  when strictly needed (required for
  *                                  Darwin)
  *  2011-Mar-22  Benjamin Poirier:  Implemented VLAN offloading
  */
diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index 11429f5..5e492fd 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -1429,7 +1429,7 @@ static void usb_host_free_streams(USBDevice *udev, =
USBEndpoint **eps,
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
@@ -226,7 +226,7 @@ static int vfio_dma_map(VFIOContainer *container, hwa=
ddr iova,
     /*
      * Try the mapping, if it fails with EBUSY, unmap the region and try
      * again.  This shouldn't be necessary, but we sometimes see it in
-     * the the VGA ROM space.
+     * the VGA ROM space.
      */
     if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map) =3D=3D 0 ||
         (errno =3D=3D EBUSY && vfio_dma_unmap(container, iova, size) =3D=
=3D 0 &&
diff --git a/include/block/block.h b/include/block/block.h
index 608cd4e..0acd104 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -23,7 +23,7 @@ typedef struct BlockDriverInfo {
     bool is_dirty;
     /*
      * True if unallocated blocks read back as zeroes. This is equivalen=
t
-     * to the the LBPRZ flag in the SCSI logical block provisioning page=
.
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
- * @opaque: passed to to the read and write callbacks of the @ops struct=
ure.
+ * @opaque: passed to the read and write callbacks of the @ops structure=
.
  * @name: used for debugging; not visible to the user or ABI
  * @size: size of the region.
  */
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 9c999ac..eca0c7f 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -3014,7 +3014,7 @@ static int elf_core_dump(int signr, const CPUArchSt=
ate *env)
     if (dump_write(fd, &elf, sizeof (elf)) !=3D 0)
         goto out;
=20
-    /* fill in in-memory version of notes */
+    /* fill in the in-memory version of notes */
     if (fill_note_info(&info, signr, env) < 0)
         goto out;
=20
diff --git a/migration/rdma.c b/migration/rdma.c
index 74876fd..9424834 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -778,7 +778,7 @@ static void qemu_rdma_dump_gid(const char *who, struc=
t rdma_cm_id *id)
  *
  *  If the source VM connects with an IPv4 address without knowing that =
the
  *  destination has bound to '[::]' the migration will unconditionally f=
ail
- *  unless the management software is explicitly listening on the the IP=
v4
+ *  unless the management software is explicitly listening on the IPv4
  *  address while using a RoCE-based device.
  *
  *  If the source VM connects with an IPv6 address, then we're OK becaus=
e we can
diff --git a/qemu-doc.texi b/qemu-doc.texi
index ea9b3fb..7af4412 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -1772,7 +1772,7 @@ Use @code{set architecture i8086} to dump 16 bit co=
de. Then use
=20
 Advanced debugging options:
=20
-The default single stepping behavior is step with the IRQs and timer ser=
vice routines off.  It is set this way because when gdb executes a single=
 step it expects to advance beyond the current instruction.  With the IRQ=
s and and timer service routines on, a single step might jump into the on=
e of the interrupt or exception vectors instead of executing the current =
instruction. This means you may hit the same breakpoint a number of times=
 before executing the instruction gdb wants to have executed.  Because th=
ere are rare circumstances where you want to single step into an interrup=
t vector the behavior can be controlled from GDB.  There are three comman=
ds you can query and set the single step behavior:
+The default single stepping behavior is step with the IRQs and timer ser=
vice routines off.  It is set this way because when gdb executes a single=
 step it expects to advance beyond the current instruction.  With the IRQ=
s and timer service routines on, a single step might jump into the one of=
 the interrupt or exception vectors instead of executing the current inst=
ruction. This means you may hit the same breakpoint a number of times bef=
ore executing the instruction gdb wants to have executed.  Because there =
are rare circumstances where you want to single step into an interrupt ve=
ctor the behavior can be controlled from GDB.  There are three commands y=
ou can query and set the single step behavior:
 @table @code
 @item maintenance packet qqemu.sstepbits
=20
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
=20
 Parameters to convert subcommand:
diff --git a/qemu-options.hx b/qemu-options.hx
index b2f9dce..739894d 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3150,7 +3150,7 @@ provide cycle accurate emulation.  Modern CPUs cont=
ain superscalar out of
 order cores with complex cache hierarchies.  The number of instructions
 executed often has little or no correlation with actual performance.
=20
-@option{align=3Don} will activate the delay algorithm which will try to
+@option{align=3Don} will activate the delay algorithm which will try
 to synchronise the host clock and the virtual clock. The goal is to
 have a guest running at the real frequency imposed by the shift option.
 Whenever the guest clock is behind the host clock and if
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 4bd5dc8..36407de 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -173,7 +173,7 @@ typedef struct CPUARMState {
     uint32_t GE; /* cpsr[19:16] */
     uint32_t thumb; /* cpsr[5]. 0 =3D arm mode, 1 =3D thumb mode. */
     uint32_t condexec_bits; /* IT bits.  cpsr[15:10,26:25].  */
-    uint64_t daif; /* exception masks, in the bits they are in in PSTATE=
 */
+    uint64_t daif; /* exception masks, in the bits they are in PSTATE */
=20
     uint64_t elr_el[4]; /* AArch64 exception link regs  */
     uint64_t sp_el[4]; /* AArch64 banked stack pointers */
@@ -1488,7 +1488,7 @@ bool write_list_to_cpustate(ARMCPU *cpu);
  */
 bool write_cpustate_to_list(ARMCPU *cpu);
=20
-/* Does the core conform to the the "MicroController" profile. e.g. Cort=
ex-M3.
+/* Does the core conform to the "MicroController" profile. e.g. Cortex-M=
3.
    Note the M in older cores (eg. ARM7TDMI) stands for Multiply. These a=
re
    conventional cores (ie. Application or Realtime profile).  */
=20
diff --git a/target-arm/helper.c b/target-arm/helper.c
index fc4b65f..d453120 100644
--- a/target-arm/helper.c
+++ b/target-arm/helper.c
@@ -2123,7 +2123,7 @@ static void vmsa_ttbcr_raw_write(CPUARMState *env, =
const ARMCPRegInfo *ri,
         }
     }
=20
-    /* Update the masks corresponding to the the TCR bank being written
+    /* Update the masks corresponding to the TCR bank being written
      * Note that we always calculate mask and base_mask, but
      * they are only used for short-descriptor tables (ie if EAE is 0);
      * for long-descriptor tables the TCR fields are used differently
diff --git a/target-arm/translate.c b/target-arm/translate.c
index 0bd3d05..ae70577 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -8500,7 +8500,7 @@ static void disas_arm_insn(DisasContext *s, unsigne=
d int insn)
                 }
                 /* Perform base writeback before the loaded value to
                    ensure correct behavior with overlapping index regist=
ers.
-                   ldrd with base writeback is is undefined if the
+                   ldrd with base writeback is undefined if the
                    destination and index registers overlap.  */
                 if (!(insn & (1 << 24))) {
                     gen_add_datah_offset(s, insn, address_offset, addr);
diff --git a/target-lm32/helper.c b/target-lm32/helper.c
index a88aa5a..e26c133 100644
--- a/target-lm32/helper.c
+++ b/target-lm32/helper.c
@@ -81,7 +81,7 @@ void lm32_watchpoint_insert(CPULM32State *env, int idx,=
 target_ulong address,
=20
     switch (wp_type) {
     case LM32_WP_DISABLED:
-        /* nothing to to */
+        /* nothing to do */
         break;
     case LM32_WP_READ:
         flags =3D BP_CPU | BP_STOP_BEFORE_ACCESS | BP_MEM_READ;
diff --git a/target-microblaze/translate.c b/target-microblaze/translate.=
c
index d4d9a8a..c33b16c 100644
--- a/target-microblaze/translate.c
+++ b/target-microblaze/translate.c
@@ -1012,7 +1012,7 @@ static void dec_load(DisasContext *dc)
     tcg_temp_free(v);
=20
     if (ex) { /* lwx */
-        /* no support for for AXI exclusive so always clear C */
+        /* no support for AXI exclusive so always clear C */
         write_carryi(dc, 0);
     }
=20
diff --git a/target-moxie/helper.c b/target-moxie/helper.c
index 6c98965..f21e884 100644
--- a/target-moxie/helper.c
+++ b/target-moxie/helper.c
@@ -56,7 +56,7 @@ void helper_raise_exception(CPUMoxieState *env, int ex)
     /* Stash the address where the exception occurred.  */
     cpu_restore_state(cs, GETPC());
     env->sregs[5] =3D env->pc;
-    /* Jump the the exception handline routine.  */
+    /* Jump to the exception handline routine.  */
     env->pc =3D env->sregs[1];
     cpu_loop_exit(cs);
 }
diff --git a/util/bitmap.c b/util/bitmap.c
index 300a68e..44f0f48 100644
--- a/util/bitmap.c
+++ b/util/bitmap.c
@@ -14,7 +14,7 @@
 #include "qemu/atomic.h"
=20
 /*
- * bitmaps provide an array of bits, implemented using an an
+ * bitmaps provide an array of bits, implemented using an
  * array of unsigned longs.  The number of valid bits in a
  * given bitmap does _not_ need to be an exact multiple of
  * BITS_PER_LONG.
--=20
2.1.4


