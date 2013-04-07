Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UOiYm-0003i2-D3
	for mharc-qemu-trivial@gnu.org; Sun, 07 Apr 2013 01:54:36 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UOiYe-0003XH-IM
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 01:54:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UOiYb-00014G-B6
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 01:54:28 -0400
Received: from mail-pa0-f49.google.com ([209.85.220.49]:44412)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UOiYb-00013w-5J
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 01:54:25 -0400
Received: by mail-pa0-f49.google.com with SMTP id kp14so2659060pab.8
	for <qemu-trivial@nongnu.org>; Sat, 06 Apr 2013 22:54:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:in-reply-to:references:x-gm-message-state;
	bh=fiutFUxpTlIB8EbmIlsvKT0JlihiZfrpN07QsXFLdFo=;
	b=epYOFd7Jv8gCXcHqoDpYMhPgV+nEKmopAOcDdp3mkJ70W4MS8AFLwIm9CcfCruq0/0
	3p7ghSLVItH2DTmLme7PR457kcxVS/fZ321KNZ99c1SZxGqRf3XSTL/6WBb3ML0bVZl4
	5NFzfpNoENjvizBvMm3ZFuFU7MHXQ3ZxK9tGs85Bsg106v38hGG2KbBch+VHk62z9OnL
	xaw0lJzNOmPWg694MgAqjZZ3hz7ebTtdFrC3I9nc1jDbdKPHFvyaCt8kS70RumjAyJLt
	o7N5Ko/OKw14QzfvDh7Cgfikaf3LDH1XpVQ7ZMWBykhXwJkNkySxm209MIlmG5xNI2QD
	MZIA==
X-Received: by 10.66.27.105 with SMTP id s9mr25200956pag.108.1365314064290;
	Sat, 06 Apr 2013 22:54:24 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPS id ve7sm26272675pab.11.2013.04.06.22.54.22
	(version=TLSv1.1 cipher=RC4-SHA bits=128/128);
	Sat, 06 Apr 2013 22:54:23 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Sun,  7 Apr 2013 15:53:30 +1000
Message-Id: <b11f602c35e64c13972671ed747fa3647e847a5e.1365313801.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1365313801.git.peter.crosthwaite@xilinx.com>
References: <cover.1365313801.git.peter.crosthwaite@xilinx.com>
In-Reply-To: <cover.1365313801.git.peter.crosthwaite@xilinx.com>
References: <cover.1365313801.git.peter.crosthwaite@xilinx.com>
X-Gm-Message-State: ALoCoQkW6bvLVdM7eNbOLdfAAbFHVQ08sE2MowB2xHP2I1K4D1F5F5sB1q6VgUP1Lnm3UMEfU3lx
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.220.49
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH v2 1/4] m25p80: Fix debug messages.
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
X-List-Received-Date: Sun, 07 Apr 2013 05:54:35 -0000

Some dodgy casts were making a mess of these msgs.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---
Remove misleading "k" suffix from erase size message
Use PRIxN macros where appropriate (Edgar review)

 hw/m25p80.c |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/hw/m25p80.c b/hw/m25p80.c
index 55e9d0d..c395e98 100644
--- a/hw/m25p80.c
+++ b/hw/m25p80.c
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


