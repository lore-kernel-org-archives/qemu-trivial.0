Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQLXH-0008Dp-Dw
	for mharc-qemu-trivial@gnu.org; Sat, 28 May 2011 11:34:43 -0400
Received: from eggs.gnu.org ([140.186.70.92]:42258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcus@mc.pp.se>) id 1QQLXF-0008Ay-U4
	for qemu-trivial@nongnu.org; Sat, 28 May 2011 11:34:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcus@mc.pp.se>) id 1QQLXF-0003JW-5t
	for qemu-trivial@nongnu.org; Sat, 28 May 2011 11:34:41 -0400
Received: from 209.171.216.81.static.lk.siw.siwnet.net ([81.216.171.209]:37358
	helo=bahamut.mc.pp.se) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcus@mc.pp.se>)
	id 1QQLXB-0003HZ-B5; Sat, 28 May 2011 11:34:39 -0400
Received: from chiyo.mc.pp.se (chiyo [192.168.42.32])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by bahamut.mc.pp.se (Postfix) with ESMTPS id EBB40FD1B;
	Sat, 28 May 2011 16:55:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mc.pp.se; s=hedgehog;
	t=1306594557; bh=1lkiNnUKLJIQ3nyNj778DjJBnPz1yZ3GqVlMqI2vmfM=;
	h=To:CC:Subject:From:Date:Message-ID:MIME-Version:Content-Type; b=f
	8zt6e7X1vbkpq5xogOZnVLQ/A7+6NZPSKeAkOai72hA3zepzDu3NYXbFEYBlkLyHNCX
	vmfzbLjf9rNuXr1WaUA6n8i2ROS3FCYKlIqpukozhATbg7S5I8A05JbcIB+IX3FKhjB
	H3gOl2+QrN5sSN8RdNnVLjpc0GrhzKOGf/4U=
Received: from marcus by chiyo.mc.pp.se with local (Exim 4.74)
	(envelope-from <marcus@mc.pp.se>)
	id 1QQKvj-0003Cb-A7; Sat, 28 May 2011 16:55:55 +0200
To: qemu-devel@nongnu.org
From: Marcus Comstedt <marcus@mc.pp.se>
Date: Sat, 28 May 2011 16:55:52 +0200
Message-ID: <yf9sjryq3gn.fsf@chiyo.mc.pp.se>
User-Agent: Gnus/5.1008 (Gnus v5.10.8) XEmacs/21.4.22 (linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-detected-operating-system: by eggs.gnu.org: Solaris 10 (beta)
X-Received-From: 81.216.171.209
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] bitbang_i2c: Fix spurious slave read after
	NACK
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
X-List-Received-Date: Sat, 28 May 2011 15:34:42 -0000

After NACKing a read operation, a raising SCL should not trigger a new
read from the slave.  Introduce a new state which just waits for a stop
or start condition after NACK.

Signed-off-by: Marcus Comstedt <marcus@mc.pp.se>
---
 hw/bitbang_i2c.c |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/hw/bitbang_i2c.c b/hw/bitbang_i2c.c
index 4ee99a1..2937b5c 100644
--- a/hw/bitbang_i2c.c
+++ b/hw/bitbang_i2c.c
@@ -38,7 +38,8 @@ typedef enum bitbang_i2c_state {
     RECEIVING_BIT2,
     RECEIVING_BIT1,
     RECEIVING_BIT0,
-    SENDING_ACK
+    SENDING_ACK,
+    SENT_NACK
 } bitbang_i2c_state;
 
 struct bitbang_i2c_interface {
@@ -115,6 +116,7 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
     }
     switch (i2c->state) {
     case STOPPED:
+    case SENT_NACK:
         return bitbang_i2c_ret(i2c, 1);
 
     case SENDING_BIT7 ... SENDING_BIT0:
@@ -155,6 +157,7 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
         i2c->state = RECEIVING_BIT7;
         if (data != 0) {
             DPRINTF("NACKED\n");
+            i2c->state = SENT_NACK;
             i2c_nack(i2c->bus);
         } else {
             DPRINTF("ACKED\n");
-- 
1.7.4.1


