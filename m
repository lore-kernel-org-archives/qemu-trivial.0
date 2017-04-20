Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d1J89-0005m7-IH
	for mharc-qemu-trivial@gnu.org; Thu, 20 Apr 2017 16:56:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51751)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1d1J84-0005g9-KZ
	for qemu-trivial@nongnu.org; Thu, 20 Apr 2017 16:56:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1d1J83-00055a-12
	for qemu-trivial@nongnu.org; Thu, 20 Apr 2017 16:56:40 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:30667)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1d1J7y-00050V-PC; Thu, 20 Apr 2017 16:56:35 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 6F5F87456BC;
	Thu, 20 Apr 2017 22:56:17 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id CC9E47456BD; Thu, 20 Apr 2017 22:56:16 +0200 (CEST)
Message-Id: <33474e1b82c6459604edec522cee585ccdb871ee.1492721026.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1492721026.git.balaton@eik.bme.hu>
References: <cover.1492721026.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Thu, 20 Apr 2017 22:43:46 +0200
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: [Qemu-trivial] [PATCH v5 07/13] sm501: Fix device endianness
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
X-List-Received-Date: Thu, 20 Apr 2017 20:56:42 -0000

We only emulate the sysbus device in its default LE mode and PCI is LE
as well so specify this for registers and framebuffer memory.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---

v2: Split off small clean up to other patch
v4: Set serial part to little endian as well
v5: Make framebuffer always LE as suggested by Peter Maydell

 hw/display/sm501.c          |  8 ++++----
 hw/display/sm501_template.h | 19 ++++++-------------
 2 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index c92a5fa..a628ef1 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -850,7 +850,7 @@ static const MemoryRegionOps sm501_system_config_ops = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static uint32_t sm501_palette_read(void *opaque, hwaddr addr)
@@ -1086,7 +1086,7 @@ static const MemoryRegionOps sm501_disp_ctrl_ops = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static uint64_t sm501_2d_engine_read(void *opaque, hwaddr addr,
@@ -1174,7 +1174,7 @@ static const MemoryRegionOps sm501_2d_engine_ops = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 /* draw line functions for all console modes */
@@ -1510,7 +1510,7 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
     if (s->chr_state) {
         serial_mm_init(&s->state.mmio_region, SM501_UART0, 2,
                        NULL, /* TODO : chain irq to IRL */
-                       115200, s->chr_state, DEVICE_NATIVE_ENDIAN);
+                       115200, s->chr_state, DEVICE_LITTLE_ENDIAN);
     }
 }
 
diff --git a/hw/display/sm501_template.h b/hw/display/sm501_template.h
index 832ee61..54807bd 100644
--- a/hw/display/sm501_template.h
+++ b/hw/display/sm501_template.h
@@ -64,10 +64,10 @@ static void glue(draw_line16_, PIXEL_NAME)(
     uint8_t r, g, b;
 
     do {
-        rgb565 = lduw_p(s);
-        r = ((rgb565 >> 11) & 0x1f) << 3;
-        g = ((rgb565 >>  5) & 0x3f) << 2;
-        b = ((rgb565 >>  0) & 0x1f) << 3;
+        rgb565 = lduw_le_p(s);
+        r = (rgb565 >> 8) & 0xf8;
+        g = (rgb565 >> 3) & 0xfc;
+        b = (rgb565 << 3) & 0xf8;
         *(PIXEL_TYPE *)d = glue(rgb_to_pixel, PIXEL_NAME)(r, g, b);
         s += 2;
         d += BPP;
@@ -80,16 +80,9 @@ static void glue(draw_line32_, PIXEL_NAME)(
     uint8_t r, g, b;
 
     do {
-        ldub_p(s);
-#if defined(TARGET_WORDS_BIGENDIAN)
-        r = s[1];
-        g = s[2];
-        b = s[3];
-#else
-        b = s[0];
-        g = s[1];
         r = s[2];
-#endif
+        g = s[1];
+        b = s[0];
         *(PIXEL_TYPE *)d = glue(rgb_to_pixel, PIXEL_NAME)(r, g, b);
         s += 4;
         d += BPP;
-- 
2.7.4


