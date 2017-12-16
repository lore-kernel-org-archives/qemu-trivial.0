Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQLXH-0007pY-OR
	for mharc-qemu-trivial@gnu.org; Sat, 16 Dec 2017 18:06:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1eQLXF-0007oM-Q1
	for qemu-trivial@nongnu.org; Sat, 16 Dec 2017 18:06:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1eQLXE-0006dw-Rx
	for qemu-trivial@nongnu.org; Sat, 16 Dec 2017 18:06:25 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:42645)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1eQLXA-0006W1-Jm; Sat, 16 Dec 2017 18:06:20 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id E999974569D;
	Sun, 17 Dec 2017 00:06:18 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 5CAD37456B4; Sun, 17 Dec 2017 00:06:18 +0100 (CET)
Message-Id: <e62d7163d0026dacd7e469a81508ee90d51d6dfa.1513465066.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1513465066.git.balaton@eik.bme.hu>
References: <cover.1513465066.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Sat, 16 Dec 2017 23:57:46 +0100
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: [Qemu-trivial] [PATCH 2/2] sm501: Add some more unimplemented
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
X-List-Received-Date: Sat, 16 Dec 2017 23:06:26 -0000

These are not really implemented (just return zero or default values)
but add these so guests accessing them can run.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/sm501.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index b9b6111..4f7dc59b2 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -795,6 +795,8 @@ static uint64_t sm501_system_config_read(void *opaque, hwaddr addr,
     case SM501_ARBTRTN_CONTROL:
         ret = s->arbitration_control;
         break;
+    case SM501_COMMAND_LIST_STATUS:
+        ret = 0x00180002; /* FIFOs are empty, everything idle */
     case SM501_IRQ_MASK:
         ret = s->irq_mask;
         break;
@@ -812,6 +814,9 @@ static uint64_t sm501_system_config_read(void *opaque, hwaddr addr,
     case SM501_POWER_MODE_CONTROL:
         ret = s->power_mode_control;
         break;
+    case SM501_ENDIAN_CONTROL:
+        ret = 0; /* Only default little endian mode is supported */
+        break;
 
     default:
         printf("sm501 system config : not implemented register read."
@@ -865,6 +870,12 @@ static void sm501_system_config_write(void *opaque, hwaddr addr,
     case SM501_POWER_MODE_CONTROL:
         s->power_mode_control = value & 0x00000003;
         break;
+    case SM501_ENDIAN_CONTROL:
+        if (value & 0x00000001) {
+            printf("sm501 system config : big endian mode not implemented.\n");
+            abort();
+        }
+        break;
 
     default:
         printf("sm501 system config : not implemented register write."
@@ -924,6 +935,9 @@ static uint64_t sm501_disp_ctrl_read(void *opaque, hwaddr addr,
     case SM501_DC_PANEL_PANNING_CONTROL:
         ret = s->dc_panel_panning_control;
         break;
+    case SM501_DC_PANEL_COLOR_KEY:
+        /* Not implemented yet */
+        break;
     case SM501_DC_PANEL_FB_ADDR:
         ret = s->dc_panel_fb_addr;
         break;
@@ -1035,6 +1049,9 @@ static void sm501_disp_ctrl_write(void *opaque, hwaddr addr,
     case SM501_DC_PANEL_PANNING_CONTROL:
         s->dc_panel_panning_control = value & 0xFF3FFF3F;
         break;
+    case SM501_DC_PANEL_COLOR_KEY:
+        /* Not implemented yet */
+        break;
     case SM501_DC_PANEL_FB_ADDR:
         s->dc_panel_fb_addr = value & 0x8FFFFFF0;
         break;
-- 
2.7.6


