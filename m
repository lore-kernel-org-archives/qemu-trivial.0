Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cTCIE-0007qS-BM
	for mharc-qemu-trivial@gnu.org; Mon, 16 Jan 2017 13:46:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cTCIC-0007of-BP
	for qemu-trivial@nongnu.org; Mon, 16 Jan 2017 13:46:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cTCIB-00064Y-LJ
	for qemu-trivial@nongnu.org; Mon, 16 Jan 2017 13:46:08 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48189)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cTCI8-000630-MO; Mon, 16 Jan 2017 13:46:04 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cTCI5-0000es-TW; Mon, 16 Jan 2017 18:46:01 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 16 Jan 2017 18:46:00 +0000
Message-Id: <1484592360-23640-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH] scsi-disk: add 'fall through' comment to
 switch VERIFY cases
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jan 2017 18:46:09 -0000

Commit 166dbda7e131 added some extra cases to a switch() such
that the existing code is intended to fall through the new
case statements. It's clear from the commit that this is
intentional, but less clear to subsequent readers of the
code, and not clear at all to static analysis tools like
Coverity. Add a /* fall through */ comment to indicate the
intent. (Fixes CID 1368287.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/scsi/scsi-disk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index bdd1e5f..25e1081 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2157,6 +2157,7 @@ static int32_t scsi_disk_dma_command(SCSIRequest *req, uint8_t *buf)
         DPRINTF("Write %s(sector %" PRId64 ", count %u)\n",
                 (command & 0xe) == 0xe ? "And Verify " : "",
                 r->req.cmd.lba, len);
+        /* fall through */
     case VERIFY_10:
     case VERIFY_12:
     case VERIFY_16:
-- 
2.7.4


