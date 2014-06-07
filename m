Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WtK3g-0000LX-5L
	for mharc-qemu-trivial@gnu.org; Sat, 07 Jun 2014 13:05:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WtK3d-0000Gw-QO
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 13:05:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WtK3d-00069d-0U
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 13:05:29 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:48546)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WtK3b-00069E-0k; Sat, 07 Jun 2014 13:05:27 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WtK3a-0003g1-II; Sat, 07 Jun 2014 18:05:26 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat,  7 Jun 2014 18:05:26 +0100
Message-Id: <1402160726-14108-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] hw/misc/milkymist-softusb: Remove unused
	softusb_{read, write}_pmem()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 07 Jun 2014 17:05:30 -0000

The functions softusb_read_pmem() and softusb_write_pmem() are unused;
remove them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/milkymist-softusb.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/hw/input/milkymist-softusb.c b/hw/input/milkymist-softusb.c
index 53ba714..1b4b8d4 100644
--- a/hw/input/milkymist-softusb.c
+++ b/hw/input/milkymist-softusb.c
@@ -156,31 +156,6 @@ static inline void softusb_write_dmem(MilkymistSoftUsbState *s,
     memcpy(s->dmem_ptr + offset, buf, len);
 }
 
-static inline void softusb_read_pmem(MilkymistSoftUsbState *s,
-        uint32_t offset, uint8_t *buf, uint32_t len)
-{
-    if (offset + len >= s->pmem_size) {
-        error_report("milkymist_softusb: read pmem out of bounds "
-                "at offset 0x%x, len %d", offset, len);
-        memset(buf, 0, len);
-        return;
-    }
-
-    memcpy(buf, s->pmem_ptr + offset, len);
-}
-
-static inline void softusb_write_pmem(MilkymistSoftUsbState *s,
-        uint32_t offset, uint8_t *buf, uint32_t len)
-{
-    if (offset + len >= s->pmem_size) {
-        error_report("milkymist_softusb: write pmem out of bounds "
-                "at offset 0x%x, len %d", offset, len);
-        return;
-    }
-
-    memcpy(s->pmem_ptr + offset, buf, len);
-}
-
 static void softusb_mouse_changed(MilkymistSoftUsbState *s)
 {
     uint8_t m;
-- 
1.8.5.4


