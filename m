Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLXyK-00049A-Rg
	for mharc-qemu-trivial@gnu.org; Sun, 24 Aug 2014 09:36:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXyE-0003vJ-4u
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:36:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXy9-0006p9-J5
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:36:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39281)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XLXxy-0006kb-PL; Sun, 24 Aug 2014 09:36:18 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E7EC044A03;
	Sun, 24 Aug 2014 17:36:17 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id CEB0B6E7;
	Sun, 24 Aug 2014 17:31:04 +0400 (MSK)
Received: (nullmailer pid 30081 invoked by uid 1000);
	Sun, 24 Aug 2014 13:31:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun, 24 Aug 2014 17:30:56 +0400
Message-Id: <1408887062-30022-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 05/11] dma: axidma: Variablise repeated
	s->streams[i] sub-expr
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
X-List-Received-Date: Sun, 24 Aug 2014 13:36:38 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

This have 6 inline usages. Make it a bit more readable by using a local
variable.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/dma/xilinx_axidma.c |   10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index ee60d3f..d06002d 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -553,10 +553,12 @@ static void xilinx_axidma_realize(DeviceState *dev, Error **errp)
     int i;
 
     for (i = 0; i < 2; i++) {
-        s->streams[i].nr = i;
-        s->streams[i].bh = qemu_bh_new(timer_hit, &s->streams[i]);
-        s->streams[i].ptimer = ptimer_init(s->streams[i].bh);
-        ptimer_set_freq(s->streams[i].ptimer, s->freqhz);
+        struct Stream *st = &s->streams[i];
+
+        st->nr = i;
+        st->bh = qemu_bh_new(timer_hit, st);
+        st->ptimer = ptimer_init(st->bh);
+        ptimer_set_freq(st->ptimer, s->freqhz);
     }
     return;
 
-- 
1.7.10.4


