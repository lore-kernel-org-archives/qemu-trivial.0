Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkEje-00039t-RJ
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 13:12:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44980)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEjZ-00030L-St
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:12:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEjY-0004Cd-Pi
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:12:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46373)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZkEjQ-0003v2-3t; Thu, 08 Oct 2015 13:11:52 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 61CCB40A55;
	Thu,  8 Oct 2015 20:11:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 43478AA6;
	Thu,  8 Oct 2015 19:52:33 +0300 (MSK)
Received: (nullmailer pid 12005 invoked by uid 1000);
	Thu, 08 Oct 2015 16:52:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 19:52:23 +0300
Message-Id: <65cb2a14cacbc08c754f3cb41436fe6ece46593a.1444323071.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
References: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shraddha Barke <shraddha.6596@gmail.com>
Subject: [Qemu-trivial] [PULL 14/19] hw: char: Remove unnecessary variable
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
X-List-Received-Date: Thu, 08 Oct 2015 17:12:03 -0000

From: Shraddha Barke <shraddha.6596@gmail.com>

Compress lines and remove the variable.

Signed-off-by: Shraddha Barke <shraddha.6596@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/char/etraxfs_ser.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/char/etraxfs_ser.c b/hw/char/etraxfs_ser.c
index 857c136..562021e 100644
--- a/hw/char/etraxfs_ser.c
+++ b/hw/char/etraxfs_ser.c
@@ -182,15 +182,13 @@ static void serial_receive(void *opaque, const uint8_t *buf, int size)
 static int serial_can_receive(void *opaque)
 {
     ETRAXSerial *s = opaque;
-    int r;
 
     /* Is the receiver enabled?  */
     if (!(s->regs[RW_REC_CTRL] & (1 << 3))) {
         return 0;
     }
 
-    r = sizeof(s->rx_fifo) - s->rx_fifo_len;
-    return r;
+    return sizeof(s->rx_fifo) - s->rx_fifo_len;
 }
 
 static void serial_event(void *opaque, int event)
-- 
2.1.4


