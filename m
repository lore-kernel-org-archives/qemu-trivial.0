Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YgHG1-0001mu-NR
	for mharc-qemu-trivial@gnu.org; Thu, 09 Apr 2015 14:32:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YgHFy-0001hu-A3
	for qemu-trivial@nongnu.org; Thu, 09 Apr 2015 14:32:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YgHFx-0003FZ-3Z
	for qemu-trivial@nongnu.org; Thu, 09 Apr 2015 14:32:50 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:42863)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YgHFs-0003Ed-5e; Thu, 09 Apr 2015 14:32:44 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 8A7A317FB05; Thu,  9 Apr 2015 20:32:40 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Thu,  9 Apr 2015 20:32:39 +0200
Message-Id: <1428604359-17067-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Kevin Wolf <kwolf@redhat.com>, Alexander Graf <agraf@suse.de>,
	Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Jiri Slaby <jslaby@suse.cz>, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH] misc: Fix new collection of typos
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
X-List-Received-Date: Thu, 09 Apr 2015 18:32:51 -0000

All of them were reported by codespell.
Most typos are in comments, one is in an error message.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/block/virtio-blk.c     |    2 +-
 hw/misc/edu.c             |    2 +-
 hw/net/virtio-net.c       |    2 +-
 hw/ppc/spapr.c            |    2 +-
 qga/qapi-schema.json      |    2 +-
 target-s390x/mmu_helper.c |    8 ++++----
 target-s390x/translate.c  |    2 +-
 tests/libqos/ahci.c       |    4 ++--
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 9546fd2..e6afe97 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -515,7 +515,7 @@ void virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
     type = virtio_ldl_p(VIRTIO_DEVICE(req->dev), &req->out.type);
 
     /* VIRTIO_BLK_T_OUT defines the command direction. VIRTIO_BLK_T_BARRIER
-     * is an optional flag. Altough a guest should not send this flag if
+     * is an optional flag. Although a guest should not send this flag if
      * not negotiated we ignored it in the past. So keep ignoring it. */
     switch (type & ~(VIRTIO_BLK_T_OUT | VIRTIO_BLK_T_BARRIER)) {
     case VIRTIO_BLK_T_IN:
diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index f601069..fe50b42 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -279,7 +279,7 @@ static const MemoryRegionOps edu_mmio_ops = {
 };
 
 /*
- * We purposedly use a thread, so that users are forced to wait for the status
+ * We purposely use a thread, so that users are forced to wait for the status
  * register.
  */
 static void *edu_fact_thread(void *opaque)
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 59f76bc..67ab228 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1590,7 +1590,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     n->max_queues = MAX(n->nic_conf.peers.queues, 1);
     if (n->max_queues * 2 + 1 > VIRTIO_PCI_QUEUE_MAX) {
         error_setg(errp, "Invalid number of queues (= %" PRIu32 "), "
-                   "must be a postive integer less than %d.",
+                   "must be a positive integer less than %d.",
                    n->max_queues, (VIRTIO_PCI_QUEUE_MAX - 1) / 2);
         virtio_cleanup(vdev);
         return;
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 61ddc79..644689a 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1029,7 +1029,7 @@ static int spapr_post_load(void *opaque, int version_id)
     sPAPREnvironment *spapr = (sPAPREnvironment *)opaque;
     int err = 0;
 
-    /* In earlier versions, there was no seperate qdev for the PAPR
+    /* In earlier versions, there was no separate qdev for the PAPR
      * RTC, so the RTC offset was stored directly in sPAPREnvironment.
      * So when migrating from those versions, poke the incoming offset
      * value into the RTC device */
diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
index 95f49e3..5c4cd40 100644
--- a/qga/qapi-schema.json
+++ b/qga/qapi-schema.json
@@ -808,7 +808,7 @@
 #
 # An enumeration of memory block operation result.
 #
-# @sucess: the operation of online/offline memory block is successful.
+# @success: the operation of online/offline memory block is successful.
 # @not-found: can't find the corresponding memoryXXX directory in sysfs.
 # @operation-not-supported: for some old kernels, it does not support
 #                           online or offline memory block.
diff --git a/target-s390x/mmu_helper.c b/target-s390x/mmu_helper.c
index b061c85..7baf5e9 100644
--- a/target-s390x/mmu_helper.c
+++ b/target-s390x/mmu_helper.c
@@ -303,8 +303,8 @@ static int mmu_translate_asce(CPUS390XState *env, target_ulong vaddr,
  * @param asc    address space control (one of the PSW_ASC_* modes)
  * @param raddr  the translated address is stored to this pointer
  * @param flags  the PAGE_READ/WRITE/EXEC flags are stored to this pointer
- * @param exc    true = inject a program check if a fault occured
- * @return       0 if the translation was successfull, -1 if a fault occured
+ * @param exc    true = inject a program check if a fault occurred
+ * @return       0 if the translation was successful, -1 if a fault occurred
  */
 int mmu_translate(CPUS390XState *env, target_ulong vaddr, int rw, uint64_t asc,
                   target_ulong *raddr, int *flags, bool exc)
@@ -436,9 +436,9 @@ static int translate_pages(S390CPU *cpu, vaddr addr, int nr_pages,
  * s390_cpu_virt_mem_rw:
  * @laddr:     the logical start address
  * @hostbuf:   buffer in host memory. NULL = do only checks w/o copying
- * @len:       length that should be transfered
+ * @len:       length that should be transferred
  * @is_write:  true = write, false = read
- * Returns:    0 on success, non-zero if an exception occured
+ * Returns:    0 on success, non-zero if an exception occurred
  *
  * Copy from/to guest memory using logical addresses. Note that we inject a
  * program interrupt in case there is an error while accessing the memory.
diff --git a/target-s390x/translate.c b/target-s390x/translate.c
index 4f82edd..8784112 100644
--- a/target-s390x/translate.c
+++ b/target-s390x/translate.c
@@ -2990,7 +2990,7 @@ static ExitStatus op_sam(DisasContext *s, DisasOps *o)
         break;
     }
 
-    /* Bizzare but true, we check the address of the current insn for the
+    /* Bizarre but true, we check the address of the current insn for the
        specification exception, not the next to be executed.  Thus the PoO
        documents that Bad Things Happen two bytes before the end.  */
     if (s->pc & ~mask) {
diff --git a/tests/libqos/ahci.c b/tests/libqos/ahci.c
index b0f39a5..be00db2 100644
--- a/tests/libqos/ahci.c
+++ b/tests/libqos/ahci.c
@@ -364,7 +364,7 @@ void ahci_port_clear(AHCIQState *ahci, uint8_t port)
     ahci_px_wreg(ahci, port, AHCI_PX_IS, reg);
     g_assert_cmphex(ahci_px_rreg(ahci, port, AHCI_PX_IS), ==, 0);
 
-    /* Wipe the FIS-Recieve Buffer */
+    /* Wipe the FIS-Receive Buffer */
     qmemset(ahci->port[port].fb, 0x00, 0x100);
 }
 
@@ -442,7 +442,7 @@ void ahci_port_check_pio_sanity(AHCIQState *ahci, uint8_t port,
 {
     PIOSetupFIS *pio = g_malloc0(0x20);
 
-    /* We cannot check the Status or E_Status registers, becuase
+    /* We cannot check the Status or E_Status registers, because
      * the status may have again changed between the PIO Setup FIS
      * and the conclusion of the command with the D2H Register FIS. */
     memread(ahci->port[port].fb + 0x20, pio, 0x20);
-- 
1.7.10.4


