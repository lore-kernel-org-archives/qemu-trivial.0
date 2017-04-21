Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d1aWO-0001gp-FX
	for mharc-qemu-trivial@gnu.org; Fri, 21 Apr 2017 11:30:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1d1aWF-0001T2-N2
	for qemu-trivial@nongnu.org; Fri, 21 Apr 2017 11:30:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1d1aWE-0007tN-IT
	for qemu-trivial@nongnu.org; Fri, 21 Apr 2017 11:30:47 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:33820)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1d1aW9-0007oj-00; Fri, 21 Apr 2017 11:30:41 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id E1BB97456BC;
	Fri, 21 Apr 2017 17:30:38 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 340EB7456E4; Fri, 21 Apr 2017 17:30:38 +0200 (CEST)
Message-Id: <187c9e4e09d9bc2967b2454b36bb088ceef0b8bc.1492787889.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1492787889.git.balaton@eik.bme.hu>
References: <cover.1492787889.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Fri, 21 Apr 2017 17:18:09 +0200
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: [Qemu-trivial] [PATCH v7 09/13] sm501: Misc clean ups
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
X-List-Received-Date: Fri, 21 Apr 2017 15:30:49 -0000

- Rename a variable
- Move variable declarations out of loop to the beginning in draw_hwc_line

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
---
 hw/display/sm501.c          | 10 +++++-----
 hw/display/sm501_template.h | 10 ++++------
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 72e86ba..3974821 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1313,7 +1313,7 @@ static void sm501_draw_crt(SM501State *s)
     uint32_t *palette = (uint32_t *)&s->dc_palette[SM501_DC_CRT_PALETTE -
                                                    SM501_DC_PANEL_PALETTE];
     uint8_t hwc_palette[3 * 3];
-    int ds_depth_index = get_depth_index(surface);
+    int dst_depth_index = get_depth_index(surface);
     draw_line_func *draw_line = NULL;
     draw_hwc_line_func *draw_hwc_line = NULL;
     int full_update = 0;
@@ -1325,13 +1325,13 @@ static void sm501_draw_crt(SM501State *s)
     /* choose draw_line function */
     switch (src_bpp) {
     case 1:
-        draw_line = draw_line8_funcs[ds_depth_index];
+        draw_line = draw_line8_funcs[dst_depth_index];
         break;
     case 2:
-        draw_line = draw_line16_funcs[ds_depth_index];
+        draw_line = draw_line16_funcs[dst_depth_index];
         break;
     case 4:
-        draw_line = draw_line32_funcs[ds_depth_index];
+        draw_line = draw_line32_funcs[dst_depth_index];
         break;
     default:
         printf("sm501 draw crt : invalid DC_CRT_CONTROL=%x.\n",
@@ -1343,7 +1343,7 @@ static void sm501_draw_crt(SM501State *s)
     /* set up to draw hardware cursor */
     if (is_hwc_enabled(s, 1)) {
         /* choose cursor draw line function */
-        draw_hwc_line = draw_hwc_line_funcs[ds_depth_index];
+        draw_hwc_line = draw_hwc_line_funcs[dst_depth_index];
         hwc_src = get_hwc_address(s, 1);
         c_x = get_hwc_x(s, 1);
         c_y = get_hwc_y(s, 1);
diff --git a/hw/display/sm501_template.h b/hw/display/sm501_template.h
index fa0d6a9..a60abad 100644
--- a/hw/display/sm501_template.h
+++ b/hw/display/sm501_template.h
@@ -96,7 +96,7 @@ static void glue(draw_hwc_line_, PIXEL_NAME)(uint8_t *d, const uint8_t *s,
                  int width, const uint8_t *palette, int c_x, int c_y)
 {
     int i;
-    uint8_t bitset = 0;
+    uint8_t r, g, b, v, bitset = 0;
 
     /* get cursor position */
     assert(0 <= c_y && c_y < SM501_HWC_HEIGHT);
@@ -104,8 +104,6 @@ static void glue(draw_hwc_line_, PIXEL_NAME)(uint8_t *d, const uint8_t *s,
     d += c_x * BPP;
 
     for (i = 0; i < SM501_HWC_WIDTH && c_x + i < width; i++) {
-        uint8_t v;
-
         /* get pixel value */
         if (i % 4 == 0) {
             bitset = ldub_p(s);
@@ -117,9 +115,9 @@ static void glue(draw_hwc_line_, PIXEL_NAME)(uint8_t *d, const uint8_t *s,
         /* write pixel */
         if (v) {
             v--;
-            uint8_t r = palette[v * 3 + 0];
-            uint8_t g = palette[v * 3 + 1];
-            uint8_t b = palette[v * 3 + 2];
+            r = palette[v * 3 + 0];
+            g = palette[v * 3 + 1];
+            b = palette[v * 3 + 2];
             *(PIXEL_TYPE *)d = glue(rgb_to_pixel, PIXEL_NAME)(r, g, b);
         }
         d += BPP;
-- 
2.7.4


