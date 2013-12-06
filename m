Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vp0zV-0008Bq-Iw
	for mharc-qemu-trivial@gnu.org; Fri, 06 Dec 2013 14:23:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp0zP-0007yl-L7
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:23:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp0zO-0008HN-Bk
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:23:03 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41011)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vp0zB-0008Aj-9I; Fri, 06 Dec 2013 14:22:49 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D055C40DD4;
	Fri,  6 Dec 2013 23:22:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 951E45FE;
	Fri,  6 Dec 2013 23:15:44 +0400 (MSK)
Received: (nullmailer pid 19224 invoked by uid 1000);
	Fri, 06 Dec 2013 19:15:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Fri,  6 Dec 2013 23:15:35 +0400
Message-Id: <1386357341-19147-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386357341-19147-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1386357341-19147-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 08/14] misc: Replace 'struct QEMUTimer' by
	'QEMUTimer'
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
X-List-Received-Date: Fri, 06 Dec 2013 19:23:05 -0000

From: Stefan Weil <sw@weilnetz.de>

Most code already used QEMUTimer without the redundant 'struct' keyword.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/char/cadence_uart.c   |    4 ++--
 hw/ppc/ppc.c             |    6 +++---
 hw/ppc/ppc405_uc.c       |    2 +-
 hw/ppc/ppc_booke.c       |    4 ++--
 hw/timer/m48t59.c        |    4 ++--
 include/hw/char/serial.h |    4 ++--
 include/hw/ppc/ppc.h     |    4 ++--
 target-alpha/cpu-qom.h   |    2 +-
 target-mips/cpu.h        |    2 +-
 target-openrisc/cpu.h    |    2 +-
 target-sparc/cpu.h       |    2 +-
 ui/console.c             |    2 +-
 12 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index f8ccbdd..f18db53 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -120,8 +120,8 @@ typedef struct {
     uint64_t char_tx_time;
     CharDriverState *chr;
     qemu_irq irq;
-    struct QEMUTimer *fifo_trigger_handle;
-    struct QEMUTimer *tx_time_handle;
+    QEMUTimer *fifo_trigger_handle;
+    QEMUTimer *tx_time_handle;
 } UartState;
=20
 static void uart_update_status(UartState *s)
diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index bf2d3d4..114be64 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -684,7 +684,7 @@ static inline void cpu_ppc_hdecr_excp(PowerPCCPU *cpu=
)
 }
=20
 static void __cpu_ppc_store_decr(PowerPCCPU *cpu, uint64_t *nextp,
-                                 struct QEMUTimer *timer,
+                                 QEMUTimer *timer,
                                  void (*raise_excp)(PowerPCCPU *),
                                  uint32_t decr, uint32_t value,
                                  int is_excp)
@@ -856,9 +856,9 @@ typedef struct ppc40x_timer_t ppc40x_timer_t;
 struct ppc40x_timer_t {
     uint64_t pit_reload;  /* PIT auto-reload value        */
     uint64_t fit_next;    /* Tick for next FIT interrupt  */
-    struct QEMUTimer *fit_timer;
+    QEMUTimer *fit_timer;
     uint64_t wdt_next;    /* Tick for next WDT interrupt  */
-    struct QEMUTimer *wdt_timer;
+    QEMUTimer *wdt_timer;
=20
     /* 405 have the PIT, 440 have a DECR.  */
     unsigned int decr_excp;
diff --git a/hw/ppc/ppc405_uc.c b/hw/ppc/ppc405_uc.c
index 6d6a7f1..8109f92 100644
--- a/hw/ppc/ppc405_uc.c
+++ b/hw/ppc/ppc405_uc.c
@@ -1234,7 +1234,7 @@ struct ppc4xx_gpt_t {
     MemoryRegion iomem;
     int64_t tb_offset;
     uint32_t tb_freq;
-    struct QEMUTimer *timer;
+    QEMUTimer *timer;
     qemu_irq irqs[5];
     uint32_t oe;
     uint32_t ol;
diff --git a/hw/ppc/ppc_booke.c b/hw/ppc/ppc_booke.c
index b421620..d839960 100644
--- a/hw/ppc/ppc_booke.c
+++ b/hw/ppc/ppc_booke.c
@@ -64,10 +64,10 @@ typedef struct booke_timer_t booke_timer_t;
 struct booke_timer_t {
=20
     uint64_t fit_next;
-    struct QEMUTimer *fit_timer;
+    QEMUTimer *fit_timer;
=20
     uint64_t wdt_next;
-    struct QEMUTimer *wdt_timer;
+    QEMUTimer *wdt_timer;
=20
     uint32_t flags;
 };
diff --git a/hw/timer/m48t59.c b/hw/timer/m48t59.c
index d3d78ec..be0592b 100644
--- a/hw/timer/m48t59.c
+++ b/hw/timer/m48t59.c
@@ -61,8 +61,8 @@ struct M48t59State {
     time_t   stop_time;
     /* Alarm & watchdog */
     struct tm alarm;
-    struct QEMUTimer *alrm_timer;
-    struct QEMUTimer *wd_timer;
+    QEMUTimer *alrm_timer;
+    QEMUTimer *wd_timer;
     /* NVRAM storage */
     uint8_t *buffer;
     /* Model parameters */
diff --git a/include/hw/char/serial.h b/include/hw/char/serial.h
index 85f58ac..f431764 100644
--- a/include/hw/char/serial.h
+++ b/include/hw/char/serial.h
@@ -65,13 +65,13 @@ struct SerialState {
     /* Interrupt trigger level for recv_fifo */
     uint8_t recv_fifo_itl;
=20
-    struct QEMUTimer *fifo_timeout_timer;
+    QEMUTimer *fifo_timeout_timer;
     int timeout_ipending;           /* timeout interrupt pending state *=
/
=20
     uint64_t char_transmit_time;    /* time to transmit a char in ticks =
*/
     int poll_msl;
=20
-    struct QEMUTimer *modem_status_poll;
+    QEMUTimer *modem_status_poll;
     MemoryRegion io;
 };
=20
diff --git a/include/hw/ppc/ppc.h b/include/hw/ppc/ppc.h
index 132ab97..835418a 100644
--- a/include/hw/ppc/ppc.h
+++ b/include/hw/ppc/ppc.h
@@ -24,10 +24,10 @@ struct ppc_tb_t {
     /* Decrementer management */
     uint64_t decr_next;    /* Tick for next decr interrupt    */
     uint32_t decr_freq;    /* decrementer frequency           */
-    struct QEMUTimer *decr_timer;
+    QEMUTimer *decr_timer;
     /* Hypervisor decrementer management */
     uint64_t hdecr_next;    /* Tick for next hdecr interrupt  */
-    struct QEMUTimer *hdecr_timer;
+    QEMUTimer *hdecr_timer;
     uint64_t purr_load;
     uint64_t purr_start;
     void *opaque;
diff --git a/target-alpha/cpu-qom.h b/target-alpha/cpu-qom.h
index 2ebc9bc..198f1b1 100644
--- a/target-alpha/cpu-qom.h
+++ b/target-alpha/cpu-qom.h
@@ -62,7 +62,7 @@ typedef struct AlphaCPU {
     CPUAlphaState env;
=20
     /* This alarm doesn't exist in real hardware; we wish it did.  */
-    struct QEMUTimer *alarm_timer;
+    QEMUTimer *alarm_timer;
 } AlphaCPU;
=20
 static inline AlphaCPU *alpha_env_get_cpu(CPUAlphaState *env)
diff --git a/target-mips/cpu.h b/target-mips/cpu.h
index a29c82f..9caf447 100644
--- a/target-mips/cpu.h
+++ b/target-mips/cpu.h
@@ -476,7 +476,7 @@ struct CPUMIPSState {
=20
     const mips_def_t *cpu_model;
     void *irq[8];
-    struct QEMUTimer *timer; /* Internal timer */
+    QEMUTimer *timer; /* Internal timer */
 };
=20
 #include "cpu-qom.h"
diff --git a/target-openrisc/cpu.h b/target-openrisc/cpu.h
index 0f9efdf..51d6afd 100644
--- a/target-openrisc/cpu.h
+++ b/target-openrisc/cpu.h
@@ -307,7 +307,7 @@ typedef struct CPUOpenRISCState {
 #ifndef CONFIG_USER_ONLY
     CPUOpenRISCTLBContext * tlb;
=20
-    struct QEMUTimer *timer;
+    QEMUTimer *timer;
     uint32_t ttmr;          /* Timer tick mode register */
     uint32_t ttcr;          /* Timer tick count register */
=20
diff --git a/target-sparc/cpu.h b/target-sparc/cpu.h
index 41194ec..c519063 100644
--- a/target-sparc/cpu.h
+++ b/target-sparc/cpu.h
@@ -370,7 +370,7 @@ struct CPUTimer
     uint32_t    disabled;
     uint64_t    disabled_mask;
     int64_t     clock_offset;
-    struct QEMUTimer  *qtimer;
+    QEMUTimer  *qtimer;
 };
=20
 typedef struct CPUTimer CPUTimer;
diff --git a/ui/console.c b/ui/console.c
index 586fc6d..502e160 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -161,7 +161,7 @@ struct QemuConsole {
 };
=20
 struct DisplayState {
-    struct QEMUTimer *gui_timer;
+    QEMUTimer *gui_timer;
     uint64_t last_update;
     uint64_t update_interval;
     bool refreshing;
--=20
1.7.10.4


