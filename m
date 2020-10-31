Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kYhgS-0006sN-2x
	for mharc-qemu-trivial@gnu.org; Fri, 30 Oct 2020 23:36:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kYhgO-0006rR-Ho; Fri, 30 Oct 2020 23:36:00 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kYhgL-00046d-Lm; Fri, 30 Oct 2020 23:36:00 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CNPw50qLpzhcVL;
 Sat, 31 Oct 2020 11:35:49 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Sat, 31 Oct 2020 11:35:38 +0800
Message-ID: <5F9CDB8A.9000001@huawei.com>
Date: Sat, 31 Oct 2020 11:35:38 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
CC: qemu-arm <qemu-arm@nongnu.org>, QEMU <qemu-devel@nongnu.org>, QEMU Trivial
 <qemu-trivial@nongnu.org>, <zhengchuan@huawei.com>,
 <zhang.zhanghailiang@huawei.com>
Subject: [PATCH V2] hw/display/omap_lcdc: Fix potential NULL pointer
 dereference
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 23:35:49
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 31 Oct 2020 03:36:01 -0000

In omap_lcd_interrupts(), the pointer omap_lcd is dereferinced before
being check if it is valid, which may lead to NULL pointer dereference.
So move the assignment to surface after checking that the omap_lcd is valid
and move surface_bits_per_pixel(surface) to after the surface assignment.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: AlexChen <alex.chen@huawei.com>
---
 hw/display/omap_lcdc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/display/omap_lcdc.c b/hw/display/omap_lcdc.c
index fa4a381db6..58e659c94f 100644
--- a/hw/display/omap_lcdc.c
+++ b/hw/display/omap_lcdc.c
@@ -78,14 +78,18 @@ static void omap_lcd_interrupts(struct omap_lcd_panel_s *s)
 static void omap_update_display(void *opaque)
 {
     struct omap_lcd_panel_s *omap_lcd = (struct omap_lcd_panel_s *) opaque;
-    DisplaySurface *surface = qemu_console_surface(omap_lcd->con);
+    DisplaySurface *surface;
     draw_line_func draw_line;
     int size, height, first, last;
     int width, linesize, step, bpp, frame_offset;
     hwaddr frame_base;

-    if (!omap_lcd || omap_lcd->plm == 1 || !omap_lcd->enable ||
-        !surface_bits_per_pixel(surface)) {
+    if (!omap_lcd || omap_lcd->plm == 1 || !omap_lcd->enable) {
+        return;
+    }
+
+    surface = qemu_console_surface(omap_lcd->con);
+    if (!surface_bits_per_pixel(surface)) {
         return;
     }

-- 
2.19.1

