Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SrWs5-0001va-CH
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jul 2012 12:13:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SrWrv-0001KT-9H
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2012 12:13:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SrWrq-0003Sb-3Z
	for qemu-trivial@nongnu.org; Wed, 18 Jul 2012 12:12:55 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:41212)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SrWrg-0003Qu-V6; Wed, 18 Jul 2012 12:12:41 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	7E1EB728001A; Wed, 18 Jul 2012 18:12:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id fX3Fo5o3h2GT; Wed, 18 Jul 2012 18:12:38 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 6B81272800C8; Wed, 18 Jul 2012 18:12:38 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Wed, 18 Jul 2012 18:12:37 +0200
Message-Id: <1342627957-31682-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] Use macro QEMU_PACKED for new packed
	structures
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
X-List-Received-Date: Wed, 18 Jul 2012 16:13:04 -0000

Since commit 541dc0d47f10973c241e9955afc2aefc96adec51,
some new packed structures were added without using QEMU_PACKED.

QEMU_PACKED is needed for compilations with MinGW.
For other platforms nothing changes.

The code was fixed using this command:

    git grep -la '__attribute__ ((packed))'|xargs perl -pi -e 's/__attribute__ \(\(packed\)\)/QEMU_PACKED/'

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/mfi.h          |   92 ++++++++++++++++++++++++++---------------------------
 hw/ppce500_spin.c |    2 +-
 2 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/hw/mfi.h b/hw/mfi.h
index 8a82162..3045d4e 100644
--- a/hw/mfi.h
+++ b/hw/mfi.h
@@ -435,24 +435,24 @@ typedef enum {
 struct mfi_sg32 {
     uint32_t addr;
     uint32_t len;
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 struct mfi_sg64 {
     uint64_t addr;
     uint32_t len;
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 struct mfi_sg_skinny {
     uint64_t addr;
     uint32_t len;
     uint32_t flag;
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 union mfi_sgl {
     struct mfi_sg32 sg32[1];
     struct mfi_sg64 sg64[1];
     struct mfi_sg_skinny sg_skinny[1];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 /* Message frames.  All messages have a common header */
 struct mfi_frame_header {
@@ -468,7 +468,7 @@ struct mfi_frame_header {
     uint16_t flags;
     uint16_t timeout;
     uint32_t data_len;
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 struct mfi_init_frame {
     struct mfi_frame_header header;
@@ -487,7 +487,7 @@ struct mfi_io_frame {
     uint32_t lba_lo;
     uint32_t lba_hi;
     union mfi_sgl sgl;
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 #define MFI_PASS_FRAME_SIZE 48
 struct mfi_pass_frame {
@@ -496,7 +496,7 @@ struct mfi_pass_frame {
     uint32_t sense_addr_hi;
     uint8_t cdb[16];
     union mfi_sgl sgl;
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 #define MFI_DCMD_FRAME_SIZE 40
 struct mfi_dcmd_frame {
@@ -504,7 +504,7 @@ struct mfi_dcmd_frame {
     uint32_t opcode;
     uint8_t mbox[MFI_MBOX_SIZE];
     union mfi_sgl sgl;
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 struct mfi_abort_frame {
     struct mfi_frame_header header;
@@ -512,7 +512,7 @@ struct mfi_abort_frame {
     uint32_t abort_mfi_addr_lo;
     uint32_t abort_mfi_addr_hi;
     uint32_t reserved1[6];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 struct mfi_smp_frame {
     struct mfi_frame_header header;
@@ -521,7 +521,7 @@ struct mfi_smp_frame {
         struct mfi_sg32 sg32[2];
         struct mfi_sg64 sg64[2];
     } sgl;
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 struct mfi_stp_frame {
     struct mfi_frame_header header;
@@ -531,7 +531,7 @@ struct mfi_stp_frame {
         struct mfi_sg32 sg32[2];
         struct mfi_sg64 sg64[2];
     } sgl;
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 union mfi_frame {
     struct mfi_frame_header header;
@@ -563,7 +563,7 @@ struct mfi_init_qinfo {
     uint32_t pi_addr_hi;
     uint32_t ci_addr_lo;
     uint32_t ci_addr_hi;
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 /* Controller properties */
 struct mfi_ctrl_props {
@@ -626,7 +626,7 @@ struct mfi_ctrl_props {
                                * is spun down (0=use FW defaults)
                                */
     uint8_t reserved[24];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 /* PCI information about the card. */
 struct mfi_info_pci {
@@ -635,7 +635,7 @@ struct mfi_info_pci {
     uint16_t subvendor;
     uint16_t subdevice;
     uint8_t reserved[24];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 /* Host (front end) interface information */
 struct mfi_info_host {
@@ -647,7 +647,7 @@ struct mfi_info_host {
     uint8_t reserved[6];
     uint8_t port_count;
     uint64_t port_addr[8];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 /* Device (back end) interface information */
 struct mfi_info_device {
@@ -659,7 +659,7 @@ struct mfi_info_device {
     uint8_t reserved[6];
     uint8_t port_count;
     uint64_t port_addr[8];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 /* Firmware component information */
 struct mfi_info_component {
@@ -667,7 +667,7 @@ struct mfi_info_component {
     char version[32];
     char build_date[16];
     char build_time[16];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 /* Controller default settings */
 struct mfi_defaults {
@@ -710,7 +710,7 @@ struct mfi_defaults {
     uint8_t fde_only;
     uint8_t delay_during_post;
     uint8_t resv[19];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 /* Controller default settings */
 struct mfi_bios_data {
@@ -722,7 +722,7 @@ struct mfi_bios_data {
     uint8_t expose_all_drives;
     uint8_t reserved[56];
     uint8_t check_sum;
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 /* SAS (?) controller info, returned from MFI_DCMD_CTRL_GETINFO. */
 struct mfi_ctrl_info {
@@ -807,7 +807,7 @@ struct mfi_ctrl_info {
         uint8_t min;
         uint8_t max;
         uint8_t reserved[2];
-    } __attribute__ ((packed)) stripe_sz_ops;
+    } QEMU_PACKED stripe_sz_ops;
 
     uint32_t pd_ops;
 #define MFI_INFO_PDOPS_FORCE_ONLINE     0x01
@@ -826,7 +826,7 @@ struct mfi_ctrl_info {
     struct mfi_ctrl_props properties;
     char package_version[0x60];
     uint8_t pad[0x800 - 0x6a0];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 /* keep track of an event. */
 union mfi_evt {
@@ -836,7 +836,7 @@ union mfi_evt {
         int8_t class;
     } members;
     uint32_t word;
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 /* event log state. */
 struct mfi_evt_log_state {
@@ -845,24 +845,24 @@ struct mfi_evt_log_state {
     uint32_t clear_seq_num;
     uint32_t shutdown_seq_num;
     uint32_t boot_seq_num;
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 struct mfi_progress {
     uint16_t progress;
     uint16_t elapsed_seconds;
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 struct mfi_evt_ld {
     uint16_t target_id;
     uint8_t ld_index;
     uint8_t reserved;
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 struct mfi_evt_pd {
     uint16_t device_id;
     uint8_t enclosure_index;
     uint8_t slot_number;
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 /* event detail, returned from MFI_DCMD_CTRL_EVENT_WAIT. */
 struct mfi_evt_detail {
@@ -982,13 +982,13 @@ struct mfi_evt_detail {
     } args;
 
     char description[128];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 struct mfi_evt_list {
     uint32_t count;
     uint32_t reserved;
     struct mfi_evt_detail event[1];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 union mfi_pd_ref {
     struct {
@@ -996,7 +996,7 @@ union mfi_pd_ref {
         uint16_t seq_num;
     } v;
     uint32_t ref;
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 union mfi_pd_ddf_type {
     struct {
@@ -1016,7 +1016,7 @@ union mfi_pd_ddf_type {
         uint32_t reserved;
     } non_disk;
     uint32_t type;
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 struct mfi_pd_progress {
     uint32_t active;
@@ -1027,7 +1027,7 @@ struct mfi_pd_progress {
     struct mfi_progress patrol;
     struct mfi_progress clear;
     struct mfi_progress reserved[4];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 struct mfi_pd_info {
     union mfi_pd_ref ref;
@@ -1062,7 +1062,7 @@ struct mfi_pd_info {
     uint8_t unusable_in_current_config;
     uint8_t vpd_page83_ext[64];
     uint8_t reserved[512-358];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 struct mfi_pd_address {
     uint16_t device_id;
@@ -1072,14 +1072,14 @@ struct mfi_pd_address {
     uint8_t scsi_dev_type;
     uint8_t connect_port_bitmap;
     uint64_t sas_addr[2];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 #define MFI_MAX_SYS_PDS 240
 struct mfi_pd_list {
     uint32_t size;
     uint32_t count;
     struct mfi_pd_address addr[MFI_MAX_SYS_PDS];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 union mfi_ld_ref {
     struct {
@@ -1088,7 +1088,7 @@ union mfi_ld_ref {
         uint16_t seq;
     } v;
     uint32_t ref;
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 struct mfi_ld_list {
     uint32_t ld_count;
@@ -1099,7 +1099,7 @@ struct mfi_ld_list {
         uint8_t reserved2[3];
         uint64_t size;
     } ld_list[MFI_MAX_LD];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 enum mfi_ld_access {
     MFI_LD_ACCESS_RW =          0,
@@ -1136,7 +1136,7 @@ struct mfi_ld_props {
     uint8_t current_cache_policy;
     uint8_t no_bgi;
     uint8_t reserved[7];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 struct mfi_ld_params {
     uint8_t primary_raid_level;
@@ -1149,7 +1149,7 @@ struct mfi_ld_params {
     uint8_t init_state;
     uint8_t is_consistent;
     uint8_t reserved[23];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 struct mfi_ld_progress {
     uint32_t            active;
@@ -1162,21 +1162,21 @@ struct mfi_ld_progress {
     struct mfi_progress fgi;
     struct mfi_progress recon;
     struct mfi_progress reserved[4];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 struct mfi_span {
     uint64_t start_block;
     uint64_t num_blocks;
     uint16_t array_ref;
     uint8_t reserved[6];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 #define MFI_MAX_SPAN_DEPTH      8
 struct mfi_ld_config {
     struct mfi_ld_props properties;
     struct mfi_ld_params params;
     struct mfi_span span[MFI_MAX_SPAN_DEPTH];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 struct mfi_ld_info {
     struct mfi_ld_config ld_config;
@@ -1187,7 +1187,7 @@ struct mfi_ld_info {
     uint8_t reserved1[1];
     uint8_t vpd_page83[64];
     uint8_t reserved2[16];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 union mfi_spare_type {
     uint8_t flags;
@@ -1195,7 +1195,7 @@ union mfi_spare_type {
 #define MFI_SPARE_IS_REVERTABLE (1 << 1)
 #define MFI_SPARE_IS_ENCL_AFFINITY (1 << 2)
     uint8_t type;
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 #define MFI_MAX_ARRAYS 16
 struct mfi_spare {
@@ -1204,7 +1204,7 @@ struct mfi_spare {
     uint8_t reserved[2];
     uint8_t array_count;
     uint16_t array_refd[MFI_MAX_ARRAYS];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 #define MFI_MAX_ROW_SIZE 32
 struct mfi_array {
@@ -1221,7 +1221,7 @@ struct mfi_array {
             uint8_t slot;
         } encl;
     } pd[MFI_MAX_ROW_SIZE];
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 struct mfi_config_data {
     uint32_t size;
@@ -1237,7 +1237,7 @@ struct mfi_config_data {
       struct mfi_ld_config ld[];
       struct mfi_spare  spare[];
     */
-} __attribute__ ((packed));
+} QEMU_PACKED;
 
 #define MFI_SCSI_MAX_TARGETS  128
 #define MFI_SCSI_MAX_LUNS       8
diff --git a/hw/ppce500_spin.c b/hw/ppce500_spin.c
index fddf219..c5b8e05 100644
--- a/hw/ppce500_spin.c
+++ b/hw/ppce500_spin.c
@@ -40,7 +40,7 @@ typedef struct spin_info {
     uint32_t resv;
     uint32_t pir;
     uint64_t reserved;
-} __attribute__ ((packed)) SpinInfo;
+} QEMU_PACKED SpinInfo;
 
 typedef struct spin_state {
     SysBusDevice busdev;
-- 
1.7.10


