Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bCMx9-00010Y-Sh
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jun 2016 04:10:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bCMx6-0000yK-4s
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2016 04:10:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bCMx1-0007xf-Px
	for qemu-trivial@nongnu.org; Mon, 13 Jun 2016 04:10:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51939)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bCMwv-0007w7-Ug; Mon, 13 Jun 2016 04:10:22 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7177E85540;
	Mon, 13 Jun 2016 08:10:21 +0000 (UTC)
Received: from thh440s.fritz.box (vpn1-6-135.ams2.redhat.com [10.36.6.135])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5D8AI8t027786; Mon, 13 Jun 2016 04:10:20 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org
Date: Mon, 13 Jun 2016 10:10:18 +0200
Message-Id: <1465805418-15906-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 13 Jun 2016 08:10:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] scsi-disk: Use (unsigned long) typecasts
 when using "%lu" format string
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
X-List-Received-Date: Mon, 13 Jun 2016 08:10:35 -0000

Some source code analyzers like cppcheck spill out a warning if
the sign of the argument does not match the format string.

Ticket: https://bugs.launchpad.net/qemu/+bug/1589564
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/scsi/scsi-disk.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index 1881969..36f8a85 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -2060,13 +2060,13 @@ static int32_t scsi_disk_emulate_command(SCSIRequest *req, uint8_t *buf)
         }
         break;
     case MODE_SELECT:
-        DPRINTF("Mode Select(6) (len %lu)\n", (long)r->req.cmd.xfer);
+        DPRINTF("Mode Select(6) (len %lu)\n", (unsigned long)r->req.cmd.xfer);
         break;
     case MODE_SELECT_10:
-        DPRINTF("Mode Select(10) (len %lu)\n", (long)r->req.cmd.xfer);
+        DPRINTF("Mode Select(10) (len %lu)\n", (unsigned long)r->req.cmd.xfer);
         break;
     case UNMAP:
-        DPRINTF("Unmap (len %lu)\n", (long)r->req.cmd.xfer);
+        DPRINTF("Unmap (len %lu)\n", (unsigned long)r->req.cmd.xfer);
         break;
     case VERIFY_10:
     case VERIFY_12:
@@ -2080,7 +2080,7 @@ static int32_t scsi_disk_emulate_command(SCSIRequest *req, uint8_t *buf)
     case WRITE_SAME_16:
         DPRINTF("WRITE SAME %d (len %lu)\n",
                 req->cmd.buf[0] == WRITE_SAME_10 ? 10 : 16,
-                (long)r->req.cmd.xfer);
+                (unsigned long)r->req.cmd.xfer);
         break;
     default:
         DPRINTF("Unknown SCSI command (%2.2x=%s)\n", buf[0],
-- 
1.8.3.1


