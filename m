Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQLXK-0007se-Sw
	for mharc-qemu-trivial@gnu.org; Sat, 16 Dec 2017 18:06:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1eQLXG-0007oP-Fo
	for qemu-trivial@nongnu.org; Sat, 16 Dec 2017 18:06:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1eQLXF-0006fI-Lr
	for qemu-trivial@nongnu.org; Sat, 16 Dec 2017 18:06:26 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:42644)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1eQLXA-0006W4-8j; Sat, 16 Dec 2017 18:06:20 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id E00617456B3;
	Sun, 17 Dec 2017 00:06:18 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 591A67456B8; Sun, 17 Dec 2017 00:06:18 +0100 (CET)
Message-Id: <4a19707d5b6554dda851b5da07e0276634b50900.1513465066.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1513465066.git.balaton@eik.bme.hu>
References: <cover.1513465066.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Sat, 16 Dec 2017 23:57:46 +0100
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: [Qemu-trivial] [PATCH 1/2] sm501: Add panel hardware cursor
 registers also to read function
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
X-List-Received-Date: Sat, 16 Dec 2017 23:06:27 -0000

These were forgotten when adding panel layer support.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/sm501.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 7f18224..b9b6111 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -956,6 +956,19 @@ static uint64_t sm501_disp_ctrl_read(void *opaque, hwaddr addr,
         ret = s->dc_panel_v_sync;
         break;
 
+    case SM501_DC_PANEL_HWC_ADDR:
+        ret = s->dc_panel_hwc_addr;
+        break;
+    case SM501_DC_PANEL_HWC_LOC:
+        ret = s->dc_panel_hwc_location;
+        break;
+    case SM501_DC_PANEL_HWC_COLOR_1_2:
+        ret = s->dc_panel_hwc_color_1_2;
+        break;
+    case SM501_DC_PANEL_HWC_COLOR_3:
+        ret = s->dc_panel_hwc_color_3;
+        break;
+
     case SM501_DC_VIDEO_CONTROL:
         ret = s->dc_video_control;
         break;
-- 
2.7.6


