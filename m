Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7jIK-0000qC-Gh
	for mharc-qemu-trivial@gnu.org; Wed, 24 Jun 2015 07:56:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Z7jII-0000mc-4m
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 07:56:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Z7jIH-0007jU-6A
	for qemu-trivial@nongnu.org; Wed, 24 Jun 2015 07:56:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46059)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1Z7jIA-0007fs-Sf; Wed, 24 Jun 2015 07:56:34 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 981E719CBAA;
	Wed, 24 Jun 2015 11:56:33 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-66.ams2.redhat.com
	[10.36.112.66])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5OBuVvG021494; Wed, 24 Jun 2015 07:56:32 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 24 Jun 2015 13:56:31 +0200
Message-Id: <1435146991-305-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] hw: fix mask for ColdFire UART command
	register
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
X-List-Received-Date: Wed, 24 Jun 2015 11:56:43 -0000

The "miscellaneous commands" part of the register is 3 bits wide.
Spotted by Coverity and confirmed in the datasheet, downloadable from
http://cache.freescale.com/files/32bit/doc/ref_manual/MCF5307BUM.pdf
(figure 14-6).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/char/mcf_uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/mcf_uart.c b/hw/char/mcf_uart.c
index 98fd44e..cda22ee 100644
--- a/hw/char/mcf_uart.c
+++ b/hw/char/mcf_uart.c
@@ -126,7 +126,7 @@ static void mcf_uart_do_tx(mcf_uart_state *s)
 static void mcf_do_command(mcf_uart_state *s, uint8_t cmd)
 {
     /* Misc command.  */
-    switch ((cmd >> 4) & 3) {
+    switch ((cmd >> 4) & 7) {
     case 0: /* No-op.  */
         break;
     case 1: /* Reset mode register pointer.  */
-- 
2.4.3


