Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1chmke-0001Wm-ML
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2017 19:31:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42621)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1chmkb-0001NU-5H
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2017 19:31:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1chmkZ-0005yY-UC
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2017 19:31:45 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:32629)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1chmkV-0005ti-0C; Sat, 25 Feb 2017 19:31:39 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 7A61F745960;
	Sun, 26 Feb 2017 01:31:30 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 7F715745964; Sun, 26 Feb 2017 01:31:29 +0100 (CET)
Message-Id: <6b70a9dfe56c3a0dc8e874c45d70612aff7b8e3a.1488068248.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1488068248.git.balaton@eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Sat, 25 Feb 2017 19:46:03 +0100
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: [Qemu-trivial] [PATCH v2 07/14] sm501: Fix device endianness
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
X-List-Received-Date: Sun, 26 Feb 2017 00:31:46 -0000

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---

v2: Split off small clean up to other patch

 hw/display/sm501.c          |  6 +++---
 hw/display/sm501_template.h | 23 ++++++++++++++---------
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index b977094..2694081 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -849,7 +849,7 @@ static const MemoryRegionOps sm501_system_config_ops = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static uint32_t sm501_palette_read(void *opaque, hwaddr addr)
@@ -1085,7 +1085,7 @@ static const MemoryRegionOps sm501_disp_ctrl_ops = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 static uint64_t sm501_2d_engine_read(void *opaque, hwaddr addr,
@@ -1173,7 +1173,7 @@ static const MemoryRegionOps sm501_2d_engine_ops = {
         .min_access_size = 4,
         .max_access_size = 4,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
 /* draw line functions for all console modes */
diff --git a/hw/display/sm501_template.h b/hw/display/sm501_template.h
index 832ee61..6e56baf 100644
--- a/hw/display/sm501_template.h
+++ b/hw/display/sm501_template.h
@@ -64,10 +64,16 @@ static void glue(draw_line16_, PIXEL_NAME)(
     uint8_t r, g, b;
 
     do {
-        rgb565 = lduw_p(s);
-        r = ((rgb565 >> 11) & 0x1f) << 3;
-        g = ((rgb565 >>  5) & 0x3f) << 2;
-        b = ((rgb565 >>  0) & 0x1f) << 3;
+        rgb565 = lduw_le_p(s);
+#if defined(TARGET_WORDS_BIGENDIAN)
+        r = (rgb565 >> 8) & 0xf8;
+        g = (rgb565 >> 3) & 0xfc;
+        b = (rgb565 << 3) & 0xf8;
+#else
+        b = (rgb565 >> 8) & 0xf8;
+        g = (rgb565 >> 3) & 0xfc;
+        r = (rgb565 << 3) & 0xf8;
+#endif
         *(PIXEL_TYPE *)d = glue(rgb_to_pixel, PIXEL_NAME)(r, g, b);
         s += 2;
         d += BPP;
@@ -80,15 +86,14 @@ static void glue(draw_line32_, PIXEL_NAME)(
     uint8_t r, g, b;
 
     do {
-        ldub_p(s);
 #if defined(TARGET_WORDS_BIGENDIAN)
+        r = s[0];
+        g = s[1];
+        b = s[2];
+#else
         r = s[1];
         g = s[2];
         b = s[3];
-#else
-        b = s[0];
-        g = s[1];
-        r = s[2];
 #endif
         *(PIXEL_TYPE *)d = glue(rgb_to_pixel, PIXEL_NAME)(r, g, b);
         s += 4;
-- 
2.7.4


