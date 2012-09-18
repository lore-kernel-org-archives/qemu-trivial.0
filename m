Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TDylJ-00045p-DS
	for mharc-qemu-trivial@gnu.org; Tue, 18 Sep 2012 10:26:53 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TDylD-00045T-3X
	for qemu-trivial@nongnu.org; Tue, 18 Sep 2012 10:26:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TDyl5-0003DB-EQ
	for qemu-trivial@nongnu.org; Tue, 18 Sep 2012 10:26:47 -0400
Received: from 38.0.169.217.in-addr.arpa ([217.169.0.38]:52074
	helo=mnementh.archaic.org.uk) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TDyl5-0003D5-7Q
	for qemu-trivial@nongnu.org; Tue, 18 Sep 2012 10:26:39 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1TDyFC-0000kY-Aq; Tue, 18 Sep 2012 14:53:42 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 18 Sep 2012 14:53:42 +0100
Message-Id: <1347976422-2859-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 217.169.0.38
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] hw/pflash_cfi0[12]: Use host-utils.h ctz32()
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
X-List-Received-Date: Tue, 18 Sep 2012 14:26:52 -0000

Drop the private reimplementation of ctz32() from pflash_cfi0[12]
in favour of using the standard version from host-utils.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/pflash_cfi01.c |   37 +------------------------------------
 hw/pflash_cfi02.c |   37 +------------------------------------
 2 files changed, 2 insertions(+), 72 deletions(-)

diff --git a/hw/pflash_cfi01.c b/hw/pflash_cfi01.c
index d1c7423..00f1cdd 100644
--- a/hw/pflash_cfi01.c
+++ b/hw/pflash_cfi01.c
@@ -41,6 +41,7 @@
 #include "block.h"
 #include "qemu-timer.h"
 #include "exec-memory.h"
+#include "host-utils.h"
 
 #define PFLASH_BUG(fmt, ...) \
 do { \
@@ -543,42 +544,6 @@ static const MemoryRegionOps pflash_cfi01_ops_le = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-/* Count trailing zeroes of a 32 bits quantity */
-static int ctz32 (uint32_t n)
-{
-    int ret;
-
-    ret = 0;
-    if (!(n & 0xFFFF)) {
-        ret += 16;
-        n = n >> 16;
-    }
-    if (!(n & 0xFF)) {
-        ret += 8;
-        n = n >> 8;
-    }
-    if (!(n & 0xF)) {
-        ret += 4;
-        n = n >> 4;
-    }
-    if (!(n & 0x3)) {
-        ret += 2;
-        n = n >> 2;
-    }
-    if (!(n & 0x1)) {
-        ret++;
-#if 0 /* This is not necessary as n is never 0 */
-        n = n >> 1;
-#endif
-    }
-#if 0 /* This is not necessary as n is never 0 */
-    if (!n)
-        ret++;
-#endif
-
-    return ret;
-}
-
 pflash_t *pflash_cfi01_register(target_phys_addr_t base,
                                 DeviceState *qdev, const char *name,
                                 target_phys_addr_t size,
diff --git a/hw/pflash_cfi02.c b/hw/pflash_cfi02.c
index 3e2002e..8cb1549 100644
--- a/hw/pflash_cfi02.c
+++ b/hw/pflash_cfi02.c
@@ -40,6 +40,7 @@
 #include "qemu-timer.h"
 #include "block.h"
 #include "exec-memory.h"
+#include "host-utils.h"
 
 //#define PFLASH_DEBUG
 #ifdef PFLASH_DEBUG
@@ -575,42 +576,6 @@ static const MemoryRegionOps pflash_cfi02_ops_le = {
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-/* Count trailing zeroes of a 32 bits quantity */
-static int ctz32 (uint32_t n)
-{
-    int ret;
-
-    ret = 0;
-    if (!(n & 0xFFFF)) {
-        ret += 16;
-        n = n >> 16;
-    }
-    if (!(n & 0xFF)) {
-        ret += 8;
-        n = n >> 8;
-    }
-    if (!(n & 0xF)) {
-        ret += 4;
-        n = n >> 4;
-    }
-    if (!(n & 0x3)) {
-        ret += 2;
-        n = n >> 2;
-    }
-    if (!(n & 0x1)) {
-        ret++;
-#if 0 /* This is not necessary as n is never 0 */
-        n = n >> 1;
-#endif
-    }
-#if 0 /* This is not necessary as n is never 0 */
-    if (!n)
-        ret++;
-#endif
-
-    return ret;
-}
-
 pflash_t *pflash_cfi02_register(target_phys_addr_t base,
                                 DeviceState *qdev, const char *name,
                                 target_phys_addr_t size,
-- 
1.7.9.5


