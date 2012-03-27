Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SCKz1-0001aN-Do
	for mharc-qemu-trivial@gnu.org; Mon, 26 Mar 2012 21:13:59 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1SCKyx-0001UN-L2
	for qemu-trivial@nongnu.org; Mon, 26 Mar 2012 21:13:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1SCKyu-00005I-LC
	for qemu-trivial@nongnu.org; Mon, 26 Mar 2012 21:13:55 -0400
Received: from e36.co.us.ibm.com ([32.97.110.154]:60688)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1SCKyu-0008Vd-Ee
	for qemu-trivial@nongnu.org; Mon, 26 Mar 2012 21:13:52 -0400
Received: from /spool/local
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Mon, 26 Mar 2012 19:13:47 -0600
Received: from d01dlp03.pok.ibm.com (9.56.224.17)
	by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 26 Mar 2012 19:13:46 -0600
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id D0AD1C90052;
	Mon, 26 Mar 2012 21:13:44 -0400 (EDT)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d01relay04.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	q2R1Dikq350286; Mon, 26 Mar 2012 21:13:45 -0400
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id q2R1Di2b030307; Mon, 26 Mar 2012 19:13:44 -0600
Received: from [9.59.241.154] (d941e-10.watson.ibm.com [9.59.241.154])
	by d03av04.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	q2R1DhMW030282; Mon, 26 Mar 2012 19:13:43 -0600
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 26 Mar 2012 21:13:37 -0400
Message-ID: <1332810817.25443.3.camel@d941e-10>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 (2.32.3-1.fc14) 
Content-Transfer-Encoding: 7bit
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 12032701-3352-0000-0000-00000397DD6A
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 32.97.110.154
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] Make live saving stages public and use their
	#defines
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
X-List-Received-Date: Tue, 27 Mar 2012 01:13:57 -0000

Make the different stages for live saving of state public and use
the #defines rather than numbers.

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>

---
 arch_init.c       |    7 ++++---
 block-migration.c |    8 ++++----
 savevm.c          |    7 -------
 vmstate.h         |    8 ++++++++
 4 files changed, 16 insertions(+), 14 deletions(-)

Index: qemu/savevm.c
===================================================================
--- qemu.orig/savevm.c
+++ qemu/savevm.c
@@ -1541,13 +1541,6 @@ static void vmstate_save(QEMUFile *f, Sa
 #define QEMU_VM_FILE_VERSION_COMPAT  0x00000002
 #define QEMU_VM_FILE_VERSION         0x00000003
 
-#define QEMU_VM_EOF                  0x00
-#define QEMU_VM_SECTION_START        0x01
-#define QEMU_VM_SECTION_PART         0x02
-#define QEMU_VM_SECTION_END          0x03
-#define QEMU_VM_SECTION_FULL         0x04
-#define QEMU_VM_SUBSECTION           0x05
-
 bool qemu_savevm_state_blocked(Error **errp)
 {
     SaveStateEntry *se;
Index: qemu/vmstate.h
===================================================================
--- qemu.orig/vmstate.h
+++ qemu/vmstate.h
@@ -31,6 +31,14 @@ typedef void SaveStateHandler(QEMUFile *
 typedef int SaveLiveStateHandler(QEMUFile *f, int stage, void *opaque);
 typedef int LoadStateHandler(QEMUFile *f, void *opaque, int version_id);
 
+/* stages of the live state handler */
+#define QEMU_VM_EOF                  0x00
+#define QEMU_VM_SECTION_START        0x01
+#define QEMU_VM_SECTION_PART         0x02
+#define QEMU_VM_SECTION_END          0x03
+#define QEMU_VM_SECTION_FULL         0x04
+#define QEMU_VM_SUBSECTION           0x05
+
 int register_savevm(DeviceState *dev,
                     const char *idstr,
                     int instance_id,
Index: qemu/arch_init.c
===================================================================
--- qemu.orig/arch_init.c
+++ qemu/arch_init.c
@@ -275,7 +275,7 @@ int ram_save_live(QEMUFile *f, int stage
 
     memory_global_sync_dirty_bitmap(get_system_memory());
 
-    if (stage == 1) {
+    if (stage == QEMU_VM_SECTION_START) {
         RAMBlock *block;
         bytes_transferred = 0;
         last_block = NULL;
@@ -330,7 +330,7 @@ int ram_save_live(QEMUFile *f, int stage
     }
 
     /* try transferring iterative blocks of memory */
-    if (stage == 3) {
+    if (stage == QEMU_VM_SECTION_END) {
         int bytes_sent;
 
         /* flush all remaining blocks regardless of rate limiting */
@@ -344,7 +344,8 @@ int ram_save_live(QEMUFile *f, int stage
 
     expected_time = ram_save_remaining() * TARGET_PAGE_SIZE / bwidth;
 
-    return (stage == 2) && (expected_time <= migrate_max_downtime());
+    return (stage == QEMU_VM_SECTION_PART) &&
+           (expected_time <= migrate_max_downtime());
 }
 
 static inline void *host_from_stream_offset(QEMUFile *f,
Index: qemu/block-migration.c
===================================================================
--- qemu.orig/block-migration.c
+++ qemu/block-migration.c
@@ -554,7 +554,7 @@ static int block_save_live(QEMUFile *f, 
         return 1;
     }
 
-    if (stage == 1) {
+    if (stage == QEMU_VM_SECTION_START) {
         init_blk_migration(f);
 
         /* start track dirty blocks */
@@ -571,7 +571,7 @@ static int block_save_live(QEMUFile *f, 
 
     blk_mig_reset_dirty_cursor();
 
-    if (stage == 2) {
+    if (stage == QEMU_VM_SECTION_PART) {
         /* control the rate of transfer */
         while ((block_mig_state.submitted +
                 block_mig_state.read_done) * BLOCK_SIZE <
@@ -599,7 +599,7 @@ static int block_save_live(QEMUFile *f, 
         }
     }
 
-    if (stage == 3) {
+    if (stage == QEMU_VM_SECTION_END) {
         /* we know for sure that save bulk is completed and
            all async read completed */
         assert(block_mig_state.submitted == 0);
@@ -620,7 +620,7 @@ static int block_save_live(QEMUFile *f, 
 
     qemu_put_be64(f, BLK_MIG_FLAG_EOS);
 
-    return ((stage == 2) && is_stage2_completed());
+    return ((stage == QEMU_VM_SECTION_PART) && is_stage2_completed());
 }
 
 static int block_load(QEMUFile *f, void *opaque, int version_id)


