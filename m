Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ckIOA-0003NQ-Q9
	for mharc-qemu-trivial@gnu.org; Sat, 04 Mar 2017 17:42:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35562)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1ckIO6-0003KG-8h
	for qemu-trivial@nongnu.org; Sat, 04 Mar 2017 17:42:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1ckIO4-0000zP-KZ
	for qemu-trivial@nongnu.org; Sat, 04 Mar 2017 17:42:54 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:26787)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1ckINz-0000uM-Pt; Sat, 04 Mar 2017 17:42:48 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 0503974596C;
	Sat,  4 Mar 2017 23:42:39 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id C2BA7745967; Sat,  4 Mar 2017 23:42:37 +0100 (CET)
Message-Id: <fc706f4363e5ec921d313b318f4d9355c6168780.1488665935.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1488665935.git.balaton@eik.bme.hu>
References: <cover.1488665935.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Sat, 25 Feb 2017 19:23:50 +0100
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: [Qemu-trivial] [PATCH v4 05/13] sm501: Get rid of base address in
 draw_hwc_line
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
X-List-Received-Date: Sat, 04 Mar 2017 22:42:57 -0000

Do not use the base address to access data in local memory. This is in
preparation to allow chip connected via PCI where base address depends
on where the BAR is mapped so it will be unknown.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/sm501.c          | 6 ++----
 hw/display/sm501_template.h | 8 ++++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 571a7e6..09c023d 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -461,7 +461,6 @@ typedef struct SM501State {
     QemuConsole *con;
 
     /* status & internal resources */
-    hwaddr base;
     uint32_t local_mem_size_index;
     uint8_t *local_mem;
     MemoryRegion local_mem_region;
@@ -1432,10 +1431,9 @@ static void sm501_reset(SM501State *s)
     s->twoD_control = 0;
 }
 
-static void sm501_init(SM501State *s, DeviceState *dev, uint32_t base,
+static void sm501_init(SM501State *s, DeviceState *dev,
                        uint32_t local_mem_bytes)
 {
-    s->base = base;
     s->local_mem_size_index = get_local_mem_size_index(local_mem_bytes);
     SM501_DPRINTF("sm501 local mem size=%x. index=%d\n", get_local_mem_size(s),
                   s->local_mem_size_index);
@@ -1489,7 +1487,7 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
     DeviceState *usb_dev;
 
-    sm501_init(&s->state, dev, s->base, s->vram_size);
+    sm501_init(&s->state, dev, s->vram_size);
     if (get_local_mem_size(&s->state) != s->vram_size) {
         error_setg(errp, "Invalid VRAM size, nearest valid size is %" PRIu32,
                    get_local_mem_size(&s->state));
diff --git a/hw/display/sm501_template.h b/hw/display/sm501_template.h
index 16e500b..832ee61 100644
--- a/hw/display/sm501_template.h
+++ b/hw/display/sm501_template.h
@@ -103,13 +103,13 @@ static void glue(draw_hwc_line_, PIXEL_NAME)(SM501State *s, int crt,
                  uint8_t *palette, int c_y, uint8_t *d, int width)
 {
     int x, i;
-    uint8_t bitset = 0;
+    uint8_t *pixval, bitset = 0;
 
     /* get hardware cursor pattern */
     uint32_t cursor_addr = get_hwc_address(s, crt);
     assert(0 <= c_y && c_y < SM501_HWC_HEIGHT);
     cursor_addr += SM501_HWC_WIDTH * c_y / 4;  /* 4 pixels per byte */
-    cursor_addr += s->base;
+    pixval = s->local_mem + cursor_addr;
 
     /* get cursor position */
     x = get_hwc_x(s, crt);
@@ -120,8 +120,8 @@ static void glue(draw_hwc_line_, PIXEL_NAME)(SM501State *s, int crt,
 
         /* get pixel value */
         if (i % 4 == 0) {
-            bitset = ldub_phys(&address_space_memory, cursor_addr);
-            cursor_addr++;
+            bitset = ldub_p(pixval);
+            pixval++;
         }
         v = bitset & 3;
         bitset >>= 2;
-- 
2.7.4


