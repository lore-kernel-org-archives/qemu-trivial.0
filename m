Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WEeIT-00079B-A6
	for mharc-qemu-trivial@gnu.org; Sat, 15 Feb 2014 07:24:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeIM-0006wJ-Bi
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:24:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeIH-0000CP-GV
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:24:34 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:39698)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WEeI4-0000A0-QC; Sat, 15 Feb 2014 07:24:16 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 36C6E41C2C;
	Sat, 15 Feb 2014 16:24:16 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 791C0645;
	Sat, 15 Feb 2014 16:18:23 +0400 (MSK)
Received: (nullmailer pid 21841 invoked by uid 1000);
	Sat, 15 Feb 2014 12:18:22 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Feb 2014 16:18:20 +0400
Message-Id: <1392466700-21770-11-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 10/10] char/serial: Fix emptyness check
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
X-List-Received-Date: Sat, 15 Feb 2014 12:24:38 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

This was guarding against a full fifo rather than an empty fifo when
popping. Fix.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Reviewed-by: Martin Kletzander <mkletzan@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/char/serial.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 27dab7d..6d3b5af 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -225,7 +225,7 @@ static gboolean serial_xmit(GIOChannel *chan, GIOCondition cond, void *opaque)
 
     if (s->tsr_retry <= 0) {
         if (s->fcr & UART_FCR_FE) {
-            s->tsr = fifo8_is_full(&s->xmit_fifo) ?
+            s->tsr = fifo8_is_empty(&s->xmit_fifo) ?
                         0 : fifo8_pop(&s->xmit_fifo);
             if (!s->xmit_fifo.num) {
                 s->lsr |= UART_LSR_THRE;
-- 
1.7.10.4


