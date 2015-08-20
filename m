Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZSS9A-0000sd-IL
	for mharc-qemu-trivial@gnu.org; Thu, 20 Aug 2015 11:52:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1ZSS96-0000pM-Hu
	for qemu-trivial@nongnu.org; Thu, 20 Aug 2015 11:52:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <linux@roeck-us.net>) id 1ZSS91-0006LI-C3
	for qemu-trivial@nongnu.org; Thu, 20 Aug 2015 11:52:52 -0400
Received: from bh-25.webhostbox.net ([208.91.199.152]:58795)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <linux@roeck-us.net>)
	id 1ZSS91-0006L8-4j; Thu, 20 Aug 2015 11:52:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=roeck-us.net;
	s=default; h=Message-Id:Date:Subject:Cc:To:From;
	bh=Hexk0jbQqy/Y2anB8+NfsIo5X2x9UT66lfPdxG4T/l0=; 
	b=N5DLtTUuqJ2S8vjYHQkQoexdxiPvTWGvdMZ472l7Deeb6g+k72ZOOAEJFCxLRNWYkkCc7mplhgRFHiYRFccHSwoX4BZA+T0w0sW516+UXkhCsaggXJ42/pVp2zqvEGA8y/Irvo/EUDkZv+FezqqpQqNlp5OrnaT5zeREhD9QMAI=;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net
	([108.223.40.66]:60418 helo=localhost)
	by bh-25.webhostbox.net with esmtpa (Exim 4.85)
	(envelope-from <linux@roeck-us.net>)
	id 1ZSS8x-000Ly6-Dt; Thu, 20 Aug 2015 15:52:43 +0000
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Chubb <peter.chubb@nicta.com.au>
Date: Thu, 20 Aug 2015 08:52:35 -0700
Message-Id: <1440085955-27951-1-git-send-email-linux@roeck-us.net>
X-Mailer: git-send-email 2.1.4
X-Authenticated_sender: guenter@roeck-us.net
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-Get-Message-Sender-Via: bh-25.webhostbox.net: authenticated_id:
	guenter@roeck-us.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 208.91.199.152
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Guenter Roeck <linux@roeck-us.net>
Subject: [Qemu-trivial] [PATCH] imx_serial: Generate interrupt on tx empty
	if enabled
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
X-List-Received-Date: Thu, 20 Aug 2015 15:52:54 -0000

Generate an interrupt if the tx buffer is empty and the tx empty interrupt
is enabled. This fixes a problem seen when running a Linux image since
Linux commit 55c3cb1358e ("serial: imx: remove unneeded imx_transmit_buffer()
from imx_start_tx()"). Linux now waits for the tx empty interrupt before
starting to send data, causing transmit stalls until there is an interrupt
for another reason.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 hw/char/imx_serial.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/char/imx_serial.c b/hw/char/imx_serial.c
index f3fbc77..8dc791d 100644
--- a/hw/char/imx_serial.c
+++ b/hw/char/imx_serial.c
@@ -145,7 +145,9 @@ static void imx_update(IMXSerialState *s)
     uint32_t flags;
 
     flags = (s->usr1 & s->ucr1) & (USR1_TRDY|USR1_RRDY);
-    if (!(s->ucr1 & UCR1_TXMPTYEN)) {
+    if (s->ucr1 & UCR1_TXMPTYEN) {
+        flags |= (s->uts1 & UTS1_TXEMPTY);
+    } else {
         flags &= ~USR1_TRDY;
     }
 
-- 
2.1.4


