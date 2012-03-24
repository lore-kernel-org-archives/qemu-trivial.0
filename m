Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SBLAa-0000dm-KM
	for mharc-qemu-trivial@gnu.org; Sat, 24 Mar 2012 03:13:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SBLAV-0000M8-76
	for qemu-trivial@nongnu.org; Sat, 24 Mar 2012 03:13:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SBLAT-0004yG-Iu
	for qemu-trivial@nongnu.org; Sat, 24 Mar 2012 03:13:42 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:54268)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SBLAQ-0004xu-Is; Sat, 24 Mar 2012 03:13:38 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	E719F72800AD; Sat, 24 Mar 2012 08:13:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id s4va2JUQ90mU; Sat, 24 Mar 2012 08:13:35 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 6F70572800AE; Sat, 24 Mar 2012 08:13:35 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: Alon Levy <alevy@redhat.com>,
	qemu-devel@nongnu.org
Date: Sat, 24 Mar 2012 08:13:34 +0100
Message-Id: <1332573214-8485-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] trace-events: Fix broken build caused by
	wrong format specifier
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
X-List-Received-Date: Sat, 24 Mar 2012 07:13:46 -0000

mem is an uint64_t value, so %lx was wrong.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 trace-events |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/trace-events b/trace-events
index 70f059d..db2cd39 100644
--- a/trace-events
+++ b/trace-events
@@ -726,7 +726,7 @@ ppm_save(const char *filename, void *display_surface) "%s surface=%p"
 # hw/qxl.c
 disable qxl_interface_set_mm_time(int qid, uint32_t mm_time) "%d %d"
 disable qxl_io_write_vga(int qid, const char *mode, uint32_t addr, uint32_t val) "%d %s addr=%u val=%u"
-qxl_create_guest_primary(int qid, uint32_t width, uint32_t height, uint64_t mem, uint32_t format, uint32_t position) "%d %dx%d mem=%lx %d,%d"
+qxl_create_guest_primary(int qid, uint32_t width, uint32_t height, uint64_t mem, uint32_t format, uint32_t position) "%d %ux%u mem=%" PRIx64 " %u,%u"
 qxl_create_guest_primary_rest(int qid, int32_t stride, uint32_t type, uint32_t flags) "%d %d,%d,%d"
 qxl_destroy_primary(int qid) "%d"
 qxl_enter_vga_mode(int qid) "%d"
-- 
1.7.0.4


