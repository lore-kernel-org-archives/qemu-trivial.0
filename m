Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIgIu-0003N2-8F
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 12:30:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56889)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1aIgIq-0003MC-HP
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 12:30:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1aIgIm-00050G-3X
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 12:30:48 -0500
Received: from e06smtp14.uk.ibm.com ([195.75.94.110]:52876)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gkurz@linux.vnet.ibm.com>) id 1aIgIl-0004zR-QZ
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 12:30:44 -0500
Received: from localhost
	by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <gkurz@linux.vnet.ibm.com>;
	Mon, 11 Jan 2016 17:30:41 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 11 Jan 2016 17:30:39 -0000
X-IBM-Helo: d06dlp03.portsmouth.uk.ibm.com
X-IBM-MailFrom: gkurz@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org;qemu-trivial@nongnu.org
Received: from b06cxnps4075.portsmouth.uk.ibm.com
	(d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id D7DFB1B0804B; 
	Mon, 11 Jan 2016 17:30:39 +0000 (GMT)
Received: from d06av05.portsmouth.uk.ibm.com (d06av05.portsmouth.uk.ibm.com
	[9.149.37.229])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u0BHUcde60621014; Mon, 11 Jan 2016 17:30:39 GMT
Received: from d06av05.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av05.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u0BHUcGG009839; Mon, 11 Jan 2016 10:30:38 -0700
Received: from smtp.lab.toulouse-stg.fr.ibm.com
	(srv01.lab.toulouse-stg.fr.ibm.com [9.101.4.1])
	by d06av05.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u0BHUcuq009825; Mon, 11 Jan 2016 10:30:38 -0700
Received: from bahia.huguette.org (sig-9-79-81-64.de.ibm.com [9.79.81.64])
	by smtp.lab.toulouse-stg.fr.ibm.com (Postfix) with ESMTP id 8CC6E220586;
	Mon, 11 Jan 2016 18:30:37 +0100 (CET)
From: Greg Kurz <gkurz@linux.vnet.ibm.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 11 Jan 2016 18:30:36 +0100
Message-ID: <20160111173036.24764.59878.stgit@bahia.huguette.org>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16011117-0017-0000-0000-000006CC3215
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.110
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] trace: drop trailing empty strings
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
X-List-Received-Date: Mon, 11 Jan 2016 17:30:50 -0000

Also fix a typo in the virtio_balloon_handle_output() trace while here.

Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>
---
 trace-events |   64 +++++++++++++++++++++++++++++-----------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/trace-events b/trace-events
index 934a7b6402d1..48834eeb8bf4 100644
--- a/trace-events
+++ b/trace-events
@@ -147,7 +147,7 @@ cpu_out(unsigned int addr, char size, unsigned int val) "addr %#x(%c) value %u"
 # balloon.c
 # Since requests are raised via monitor, not many tracepoints are needed.
 balloon_event(void *opaque, unsigned long addr) "opaque %p addr %lu"
-virtio_balloon_handle_output(const char *name, uint64_t gpa) "setion name: %s gpa: %"PRIx64""
+virtio_balloon_handle_output(const char *name, uint64_t gpa) "section name: %s gpa: %"PRIx64
 virtio_balloon_get_config(uint32_t num_pages, uint32_t acutal) "num_pages: %d acutal: %d"
 virtio_balloon_set_config(uint32_t acutal, uint32_t oldacutal) "acutal: %d oldacutal: %d"
 virtio_balloon_to_target(uint64_t target, uint32_t num_pages) "balloon target: %"PRIx64" num_pages: %d"
@@ -687,7 +687,7 @@ grlib_irqmp_writel_unknown(uint64_t addr, uint32_t value) "addr 0x%"PRIx64" valu
 # hw/char/grlib_apbuart.c
 grlib_apbuart_event(int event) "event:%d"
 grlib_apbuart_writel_unknown(uint64_t addr, uint32_t value) "addr 0x%"PRIx64" value 0x%x"
-grlib_apbuart_readl_unknown(uint64_t addr) "addr 0x%"PRIx64""
+grlib_apbuart_readl_unknown(uint64_t addr) "addr 0x%"PRIx64
 
 # hw/sparc/leon3.c
 leon3_set_irq(int intno) "Set CPU IRQ %d"
@@ -730,10 +730,10 @@ lm32_uart_irq_state(int level) "irq state %d"
 megasas_init_firmware(uint64_t pa) "pa %" PRIx64 " "
 megasas_init_queue(uint64_t queue_pa, int queue_len, uint64_t head, uint64_t tail, uint32_t flags) "queue at %" PRIx64 " len %d head %" PRIx64 " tail %" PRIx64 " flags %x"
 megasas_initq_map_failed(int frame) "scmd %d: failed to map queue"
-megasas_initq_mapped(uint64_t pa) "queue already mapped at %" PRIx64 ""
+megasas_initq_mapped(uint64_t pa) "queue already mapped at %" PRIx64
 megasas_initq_mismatch(int queue_len, int fw_cmds) "queue size %d max fw cmds %d"
 megasas_qf_mapped(unsigned int index) "skip mapped frame %x"
-megasas_qf_new(unsigned int index, uint64_t frame) "frame %x addr %" PRIx64 ""
+megasas_qf_new(unsigned int index, uint64_t frame) "frame %x addr %" PRIx64
 megasas_qf_busy(unsigned long pa) "all frames busy for frame %lx"
 megasas_qf_enqueue(unsigned int index, unsigned int count, uint64_t context, unsigned int head, unsigned int tail, int busy) "frame %x count %d context %" PRIx64 " head %x tail %x busy %d"
 megasas_qf_update(unsigned int head, unsigned int tail, unsigned int busy) "head %x tail %x busy %d"
@@ -787,7 +787,7 @@ megasas_dcmd_pd_list_query(int cmd, int flags) "scmd %d: query flags %x"
 megasas_dcmd_reset_ld(int cmd, int target_id) "scmd %d: dev %d"
 megasas_dcmd_unsupported(int cmd, unsigned long size) "scmd %d: set properties len %ld"
 megasas_abort_frame(int cmd, int abort_cmd) "scmd %d: frame %x"
-megasas_abort_no_cmd(int cmd, uint64_t context) "scmd %d: no active command for frame context %" PRIx64 ""
+megasas_abort_no_cmd(int cmd, uint64_t context) "scmd %d: no active command for frame context %" PRIx64
 megasas_abort_invalid_context(int cmd, uint64_t context, int abort_cmd) "scmd %d: invalid frame context %" PRIx64 " for abort frame %x"
 megasas_reset(int fw_state) "firmware state %x"
 megasas_init(int sges, int cmds, const char *mode) "Using %d sges, %d cmds, %s mode"
@@ -880,7 +880,7 @@ milkymist_vgafb_memory_write(uint32_t addr, uint32_t value) "addr %08x value %08
 mipsnet_send(uint32_t size) "sending len=%u"
 mipsnet_receive(uint32_t size) "receiving len=%u"
 mipsnet_read(uint64_t addr, uint32_t val) "read addr=0x%" PRIx64 " val=0x%x"
-mipsnet_write(uint64_t addr, uint64_t val) "write addr=0x%" PRIx64 " val=0x%" PRIx64 ""
+mipsnet_write(uint64_t addr, uint64_t val) "write addr=0x%" PRIx64 " val=0x%" PRIx64
 mipsnet_irq(uint32_t isr, uint32_t intctl) "set irq to %d (%02x)"
 
 # hw/isa/pc87312.c
@@ -894,8 +894,8 @@ pc87312_info_serial(int n, uint32_t base, uint32_t irq) "id=%d, base 0x%x, irq %
 # hw/scsi/vmw_pvscsi.c
 pvscsi_ring_init_data(uint32_t txr_len_log2, uint32_t rxr_len_log2) "TX/RX rings logarithms set to %d/%d"
 pvscsi_ring_init_msg(uint32_t len_log2) "MSG ring logarithm set to %d"
-pvscsi_ring_flush_cmp(uint64_t filled_cmp_ptr) "new production counter of completion ring is 0x%"PRIx64""
-pvscsi_ring_flush_msg(uint64_t filled_cmp_ptr) "new production counter of message ring is 0x%"PRIx64""
+pvscsi_ring_flush_cmp(uint64_t filled_cmp_ptr) "new production counter of completion ring is 0x%"PRIx64
+pvscsi_ring_flush_msg(uint64_t filled_cmp_ptr) "new production counter of message ring is 0x%"PRIx64
 pvscsi_update_irq_level(bool raise, uint64_t mask, uint64_t status) "interrupt level set to %d (MASK: 0x%"PRIx64", STATUS: 0x%"PRIx64")"
 pvscsi_update_irq_msi(void) "sending MSI notification"
 pvscsi_cmp_ring_put(unsigned long addr) "got completion descriptor 0x%lx"
@@ -907,7 +907,7 @@ pvscsi_command_complete_not_found(uint32_t tag) "can't find request for tag 0x%x
 pvscsi_command_complete_data_run(void) "not all data required for command transferred"
 pvscsi_command_complete_sense_len(int len) "sense information length is %d bytes"
 pvscsi_convert_sglist(uint64_t context, unsigned long addr, uint32_t resid) "element: ctx: 0x%"PRIx64" addr: 0x%lx, len: %ul"
-pvscsi_process_req_descr(uint8_t cmd, uint64_t ctx) "SCSI cmd 0x%x, ctx: 0x%"PRIx64""
+pvscsi_process_req_descr(uint8_t cmd, uint64_t ctx) "SCSI cmd 0x%x, ctx: 0x%"PRIx64
 pvscsi_process_req_descr_unknown_device(void) "command directed to unknown device rejected"
 pvscsi_process_req_descr_invalid_dir(void) "command with invalid transfer direction rejected"
 pvscsi_process_io(unsigned long addr) "got descriptor 0x%lx"
@@ -915,15 +915,15 @@ pvscsi_on_cmd_noimpl(const char* cmd) "unimplemented command %s ignored"
 pvscsi_on_cmd_reset_dev(uint32_t tgt, int lun, void* dev) "PVSCSI_CMD_RESET_DEVICE[target %u lun %d (dev 0x%p)]"
 pvscsi_on_cmd_arrived(const char* cmd) "command %s arrived"
 pvscsi_on_cmd_abort(uint64_t ctx, uint32_t tgt) "command PVSCSI_CMD_ABORT_CMD for ctx 0x%"PRIx64", target %u"
-pvscsi_on_cmd_unknown(uint64_t cmd_id) "unknown command %"PRIx64""
+pvscsi_on_cmd_unknown(uint64_t cmd_id) "unknown command %"PRIx64
 pvscsi_on_cmd_unknown_data(uint32_t data) "data for unknown command 0x:%x"
-pvscsi_io_write(const char* cmd, uint64_t val) "%s write: %"PRIx64""
-pvscsi_io_write_unknown(unsigned long addr, unsigned sz, uint64_t val) "unknown write address: 0x%lx size: %u bytes value: 0x%"PRIx64""
-pvscsi_io_read(const char* cmd, uint64_t status) "%s read: 0x%"PRIx64""
+pvscsi_io_write(const char* cmd, uint64_t val) "%s write: %"PRIx64
+pvscsi_io_write_unknown(unsigned long addr, unsigned sz, uint64_t val) "unknown write address: 0x%lx size: %u bytes value: 0x%"PRIx64
+pvscsi_io_read(const char* cmd, uint64_t status) "%s read: 0x%"PRIx64
 pvscsi_io_read_unknown(unsigned long addr, unsigned sz) "unknown read address: 0x%lx size: %u bytes"
 pvscsi_init_msi_fail(int res) "failed to initialize MSI, error %d"
 pvscsi_state(const char* state) "starting %s ..."
-pvscsi_tx_rings_ppn(const char* label, uint64_t ppn) "%s page: %"PRIx64""
+pvscsi_tx_rings_ppn(const char* label, uint64_t ppn) "%s page: %"PRIx64
 pvscsi_tx_rings_num_pages(const char* label, uint32_t num) "Number of %s pages: %u"
 
 # xen-hvm.c
@@ -1059,10 +1059,10 @@ v9fs_rerror(uint16_t tag, uint8_t id, int err) "tag %d id %d err %d"
 v9fs_version(uint16_t tag, uint8_t id, int32_t msize, char* version) "tag %d id %d msize %d version %s"
 v9fs_version_return(uint16_t tag, uint8_t id, int32_t msize, char* version) "tag %d id %d msize %d version %s"
 v9fs_attach(uint16_t tag, uint8_t id, int32_t fid, int32_t afid, char* uname, char* aname) "tag %u id %u fid %d afid %d uname %s aname %s"
-v9fs_attach_return(uint16_t tag, uint8_t id, int8_t type, int32_t version, int64_t path) "tag %d id %d type %d version %d path %"PRId64""
+v9fs_attach_return(uint16_t tag, uint8_t id, int8_t type, int32_t version, int64_t path) "tag %d id %d type %d version %d path %"PRId64
 v9fs_stat(uint16_t tag, uint8_t id, int32_t fid) "tag %d id %d fid %d"
 v9fs_stat_return(uint16_t tag, uint8_t id, int32_t mode, int32_t atime, int32_t mtime, int64_t length) "tag %d id %d stat={mode %d atime %d mtime %d length %"PRId64"}"
-v9fs_getattr(uint16_t tag, uint8_t id, int32_t fid, uint64_t request_mask) "tag %d id %d fid %d request_mask %"PRIu64""
+v9fs_getattr(uint16_t tag, uint8_t id, int32_t fid, uint64_t request_mask) "tag %d id %d fid %d request_mask %"PRIu64
 v9fs_getattr_return(uint16_t tag, uint8_t id, uint64_t result_mask, uint32_t mode, uint32_t uid, uint32_t gid) "tag %d id %d getattr={result_mask %"PRId64" mode %u uid %u gid %u}"
 v9fs_walk(uint16_t tag, uint8_t id, int32_t fid, int32_t newfid, uint16_t nwnames) "tag %d id %d fid %d newfid %d nwnames %d"
 v9fs_walk_return(uint16_t tag, uint8_t id, uint16_t nwnames, void* qids) "tag %d id %d nwnames %d qids %p"
@@ -1088,14 +1088,14 @@ v9fs_remove(uint16_t tag, uint8_t id, int32_t fid) "tag %d id %d fid %d"
 v9fs_wstat(uint16_t tag, uint8_t id, int32_t fid, int32_t mode, int32_t atime, int32_t mtime) "tag %u id %u fid %d stat={mode %d atime %d mtime %d}"
 v9fs_mknod(uint16_t tag, uint8_t id, int32_t fid, int mode, int major, int minor) "tag %d id %d fid %d mode %d major %d minor %d"
 v9fs_mknod_return(uint16_t tag, uint8_t id, int8_t type, int32_t version, int64_t path) "tag %d id %d qid={type %d version %d path %"PRId64"}"
-v9fs_lock(uint16_t tag, uint8_t id, int32_t fid, uint8_t type, uint64_t start, uint64_t length) "tag %d id %d fid %d type %d start %"PRIu64" length %"PRIu64""
+v9fs_lock(uint16_t tag, uint8_t id, int32_t fid, uint8_t type, uint64_t start, uint64_t length) "tag %d id %d fid %d type %d start %"PRIu64" length %"PRIu64
 v9fs_lock_return(uint16_t tag, uint8_t id, int8_t status) "tag %d id %d status %d"
-v9fs_getlock(uint16_t tag, uint8_t id, int32_t fid, uint8_t type, uint64_t start, uint64_t length)"tag %d id %d fid %d type %d start %"PRIu64" length %"PRIu64""
+v9fs_getlock(uint16_t tag, uint8_t id, int32_t fid, uint8_t type, uint64_t start, uint64_t length)"tag %d id %d fid %d type %d start %"PRIu64" length %"PRIu64
 v9fs_getlock_return(uint16_t tag, uint8_t id, uint8_t type, uint64_t start, uint64_t length, uint32_t proc_id) "tag %d id %d type %d start %"PRIu64" length %"PRIu64" proc_id %u"
 v9fs_mkdir(uint16_t tag, uint8_t id, int32_t fid, char* name, int mode, uint32_t gid) "tag %u id %u fid %d name %s mode %d gid %u"
 v9fs_mkdir_return(uint16_t tag, uint8_t id, int8_t type, int32_t version, int64_t path, int err) "tag %u id %u qid={type %d version %d path %"PRId64"} err %d"
 v9fs_xattrwalk(uint16_t tag, uint8_t id, int32_t fid, int32_t newfid, char* name) "tag %d id %d fid %d newfid %d name %s"
-v9fs_xattrwalk_return(uint16_t tag, uint8_t id, int64_t size) "tag %d id %d size %"PRId64""
+v9fs_xattrwalk_return(uint16_t tag, uint8_t id, int64_t size) "tag %d id %d size %"PRId64
 v9fs_xattrcreate(uint16_t tag, uint8_t id, int32_t fid, char* name, int64_t size, int flags) "tag %d id %d fid %d name %s size %"PRId64" flags %d"
 v9fs_readlink(uint16_t tag, uint8_t id, int32_t fid) "tag %d id %d fid %d"
 v9fs_readlink_return(uint16_t tag, uint8_t id, char* target) "tag %d id %d name %s"
@@ -1103,12 +1103,12 @@ v9fs_readlink_return(uint16_t tag, uint8_t id, char* target) "tag %d id %d name
 # target-sparc/mmu_helper.c
 mmu_helper_dfault(uint64_t address, uint64_t context, int mmu_idx, uint32_t tl) "DFAULT at %"PRIx64" context %"PRIx64" mmu_idx=%d tl=%d"
 mmu_helper_dprot(uint64_t address, uint64_t context, int mmu_idx, uint32_t tl) "DPROT at %"PRIx64" context %"PRIx64" mmu_idx=%d tl=%d"
-mmu_helper_dmiss(uint64_t address, uint64_t context) "DMISS at %"PRIx64" context %"PRIx64""
-mmu_helper_tfault(uint64_t address, uint64_t context) "TFAULT at %"PRIx64" context %"PRIx64""
-mmu_helper_tmiss(uint64_t address, uint64_t context) "TMISS at %"PRIx64" context %"PRIx64""
-mmu_helper_get_phys_addr_code(uint32_t tl, int mmu_idx, uint64_t prim_context, uint64_t sec_context, uint64_t address) "tl=%d mmu_idx=%d primary context=%"PRIx64" secondary context=%"PRIx64" address=%"PRIx64""
-mmu_helper_get_phys_addr_data(uint32_t tl, int mmu_idx, uint64_t prim_context, uint64_t sec_context, uint64_t address) "tl=%d mmu_idx=%d primary context=%"PRIx64" secondary context=%"PRIx64" address=%"PRIx64""
-mmu_helper_mmu_fault(uint64_t address, uint64_t paddr, int mmu_idx, uint32_t tl, uint64_t prim_context, uint64_t sec_context) "Translate at %"PRIx64" -> %"PRIx64", mmu_idx=%d tl=%d primary context=%"PRIx64" secondary context=%"PRIx64""
+mmu_helper_dmiss(uint64_t address, uint64_t context) "DMISS at %"PRIx64" context %"PRIx64
+mmu_helper_tfault(uint64_t address, uint64_t context) "TFAULT at %"PRIx64" context %"PRIx64
+mmu_helper_tmiss(uint64_t address, uint64_t context) "TMISS at %"PRIx64" context %"PRIx64
+mmu_helper_get_phys_addr_code(uint32_t tl, int mmu_idx, uint64_t prim_context, uint64_t sec_context, uint64_t address) "tl=%d mmu_idx=%d primary context=%"PRIx64" secondary context=%"PRIx64" address=%"PRIx64
+mmu_helper_get_phys_addr_data(uint32_t tl, int mmu_idx, uint64_t prim_context, uint64_t sec_context, uint64_t address) "tl=%d mmu_idx=%d primary context=%"PRIx64" secondary context=%"PRIx64" address=%"PRIx64
+mmu_helper_mmu_fault(uint64_t address, uint64_t paddr, int mmu_idx, uint32_t tl, uint64_t prim_context, uint64_t sec_context) "Translate at %"PRIx64" -> %"PRIx64", mmu_idx=%d tl=%d primary context=%"PRIx64" secondary context=%"PRIx64
 
 # target-sparc/int64_helper.c
 int_helper_set_softint(uint32_t softint) "new %08x"
@@ -1263,7 +1263,7 @@ qemu_file_fclose(void) ""
 get_queued_page(const char *block_name, uint64_t tmp_offset, uint64_t ram_addr) "%s/%" PRIx64 " ram_addr=%" PRIx64
 get_queued_page_not_dirty(const char *block_name, uint64_t tmp_offset, uint64_t ram_addr, int sent) "%s/%" PRIx64 " ram_addr=%" PRIx64 " (sent=%d)"
 migration_bitmap_sync_start(void) ""
-migration_bitmap_sync_end(uint64_t dirty_pages) "dirty_pages %" PRIu64""
+migration_bitmap_sync_end(uint64_t dirty_pages) "dirty_pages %" PRIu64
 migration_throttle(void) ""
 ram_load_postcopy_loop(uint64_t addr, int flags) "@%" PRIx64 " %x"
 ram_postcopy_send_discard_bitmap(void) ""
@@ -1277,7 +1277,7 @@ qxl_create_guest_primary_rest(int qid, int32_t stride, uint32_t type, uint32_t f
 qxl_destroy_primary(int qid) "%d"
 qxl_enter_vga_mode(int qid) "%d"
 qxl_exit_vga_mode(int qid) "%d"
-qxl_hard_reset(int qid, int64_t loadvm) "%d loadvm=%"PRId64""
+qxl_hard_reset(int qid, int64_t loadvm) "%d loadvm=%"PRId64
 qxl_interface_async_complete_io(int qid, uint32_t current_async, void *cookie) "%d current=%d cookie=%p"
 qxl_interface_attach_worker(int qid) "%d"
 qxl_interface_get_init_info(int qid) "%d"
@@ -1801,15 +1801,15 @@ qcrypto_tls_session_new(void *session, void *creds, const char *hostname, const
 vhost_user_event(const char *chr, int event) "chr: %s got event: %d"
 
 # linux-user/signal.c
-user_setup_frame(void *env, uint64_t frame_addr) "env=%p frame_addr=%"PRIx64""
-user_setup_rt_frame(void *env, uint64_t frame_addr) "env=%p frame_addr=%"PRIx64""
-user_do_rt_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=%"PRIx64""
-user_do_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=%"PRIx64""
+user_setup_frame(void *env, uint64_t frame_addr) "env=%p frame_addr=%"PRIx64
+user_setup_rt_frame(void *env, uint64_t frame_addr) "env=%p frame_addr=%"PRIx64
+user_do_rt_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=%"PRIx64
+user_do_sigreturn(void *env, uint64_t frame_addr) "env=%p frame_addr=%"PRIx64
 user_force_sig(void *env, int target_sig, int host_sig) "env=%p signal %d (host %d)"
 user_handle_signal(void *env, int target_sig) "env=%p signal %d"
 user_host_signal(void *env, int host_sig, int target_sig) "env=%p signal %d (target %d("
 user_queue_signal(void *env, int target_sig) "env=%p signal %d"
-user_s390x_restore_sigregs(void *env, uint64_t sc_psw_addr, uint64_t env_psw_addr) "env=%p frame psw.addr %"PRIx64 " current psw.addr %"PRIx64""
+user_s390x_restore_sigregs(void *env, uint64_t sc_psw_addr, uint64_t env_psw_addr) "env=%p frame psw.addr %"PRIx64 " current psw.addr %"PRIx64
 
 # io/task.c
 qio_task_new(void *task, void *source, void *func, void *opaque) "Task new task=%p source=%p func=%p opaque=%p"


