Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d1J8C-0005qD-Rg
	for mharc-qemu-trivial@gnu.org; Thu, 20 Apr 2017 16:56:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51733)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1d1J84-0005fg-5n
	for qemu-trivial@nongnu.org; Thu, 20 Apr 2017 16:56:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1d1J82-00055I-OL
	for qemu-trivial@nongnu.org; Thu, 20 Apr 2017 16:56:40 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:30614)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1d1J7x-0004nx-EH; Thu, 20 Apr 2017 16:56:33 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 335367456F9;
	Thu, 20 Apr 2017 22:56:17 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id C6F4A7456B8; Thu, 20 Apr 2017 22:56:16 +0200 (CEST)
Message-Id: <3c5b0d9bcf770cb87f84cb5649d7119b37647355.1492721026.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1492721026.git.balaton@eik.bme.hu>
References: <cover.1492721026.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Thu, 20 Apr 2017 22:43:46 +0200
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: [Qemu-trivial] [PATCH v5 05/13] sm501: Get rid of base address in
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
X-List-Received-Date: Thu, 20 Apr 2017 20:56:41 -0000

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


