Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d1aWQ-0001k9-Vl
	for mharc-qemu-trivial@gnu.org; Fri, 21 Apr 2017 11:30:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50062)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1d1aWI-0001Ww-Ak
	for qemu-trivial@nongnu.org; Fri, 21 Apr 2017 11:30:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1d1aWH-0007vD-9Z
	for qemu-trivial@nongnu.org; Fri, 21 Apr 2017 11:30:50 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:33831)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1d1aWE-0007t9-O7; Fri, 21 Apr 2017 11:30:46 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 862D77456BA;
	Fri, 21 Apr 2017 17:30:45 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 22F617456BB; Fri, 21 Apr 2017 17:30:38 +0200 (CEST)
Message-Id: <d1eaf3b19c40aeb32a343a211f2b56664a67f948.1492787889.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1492787889.git.balaton@eik.bme.hu>
References: <cover.1492787889.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Fri, 21 Apr 2017 17:18:09 +0200
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: [Qemu-trivial] [PATCH v7 03/13] sm501: Add missing arbitration
 control register
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
X-List-Received-Date: Fri, 21 Apr 2017 15:30:55 -0000

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
---
 hw/display/sm501.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 6b72964..6e74200 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -474,6 +474,7 @@ typedef struct SM501State {
     uint32_t gpio_31_0_control;
     uint32_t gpio_63_32_control;
     uint32_t dram_control;
+    uint32_t arbitration_control;
     uint32_t irq_mask;
     uint32_t misc_timing;
     uint32_t power_mode_control;
@@ -757,6 +758,9 @@ static uint64_t sm501_system_config_read(void *opaque, hwaddr addr,
     case SM501_DRAM_CONTROL:
         ret = (s->dram_control & 0x07F107C0) | s->local_mem_size_index << 13;
         break;
+    case SM501_ARBTRTN_CONTROL:
+        ret = s->arbitration_control;
+        break;
     case SM501_IRQ_MASK:
         ret = s->irq_mask;
         break;
@@ -809,6 +813,9 @@ static void sm501_system_config_write(void *opaque, hwaddr addr,
         /* TODO : check validity of size change */
         s->dram_control |=  value & 0x7FFFFFC3;
         break;
+    case SM501_ARBTRTN_CONTROL:
+        s->arbitration_control =  value & 0x37777777;
+        break;
     case SM501_IRQ_MASK:
         s->irq_mask = value;
         break;
@@ -1422,6 +1429,7 @@ void sm501_init(MemoryRegion *address_space_mem, uint32_t base,
      *  BUS = 0 : Hitachi SH3/SH4
      */
     s->misc_control = SM501_MISC_DAC_POWER;
+    s->arbitration_control = 0x05146732;
     s->dc_panel_control = 0x00010000; /* FIFO level 3 */
     s->dc_crt_control = 0x00010000;
 
-- 
2.7.4


