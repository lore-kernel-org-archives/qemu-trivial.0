Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c0A8I-0006mL-NY
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 12:35:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c0A8F-0006jd-RY
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 12:35:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c0A8D-0004Td-Uo
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 12:35:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45341)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c0A88-0004QL-3i; Fri, 28 Oct 2016 12:35:44 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6276743752;
	Fri, 28 Oct 2016 19:35:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 1FAC1B61;
	Fri, 28 Oct 2016 18:18:58 +0300 (MSK)
Received: (nullmailer pid 6089 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Anand J <anand.indukala@gmail.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 28 Oct 2016 18:18:53 +0300
Message-Id: <814bb12a561d36aeb5ae4440ad43d2b0761d76da.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 22/23] clean-up: removed duplicate #includes
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
X-List-Received-Date: Fri, 28 Oct 2016 16:35:53 -0000

From: Anand J <anand.indukala@gmail.com>

Some files contain multiple #includes of the same header file.
Removed most of those unnecessary duplicate entries using
scripts/clean-includes.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Anand J <anand.indukala@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 accel.c                             | 1 -
 cputlb.c                            | 1 -
 gdbstub.c                           | 1 -
 hw/i386/acpi-build.c                | 1 -
 hw/microblaze/boot.c                | 1 -
 hw/mips/mips_malta.c                | 1 -
 hw/nvram/fw_cfg.c                   | 1 -
 hw/pci-bridge/pci_expander_bridge.c | 1 -
 hw/ppc/ppc405_boards.c              | 1 -
 hw/ppc/spapr.c                      | 1 -
 hw/timer/grlib_gptimer.c            | 1 -
 hw/tpm/tpm_tis.c                    | 1 -
 hw/unicore32/puv3.c                 | 1 -
 hw/usb/dev-mtp.c                    | 1 -
 include/hw/i386/pc.h                | 1 -
 monitor.c                           | 2 --
 qemu-io-cmds.c                      | 1 -
 qmp.c                               | 1 -
 target-i386/machine.c               | 3 ---
 target-mips/machine.c               | 1 -
 target-ppc/machine.c                | 1 -
 target-ppc/mem_helper.c             | 1 -
 target-sparc/machine.c              | 3 ---
 target-xtensa/translate.c           | 1 -
 tests/crypto-tls-x509-helpers.h     | 3 ---
 tests/vhost-user-test.c             | 2 --
 util/oslib-posix.c                  | 1 -
 vl.c                                | 1 -
 28 files changed, 36 deletions(-)

diff --git a/accel.c b/accel.c
index 403eb5e..664bb88 100644
--- a/accel.c
+++ b/accel.c
@@ -33,7 +33,6 @@
 #include "sysemu/qtest.h"
 #include "hw/xen/xen.h"
 #include "qom/object.h"
-#include "hw/boards.h"
 
 int tcg_tb_size;
 static bool tcg_allowed = true;
diff --git a/cputlb.c b/cputlb.c
index cc4da4d..813279f 100644
--- a/cputlb.c
+++ b/cputlb.c
@@ -26,7 +26,6 @@
 #include "exec/cputlb.h"
 #include "exec/memory-internal.h"
 #include "exec/ram_addr.h"
-#include "exec/exec-all.h"
 #include "tcg/tcg.h"
 #include "qemu/error-report.h"
 #include "exec/log.h"
diff --git a/gdbstub.c b/gdbstub.c
index b2e1b79..de62d26 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -31,7 +31,6 @@
 
 #define MAX_PACKET_LENGTH 4096
 
-#include "cpu.h"
 #include "qemu/sockets.h"
 #include "sysemu/kvm.h"
 #include "exec/semihost.h"
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 93be96f..5cd1da9 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -53,7 +53,6 @@
 #include "hw/pci/pci_bus.h"
 #include "hw/pci-host/q35.h"
 #include "hw/i386/x86-iommu.h"
-#include "hw/timer/hpet.h"
 
 #include "hw/acpi/aml-build.h"
 
diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
index 9eebb1a..1834d22 100644
--- a/hw/microblaze/boot.c
+++ b/hw/microblaze/boot.c
@@ -30,7 +30,6 @@
 #include "qemu/option.h"
 #include "qemu/config-file.h"
 #include "qemu/error-report.h"
-#include "qemu-common.h"
 #include "sysemu/device_tree.h"
 #include "sysemu/sysemu.h"
 #include "hw/loader.h"
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index cf9bd3e..cf48f42 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -47,7 +47,6 @@
 #include "elf.h"
 #include "hw/timer/mc146818rtc.h"
 #include "hw/timer/i8254.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "exec/address-spaces.h"
 #include "hw/sysbus.h"             /* SysBusDevice */
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 92aa563..1f0c3e9 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -29,7 +29,6 @@
 #include "hw/isa/isa.h"
 #include "hw/nvram/fw_cfg.h"
 #include "hw/sysbus.h"
-#include "hw/boards.h"
 #include "trace.h"
 #include "qemu/error-report.h"
 #include "qemu/config-file.h"
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 1cc598f..6ac187f 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -15,7 +15,6 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/pci_host.h"
-#include "hw/pci/pci_bus.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/i386/pc.h"
 #include "qemu/range.h"
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 4b2f07a..d01798f 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -37,7 +37,6 @@
 #include "qemu/log.h"
 #include "qemu/error-report.h"
 #include "hw/loader.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/blockdev.h"
 #include "exec/address-spaces.h"
 
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 486f57d..17d5d6d 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -37,7 +37,6 @@
 #include "sysemu/block-backend.h"
 #include "sysemu/cpus.h"
 #include "sysemu/kvm.h"
-#include "sysemu/device_tree.h"
 #include "kvm_ppc.h"
 #include "migration/migration.h"
 #include "mmu-hash64.h"
diff --git a/hw/timer/grlib_gptimer.c b/hw/timer/grlib_gptimer.c
index 712d1ae..4ed96e9 100644
--- a/hw/timer/grlib_gptimer.c
+++ b/hw/timer/grlib_gptimer.c
@@ -26,7 +26,6 @@
 #include "hw/sysbus.h"
 #include "qemu/timer.h"
 #include "hw/ptimer.h"
-#include "qemu/timer.h"
 #include "qemu/main-loop.h"
 
 #include "trace.h"
diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
index 381e726..a6440fe 100644
--- a/hw/tpm/tpm_tis.c
+++ b/hw/tpm/tpm_tis.c
@@ -34,7 +34,6 @@
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "qemu/main-loop.h"
-#include "sysemu/tpm_backend.h"
 
 #define DEBUG_TIS 0
 
diff --git a/hw/unicore32/puv3.c b/hw/unicore32/puv3.c
index 31cd171..032078f 100644
--- a/hw/unicore32/puv3.c
+++ b/hw/unicore32/puv3.c
@@ -13,7 +13,6 @@
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
-#include "qemu-common.h"
 #include "ui/console.h"
 #include "elf.h"
 #include "exec/address-spaces.h"
diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index 58d95ff..9cb0f50 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -17,7 +17,6 @@
 #include <sys/statvfs.h>
 #ifdef CONFIG_INOTIFY1
 #include <sys/inotify.h>
-#include "qapi/error.h"
 #include "qemu/main-loop.h"
 #endif
 
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 17fff80..98dc772 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -13,7 +13,6 @@
 #include "qemu/bitmap.h"
 #include "sysemu/sysemu.h"
 #include "hw/pci/pci.h"
-#include "hw/boards.h"
 #include "hw/compat.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/mem/nvdimm.h"
diff --git a/monitor.c b/monitor.c
index c4b6e26..7b963ad 100644
--- a/monitor.c
+++ b/monitor.c
@@ -59,7 +59,6 @@
 #include "qapi/qmp/json-streamer.h"
 #include "qapi/qmp/json-parser.h"
 #include "qom/object_interfaces.h"
-#include "cpu.h"
 #include "trace.h"
 #include "trace/control.h"
 #include "monitor/hmp-target.h"
@@ -76,7 +75,6 @@
 #include "qapi/qmp-event.h"
 #include "qapi-event.h"
 #include "qmp-introspect.h"
-#include "sysemu/block-backend.h"
 #include "sysemu/qtest.h"
 #include "qemu/cutils.h"
 #include "qapi/qmp/dispatch.h"
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 3a3838a..e0249e2 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -18,7 +18,6 @@
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/timer.h"
-#include "sysemu/block-backend.h"
 #include "qemu/cutils.h"
 
 #define CMD_NOFILE_OK   0x01
diff --git a/qmp.c b/qmp.c
index a06cb7b..0028f0b 100644
--- a/qmp.c
+++ b/qmp.c
@@ -36,7 +36,6 @@
 #include "qom/object_interfaces.h"
 #include "hw/mem/pc-dimm.h"
 #include "hw/acpi/acpi_dev_interface.h"
-#include "qemu/uuid.h"
 
 NameInfo *qmp_query_name(Error **errp)
 {
diff --git a/target-i386/machine.c b/target-i386/machine.c
index 71c0e4d..48037f1 100644
--- a/target-i386/machine.c
+++ b/target-i386/machine.c
@@ -7,10 +7,7 @@
 #include "hw/i386/pc.h"
 #include "hw/isa/isa.h"
 #include "migration/cpu.h"
-#include "exec/exec-all.h"
 
-#include "cpu.h"
-#include "exec/exec-all.h"
 #include "sysemu/kvm.h"
 
 #include "qemu/error-report.h"
diff --git a/target-mips/machine.c b/target-mips/machine.c
index a27f2f1..d20d948 100644
--- a/target-mips/machine.c
+++ b/target-mips/machine.c
@@ -2,7 +2,6 @@
 #include "qemu-common.h"
 #include "cpu.h"
 #include "hw/hw.h"
-#include "cpu.h"
 #include "migration/cpu.h"
 
 static int cpu_post_load(void *opaque, int version_id)
diff --git a/target-ppc/machine.c b/target-ppc/machine.c
index 4820f22..e43cb6c 100644
--- a/target-ppc/machine.c
+++ b/target-ppc/machine.c
@@ -8,7 +8,6 @@
 #include "helper_regs.h"
 #include "mmu-hash64.h"
 #include "migration/cpu.h"
-#include "exec/exec-all.h"
 
 static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
 {
diff --git a/target-ppc/mem_helper.c b/target-ppc/mem_helper.c
index 6548715..1ab8a6e 100644
--- a/target-ppc/mem_helper.c
+++ b/target-ppc/mem_helper.c
@@ -23,7 +23,6 @@
 #include "exec/helper-proto.h"
 
 #include "helper_regs.h"
-#include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 
 //#define DEBUG_OP
diff --git a/target-sparc/machine.c b/target-sparc/machine.c
index 59c92f7..aea6397 100644
--- a/target-sparc/machine.c
+++ b/target-sparc/machine.c
@@ -6,10 +6,7 @@
 #include "hw/boards.h"
 #include "qemu/timer.h"
 
-#include "cpu.h"
-#include "exec/exec-all.h"
 #include "migration/cpu.h"
-#include "exec/exec-all.h"
 
 #ifdef TARGET_SPARC64
 static const VMStateDescription vmstate_cpu_timer = {
diff --git a/target-xtensa/translate.c b/target-xtensa/translate.c
index 4c1e487..fb0fa56 100644
--- a/target-xtensa/translate.c
+++ b/target-xtensa/translate.c
@@ -36,7 +36,6 @@
 #include "tcg-op.h"
 #include "qemu/log.h"
 #include "sysemu/sysemu.h"
-#include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "exec/semihost.h"
 
diff --git a/tests/crypto-tls-x509-helpers.h b/tests/crypto-tls-x509-helpers.h
index a8faa92..921341c 100644
--- a/tests/crypto-tls-x509-helpers.h
+++ b/tests/crypto-tls-x509-helpers.h
@@ -21,9 +21,6 @@
 #include <gnutls/gnutls.h>
 #include <gnutls/x509.h>
 
-#include <gnutls/gnutls.h>
-#include <gnutls/x509.h>
-
 #if !(defined WIN32) && \
     defined(CONFIG_TASN1) && \
     (LIBGNUTLS_VERSION_NUMBER >= 0x020600)
diff --git a/tests/vhost-user-test.c b/tests/vhost-user-test.c
index a7f0629..8b10afb 100644
--- a/tests/vhost-user-test.c
+++ b/tests/vhost-user-test.c
@@ -22,8 +22,6 @@
 #include "libqos/virtio-pci.h"
 #include "qapi/error.h"
 
-#include "libqos/pci-pc.h"
-#include "libqos/virtio-pci.h"
 #include "libqos/malloc-pc.h"
 #include "hw/virtio/virtio-net.h"
 
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index 8ec99cc..67c6589 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -28,7 +28,6 @@
 
 #include "qemu/osdep.h"
 #include <termios.h>
-#include <termios.h>
 
 #include <glib/gprintf.h>
 
diff --git a/vl.c b/vl.c
index 496e655..55763f7 100644
--- a/vl.c
+++ b/vl.c
@@ -110,7 +110,6 @@ int main(int argc, char **argv)
 #include "trace.h"
 #include "trace/control.h"
 #include "qemu/queue.h"
-#include "sysemu/cpus.h"
 #include "sysemu/arch_init.h"
 
 #include "ui/qemu-spice.h"
-- 
2.1.4


