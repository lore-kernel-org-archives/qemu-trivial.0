Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhNop-00038s-VZ
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 14:40:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNoh-000326-LB
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:40:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNob-0005Tb-Qi
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:40:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57106)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhNoN-0005QQ-4r; Mon, 05 May 2014 14:40:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1205340758;
	Mon,  5 May 2014 22:40:21 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1193D672;
	Mon,  5 May 2014 22:02:07 +0400 (MSK)
Received: (nullmailer pid 24239 invoked by uid 1000);
	Mon, 05 May 2014 18:02:06 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon,  5 May 2014 22:01:53 +0400
Message-Id: <1399312923-24129-13-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 12/22] hw: Add missing 'static' attributes
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
X-List-Received-Date: Mon, 05 May 2014 18:40:50 -0000

From: Stefan Weil <sw@weilnetz.de>

This fixes warnings from the static code analysis (smatch).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


