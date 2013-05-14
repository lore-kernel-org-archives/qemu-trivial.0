Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UcDFy-0006Sd-Lf
	for mharc-qemu-trivial@gnu.org; Tue, 14 May 2013 07:18:58 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UcDFu-0006OU-Jq
	for qemu-trivial@nongnu.org; Tue, 14 May 2013 07:18:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UcDFp-0000BG-0U
	for qemu-trivial@nongnu.org; Tue, 14 May 2013 07:18:54 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37341)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UcDFj-0000Ao-QA; Tue, 14 May 2013 07:18:44 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 516DF40967;
	Tue, 14 May 2013 15:18:41 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 26B7E47E; Tue, 14 May 2013 15:18:40 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 14 May 2013 15:18:32 +0400
Message-Id: <1368530312-16080-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH (trivial)] remove some double-includes
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
X-List-Received-Date: Tue, 14 May 2013 11:18:57 -0000

Some source files #include the same header more than
once for no good reason.  Remove second #includes in
such cases.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
I used more lines in context diff below, to show that these
#includes are actually repeated.  In some cases, however,
list of #includes is large and even this amount of context
does not show another include.

 audio/audio_win_int.c      |    1 -
 hw/arm/highbank.c          |    1 -
 hw/audio/marvell_88w8618.c |    1 -
 hw/mips/mips_malta.c       |    1 -
 hw/misc/lm32_sys.c         |    1 -
 hw/ppc/spapr.c             |    2 --
 hw/ppc/spapr_hcall.c       |    1 -
 hw/timer/exynos4210_rtc.c  |    1 -
 include/hw/i386/pc.h       |    1 -
 include/qapi/qmp/qlist.h   |    1 -
 include/qemu/config-file.h |    1 -
 monitor.c                  |    1 -
 page_cache.c               |    1 -
 slirp/misc.c               |    2 --
 target-ppc/kvm.c           |    2 --
 tests/tcg/linux-test.c     |    1 -
 translate-all.c            |    1 -
 17 files changed, 20 deletions(-)

diff --git a/audio/audio_win_int.c b/audio/audio_win_int.c
index 5869052..e132405 100644
--- a/audio/audio_win_int.c
+++ b/audio/audio_win_int.c
@@ -1,14 +1,13 @@
 /* public domain */
 
 #include "qemu-common.h"
-#include "audio.h"
 
 #define AUDIO_CAP "win-int"
 #include <windows.h>
 #include <mmsystem.h>
 
 #include "audio.h"
 #include "audio_int.h"
 #include "audio_win_int.h"
 
 int waveformat_from_audio_settings (WAVEFORMATEX *wfx,
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 0fd9465..4405dbd 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -17,21 +17,20 @@
  *
  */
 
 #include "hw/sysbus.h"
 #include "hw/arm/arm.h"
 #include "hw/devices.h"
 #include "hw/loader.h"
 #include "net/net.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
-#include "hw/sysbus.h"
 #include "sysemu/blockdev.h"
 #include "exec/address-spaces.h"
 
 #define SMP_BOOT_ADDR 0x100
 #define SMP_BOOT_REG  0x40
 #define GIC_BASE_ADDR 0xfff10000
 
 #define NIRQ_GIC      160
 
 /* Board init.  */
diff --git a/hw/audio/marvell_88w8618.c b/hw/audio/marvell_88w8618.c
index de06dfd..c5d88a7 100644
--- a/hw/audio/marvell_88w8618.c
+++ b/hw/audio/marvell_88w8618.c
@@ -5,21 +5,20 @@
  * Copyright (c) 2008 Jan Kiszka
  *
  * This code is licensed under the GNU GPL v2.
  *
  * Contributions after 2012-01-13 are licensed under the terms of the
  * GNU GPL, version 2 or (at your option) any later version.
  */
 #include "hw/sysbus.h"
 #include "hw/hw.h"
 #include "hw/i2c/i2c.h"
-#include "hw/sysbus.h"
 #include "audio/audio.h"
 
 #define MP_AUDIO_SIZE           0x00001000
 
 /* Audio register offsets */
 #define MP_AUDIO_PLAYBACK_MODE  0x00
 #define MP_AUDIO_CLOCK_DIV      0x18
 #define MP_AUDIO_IRQ_STATUS     0x20
 #define MP_AUDIO_IRQ_ENABLE     0x24
 #define MP_AUDIO_TX_START_LO    0x28
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 9d521cc..5033d51 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -30,21 +30,20 @@
 #include "hw/boards.h"
 #include "hw/i2c/smbus.h"
 #include "block/block.h"
 #include "hw/block/flash.h"
 #include "hw/mips/mips.h"
 #include "hw/mips/cpudevs.h"
 #include "hw/pci/pci.h"
 #include "sysemu/char.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/arch_init.h"
-#include "hw/boards.h"
 #include "qemu/log.h"
 #include "hw/mips/bios.h"
 #include "hw/ide.h"
 #include "hw/loader.h"
 #include "elf.h"
 #include "hw/timer/mc146818rtc.h"
 #include "hw/timer/i8254.h"
 #include "sysemu/blockdev.h"
 #include "exec/address-spaces.h"
 #include "hw/sysbus.h"             /* SysBusDevice */
diff --git a/hw/misc/lm32_sys.c b/hw/misc/lm32_sys.c
index 33a3b80..aeaf2b7 100644
--- a/hw/misc/lm32_sys.c
+++ b/hw/misc/lm32_sys.c
@@ -27,21 +27,20 @@
  * (R_TESTNAME) and then write a zero to the pass/fail register (R_PASSFAIL) if
  * the test is passed or any non-zero value to it if the test is failed.
  */
 
 #include "hw/hw.h"
 #include "hw/sysbus.h"
 #include "trace.h"
 #include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "sysemu/sysemu.h"
-#include "qemu/log.h"
 
 enum {
     R_CTRL = 0,
     R_PASSFAIL,
     R_TESTNAME,
     R_MAX
 };
 
 #define MAX_TESTNAME_LEN 16
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index c96ac81..218ea23 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -36,22 +36,20 @@
 #include "hw/boards.h"
 #include "hw/ppc/ppc.h"
 #include "hw/loader.h"
 
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_vio.h"
 #include "hw/pci-host/spapr.h"
 #include "hw/ppc/xics.h"
 #include "hw/pci/msi.h"
 
-#include "sysemu/kvm.h"
-#include "kvm_ppc.h"
 #include "hw/pci/pci.h"
 
 #include "exec/address-spaces.h"
 #include "hw/usb.h"
 #include "qemu/config-file.h"
 
 #include <libfdt.h>
 
 /* SLOF memory layout:
  *
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index f518aee..8f0b7e8 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1,13 +1,12 @@
 #include "sysemu/sysemu.h"
 #include "cpu.h"
-#include "sysemu/sysemu.h"
 #include "helper_regs.h"
 #include "hw/ppc/spapr.h"
 #include "mmu-hash64.h"
 
 static target_ulong compute_tlbie_rb(target_ulong v, target_ulong r,
                                      target_ulong pte_index)
 {
     target_ulong rb, va_low;
 
     rb = (v & ~0x7fULL) << 16; /* AVA field */
diff --git a/hw/timer/exynos4210_rtc.c b/hw/timer/exynos4210_rtc.c
index bceee44..3ac77f9 100644
--- a/hw/timer/exynos4210_rtc.c
+++ b/hw/timer/exynos4210_rtc.c
@@ -24,21 +24,20 @@
  *  CLKSEL Bit[1] not used
  *  CLKOUTEN Bit[9] not used
  */
 
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
 #include "qemu-common.h"
 #include "hw/ptimer.h"
 
 #include "hw/hw.h"
-#include "qemu/timer.h"
 #include "sysemu/sysemu.h"
 
 #include "hw/arm/exynos4210.h"
 
 #define DEBUG_RTC 0
 
 #if DEBUG_RTC
 #define DPRINTF(fmt, ...) \
         do { fprintf(stdout, "RTC: [%24s:%5d] " fmt, __func__, __LINE__, \
                 ## __VA_ARGS__); } while (0)
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 2bd7090..740cf49 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -1,20 +1,19 @@
 #ifndef HW_PC_H
 #define HW_PC_H
 
 #include "qemu-common.h"
 #include "exec/memory.h"
 #include "exec/ioport.h"
 #include "hw/isa/isa.h"
 #include "hw/block/fdc.h"
 #include "net/net.h"
-#include "exec/memory.h"
 #include "hw/i386/ioapic.h"
 
 /* PC-style peripherals (also used by other machines).  */
 
 /* parallel.c */
 static inline bool parallel_init(ISABus *bus, int index, CharDriverState *chr)
 {
     ISADevice *dev;
 
     dev = isa_try_create(bus, "isa-parallel");
diff --git a/include/qapi/qmp/qlist.h b/include/qapi/qmp/qlist.h
index 382f04c..6cc4831 100644
--- a/include/qapi/qmp/qlist.h
+++ b/include/qapi/qmp/qlist.h
@@ -8,21 +8,20 @@
  *
  * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
  * See the COPYING.LIB file in the top-level directory.
  */
 
 #ifndef QLIST_H
 #define QLIST_H
 
 #include "qapi/qmp/qobject.h"
 #include "qemu/queue.h"
-#include "qemu/queue.h"
 
 typedef struct QListEntry {
     QObject *value;
     QTAILQ_ENTRY(QListEntry) next;
 } QListEntry;
 
 typedef struct QList {
     QObject_HEAD;
     QTAILQ_HEAD(,QListEntry) head;
 } QList;
diff --git a/include/qemu/config-file.h b/include/qemu/config-file.h
index ccfccae..ad4a9e5 100644
--- a/include/qemu/config-file.h
+++ b/include/qemu/config-file.h
@@ -1,17 +1,16 @@
 #ifndef QEMU_CONFIG_H
 #define QEMU_CONFIG_H
 
 #include <stdio.h>
 #include "qemu/option.h"
 #include "qapi/error.h"
-#include "qemu/option.h"
 
 QemuOptsList *qemu_find_opts(const char *group);
 QemuOptsList *qemu_find_opts_err(const char *group, Error **errp);
 void qemu_add_opts(QemuOptsList *list);
 int qemu_set_option(const char *str);
 int qemu_global_option(const char *str);
 void qemu_add_globals(void);
 
 void qemu_config_write(FILE *fp);
 int qemu_config_parse(FILE *fp, QemuOptsList **lists, const char *fname);
diff --git a/monitor.c b/monitor.c
index 62aaebe..6ce2a4e 100644
--- a/monitor.c
+++ b/monitor.c
@@ -56,21 +56,20 @@
 #include "qapi/qmp/qjson.h"
 #include "qapi/qmp/json-streamer.h"
 #include "qapi/qmp/json-parser.h"
 #include "qemu/osdep.h"
 #include "cpu.h"
 #include "trace.h"
 #include "trace/control.h"
 #ifdef CONFIG_TRACE_SIMPLE
 #include "trace/simple.h"
 #endif
-#include "ui/qemu-spice.h"
 #include "exec/memory.h"
 #include "qmp-commands.h"
 #include "hmp.h"
 #include "qemu/thread.h"
 
 /* for pic/irq_info */
 #if defined(TARGET_SPARC)
 #include "hw/sparc/sun4m.h"
 #endif
 #include "hw/lm32/lm32_pic.h"
diff --git a/page_cache.c b/page_cache.c
index 938a79c..a05db64 100644
--- a/page_cache.c
+++ b/page_cache.c
@@ -14,21 +14,20 @@
 
 #include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <strings.h>
 #include <string.h>
 #include <sys/time.h>
 #include <sys/types.h>
 #include <stdbool.h>
 #include <glib.h>
-#include <strings.h>
 
 #include "qemu-common.h"
 #include "migration/page_cache.h"
 
 #ifdef DEBUG_CACHE
 #define DPRINTF(fmt, ...) \
     do { fprintf(stdout, "cache: " fmt, ## __VA_ARGS__); } while (0)
 #else
 #define DPRINTF(fmt, ...) \
     do { } while (0)
diff --git a/slirp/misc.c b/slirp/misc.c
index 8ecced5..0bcc481 100644
--- a/slirp/misc.c
+++ b/slirp/misc.c
@@ -235,22 +235,20 @@ strdup(str)
 {
 	char *bptr;
 
 	bptr = (char *)malloc(strlen(str)+1);
 	strcpy(bptr, str);
 
 	return bptr;
 }
 #endif
 
-#include "monitor/monitor.h"
-
 void lprint(const char *format, ...)
 {
     va_list args;
 
     va_start(args, format);
     monitor_vprintf(default_mon, format, args);
     va_end(args);
 }
 
 void slirp_connection_info(Slirp *slirp, Monitor *mon)
diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c
index 725071e..3ab2946 100644
--- a/target-ppc/kvm.c
+++ b/target-ppc/kvm.c
@@ -23,22 +23,20 @@
 #include <linux/kvm.h>
 
 #include "qemu-common.h"
 #include "qemu/timer.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/kvm.h"
 #include "kvm_ppc.h"
 #include "cpu.h"
 #include "sysemu/cpus.h"
 #include "sysemu/device_tree.h"
-#include "hw/sysbus.h"
-#include "hw/ppc/spapr.h"
 #include "mmu-hash64.h"
 
 #include "hw/sysbus.h"
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_vio.h"
 #include "sysemu/watchdog.h"
 
 //#define DEBUG_KVM
 
 #ifdef DEBUG_KVM
diff --git a/tests/tcg/linux-test.c b/tests/tcg/linux-test.c
index 83cb32d..1c6c013 100644
--- a/tests/tcg/linux-test.c
+++ b/tests/tcg/linux-test.c
@@ -32,21 +32,20 @@
 #include <time.h>
 #include <sys/time.h>
 #include <sys/uio.h>
 #include <sys/socket.h>
 #include <netinet/in.h>
 #include <arpa/inet.h>
 #include <sched.h>
 #include <dirent.h>
 #include <setjmp.h>
 #include <sys/shm.h>
-#include <sched.h>
 
 #define TESTPATH "/tmp/linux-test.tmp"
 #define TESTPORT 7654
 #define STACK_SIZE 16384
 
 void error1(const char *filename, int line, const char *fmt, ...)
 {
     va_list ap;
     va_start(ap, fmt);
     fprintf(stderr, "%s:%d: ", filename, line);
diff --git a/translate-all.c b/translate-all.c
index da93608..a18bf55 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -52,21 +52,20 @@
 #include <libutil.h>
 #endif
 #endif
 #else
 #include "exec/address-spaces.h"
 #endif
 #include "qemu/timer.h"
 
 #include "exec/cputlb.h"
 #include "translate-all.h"
-#include "qemu/timer.h"
 
 //#define DEBUG_TB_INVALIDATE
 //#define DEBUG_FLUSH
 /* make various TB consistency checks */
 //#define DEBUG_TB_CHECK
 
 #if !defined(CONFIG_USER_ONLY)
 /* TB consistency checks only implemented for usermode emulation.  */
 #undef DEBUG_TB_CHECK
 #endif
-- 
1.7.10.4


