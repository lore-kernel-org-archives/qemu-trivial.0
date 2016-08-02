Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bUaAQ-0000Bg-1D
	for mharc-qemu-trivial@gnu.org; Tue, 02 Aug 2016 09:55:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chaojianhu@hotmail.com>) id 1bUYbv-0007AF-Nz
	for qemu-trivial@nongnu.org; Tue, 02 Aug 2016 08:15:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chaojianhu@hotmail.com>) id 1bUYbt-0004Zz-OB
	for qemu-trivial@nongnu.org; Tue, 02 Aug 2016 08:15:50 -0400
Received: from blu004-omc2s9.hotmail.com ([65.55.111.84]:61654)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chaojianhu@hotmail.com>)
	id 1bUYbo-0004ZE-2H; Tue, 02 Aug 2016 08:15:44 -0400
Received: from BLU436-SMTP183 ([65.55.111.71]) by BLU004-OMC2S9.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.23008);
	Tue, 2 Aug 2016 05:15:43 -0700
X-TMN: [IMCzJr3rfGE7zpPhg6F2/wn6Qo5FM4R1MwSKNXMdUDI=]
X-Originating-Email: [chaojianhu@hotmail.com]
Message-ID: <BLU436-SMTP18383289290DAB1921B097CDB050@phx.gbl>
From: chaojianhu <chaojianhu@hotmail.com>
To: qemu-devel@nongnu.org
CC: qemu-trivial@nongnu.org, kwolf@redhat.com, stefanha@redhat.com,
	chaojianhu <chaojianhu@hotmail.com>
Date: Tue, 2 Aug 2016 20:15:30 +0800
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 02 Aug 2016 12:15:43.0014 (UTC)
	FILETIME=[97302460:01D1ECB7]
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 65.55.111.84
X-Mailman-Approved-At: Tue, 02 Aug 2016 09:55:31 -0400
Subject: [Qemu-trivial] [PATCH] hw/ide: fix a writing to null pointer
 exception
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
X-List-Received-Date: Tue, 02 Aug 2016 12:15:52 -0000

From: chaojianhu <chaojianhu@hotmail.com>
Date: Tue, 2 Aug 2016 17:39:16 +0800
Subject: [PATCH] hw/ide: fix a writing to null pointer exception

In qemu less than v2.1.3, ide_flush_cache calls ide_flush_cb with s->bs == NULL,
and ide_flush_cb calls bdrv_acct_done without checking s->bs neither. Finally, 
bdrv_acct_done writes s->bs directly!

Reported-by: chaojianhu <chaojianhu@hotmail.com>
Signed-off-by: chaojianhu <chaojianhu@hotmail.com>

---
 hw/ide/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/ide/core.c b/hw/ide/core.c
index fa4cafa..c39eedc 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -839,7 +839,9 @@ static void ide_flush_cb(void *opaque, int ret)
         }
     }
 
-    bdrv_acct_done(s->bs, &s->acct);
+    if (s->bs){
+        bdrv_acct_done(s->bs, &s->acct);
+    }
     s->status = READY_STAT | SEEK_STAT;
     ide_async_cmd_done(s);
     ide_set_irq(s->bus);
-- 
1.9.1


