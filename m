Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VpIFi-0000bT-S1
	for mharc-qemu-trivial@gnu.org; Sat, 07 Dec 2013 08:49:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpIFc-0000Ju-MA
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 08:49:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpIFY-0001U5-5k
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 08:48:56 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:59173
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VpIFO-0001S5-Ta; Sat, 07 Dec 2013 08:48:43 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 8CA56180284; Sat,  7 Dec 2013 14:48:40 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sat,  7 Dec 2013 14:48:06 +0100
Message-Id: <1386424088-23196-4-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386424088-23196-1-git-send-email-sw@weilnetz.de>
References: <1386424088-23196-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Evgeny Voevodin <e.voevodin@samsung.com>, qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Dmitry Solodkiy <d.solodkiy@samsung.com>,
	Maksim Kozlov <m.kozlov@samsung.com>
Subject: [Qemu-trivial] [PATCH v2 3/5] exynos4210: Use macro ARRAY_SIZE
	where possible
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
X-List-Received-Date: Sat, 07 Dec 2013 13:49:01 -0000

This improves readability and simplifies the code.

Cc: Dmitry Solodkiy <d.solodkiy@samsung.com>
Cc: Evgeny Voevodin <e.voevodin@samsung.com>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
Cc: Maksim Kozlov <m.kozlov@samsung.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/char/exynos4210_uart.c |    6 ++----
 hw/misc/exynos4210_pmu.c  |    3 +--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index eef23a0..19b59cc 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -192,10 +192,9 @@ typedef struct Exynos4210UartState {
 static const char *exynos4210_uart_regname(hwaddr  offset)
 {
 
-    int regs_number = sizeof(exynos4210_uart_regs) / sizeof(Exynos4210UartReg);
     int i;
 
-    for (i = 0; i < regs_number; i++) {
+    for (i = 0; i < ARRAY_SIZE(exynos4210_uart_regs); i++) {
         if (offset == exynos4210_uart_regs[i].offset) {
             return exynos4210_uart_regs[i].name;
         }
@@ -544,10 +543,9 @@ static void exynos4210_uart_event(void *opaque, int event)
 static void exynos4210_uart_reset(DeviceState *dev)
 {
     Exynos4210UartState *s = EXYNOS4210_UART(dev);
-    int regs_number = sizeof(exynos4210_uart_regs)/sizeof(Exynos4210UartReg);
     int i;
 
-    for (i = 0; i < regs_number; i++) {
+    for (i = 0; i < ARRAY_SIZE(exynos4210_uart_regs); i++) {
         s->reg[I_(exynos4210_uart_regs[i].offset)] =
                 exynos4210_uart_regs[i].reset_value;
     }
diff --git a/hw/misc/exynos4210_pmu.c b/hw/misc/exynos4210_pmu.c
index cbf0795..5ec14d1 100644
--- a/hw/misc/exynos4210_pmu.c
+++ b/hw/misc/exynos4210_pmu.c
@@ -383,8 +383,7 @@ static const Exynos4210PmuReg exynos4210_pmu_regs[] = {
     {"GPS_ALIVE_OPTION", GPS_ALIVE_OPTION, 0x00000001},
 };
 
-#define PMU_NUM_OF_REGISTERS     \
-    (sizeof(exynos4210_pmu_regs) / sizeof(Exynos4210PmuReg))
+#define PMU_NUM_OF_REGISTERS ARRAY_SIZE(exynos4210_pmu_regs)
 
 #define TYPE_EXYNOS4210_PMU "exynos4210.pmu"
 #define EXYNOS4210_PMU(obj) \
-- 
1.7.10.4


