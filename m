Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VwfZV-0002rj-LP
	for mharc-qemu-trivial@gnu.org; Fri, 27 Dec 2013 17:07:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60241)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VwfZQ-0002g3-Ea
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:07:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VwfZM-0003xI-EV
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:07:52 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43256)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VwfZA-0003uW-NI; Fri, 27 Dec 2013 17:07:36 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 98139438A3;
	Sat, 28 Dec 2013 02:07:36 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 425C85FE;
	Sat, 28 Dec 2013 02:07:35 +0400 (MSK)
Received: (nullmailer pid 10335 invoked by uid 1000);
	Fri, 27 Dec 2013 22:07:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sat, 28 Dec 2013 02:07:18 +0400
Message-Id: <1388182050-10270-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Evgeny Voevodin <e.voevodin@samsung.com>, qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Dmitry Solodkiy <d.solodkiy@samsung.com>,
	Maksim Kozlov <m.kozlov@samsung.com>
Subject: [Qemu-trivial] [PULL 05/17] exynos4210: Use macro ARRAY_SIZE where
	possible
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
X-List-Received-Date: Fri, 27 Dec 2013 22:07:56 -0000

From: Stefan Weil <sw@weilnetz.de>

This improves readability and simplifies the code.

Cc: Dmitry Solodkiy <d.solodkiy@samsung.com>
Cc: Evgeny Voevodin <e.voevodin@samsung.com>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>
Cc: Maksim Kozlov <m.kozlov@samsung.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


