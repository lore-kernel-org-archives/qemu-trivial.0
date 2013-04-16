Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1URtre-0001BK-ET
	for mharc-qemu-trivial@gnu.org; Mon, 15 Apr 2013 20:35:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1URtrb-00018l-OL
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2013 20:35:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1URtrZ-0002tj-S8
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2013 20:35:11 -0400
Received: from mail-pd0-f181.google.com ([209.85.192.181]:49505)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1URtrZ-0002tV-IH
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2013 20:35:09 -0400
Received: by mail-pd0-f181.google.com with SMTP id y10so2790922pdj.12
	for <qemu-trivial@nongnu.org>; Mon, 15 Apr 2013 17:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:x-gm-message-state;
	bh=IpLXepheL5QOdNNLizgP+KQdfOb35yL66AOrBkYc7us=;
	b=o9bV853fO9gNDWmtuD2wmAzG9nVD/iXQG6OPI9+CtQ4Zs481vy5WpifX8LDczsMMd2
	AxmJsgkw4egv3s1kd9L59j77874uQDDd1lsPyGcUcIOvkCJ7lakap673kiKq1VZrnFCZ
	ht7WfbrtMjgU9v5rvaUoHBYWkc6rEszpLXf68hm1nWsfM6aR56xNFrs519ZegCRoj71r
	rHPHUgMheHYTkhnw7nfLyI4tJ74weGhPfkvgi7a78b2OVAEuCMpztprrXzaafTuwMyw3
	BRjB/sQRuYMW065He7mDUebC27WCsBxYZerDpVwzF4VykFQjykWJwoGaqYnrYHvaRPjI
	I1OQ==
X-Received: by 10.66.252.6 with SMTP id zo6mr628672pac.100.1366072508837;
	Mon, 15 Apr 2013 17:35:08 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPS id ra9sm107844pab.16.2013.04.15.17.35.06
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 17:35:07 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: peter.crosthwaite@xilinx.com
To: qemu-devel@nongnu.org
Date: Tue, 16 Apr 2013 10:32:53 +1000
Message-Id: <6438a07b209e5e20bbd47e7aaedc86ae7dec2396.1366071713.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1366071713.git.peter.crosthwaite@xilinx.com>
References: <cover.1366071713.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQnheYWObOBGOWwKbwrjLEX10fD1CkOpU8/Ciuw5G/+iQBe/W29pw/ehUZmvivB5w4dIsphb
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.192.181
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com
Subject: [Qemu-trivial] [PATCH v3 1/4] m25p80: Fix debug messages.
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
X-List-Received-Date: Tue, 16 Apr 2013 00:35:12 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

Some dodgy casts were making a mess of these msgs.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---
Remove misleading "k" suffix from erase size message
Use PRIxN macros where appropriate (Edgar review)

 hw/block/m25p80.c |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index cd560e3..a524bde 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -319,7 +319,7 @@ static void flash_erase(Flash *s, int offset, FlashCMD cmd)
 
     DB_PRINT("offset = %#x, len = %d\n", offset, len);
     if ((s->pi->flags & capa_to_assert) != capa_to_assert) {
-        hw_error("m25p80: %dk erase size not supported by device\n", len);
+        hw_error("m25p80: %d erase size not supported by device\n", len);
     }
 
     if (!s->write_enable) {
@@ -349,8 +349,8 @@ void flash_write8(Flash *s, uint64_t addr, uint8_t data)
     }
 
     if ((prev ^ data) & data) {
-        DB_PRINT("programming zero to one! addr=%lx  %x -> %x\n",
-                  addr, prev, data);
+        DB_PRINT("programming zero to one! addr=%" PRIx64 "  %" PRIx8
+                 " -> %" PRIx8 "\n", addr, prev, data);
     }
 
     if (s->pi->flags & WR_1) {
@@ -538,15 +538,16 @@ static uint32_t m25p80_transfer8(SSISlave *ss, uint32_t tx)
     switch (s->state) {
 
     case STATE_PAGE_PROGRAM:
-        DB_PRINT("page program cur_addr=%lx data=%x\n", s->cur_addr,
-                 (uint8_t)tx);
+        DB_PRINT("page program cur_addr=%#" PRIx64 " data=%" PRIx8 "\n",
+                 s->cur_addr, (uint8_t)tx);
         flash_write8(s, s->cur_addr, (uint8_t)tx);
         s->cur_addr++;
         break;
 
     case STATE_READ:
         r = s->storage[s->cur_addr];
-        DB_PRINT("READ 0x%lx=%x\n", s->cur_addr, r);
+        DB_PRINT("READ 0x%" PRIx64 "=%" PRIx8 "\n", s->cur_addr,
+                 (uint8_t)r);
         s->cur_addr = (s->cur_addr + 1) % s->size;
         break;
 
-- 
1.7.0.4


