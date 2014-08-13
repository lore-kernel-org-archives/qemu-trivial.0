Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHSur-0002Pk-PG
	for mharc-qemu-trivial@gnu.org; Wed, 13 Aug 2014 03:24:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XHSul-0002Hh-Pd
	for qemu-trivial@nongnu.org; Wed, 13 Aug 2014 03:24:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XHSue-0006Au-B3
	for qemu-trivial@nongnu.org; Wed, 13 Aug 2014 03:24:04 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38198)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XHSuL-000687-Pm; Wed, 13 Aug 2014 03:23:41 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9707542AB2;
	Wed, 13 Aug 2014 11:23:40 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 847676DF;
	Wed, 13 Aug 2014 11:23:40 +0400 (MSK)
Received: (nullmailer pid 10564 invoked by uid 1000);
	Wed, 13 Aug 2014 07:23:40 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed, 13 Aug 2014 11:23:31 +0400
Message-Id: <1407914611-10516-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, Michael Tokarev <mjt@tls.msk.ru>,
	armbru@redhat.com, qemu-stable@nongnu.org
Subject: [Qemu-trivial] ide: only constrain read/write requests to drive
	size, not other types
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
X-List-Received-Date: Wed, 13 Aug 2014 07:24:12 -0000

Commit 58ac321135a introduced a check to ide dma processing which
constrains all requests to drive size.  However, apparently, some
valid requests (like TRIM) does not fit in this constraint, and
fails in 2.1.  So check the range only for reads and writes.

Cc: qemu-stable@nongnu.org
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Markus Armbruster <armbru@redhat.com>

diff --git a/hw/ide/core.c b/hw/ide/core.c
index db191a6..7256592 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -688,7 +688,8 @@ void ide_dma_cb(void *opaque, int ret)
            sector_num, n, s->dma_cmd);
 #endif
 
-    if (!ide_sect_range_ok(s, sector_num, n)) {
+    if ((s->dma_cmd == IDE_DMA_READ || s->dma_cmd == IDE_DMA_WRITE) &&
+        !ide_sect_range_ok(s, sector_num, n)) {
         dma_buf_commit(s);
         ide_dma_error(s);
         return;

