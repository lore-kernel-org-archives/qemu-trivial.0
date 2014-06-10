Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuOuF-0007Qa-0z
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:28:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36490)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOu9-0007Dr-1c
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:28:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOu4-0007ax-NV
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:28:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38437)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuOtt-0007XK-Nf; Tue, 10 Jun 2014 12:27:53 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 13BF3412C5;
	Tue, 10 Jun 2014 20:27:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 36B916D9;
	Tue, 10 Jun 2014 20:08:51 +0400 (MSK)
Received: (nullmailer pid 13319 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:32 +0400
Message-Id: <1402416523-13212-15-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 14/25] hw/misc/milkymist-softusb: Remove
	unused softusb_{read, write}_pmem()
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
X-List-Received-Date: Tue, 10 Jun 2014 16:28:13 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The functions softusb_read_pmem() and softusb_write_pmem() are unused;
remove them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/input/milkymist-softusb.c |   25 -------------------------
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
1.7.10.4


