Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1StEud-0007rB-Um
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jul 2012 05:26:47 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <initcrash@gmail.com>) id 1StEuX-0007q4-2n
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2012 05:26:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <initcrash@gmail.com>) id 1StEuT-00087C-6p
	for qemu-trivial@nongnu.org; Mon, 23 Jul 2012 05:26:41 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:56103)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <initcrash@gmail.com>)
	id 1StEuJ-00085A-FQ; Mon, 23 Jul 2012 05:26:27 -0400
Received: by bkcji1 with SMTP id ji1so4182572bkc.4
	for <multiple recipients>; Mon, 23 Jul 2012 02:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Cw6lwimhdCYNJU0efg3fnFYYE0ZRLvMEc0Ux1Pm2jLY=;
	b=S1qVLtBXnhC6YJ9x8JQrhzNiJCk6362Ag5gkCC7FlJrZD9dYlIFyhaqEONVKPTW1PW
	xbwbOH+9bg2Y4i/3Ra+BbRTt3npnRCeGO/On2A2zAJM3RlHfZR8NcVw3FuPN9noej/M3
	Zb42avrsnUU6Fcl47C/JvKYlNRCXFclU720Mc5VExhgwYE+BFaSKriMAWX6WlivSd7Eo
	kAEZtz3AhKyYMdvYyW5xeI2Yr4MqOGrlsmTf8EU/iMj53Lo/jpzftw8AesscRttuMnaC
	lZWq/9VTxWb/JFlPtmFfxqQllD5Xlv5nGzy/S1griIAw/Mm/pKLGBbHtWfWQLAOEQzQU
	5sgA==
Received: by 10.204.133.194 with SMTP id g2mr7153429bkt.13.1343035586160;
	Mon, 23 Jul 2012 02:26:26 -0700 (PDT)
Received: from christianschilling.intern (p57A0E8D2.dip.t-dialin.net.
	[87.160.232.210])
	by mx.google.com with ESMTPS id 14sm6598101bkq.12.2012.07.23.02.26.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jul 2012 02:26:25 -0700 (PDT)
From: initcrash@gmail.com
To: qemu-devel@nongnu.org
Date: Mon, 23 Jul 2012 11:25:44 +0200
Message-Id: <1343035544-11101-1-git-send-email-initcrash@gmail.com>
X-Mailer: git-send-email 1.7.7.6
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Christian Schilling <initcrash@gmail.com>
Subject: [Qemu-trivial] [PATCH] eepro100: fix simplified mode
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
X-List-Received-Date: Mon, 23 Jul 2012 09:26:46 -0000

From: Christian Schilling <initcrash@gmail.com>

A driver using simplified mode that works on real hardware
did not work in qemu.

Signed-off-by: Christian Schilling <initcrash@gmail.com>
---
 hw/eepro100.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/hw/eepro100.c b/hw/eepro100.c
index 6279ae3..4a48372 100644
--- a/hw/eepro100.c
+++ b/hw/eepro100.c
@@ -774,6 +774,13 @@ static void tx_command(EEPRO100State *s)
 #if 0
         uint16_t tx_buffer_el = lduw_le_pci_dma(&s->dev, tbd_address + 6);
 #endif
+        if (tbd_array == 0xffffffff) {
+            /* In simpliyfied mode there is no tbd_array. Instead the packet data
+             * starts right after the tcb_bytes field, and the packet size is
+             * equal to tcb_bytes */
+            tx_buffer_size = tcb_bytes;
+            tx_buffer_address = tbd_address;
+        }
         tbd_address += 8;
         TRACE(RXTX, logout
             ("TBD (simplified mode): buffer address 0x%08x, size 0x%04x\n",
-- 
1.7.7.6


