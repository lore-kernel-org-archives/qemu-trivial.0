Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WoqTv-0005v7-6u
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 04:42:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WoqTm-0005dB-5u
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 04:42:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WoqTf-0000f9-N9
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 04:41:58 -0400
Received: from mail-qg0-f42.google.com ([209.85.192.42]:64411)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WoqTf-0000ew-Jg
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 04:41:51 -0400
Received: by mail-qg0-f42.google.com with SMTP id q107so11917627qgd.1
	for <qemu-trivial@nongnu.org>; Mon, 26 May 2014 01:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=O4Ff6496UHpoR7cZ1MRg4LaTPxGJMSEGIWaHnNkGc+U=;
	b=dnQ3N3RuOIwPXGpdKeI6REuX9uoSkBE4VA/zmAvoUiB8juELrKihXbAmstde8qME2N
	GCyO337zFBO/9I9BVLPZgqw04zvA7Ek3GgXhGEdMMTU4C0qNXZVj3pfpoLCKLyJvrO1j
	fW74hX9QM+6wXsMpL5Vjf9+bvn2LI6MZ9fBZiijLLU24TD6AXFzxbKh2tcxcgzGKYsZJ
	VswJvXm2YhMXwyfPIGRQOpxiqTKaQdYwk++oT0kbDhzj3mQfFo+Q0C4WnOXsU/CzSzTB
	oA9ZQyKjqsX9aBqmpmaUTCjBBzu6FVRSZQqI9OaBajo7+Y90rOd9agiVZbfThQc1cXR9
	kVvg==
X-Gm-Message-State: ALoCoQlhFbnVAaGJz3wJEyio0cqEL6t7/8AvdDhVVZ53W+qYE5WP4bDs8lYkBCBUBVfeU5bXkZyi
X-Received: by 10.140.36.149 with SMTP id p21mr28979123qgp.54.1401093711190;
	Mon, 26 May 2014 01:41:51 -0700 (PDT)
Received: from localhost ([149.199.62.254]) by mx.google.com with ESMTPSA id
	o16sm19086222qax.23.2014.05.26.01.41.50 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 26 May 2014 01:41:50 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 01:38:55 -0700
Message-Id: <8d2eb6e8b44a642705fdcf388c7579d1a77c9cbf.1401092237.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.9.3.1.ga73a6ad
In-Reply-To: <cover.1401092237.git.peter.crosthwaite@xilinx.com>
References: <cover.1401092237.git.peter.crosthwaite@xilinx.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.42
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH trivial v2 3/4] net: cadence_gem: Comment
	spelling sweep
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
X-List-Received-Date: Mon, 26 May 2014 08:42:06 -0000

Fix some typos in comments.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---

 hw/net/cadence_gem.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index f0e9f5b..7cd4b54 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -50,7 +50,7 @@
 #define GEM_IER           (0x00000028/4) /* Interrupt Enable reg */
 #define GEM_IDR           (0x0000002C/4) /* Interrupt Disable reg */
 #define GEM_IMR           (0x00000030/4) /* Interrupt Mask reg */
-#define GEM_PHYMNTNC      (0x00000034/4) /* Phy Maintaince reg */
+#define GEM_PHYMNTNC      (0x00000034/4) /* Phy Maintenance reg */
 #define GEM_RXPAUSE       (0x00000038/4) /* RX Pause Time reg */
 #define GEM_TXPAUSE       (0x0000003C/4) /* TX Pause Time reg */
 #define GEM_TXPARTIALSF   (0x00000040/4) /* TX Partial Store and Forward */
@@ -150,7 +150,7 @@
 #define GEM_NWCTRL_LOCALLOOP   0x00000002 /* Local Loopback */
 
 #define GEM_NWCFG_STRIP_FCS    0x00020000 /* Strip FCS field */
-#define GEM_NWCFG_LERR_DISC    0x00010000 /* Discard RX frames with lenth err */
+#define GEM_NWCFG_LERR_DISC    0x00010000 /* Discard RX frames with len err */
 #define GEM_NWCFG_BUFF_OFST_M  0x0000C000 /* Receive buffer offset mask */
 #define GEM_NWCFG_BUFF_OFST_S  14         /* Receive buffer offset shift */
 #define GEM_NWCFG_UCAST_HASH   0x00000080 /* accept unicast if hash match */
@@ -397,7 +397,7 @@ static const uint8_t broadcast_addr[] = { 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF };
  */
 static void gem_init_register_masks(GemState *s)
 {
-    /* Mask of register bits which are read only*/
+    /* Mask of register bits which are read only */
     memset(&s->regs_ro[0], 0, sizeof(s->regs_ro));
     s->regs_ro[GEM_NWCTRL]   = 0xFFF80000;
     s->regs_ro[GEM_NWSTATUS] = 0xFFFFFFFF;
@@ -719,7 +719,7 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         unsigned crc_val;
 
         /* The application wants the FCS field, which QEMU does not provide.
-         * We must try and caclculate one.
+         * We must try and calculate one.
          */
 
         memcpy(rxbuf, buf, size);
@@ -871,7 +871,7 @@ static void gem_transmit(GemState *s)
 
     DB_PRINT("\n");
 
-    /* The packet we will hand off to qemu.
+    /* The packet we will hand off to QEMU.
      * Packets scattered across multiple descriptors are gathered to this
      * one contiguous buffer first.
      */
@@ -923,7 +923,7 @@ static void gem_transmit(GemState *s)
             tx_desc_set_used(desc_first);
             cpu_physical_memory_write(s->tx_desc_addr, (uint8_t *)desc_first,
                                       sizeof(desc_first));
-            /* Advance the hardare current descriptor past this packet */
+            /* Advance the hardware current descriptor past this packet */
             if (tx_desc_get_wrap(desc)) {
                 s->tx_desc_addr = s->regs[GEM_TXQBASE];
             } else {
-- 
1.9.3.1.ga73a6ad


