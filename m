Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjN8a-0006Pj-DI
	for mharc-qemu-trivial@gnu.org; Mon, 03 Jun 2013 01:16:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35893)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UjN8U-0006Oe-Cd
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 01:16:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UjN8O-0002US-SW
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 01:16:50 -0400
Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230]:35615)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UjN8O-0002UC-LR
	for qemu-trivial@nongnu.org; Mon, 03 Jun 2013 01:16:44 -0400
Received: by mail-pa0-f48.google.com with SMTP id kp6so714266pab.21
	for <qemu-trivial@nongnu.org>; Sun, 02 Jun 2013 22:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=BjJ5PGEQ+lWgaz819c0HHQ1uzqF0AY3peEmaxmHRxt4=;
	b=gzOGygeHG/c4E8kwMCGefPnjZ9Scs9GcDOHRGRxGtPOQh0ACA+qkh/+0eGhHXc2+qM
	le16HdhXc7XClLKWl8cOj22vxnxNINNVTi/iP6aLxIumA6eiEhUvOxYiAVwkjLldsddB
	J7mySNORPuBCyp6axAjD7CbHObJ0EY1yFx3JR7L67rcZ33Ykb99StBbW4LuK5+KWkv5e
	w8smAr7qjZ+2hS4kxmBSFJk9WHtxY6xYgNMgErd0qNJ2ucsMazJzqNuehHS1cFiVgUxr
	SEt/xU3vxvP05Ea4axj3OePHzopIMq5DIkyrMHeTv1W4+dJ8Jr/nZWhiBRy5MYDZtDrn
	bF2A==
X-Received: by 10.66.118.129 with SMTP id km1mr22257831pab.112.1370236603943; 
	Sun, 02 Jun 2013 22:16:43 -0700 (PDT)
Received: from localhost ([203.126.243.116]) by mx.google.com with ESMTPSA id
	ov2sm57399765pbc.34.2013.06.02.22.16.36 for <multiple recipients>
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Sun, 02 Jun 2013 22:16:42 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: peter.crosthwaite@xilinx.com
To: qemu-devel@nongnu.org
Date: Mon,  3 Jun 2013 15:14:48 +1000
Message-Id: <3a93fbb6bbc96792cf7b85384a2317344b77ab13.1370236013.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.8.3.rc1.44.gb387c77.dirty
In-Reply-To: <cover.1370236013.git.peter.crosthwaite@xilinx.com>
References: <cover.1370236013.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQkPVG+/83xAHtJW/Ky6eJz6JHkEcC+ba61eIP+ufaQI1TjrQGGZ/6NJuvwK8ugD1f9pgaAn
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::230
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com, aliguori@us.ibm.com,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH v1 3/3] char/serial: serial_ioport_write:
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
X-List-Received-Date: Mon, 03 Jun 2013 05:16:55 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

These three lines are common to both FIFO and regular mode. Just factor
them out to outside the if rather than replicate the same lines inside
both if and else.

Cc: qemu-trivial@nongnu.org

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/char/serial.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/hw/char/serial.c b/hw/char/serial.c
index 0a2b6c9..017610e 100644
--- a/hw/char/serial.c
+++ b/hw/char/serial.c
@@ -285,15 +285,11 @@ static void serial_ioport_write(void *opaque, hwaddr addr, uint64_t val,
                     fifo8_pop(&s->xmit_fifo);
                 }
                 fifo8_push(&s->xmit_fifo, s->thr);
-                s->thr_ipending = 0;
                 s->lsr &= ~UART_LSR_TEMT;
-                s->lsr &= ~UART_LSR_THRE;
-                serial_update_irq(s);
-            } else {
-                s->thr_ipending = 0;
-                s->lsr &= ~UART_LSR_THRE;
-                serial_update_irq(s);
             }
+            s->thr_ipending = 0;
+            s->lsr &= ~UART_LSR_THRE;
+            serial_update_irq(s);
             serial_xmit(NULL, G_IO_OUT, s);
         }
         break;
-- 
1.8.3.rc1.44.gb387c77.dirty


