Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TP8Z0-00082u-UX
	for mharc-qemu-trivial@gnu.org; Fri, 19 Oct 2012 05:08:18 -0400
Received: from eggs.gnu.org ([208.118.235.92]:52802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1TP8Yu-0007vj-GR
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 05:08:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1TP8Yq-0004aP-Ji
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 05:08:12 -0400
Received: from mail-pa0-f45.google.com ([209.85.220.45]:33382)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1TP8Yq-0004aC-Dl
	for qemu-trivial@nongnu.org; Fri, 19 Oct 2012 05:08:08 -0400
Received: by mail-pa0-f45.google.com with SMTP id fb10so223684pad.4
	for <qemu-trivial@nongnu.org>; Fri, 19 Oct 2012 02:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=BDYHOWWsWoQISDVLvwnEWmm0IZQmAuXUN0O9JbInGg8=;
	b=pUxTRLi7ccSGOvaCT6FvBXduDgsd81QWXLU/sqcmb97LSz4Lg8bGpO3QD/O2ypSGFY
	BZbiCWJ+wC+aRHOZafcmruxAEwjoBabp4NJgAo87k8C9u2ky1O/BLVSkhhdMQCo4muTC
	c0q5nny09HYrb/Sp3TIlt1eWi5tmNphbYuXeTuJD4Nt287I35nEIZFClViWtUbZk12tU
	5ELF+rvMT84eXM0iza24BpYNiR0zR4jOF8K1rIAd6PynlucBMfLP6QJlkjG7gWaGVc2h
	GWwN5qne30HMpfCHiD9idO+lZ9pO7/YAkNkPUUMxwQyXn3unAuHluzCag1m7pRq5UwAi
	HMxg==
Received: by 10.66.85.66 with SMTP id f2mr1882536paz.56.1350637687683;
	Fri, 19 Oct 2012 02:08:07 -0700 (PDT)
Received: from localhost ([124.148.20.9])
	by mx.google.com with ESMTPS id k9sm790951paz.22.2012.10.19.02.08.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Oct 2012 02:08:07 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Fri, 19 Oct 2012 19:08:04 +1000
Message-Id: <1350637684-32300-1-git-send-email-peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
X-Gm-Message-State: ALoCoQm9gOLmBzgPV1W6aUxI87/ZfUMJ1uLWtTE03d99XFJdGCu4bdVvfAw2siGcwR4AUOY9qcU3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.220.45
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH] cadence_uart: More debug information
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
X-List-Received-Date: Fri, 19 Oct 2012 09:08:18 -0000

Add more helpful debug information to the cadence UART.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---
 hw/cadence_uart.c |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/cadence_uart.c b/hw/cadence_uart.c
index f8afc4e..483a316 100644
--- a/hw/cadence_uart.c
+++ b/hw/cadence_uart.c
@@ -359,7 +359,7 @@ static void uart_write(void *opaque, target_phys_addr_t offset,
 {
     UartState *s = (UartState *)opaque;
 
-    DB_PRINT(" offset:%x data:%08x\n", offset, (unsigned)value);
+    DB_PRINT(" offset:%x data:%08x\n", (unsigned)offset, (unsigned)value);
     offset >>= 2;
     switch (offset) {
     case R_IER: /* ier (wts imr) */
@@ -405,12 +405,15 @@ static uint64_t uart_read(void *opaque, target_phys_addr_t offset,
 
     offset >>= 2;
     if (offset >= R_MAX) {
-        return 0;
+        c = 0;
     } else if (offset == R_TX_RX) {
         uart_read_rx_fifo(s, &c);
-        return c;
+    } else {
+       c = s->r[offset];
     }
-    return s->r[offset];
+
+    DB_PRINT(" offset:%x data:%08x\n", (unsigned)(offset << 2), (unsigned)c);
+    return c;
 }
 
 static const MemoryRegionOps uart_ops = {
-- 
1.7.0.4


