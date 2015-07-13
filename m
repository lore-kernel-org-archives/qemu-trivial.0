Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZEjND-0004Nu-MH
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jul 2015 15:26:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZEjNB-0004Kl-Lj
	for qemu-trivial@nongnu.org; Mon, 13 Jul 2015 15:26:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1ZEjNA-0000oH-P2
	for qemu-trivial@nongnu.org; Mon, 13 Jul 2015 15:26:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50281)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1ZEjN4-0000mT-BR; Mon, 13 Jul 2015 15:26:34 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id AA560B0FAA;
	Mon, 13 Jul 2015 19:26:33 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-29.bos.redhat.com [10.18.17.29])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6DJQVvY024283; Mon, 13 Jul 2015 15:26:31 -0400
From: John Snow <jsnow@redhat.com>
To: qemu-trivial@nongnu.org
Date: Mon, 13 Jul 2015 15:26:29 -0400
Message-Id: <1436815589-19194-1-git-send-email-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: John Snow <jsnow@redhat.com>, pbonzini@redhat.com, mjt@tls.msk.ru,
	qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: [Qemu-trivial] [PATCH] ide: coverity touchups
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
X-List-Received-Date: Mon, 13 Jul 2015 19:26:42 -0000

Just a handful of casts to quiet coverity up.

s->ports should never exceed 32, but coverity doesn't know that.
ncq_tfs->sector_count should also never exceed 64K.

Why not make Coverity a happy camper, though.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 hw/ide/ahci.c  | 8 ++++----
 hw/ide/macio.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index bb6a92f..c45983c 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -356,7 +356,7 @@ static uint64_t ahci_mem_read_32(void *opaque, hwaddr addr)
         DPRINTF(-1, "(addr 0x%08X), val 0x%08X\n", (unsigned) addr, val);
     } else if ((addr >= AHCI_PORT_REGS_START_ADDR) &&
                (addr < (AHCI_PORT_REGS_START_ADDR +
-                (s->ports * AHCI_PORT_ADDR_OFFSET_LEN)))) {
+                        (s->ports * (hwaddr)AHCI_PORT_ADDR_OFFSET_LEN)))) {
         val = ahci_port_read(s, (addr - AHCI_PORT_REGS_START_ADDR) >> 7,
                              addr & AHCI_PORT_ADDR_OFFSET_MASK);
     }
@@ -433,7 +433,7 @@ static void ahci_mem_write(void *opaque, hwaddr addr,
         }
     } else if ((addr >= AHCI_PORT_REGS_START_ADDR) &&
                (addr < (AHCI_PORT_REGS_START_ADDR +
-                (s->ports * AHCI_PORT_ADDR_OFFSET_LEN)))) {
+                        (s->ports * (hwaddr)AHCI_PORT_ADDR_OFFSET_LEN)))) {
         ahci_port_write(s, (addr - AHCI_PORT_REGS_START_ADDR) >> 7,
                         addr & AHCI_PORT_ADDR_OFFSET_MASK, val);
     }
@@ -1571,8 +1571,8 @@ static int ahci_state_post_load(void *opaque, int version_id)
                 return -1;
             }
             ahci_populate_sglist(ncq_tfs->drive, &ncq_tfs->sglist,
-                                 ncq_tfs->cmdh, ncq_tfs->sector_count * 512,
-                                 0);
+                                 ncq_tfs->cmdh,
+                                 (int64_t)ncq_tfs->sector_count * 512, 0);
             if (ncq_tfs->sector_count != ncq_tfs->sglist.size >> 9) {
                 return -1;
             }
diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index a55a479..340774b 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -253,7 +253,7 @@ static void pmac_ide_atapi_transfer_cb(void *opaque, int ret)
     }
 
     /* Calculate current offset */
-    offset = (int64_t)(s->lba << 11) + s->io_buffer_index;
+    offset = ((int64_t)s->lba << 11) + s->io_buffer_index;
 
     pmac_dma_read(s->blk, offset, io->len, pmac_ide_atapi_transfer_cb, io);
     return;
-- 
2.1.0


