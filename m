Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RJ1Jf-0005ma-73
	for mharc-qemu-trivial@gnu.org; Wed, 26 Oct 2011 07:06:39 -0400
Received: from eggs.gnu.org ([140.186.70.92]:55602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@oktetlabs.ru>) id 1RJ1Jc-0005dU-Kn
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2011 07:06:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@oktetlabs.ru>) id 1RJ1Jb-0008RO-10
	for qemu-trivial@nongnu.org; Wed, 26 Oct 2011 07:06:36 -0400
Received: from shelob.oktetlabs.ru ([195.131.132.186]:55566)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@oktetlabs.ru>)
	id 1RJ1JY-0008Ng-0l; Wed, 26 Oct 2011 07:06:32 -0400
Received: by shelob.oktetlabs.ru (Postfix, from userid 122)
	id A77997F505; Wed, 26 Oct 2011 15:06:25 +0400 (MSK)
Received: from marish.oktetlabs.ru (marish.oktetlabs.ru [192.168.38.66])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by shelob.oktetlabs.ru (Postfix) with ESMTPS id 68CCD7F4E9;
	Wed, 26 Oct 2011 15:06:19 +0400 (MSK)
X-DKIM: Sendmail DKIM Filter v2.8.2 shelob.oktetlabs.ru 68CCD7F4E9
Authentication-Results: shelob.oktetlabs.ru/68CCD7F4E9; dkim=none
	(no signature) header.i=unknown; dkim-adsp=none
Received: from jcmvbkbc by marish.oktetlabs.ru with local (Exim 4.72)
	(envelope-from <jcmvbkbc@marish.oktetlabs.ru>)
	id 1RJ1JL-00025l-Rm; Wed, 26 Oct 2011 15:06:19 +0400
From: Max Filippov <jcmvbkbc@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Wed, 26 Oct 2011 15:06:14 +0400
Message-Id: <1319627174-8015-1-git-send-email-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 195.131.132.186
Cc: Kevin Wolf <kwolf@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>
Subject: [Qemu-trivial] [PATCH] ahci: fix DPRINTF format strings
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
X-List-Received-Date: Wed, 26 Oct 2011 11:06:37 -0000

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 hw/ide/ahci.c |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 1c7e3a0..0af201d 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -327,7 +327,7 @@ static void ahci_mem_write(void *opaque, target_phys_addr_t addr,
     }
 
     if (addr < AHCI_GENERIC_HOST_CONTROL_REGS_MAX_ADDR) {
-        DPRINTF(-1, "(addr 0x%08X), val 0x%08X\n", (unsigned) addr, val);
+        DPRINTF(-1, "(addr 0x%08X), val 0x%08"PRIX64"\n", (unsigned) addr, val);
 
         switch (addr) {
             case HOST_CAP: /* R/WO, RO */
@@ -777,7 +777,8 @@ static void process_ncq_command(AHCIState *s, int port, uint8_t *cmd_fis,
     ncq_tfs->sector_count = ((uint16_t)ncq_fis->sector_count_high << 8) |
                                 ncq_fis->sector_count_low;
 
-    DPRINTF(port, "NCQ transfer LBA from %ld to %ld, drive max %ld\n",
+    DPRINTF(port, "NCQ transfer LBA from %"PRId64" to %"PRId64", "
+            "drive max %"PRId64"\n",
             ncq_tfs->lba, ncq_tfs->lba + ncq_tfs->sector_count - 2,
             s->dev[port].port.ifs[0].nb_sectors - 1);
 
@@ -786,10 +787,12 @@ static void process_ncq_command(AHCIState *s, int port, uint8_t *cmd_fis,
 
     switch(ncq_fis->command) {
         case READ_FPDMA_QUEUED:
-            DPRINTF(port, "NCQ reading %d sectors from LBA %ld, tag %d\n",
+            DPRINTF(port, "NCQ reading %d sectors from LBA %"PRId64", "
+                    "tag %d\n",
                     ncq_tfs->sector_count-1, ncq_tfs->lba, ncq_tfs->tag);
 
-            DPRINTF(port, "tag %d aio read %ld\n", ncq_tfs->tag, ncq_tfs->lba);
+            DPRINTF(port, "tag %d aio read %"PRId64"\n",
+                    ncq_tfs->tag, ncq_tfs->lba);
 
             bdrv_acct_start(ncq_tfs->drive->port.ifs[0].bs, &ncq_tfs->acct,
                             (ncq_tfs->sector_count-1) * BDRV_SECTOR_SIZE,
@@ -799,10 +802,11 @@ static void process_ncq_command(AHCIState *s, int port, uint8_t *cmd_fis,
                                            ncq_cb, ncq_tfs);
             break;
         case WRITE_FPDMA_QUEUED:
-            DPRINTF(port, "NCQ writing %d sectors to LBA %ld, tag %d\n",
+            DPRINTF(port, "NCQ writing %d sectors to LBA %"PRId64", tag %d\n",
                     ncq_tfs->sector_count-1, ncq_tfs->lba, ncq_tfs->tag);
 
-            DPRINTF(port, "tag %d aio write %ld\n", ncq_tfs->tag, ncq_tfs->lba);
+            DPRINTF(port, "tag %d aio write %"PRId64"\n",
+                    ncq_tfs->tag, ncq_tfs->lba);
 
             bdrv_acct_start(ncq_tfs->drive->port.ifs[0].bs, &ncq_tfs->acct,
                             (ncq_tfs->sector_count-1) * BDRV_SECTOR_SIZE,
-- 
1.7.2.5


