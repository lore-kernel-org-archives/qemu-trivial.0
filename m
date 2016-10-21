Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bxTlp-0007Ni-9j
	for mharc-qemu-trivial@gnu.org; Fri, 21 Oct 2016 02:57:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>) id 1bxTll-0007L1-RD
	for qemu-trivial@nongnu.org; Fri, 21 Oct 2016 02:57:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anand.indukala@gmail.com>) id 1bxTlj-0004wS-S9
	for qemu-trivial@nongnu.org; Fri, 21 Oct 2016 02:57:33 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:36562)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <anand.indukala@gmail.com>)
	id 1bxTle-0004pd-BS; Fri, 21 Oct 2016 02:57:26 -0400
Received: by mail-pf0-x241.google.com with SMTP id r16so7768144pfg.3;
	Thu, 20 Oct 2016 23:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=i7DyEKcB3PbfE7FVQTiuH6Ih2UfROceFICRkc157UaQ=;
	b=TCKF3FUAivLd/rCy7rbH0OBr0fto+muXj1MJL0yIgCfM4uQi5qudZEuJzTTnEQJsHq
	ikeIa2Nt19R0wgHpbbE6/sf5nd6VkBfj3SCRP2ubrqeJ3Jd0VN3H0o6XCF9iW9mS21pe
	GDrYB1UWCVZwKcvFyxWIWKYMrV8LwB5Mrr3lsObZwlD2YPajJ3scI1/YyxIJd9fizLkv
	Fm1Uzn3opDnRxqwDk+X8GIJwpJAw5oqgnYQuJ5/oEJFmQSQJgpy9ba8UqRmVxYxYuhBY
	1JTNgMVC4PO6BzIt76lNG9b2SOWIopOvHzmoiG+d6TvZuVo2SoYy3dhCiMRnTHlBwS64
	WFVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=i7DyEKcB3PbfE7FVQTiuH6Ih2UfROceFICRkc157UaQ=;
	b=iYoL+HqVvn8GGLZ/J6WQF5vyFE9Wp3ED/N+3ploI8+6nq/kAOkH40tJRhqsceUTCyp
	YhCeUh5zyI2n4M0/sxjtlow3DI+jWkC0yJPd4s5udwTINNoGcH3NporFgRxcz+MAnK3C
	NFi2Pnc22pgQ98M/oqSJSMb16q1vTIbx+xcUIYjsbEtZ73YHI492/uiCzPIsYbNmPUqp
	pz2IkFGU1cfePl1BI1S2AXgozaL8G7fkh4az0g3Abn7QxfdIaFYF/Y8v0TH9A/FqP4+c
	v4a+xsw68WU9S7bO3u3v+5WjG8uciC6XR2DTKECmFs0DUa3RzKZSlhkZO1QuIPi/TCJT
	RF2A==
X-Gm-Message-State: AA6/9RnQEHlVE7SueSMhaezz+t9I+2h1Vn47S3VpQYZ72vtuwWBAqQhJfHYK8Cdpyl5dKQ==
X-Received: by 10.98.100.207 with SMTP id y198mr8740038pfb.49.1477033044779;
	Thu, 20 Oct 2016 23:57:24 -0700 (PDT)
Received: from anand.j ([117.242.89.90]) by smtp.googlemail.com with ESMTPSA id
	j17sm2057818pfe.79.2016.10.20.23.57.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Oct 2016 23:57:24 -0700 (PDT)
From: Anand J <anand.indukala@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	thuth@redhat.com,
	eblake@redhat.com
Date: Fri, 21 Oct 2016 12:27:07 +0530
Message-Id: <1477033027-25315-3-git-send-email-anand.indukala@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1477033027-25315-1-git-send-email-anand.indukala@gmail.com>
References: <1477033027-25315-1-git-send-email-anand.indukala@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-trivial] [Qemu-devel] [PATCH v4 2/2] clean-up: removed
 duplicate #includes
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
X-List-Received-Date: Fri, 21 Oct 2016 06:57:36 -0000

Some files contain multiple #includes of the same header file.
Removed most of those unnecessary duplicate entries using
scripts/clean-includes.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Anand J <anand.indukala@gmail.com>
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
index 3c99c34..6a7208f 100644
--- a/cputlb.c
+++ b/cputlb.c
@@ -28,7 +28,6 @@
 
 #include "exec/memory-internal.h"
 #include "exec/ram_addr.h"
-#include "exec/exec-all.h"
 #include "tcg/tcg.h"
 #include "qemu/error-report.h"
 #include "exec/log.h"
diff --git a/gdbstub.c b/gdbstub.c
index ecea8c4..67eb028 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -31,7 +31,6 @@
 
 #define MAX_PACKET_LENGTH 4096
 
-#include "cpu.h"
 #include "qemu/sockets.h"
 #include "sysemu/kvm.h"
 #include "exec/semihost.h"
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index e999654..2b49f58 100644
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
index e90857e..61aa8eb 100644
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
index ddb7438..2491287 100644
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
index b16c448..9c42603 100644
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
index 8728dd9..b8773a5 100644
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
index b3ba9ef..f37ad7e 100644
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
index d7c48c5..4d85f88 100644
--- a/tests/vhost-user-test.c
+++ b/tests/vhost-user-test.c
@@ -20,8 +20,6 @@
 #include "libqos/pci-pc.h"
 #include "libqos/virtio-pci.h"
 
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
index ebd47af..8d0c7c3 100644
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
2.7.4


