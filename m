Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UoU7F-0007o3-GG
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jun 2013 03:44:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UoU7C-0007g9-Dy
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 03:44:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UoU7A-0005VJ-Vc
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 03:44:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59055)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UoU75-0005Tj-QU; Mon, 17 Jun 2013 03:44:31 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 27AAA418F9;
	Mon, 17 Jun 2013 11:44:31 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 6179C51B; Mon, 17 Jun 2013 11:44:30 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Mon, 17 Jun 2013 11:44:10 +0400
Message-Id: <1371455050-9523-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371455050-9523-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371455050-9523-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Vladimir Senkov <hangup@gmail.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL trivial/urgent 2/2] fixed a copy&paste error
	in serial.c
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
X-List-Received-Date: Mon, 17 Jun 2013 07:44:40 -0000

From: Vladimir Senkov <hangup@gmail.com>

Copy&paste error in serial.c causes a crash when attempting
to read from UART (if there is no data to be read)

Signed-off-by: Vladimir Senkov <hangup@gmail.com>
Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/char/serial.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index b537e42..6382f98 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -424,7 +424,7 @@ static uint64_t serial_ioport_read(void *opaque, hwaddr addr, unsigned size)
             ret = s->divider & 0xff;
         } else {
             if(s->fcr & UART_FCR_FE) {
-                ret = fifo8_is_full(&s->recv_fifo) ?
+                ret = fifo8_is_empty(&s->recv_fifo) ?
                             0 : fifo8_pop(&s->recv_fifo);
                 if (s->recv_fifo.num == 0) {
                     s->lsr &= ~(UART_LSR_DR | UART_LSR_BI);
-- 
1.7.10.4


