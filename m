Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cfUu3-0000Au-Mh
	for mharc-qemu-trivial@gnu.org; Sun, 19 Feb 2017 12:04:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34567)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cfUtz-00005t-PV
	for qemu-trivial@nongnu.org; Sun, 19 Feb 2017 12:04:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cfUtw-0002mt-L3
	for qemu-trivial@nongnu.org; Sun, 19 Feb 2017 12:03:59 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:65181)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1cfUtw-0002el-DG
	for qemu-trivial@nongnu.org; Sun, 19 Feb 2017 12:03:56 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 6DEE2745955;
	Sun, 19 Feb 2017 18:03:39 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 2845E74595E; Sun, 19 Feb 2017 18:03:39 +0100 (CET)
Message-Id: <f4e117af10b1a6c1e8f29a921b46bc6df1ca36c8.1487522123.git.balaton@eik.bme.hu>
In-Reply-To: <cover.1487522123.git.balaton@eik.bme.hu>
References: <cover.1487522123.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Sun, 19 Feb 2017 17:35:23 +0100
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: [Qemu-trivial] [PATCH 05/10] sm501: Add missing arbitration control
 register
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
X-List-Received-Date: Sun, 19 Feb 2017 17:04:00 -0000

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/display/sm501.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index e966896..9091bb5 100644
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
-- 
2.7.4


