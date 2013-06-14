Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnRiG-0006is-RL
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 06:58:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRiA-0006bT-GU
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:58:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRi6-0006gd-Mu
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:58:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46991)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnRhz-0006d3-VO; Fri, 14 Jun 2013 06:58:20 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3CC3B4165F;
	Fri, 14 Jun 2013 14:58:19 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 541D2519; Fri, 14 Jun 2013 14:50:47 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 14 Jun 2013 14:50:23 +0400
Message-Id: <1371207042-17980-8-git-send-email-mjt@msgid.tls.msk.ru>
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
Subject: [Qemu-trivial] [PULL 07/26] char/serial: cosmetic fixes.
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
X-List-Received-Date: Fri, 14 Jun 2013 10:58:33 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Some cosmetic fixes to char/serial fixing some checkpatch errors.

Cc: qemu-trivial@nongnu.org

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/char/serial.c |   30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 66b6348..bd6813e 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -263,8 +263,9 @@ static gboolean serial_xmit(GIOChannel *chan, GIOCond=
ition cond, void *opaque)
     if (s->tsr_retry <=3D 0) {
         if (s->fcr & UART_FCR_FE) {
             s->tsr =3D fifo_get(s,XMIT_FIFO);
-            if (!s->xmit_fifo.count)
+            if (!s->xmit_fifo.count) {
                 s->lsr |=3D UART_LSR_THRE;
+            }
         } else if ((s->lsr & UART_LSR_THRE)) {
             return FALSE;
         } else {
@@ -461,10 +462,11 @@ static uint64_t serial_ioport_read(void *opaque, hw=
addr addr, unsigned size)
         } else {
             if(s->fcr & UART_FCR_FE) {
                 ret =3D fifo_get(s,RECV_FIFO);
-                if (s->recv_fifo.count =3D=3D 0)
+                if (s->recv_fifo.count =3D=3D 0) {
                     s->lsr &=3D ~(UART_LSR_DR | UART_LSR_BI);
-                else
+                } else {
                     qemu_mod_timer(s->fifo_timeout_timer, qemu_get_clock=
_ns (vm_clock) + s->char_transmit_time * 4);
+                }
                 s->timeout_ipending =3D 0;
             } else {
                 ret =3D s->rbr;
@@ -534,15 +536,21 @@ static uint64_t serial_ioport_read(void *opaque, hw=
addr addr, unsigned size)
 static int serial_can_receive(SerialState *s)
 {
     if(s->fcr & UART_FCR_FE) {
-        if(s->recv_fifo.count < UART_FIFO_LENGTH)
-        /* Advertise (fifo.itl - fifo.count) bytes when count < ITL, and=
 1 if above. If UART_FIFO_LENGTH - fifo.count is
-        advertised the effect will be to almost always fill the fifo com=
pletely before the guest has a chance to respond,
-        effectively overriding the ITL that the guest has set. */
-             return (s->recv_fifo.count <=3D s->recv_fifo.itl) ? s->recv=
_fifo.itl - s->recv_fifo.count : 1;
-        else
-             return 0;
+        if (s->recv_fifo.count < UART_FIFO_LENGTH) {
+            /*
+             * Advertise (fifo.itl - fifo.count) bytes when count < ITL,=
 and 1
+             * if above. If UART_FIFO_LENGTH - fifo.count is advertised =
the
+             * effect will be to almost always fill the fifo completely =
before
+             * the guest has a chance to respond, effectively overriding=
 the ITL
+             * that the guest has set.
+             */
+            return (s->recv_fifo.count <=3D s->recv_fifo.itl) ?
+                        s->recv_fifo.itl - s->recv_fifo.count : 1;
+        } else {
+            return 0;
+        }
     } else {
-    return !(s->lsr & UART_LSR_DR);
+        return !(s->lsr & UART_LSR_DR);
     }
 }
=20
--=20
1.7.10.4


