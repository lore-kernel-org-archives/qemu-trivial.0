Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVy7u-0002pc-RU
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 05:14:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVy7q-0002ki-Bq
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 05:14:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVy7p-0002cL-IA
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 05:14:54 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58699)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVy7l-0002Zp-Aq; Tue, 24 Jan 2017 05:14:49 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 878A54210B;
	Tue, 24 Jan 2017 13:14:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 7B4DC58D;
	Tue, 24 Jan 2017 12:39:44 +0300 (MSK)
Received: (nullmailer pid 12663 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:31 +0300
Message-Id: <a8802cd1d30fd153eac8f3a3ff9fdabf1cb069a5.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 27/31] scsi-disk: add 'fall through' comment
 to switch VERIFY cases
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
X-List-Received-Date: Tue, 24 Jan 2017 10:14:55 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Commit 166dbda7e131 added some extra cases to a switch() such
that the existing code is intended to fall through the new
case statements. It's clear from the commit that this is
intentional, but less clear to subsequent readers of the
code, and not clear at all to static analysis tools like
Coverity. Add a /* fall through */ comment to indicate the
intent. (Fixes CID 1368287.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/scsi/scsi-disk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index c080888..cc06fe5 100644
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
2.1.4


