Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WgKAl-0004Uw-Ay
	for mharc-qemu-trivial@gnu.org; Fri, 02 May 2014 16:35:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WgKAe-0004IF-N4
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 16:35:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WgKAZ-0001vm-HP
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 16:35:00 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:47112)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1WgKAN-0001ra-A1; Fri, 02 May 2014 16:34:43 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 0E3E01800ED; Fri,  2 May 2014 22:34:41 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri,  2 May 2014 22:34:40 +0200
Message-Id: <1399062880-3071-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Mark Langsdorf <mark.langsdorf@calxeda.com>,
	Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH] hw: Add missing 'static' attributes
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
X-List-Received-Date: Fri, 02 May 2014 20:35:05 -0000

This fixes warnings from the static code analysis (smatch).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/net/cadence_gem.c |    2 +-
 hw/net/vmxnet3.c     |    6 +++---
 hw/net/xgmac.c       |    2 +-
 hw/ppc/spapr_iommu.c |    2 +-
 hw/ppc/spapr_rtas.c  |    2 +-
 hw/scsi/scsi-bus.c   |    2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index e34b25e..cdb1825 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -388,7 +388,7 @@ typedef struct GemState {
 } GemState;
 
 /* The broadcast MAC address: 0xFFFFFFFFFFFF */
-const uint8_t broadcast_addr[] = { 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF };
+static const uint8_t broadcast_addr[] = { 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF };
 
 /*
  * gem_init_register_masks:
diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index ddcee4b..1bb9259 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -2305,7 +2305,7 @@ static void vmxnet3_put_txq_descr(QEMUFile *f, void *pv, size_t size)
     vmxnet3_put_tx_stats_to_file(f, &r->txq_stats);
 }
 
-const VMStateInfo txq_descr_info = {
+static const VMStateInfo txq_descr_info = {
     .name = "txq_descr",
     .get = vmxnet3_get_txq_descr,
     .put = vmxnet3_put_txq_descr
@@ -2397,7 +2397,7 @@ static int vmxnet3_post_load(void *opaque, int version_id)
     return 0;
 }
 
-const VMStateInfo rxq_descr_info = {
+static const VMStateInfo rxq_descr_info = {
     .name = "rxq_descr",
     .get = vmxnet3_get_rxq_descr,
     .put = vmxnet3_put_rxq_descr
@@ -2423,7 +2423,7 @@ static void vmxnet3_put_int_state(QEMUFile *f, void *pv, size_t size)
     qemu_put_byte(f, r->is_asserted);
 }
 
-const VMStateInfo int_state_info = {
+static const VMStateInfo int_state_info = {
     .name = "int_state",
     .get = vmxnet3_get_int_state,
     .put = vmxnet3_put_int_state
diff --git a/hw/net/xgmac.c b/hw/net/xgmac.c
index 9384fa0..88349ac 100644
--- a/hw/net/xgmac.c
+++ b/hw/net/xgmac.c
@@ -152,7 +152,7 @@ typedef struct XgmacState {
     uint32_t regs[R_MAX];
 } XgmacState;
 
-const VMStateDescription vmstate_rxtx_stats = {
+static const VMStateDescription vmstate_rxtx_stats = {
     .name = "xgmac_stats",
     .version_id = 1,
     .minimum_version_id = 1,
diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
index d9fe946..72493d8 100644
--- a/hw/ppc/spapr_iommu.c
+++ b/hw/ppc/spapr_iommu.c
@@ -35,7 +35,7 @@ enum sPAPRTCEAccess {
     SPAPR_TCE_RW = 3,
 };
 
-QLIST_HEAD(spapr_tce_tables, sPAPRTCETable) spapr_tce_tables;
+static QLIST_HEAD(spapr_tce_tables, sPAPRTCETable) spapr_tce_tables;
 
 static sPAPRTCETable *spapr_tce_find_by_liobn(uint32_t liobn)
 {
diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
index 73860d0..ea4a2b2 100644
--- a/hw/ppc/spapr_rtas.c
+++ b/hw/ppc/spapr_rtas.c
@@ -272,7 +272,7 @@ static struct rtas_call {
     spapr_rtas_fn fn;
 } rtas_table[TOKEN_MAX];
 
-struct rtas_call *rtas_next = rtas_table;
+static struct rtas_call *rtas_next = rtas_table;
 
 target_ulong spapr_rtas_call(PowerPCCPU *cpu, sPAPREnvironment *spapr,
                              uint32_t token, uint32_t nargs, target_ulong args,
diff --git a/hw/scsi/scsi-bus.c b/hw/scsi/scsi-bus.c
index ae921a6..abe7302 100644
--- a/hw/scsi/scsi-bus.c
+++ b/hw/scsi/scsi-bus.c
@@ -1179,7 +1179,7 @@ static uint64_t scsi_cmd_lba(SCSICommand *cmd)
     return lba;
 }
 
-int scsi_req_parse(SCSICommand *cmd, SCSIDevice *dev, uint8_t *buf)
+static int scsi_req_parse(SCSICommand *cmd, SCSIDevice *dev, uint8_t *buf)
 {
     int rc;
 
-- 
1.7.10.4


