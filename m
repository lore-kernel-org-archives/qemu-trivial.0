Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UdgkC-0005rZ-SS
	for mharc-qemu-trivial@gnu.org; Sat, 18 May 2013 09:00:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Udgk5-0005jT-Q3
	for qemu-trivial@nongnu.org; Sat, 18 May 2013 09:00:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Udgk0-0001bo-CN
	for qemu-trivial@nongnu.org; Sat, 18 May 2013 09:00:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38383)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Udgjo-0001Ni-HB; Sat, 18 May 2013 08:59:52 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B464240E7B;
	Sat, 18 May 2013 16:59:49 +0400 (MSK)
Message-ID: <51977B44.1000302@msgid.tls.msk.ru>
Date: Sat, 18 May 2013 16:59:48 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Anthony Liguori <aliguori@us.ibm.com>, qemu-devel <qemu-devel@nongnu.org>,
	qemu-trivial@nongnu.org
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [GIT PULL for-1.5] Trivial patches for 2013-05-18
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
X-List-Received-Date: Sat, 18 May 2013 13:00:15 -0000

Hello.  We accumulated several more patches in the trivial patch
queue, all of which are simple, easy to verify and safe.  One
of the patches are authored by me, -- this one removes a few more
double-includes in sources, because we were getting separate
patches removing double includes in single place lately, so
I went on and checked the rest of the tree for double includes.

As for previous pull requests, I include whole patch below for
reference, because it's rather small.

Please consider applying.

Thanks,

/mjt

The following changes since commit 489ed4bbae309a6d897f6e037481c4c04f0737b5:

  target-mips: fix incorrect behaviour for EXTP (2013-05-17 19:29:40 +0200)

are available in the git repository at:

  git://git.corpit.ru/qemu.git trivial-patches

for you to fetch changes up to d2ad50210b35c2685640f7df931a0fccb49334f7:

  target-moxie: replace target_phys_addr_t with hwaddr (2013-05-18 16:35:12 +0400)

----------------------------------------------------------------
Christophe Lyon (1):
      fix /proc/self/maps output

Ed Maste (1):
      Rename hexdump to avoid FreeBSD libutil conflict

Hu Tao (1):
      target-moxie: replace target_phys_addr_t with hwaddr

Michael Tokarev (1):
      remove some double-includes

Qiao Nuohan (1):
      Remove twice include of qemu-common.h

liguang (1):
      translate: remove redundantly included qemu/timer.h

 audio/audio_win_int.c      |    1 -
 block/win32-aio.c          |    1 -
 hw/arm/highbank.c          |    1 -
 hw/audio/marvell_88w8618.c |    1 -
 hw/dma/pl330.c             |    4 ++--
 hw/mips/mips_malta.c       |    1 -
 hw/misc/lm32_sys.c         |    1 -
 hw/ppc/spapr.c             |    2 --
 hw/ppc/spapr_hcall.c       |    1 -
 hw/timer/exynos4210_rtc.c  |    1 -
 include/hw/i386/pc.h       |    1 -
 include/qapi/qmp/qlist.h   |    1 -
 include/qemu-common.h      |    2 +-
 include/qemu/config-file.h |    1 -
 linux-user/syscall.c       |    4 ++--
 monitor.c                  |    1 -
 page_cache.c               |    1 -
 slirp/misc.c               |    2 --
 target-moxie/helper.c      |    2 +-
 target-ppc/kvm.c           |    2 --
 tests/tcg/linux-test.c     |    1 -
 translate-all.c            |    1 -
 util/hexdump.c             |    2 +-
 util/iov.c                 |    2 +-
 24 files changed, 8 insertions(+), 29 deletions(-)

diff --git a/audio/audio_win_int.c b/audio/audio_win_int.c
index 5869052..e132405 100644
--- a/audio/audio_win_int.c
+++ b/audio/audio_win_int.c
@@ -1,7 +1,6 @@
 /* public domain */

 #include "qemu-common.h"
-#include "audio.h"

 #define AUDIO_CAP "win-int"
 #include <windows.h>
diff --git a/block/win32-aio.c b/block/win32-aio.c
index 5d0fbbf..fcb7c75 100644
--- a/block/win32-aio.c
+++ b/block/win32-aio.c
@@ -25,7 +25,6 @@
 #include "qemu/timer.h"
 #include "block/block_int.h"
 #include "qemu/module.h"
-#include "qemu-common.h"
 #include "block/aio.h"
 #include "raw-aio.h"
 #include "qemu/event_notifier.h"
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 0fd9465..4405dbd 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -24,7 +24,6 @@
 #include "net/net.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
-#include "hw/sysbus.h"
 #include "sysemu/blockdev.h"
 #include "exec/address-spaces.h"

diff --git a/hw/audio/marvell_88w8618.c b/hw/audio/marvell_88w8618.c
index de06dfd..c5d88a7 100644
--- a/hw/audio/marvell_88w8618.c
+++ b/hw/audio/marvell_88w8618.c
@@ -12,7 +12,6 @@
 #include "hw/sysbus.h"
 #include "hw/hw.h"
 #include "hw/i2c/i2c.h"
-#include "hw/sysbus.h"
 #include "audio/audio.h"

 #define MP_AUDIO_SIZE           0x00001000
diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
index 8b33138..60f5299 100644
--- a/hw/dma/pl330.c
+++ b/hw/dma/pl330.c
@@ -1157,7 +1157,7 @@ static int pl330_exec_cycle(PL330Chan *channel)
         if (PL330_ERR_DEBUG > 1) {
             DB_PRINT("PL330 read from memory @%08x (size = %08x):\n",
                       q->addr, len);
-            hexdump((char *)buf, stderr, "", len);
+            qemu_hexdump((char *)buf, stderr, "", len);
         }
         fifo_res = pl330_fifo_push(&s->fifo, buf, len, q->tag);
         if (fifo_res == PL330_FIFO_OK) {
@@ -1189,7 +1189,7 @@ static int pl330_exec_cycle(PL330Chan *channel)
             if (PL330_ERR_DEBUG > 1) {
                 DB_PRINT("PL330 read from memory @%08x (size = %08x):\n",
                          q->addr, len);
-                hexdump((char *)buf, stderr, "", len);
+                qemu_hexdump((char *)buf, stderr, "", len);
             }
             if (q->inc) {
                 q->addr += len;
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 9d521cc..5033d51 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -37,7 +37,6 @@
 #include "sysemu/char.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/arch_init.h"
-#include "hw/boards.h"
 #include "qemu/log.h"
 #include "hw/mips/bios.h"
 #include "hw/ide.h"
diff --git a/hw/misc/lm32_sys.c b/hw/misc/lm32_sys.c
index 33a3b80..aeaf2b7 100644
--- a/hw/misc/lm32_sys.c
+++ b/hw/misc/lm32_sys.c
@@ -34,7 +34,6 @@
 #include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "sysemu/sysemu.h"
-#include "qemu/log.h"

 enum {
     R_CTRL = 0,
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index c96ac81..218ea23 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -43,8 +43,6 @@
 #include "hw/ppc/xics.h"
 #include "hw/pci/msi.h"

-#include "sysemu/kvm.h"
-#include "kvm_ppc.h"
 #include "hw/pci/pci.h"

 #include "exec/address-spaces.h"
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index f518aee..8f0b7e8 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1,6 +1,5 @@
 #include "sysemu/sysemu.h"
 #include "cpu.h"
-#include "sysemu/sysemu.h"
 #include "helper_regs.h"
 #include "hw/ppc/spapr.h"
 #include "mmu-hash64.h"
diff --git a/hw/timer/exynos4210_rtc.c b/hw/timer/exynos4210_rtc.c
index bceee44..3ac77f9 100644
--- a/hw/timer/exynos4210_rtc.c
+++ b/hw/timer/exynos4210_rtc.c
@@ -31,7 +31,6 @@
 #include "hw/ptimer.h"

 #include "hw/hw.h"
-#include "qemu/timer.h"
 #include "sysemu/sysemu.h"

 #include "hw/arm/exynos4210.h"
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 2bd7090..740cf49 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -7,7 +7,6 @@
 #include "hw/isa/isa.h"
 #include "hw/block/fdc.h"
 #include "net/net.h"
-#include "exec/memory.h"
 #include "hw/i386/ioapic.h"

 /* PC-style peripherals (also used by other machines).  */
diff --git a/include/qapi/qmp/qlist.h b/include/qapi/qmp/qlist.h
index 382f04c..6cc4831 100644
--- a/include/qapi/qmp/qlist.h
+++ b/include/qapi/qmp/qlist.h
@@ -15,7 +15,6 @@

 #include "qapi/qmp/qobject.h"
 #include "qemu/queue.h"
-#include "qemu/queue.h"

 typedef struct QListEntry {
     QObject *value;
diff --git a/include/qemu-common.h b/include/qemu-common.h
index 7f18b8e..b9057d1 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -443,7 +443,7 @@ int mod_utf8_codepoint(const char *s, size_t n, char **end);
  * Hexdump a buffer to a file. An optional string prefix is added to every line
  */

-void hexdump(const char *buf, FILE *fp, const char *prefix, size_t size);
+void qemu_hexdump(const char *buf, FILE *fp, const char *prefix, size_t size);

 /* vector definitions */
 #ifdef __ALTIVEC__
diff --git a/include/qemu/config-file.h b/include/qemu/config-file.h
index ccfccae..ad4a9e5 100644
--- a/include/qemu/config-file.h
+++ b/include/qemu/config-file.h
@@ -4,7 +4,6 @@
 #include <stdio.h>
 #include "qemu/option.h"
 #include "qapi/error.h"
-#include "qemu/option.h"

 QemuOptsList *qemu_find_opts(const char *group);
 QemuOptsList *qemu_find_opts_err(const char *group, Error **errp);
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 30e93bc..1b3c0ed 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -5050,10 +5050,10 @@ static int open_self_maps(void *cpu_env, int fd)
         }
         if (h2g_valid(min) && h2g_valid(max)) {
             dprintf(fd, TARGET_ABI_FMT_lx "-" TARGET_ABI_FMT_lx
-                    " %c%c%c%c %08" PRIx64 " %02x:%02x %d%s%s\n",
+                    " %c%c%c%c %08" PRIx64 " %02x:%02x %d %s%s\n",
                     h2g(min), h2g(max), flag_r, flag_w,
                     flag_x, flag_p, offset, dev_maj, dev_min, inode,
-                    path[0] ? "          " : "", path);
+                    path[0] ? "         " : "", path);
         }
     }

diff --git a/monitor.c b/monitor.c
index 62aaebe..6ce2a4e 100644
--- a/monitor.c
+++ b/monitor.c
@@ -63,7 +63,6 @@
 #ifdef CONFIG_TRACE_SIMPLE
 #include "trace/simple.h"
 #endif
-#include "ui/qemu-spice.h"
 #include "exec/memory.h"
 #include "qmp-commands.h"
 #include "hmp.h"
diff --git a/page_cache.c b/page_cache.c
index 938a79c..a05db64 100644
--- a/page_cache.c
+++ b/page_cache.c
@@ -21,7 +21,6 @@
 #include <sys/types.h>
 #include <stdbool.h>
 #include <glib.h>
-#include <strings.h>

 #include "qemu-common.h"
 #include "migration/page_cache.h"
diff --git a/slirp/misc.c b/slirp/misc.c
index 8ecced5..0bcc481 100644
--- a/slirp/misc.c
+++ b/slirp/misc.c
@@ -242,8 +242,6 @@ strdup(str)
 }
 #endif

-#include "monitor/monitor.h"
-
 void lprint(const char *format, ...)
 {
     va_list args;
diff --git a/target-moxie/helper.c b/target-moxie/helper.c
index 6e0ac2a..5cfe889 100644
--- a/target-moxie/helper.c
+++ b/target-moxie/helper.c
@@ -116,7 +116,7 @@ int cpu_moxie_handle_mmu_fault(CPUMoxieState *env, target_ulong address,
     return 1;
 }

-target_phys_addr_t cpu_get_phys_page_debug(CPUState *env, target_ulong addr)
+hwaddr cpu_get_phys_page_debug(CPUState *env, target_ulong addr)
 {
     return addr;
 }
diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c
index 725071e..3ab2946 100644
--- a/target-ppc/kvm.c
+++ b/target-ppc/kvm.c
@@ -30,8 +30,6 @@
 #include "cpu.h"
 #include "sysemu/cpus.h"
 #include "sysemu/device_tree.h"
-#include "hw/sysbus.h"
-#include "hw/ppc/spapr.h"
 #include "mmu-hash64.h"

 #include "hw/sysbus.h"
diff --git a/tests/tcg/linux-test.c b/tests/tcg/linux-test.c
index 83cb32d..1c6c013 100644
--- a/tests/tcg/linux-test.c
+++ b/tests/tcg/linux-test.c
@@ -39,7 +39,6 @@
 #include <dirent.h>
 #include <setjmp.h>
 #include <sys/shm.h>
-#include <sched.h>

 #define TESTPATH "/tmp/linux-test.tmp"
 #define TESTPORT 7654
diff --git a/translate-all.c b/translate-all.c
index da93608..d04a116 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -55,7 +55,6 @@
 #else
 #include "exec/address-spaces.h"
 #endif
-#include "qemu/timer.h"

 #include "exec/cputlb.h"
 #include "translate-all.h"
diff --git a/util/hexdump.c b/util/hexdump.c
index 0d0efc8..969b340 100644
--- a/util/hexdump.c
+++ b/util/hexdump.c
@@ -15,7 +15,7 @@

 #include "qemu-common.h"

-void hexdump(const char *buf, FILE *fp, const char *prefix, size_t size)
+void qemu_hexdump(const char *buf, FILE *fp, const char *prefix, size_t size)
 {
     unsigned int b;

diff --git a/util/iov.c b/util/iov.c
index 78bbbe1..cc6e837 100644
--- a/util/iov.c
+++ b/util/iov.c
@@ -225,7 +225,7 @@ void iov_hexdump(const struct iovec *iov, const unsigned int iov_cnt,
     size = size > limit ? limit : size;
     buf = g_malloc(size);
     iov_to_buf(iov, iov_cnt, 0, buf, size);
-    hexdump(buf, fp, prefix, size);
+    qemu_hexdump(buf, fp, prefix, size);
     g_free(buf);
 }


