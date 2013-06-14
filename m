Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnRiF-0006ik-W5
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 06:58:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56997)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRi9-0006Z3-Ck
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:58:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRi6-0006gR-8I
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:58:29 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57993)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnRi0-0006df-A8; Fri, 14 Jun 2013 06:58:20 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 924DE41662;
	Fri, 14 Jun 2013 14:58:19 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 6CEF5517; Fri, 14 Jun 2013 14:50:47 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 14 Jun 2013 14:50:25 +0400
Message-Id: <1371207042-17980-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 09/26] char/serial: serial_ioport_write:
	Factor out common code
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
X-List-Received-Date: Fri, 14 Jun 2013 10:58:31 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

These three lines are common to both FIFO and regular mode. Just factor
them out to outside the if rather than replicate the same lines inside
both if and else.

Cc: qemu-trivial@nongnu.org

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/char/serial.c |   10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 0a2b6c9..017610e 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -285,15 +285,11 @@ static void serial_ioport_write(void *opaque, hwadd=
r addr, uint64_t val,
                     fifo8_pop(&s->xmit_fifo);
                 }
                 fifo8_push(&s->xmit_fifo, s->thr);
-                s->thr_ipending =3D 0;
                 s->lsr &=3D ~UART_LSR_TEMT;
-                s->lsr &=3D ~UART_LSR_THRE;
-                serial_update_irq(s);
-            } else {
-                s->thr_ipending =3D 0;
-                s->lsr &=3D ~UART_LSR_THRE;
-                serial_update_irq(s);
             }
+            s->thr_ipending =3D 0;
+            s->lsr &=3D ~UART_LSR_THRE;
+            serial_update_irq(s);
             serial_xmit(NULL, G_IO_OUT, s);
         }
         break;
--=20
1.7.10.4


