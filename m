Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1chmko-00027n-Dy
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2017 19:31:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1chmka-0001MT-U9
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2017 19:31:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1chmka-0005yh-1w
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2017 19:31:44 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:32649)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1chmkW-0005vI-C9; Sat, 25 Feb 2017 19:31:40 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 404CC745966;
	Sun, 26 Feb 2017 01:31:31 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 8E76C745969; Sun, 26 Feb 2017 01:31:29 +0100 (CET)
Message-Id: <db1b69270ca4d2335e6fb2455ee56552373757fc.1488068248.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1488068248.git.balaton@eik.bme.hu>
References: <cover.1488068248.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Sat, 25 Feb 2017 22:47:26 +0100
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: [Qemu-trivial] [PATCH v2 12/14] sm501: Implement reading 2D engine
 registers
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

Clients normally only write to these registers, nothing is known to
ever read them but they are documented as read/write so allow clients
to also read the values.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/sm501.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index af5e4db..32223f6 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1149,9 +1149,66 @@ static uint64_t sm501_2d_engine_read(void *opaque, hwaddr addr,
     SM501_DPRINTF("sm501 2d engine regs : read addr=%x\n", (int)addr);
 
     switch (addr) {
+    case SM501_2D_SOURCE:
+        ret = s->twoD_source;
+        break;
+    case SM501_2D_DESTINATION:
+        ret = s->twoD_destination;
+        break;
+    case SM501_2D_DIMENSION:
+        ret = s->twoD_dimension;
+        break;
+    case SM501_2D_CONTROL:
+        ret = s->twoD_control;
+        break;
+    case SM501_2D_PITCH:
+        ret = s->twoD_pitch;
+        break;
+    case SM501_2D_FOREGROUND:
+        ret = s->twoD_foreground;
+        break;
+    case SM501_2D_BACKGROUND:
+        ret = s->twoD_background;
+        break;
+    case SM501_2D_STRETCH:
+        ret = s->twoD_stretch;
+        break;
+    case SM501_2D_COLOR_COMPARE:
+        ret = s->twoD_color_compare;
+        break;
+    case SM501_2D_COLOR_COMPARE_MASK:
+        ret = s->twoD_color_compare_mask;
+        break;
+    case SM501_2D_MASK:
+        ret = s->twoD_mask;
+        break;
+    case SM501_2D_CLIP_TL:
+        ret = s->twoD_clip_tl;
+        break;
+    case SM501_2D_CLIP_BR:
+        ret = s->twoD_clip_br;
+        break;
+    case SM501_2D_MONO_PATTERN_LOW:
+        ret = s->twoD_mono_pattern_low;
+        break;
+    case SM501_2D_MONO_PATTERN_HIGH:
+        ret = s->twoD_mono_pattern_high;
+        break;
+    case SM501_2D_WINDOW_WIDTH:
+        ret = s->twoD_window_width;
+        break;
     case SM501_2D_SOURCE_BASE:
         ret = s->twoD_source_base;
         break;
+    case SM501_2D_DESTINATION_BASE:
+        ret = s->twoD_destination_base;
+        break;
+    case SM501_2D_ALPHA:
+        ret = s->twoD_alpha;
+        break;
+    case SM501_2D_WRAP:
+        ret = s->twoD_wrap;
+        break;
     case SM501_2D_STATUS:
         ret = 0; /* Should return interrupt status */
         break;
-- 
2.7.4


