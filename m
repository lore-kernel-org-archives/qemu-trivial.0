Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cfUu7-0000FX-KC
	for mharc-qemu-trivial@gnu.org; Sun, 19 Feb 2017 12:04:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cfUu2-00008y-Lk
	for qemu-trivial@nongnu.org; Sun, 19 Feb 2017 12:04:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cfUu1-0002s9-Uc
	for qemu-trivial@nongnu.org; Sun, 19 Feb 2017 12:04:02 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:65195)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1cfUtz-0002ou-2a; Sun, 19 Feb 2017 12:03:59 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 5A6B9745964;
	Sun, 19 Feb 2017 18:03:46 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 1E20374595D; Sun, 19 Feb 2017 18:03:39 +0100 (CET)
Message-Id: <84d7cdceac575c23bd4ee4bdcb80a03966b96db8.1487522123.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1487522123.git.balaton@eik.bme.hu>
References: <cover.1487522123.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Sun, 19 Feb 2017 17:35:23 +0100
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: [Qemu-trivial] [PATCH 02/10] sm501: Use defines instead of
 constants where available
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 19 Feb 2017 17:04:03 -0000

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/sm501.c          | 8 ++++----
 hw/display/sm501_template.h | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 4f40dee..4eb085c 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -555,7 +555,7 @@ static uint32_t get_local_mem_size_index(uint32_t size)
 static inline int is_hwc_enabled(SM501State *state, int crt)
 {
     uint32_t addr = crt ? state->dc_crt_hwc_addr : state->dc_panel_hwc_addr;
-    return addr & 0x80000000;
+    return addr & SM501_HWC_EN;
 }
 
 /**
@@ -1411,9 +1411,9 @@ void sm501_init(MemoryRegion *address_space_mem, uint32_t base,
     s->local_mem_size_index = get_local_mem_size_index(local_mem_bytes);
     SM501_DPRINTF("local mem size=%x. index=%d\n", get_local_mem_size(s),
                   s->local_mem_size_index);
-    s->system_control = 0x00100000;
-    s->misc_control = 0x00001000; /* assumes SH, active=low */
-    s->dc_panel_control = 0x00010000;
+    s->system_control = 0x00100000; /* 2D engine FIFO empty */
+    s->misc_control = SM501_MISC_IRQ_INVERT; /* assumes SH, active=low */
+    s->dc_panel_control = 0x00010000; /* FIFO level 3 */
     s->dc_crt_control = 0x00010000;
 
     /* allocate local memory */
diff --git a/hw/display/sm501_template.h b/hw/display/sm501_template.h
index aeeac5d..16e500b 100644
--- a/hw/display/sm501_template.h
+++ b/hw/display/sm501_template.h
@@ -108,7 +108,7 @@ static void glue(draw_hwc_line_, PIXEL_NAME)(SM501State *s, int crt,
     /* get hardware cursor pattern */
     uint32_t cursor_addr = get_hwc_address(s, crt);
     assert(0 <= c_y && c_y < SM501_HWC_HEIGHT);
-    cursor_addr += 64 * c_y / 4;  /* 4 pixels per byte */
+    cursor_addr += SM501_HWC_WIDTH * c_y / 4;  /* 4 pixels per byte */
     cursor_addr += s->base;
 
     /* get cursor position */
-- 
2.7.4


