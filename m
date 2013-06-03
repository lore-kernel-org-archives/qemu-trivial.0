Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjN63-0004Se-J4
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2013 01:14:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UjN5x-0004SB-Bu
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 01:14:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UjN5s-0001mr-KC
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 01:14:13 -0400
Received: from mail-pb0-x230.google.com ([2607:f8b0:400e:c01::230]:44175)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UjN5s-0001mk-Db
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 01:14:08 -0400
Received: by mail-pb0-f48.google.com with SMTP id md4so5094888pbc.21
	for <qemu-trivial@nongnu.org>; Sun, 02 Jun 2013 22:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=9suX9FTr8LMnBbtSh588zL8ZEV0SMEJwuMQfDbbw/Kc=;
	b=BmSVLe2SquOZiVsQ4WAaix1QGtvW+NKVsPLmbUN1wEHvMXQoHg//uNzR4h9xYy6lJF
	1POc5mEtn3x92rXZQGBU+8yaiZ+6ywiL5tIL53oeaH9ossdpYAIC4rTwXxF4cbxqSDYC
	mO8yZ1Xqe7qNVJGdxEb0PEMvh0JqgS8SztMwGTyz/jDkQnIQRO5UIfWeFERKM+zmUwzX
	UDQT8AMagI6G/aQLf6sbG0AzKFufm+/6YjzH2Ar3Qw7yDygwS6AmmBD8iexvriwJ591v
	D9477fbqzKv7QsZf+R1DTYQTrGxRsdzYe60Cu0sR6ZxSd6CTQ5Qy1jJ5llurE7BROacT
	LreQ==
X-Received: by 10.66.145.98 with SMTP id st2mr23215886pab.24.1370236447727;
	Sun, 02 Jun 2013 22:14:07 -0700 (PDT)
Received: from localhost ([203.126.243.116])
	by mx.google.com with ESMTPSA id aj2sm57449492pbc.1.2013.06.02.22.14.00
	for <multiple recipients>
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Sun, 02 Jun 2013 22:14:06 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: peter.crosthwaite@xilinx.com
To: qemu-devel@nongnu.org
Date: Mon,  3 Jun 2013 15:12:09 +1000
Message-Id: <b61bfd22e26fd08d9cca73e875c6074a9664c49c.1370236013.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.8.3.rc1.44.gb387c77.dirty
In-Reply-To: <cover.1370236013.git.peter.crosthwaite@xilinx.com>
References: <cover.1370236013.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQnPGTgEbyWA1yiCjU9RKimlMa7IofYQcoVF9xayDi4VZ/C/B3L6ztrunLcE0IiR5h2hSYnJ
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::230
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com, aliguori@us.ibm.com,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH v1 1/3] char/serial: cosmetic fixes.
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
X-List-Received-Date: Mon, 03 Jun 2013 05:14:18 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Some cosmetic fixes to char/serial fixing some checkpatch errors.

Cc: qemu-trivial@nongnu.org

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---
Needed for the next patch to pass checkpatch. Done as sep patch to not
obscure that patch.

 hw/char/serial.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 66b6348..bd6813e 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -263,8 +263,9 @@ static gboolean serial_xmit(GIOChannel *chan, GIOCondition cond, void *opaque)
     if (s->tsr_retry <= 0) {
         if (s->fcr & UART_FCR_FE) {
             s->tsr = fifo_get(s,XMIT_FIFO);
-            if (!s->xmit_fifo.count)
+            if (!s->xmit_fifo.count) {
                 s->lsr |= UART_LSR_THRE;
+            }
         } else if ((s->lsr & UART_LSR_THRE)) {
             return FALSE;
         } else {
@@ -461,10 +462,11 @@ static uint64_t serial_ioport_read(void *opaque, hwaddr addr, unsigned size)
         } else {
             if(s->fcr & UART_FCR_FE) {
                 ret = fifo_get(s,RECV_FIFO);
-                if (s->recv_fifo.count == 0)
+                if (s->recv_fifo.count == 0) {
                     s->lsr &= ~(UART_LSR_DR | UART_LSR_BI);
-                else
+                } else {
                     qemu_mod_timer(s->fifo_timeout_timer, qemu_get_clock_ns (vm_clock) + s->char_transmit_time * 4);
+                }
                 s->timeout_ipending = 0;
             } else {
                 ret = s->rbr;
@@ -534,15 +536,21 @@ static uint64_t serial_ioport_read(void *opaque, hwaddr addr, unsigned size)
 static int serial_can_receive(SerialState *s)
 {
     if(s->fcr & UART_FCR_FE) {
-        if(s->recv_fifo.count < UART_FIFO_LENGTH)
-        /* Advertise (fifo.itl - fifo.count) bytes when count < ITL, and 1 if above. If UART_FIFO_LENGTH - fifo.count is
-        advertised the effect will be to almost always fill the fifo completely before the guest has a chance to respond,
-        effectively overriding the ITL that the guest has set. */
-             return (s->recv_fifo.count <= s->recv_fifo.itl) ? s->recv_fifo.itl - s->recv_fifo.count : 1;
-        else
-             return 0;
+        if (s->recv_fifo.count < UART_FIFO_LENGTH) {
+            /*
+             * Advertise (fifo.itl - fifo.count) bytes when count < ITL, and 1
+             * if above. If UART_FIFO_LENGTH - fifo.count is advertised the
+             * effect will be to almost always fill the fifo completely before
+             * the guest has a chance to respond, effectively overriding the ITL
+             * that the guest has set.
+             */
+            return (s->recv_fifo.count <= s->recv_fifo.itl) ?
+                        s->recv_fifo.itl - s->recv_fifo.count : 1;
+        } else {
+            return 0;
+        }
     } else {
-    return !(s->lsr & UART_LSR_DR);
+        return !(s->lsr & UART_LSR_DR);
     }
 }
 
-- 
1.8.3.rc1.44.gb387c77.dirty


