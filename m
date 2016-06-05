Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9T0Q-00021l-8p
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 04:01:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9T0I-0001rI-7h
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:01:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9T0D-000860-SF
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:01:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60544)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9T02-00081b-JZ; Sun, 05 Jun 2016 04:01:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4819A40910;
	Sun,  5 Jun 2016 11:01:26 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 52E4BB44;
	Sun,  5 Jun 2016 10:43:41 +0300 (MSK)
Received: (nullmailer pid 1149 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:06 +0300
Message-Id: <f94f0a93d5d7c665b102d11cbf250b1aa8a35c94.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 29/52] tests: Remove unnecessary glib.h
 includes
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
X-List-Received-Date: Sun, 05 Jun 2016 08:01:54 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Remove glib.h includes, as it is provided by osdep.h.

This commit was created with scripts/clean-includes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/ac97-test.c                  | 1 -
 tests/ahci-test.c                  | 1 -
 tests/bios-tables-test.c           | 1 -
 tests/boot-order-test.c            | 1 -
 tests/check-qdict.c                | 1 -
 tests/check-qfloat.c               | 1 -
 tests/check-qint.c                 | 1 -
 tests/check-qjson.c                | 1 -
 tests/check-qlist.c                | 1 -
 tests/check-qnull.c                | 1 -
 tests/check-qom-interface.c        | 1 -
 tests/check-qom-proplist.c         | 1 -
 tests/check-qstring.c              | 1 -
 tests/device-introspect-test.c     | 1 -
 tests/display-vga-test.c           | 1 -
 tests/drive_del-test.c             | 1 -
 tests/ds1338-test.c                | 2 --
 tests/e1000-test.c                 | 1 -
 tests/eepro100-test.c              | 1 -
 tests/endianness-test.c            | 1 -
 tests/es1370-test.c                | 1 -
 tests/fdc-test.c                   | 1 -
 tests/fw_cfg-test.c                | 1 -
 tests/hd-geo-test.c                | 1 -
 tests/i440fx-test.c                | 1 -
 tests/i82801b11-test.c             | 1 -
 tests/ide-test.c                   | 1 -
 tests/intel-hda-test.c             | 1 -
 tests/ioh3420-test.c               | 1 -
 tests/ipmi-bt-test.c               | 1 -
 tests/ipmi-kcs-test.c              | 1 -
 tests/ipoctal232-test.c            | 1 -
 tests/ivshmem-test.c               | 1 -
 tests/libqos/ahci.c                | 1 -
 tests/libqos/fw_cfg.c              | 1 -
 tests/libqos/i2c-imx.c             | 1 -
 tests/libqos/i2c-omap.c            | 1 -
 tests/libqos/libqos.c              | 1 -
 tests/libqos/malloc-generic.c      | 1 -
 tests/libqos/malloc-pc.c           | 1 -
 tests/libqos/malloc.c              | 1 -
 tests/libqos/pci-pc.c              | 1 -
 tests/libqos/pci.c                 | 1 -
 tests/libqos/usb.c                 | 1 -
 tests/libqos/virtio-mmio.c         | 1 -
 tests/libqos/virtio-pci.c          | 1 -
 tests/libqos/virtio.c              | 1 -
 tests/libqtest.c                   | 1 -
 tests/m48t59-test.c                | 1 -
 tests/ne2000-test.c                | 1 -
 tests/nvme-test.c                  | 1 -
 tests/pc-cpu-test.c                | 1 -
 tests/pcnet-test.c                 | 1 -
 tests/pvpanic-test.c               | 1 -
 tests/pxe-test.c                   | 1 -
 tests/q35-test.c                   | 1 -
 tests/qom-test.c                   | 1 -
 tests/rcutorture.c                 | 1 -
 tests/rtc-test.c                   | 1 -
 tests/rtl8139-test.c               | 1 -
 tests/spapr-phb-test.c             | 1 -
 tests/tco-test.c                   | 1 -
 tests/test-aio.c                   | 1 -
 tests/test-base64.c                | 1 -
 tests/test-bitops.c                | 1 -
 tests/test-blockjob-txn.c          | 1 -
 tests/test-coroutine.c             | 1 -
 tests/test-crypto-cipher.c         | 1 -
 tests/test-crypto-hash.c           | 1 -
 tests/test-crypto-secret.c         | 1 -
 tests/test-cutils.c                | 1 -
 tests/test-filter-mirror.c         | 1 -
 tests/test-filter-redirector.c     | 1 -
 tests/test-hbitmap.c               | 1 -
 tests/test-int128.c                | 1 -
 tests/test-io-task.c               | 1 -
 tests/test-iov.c                   | 1 -
 tests/test-logging.c               | 1 -
 tests/test-mul64.c                 | 1 -
 tests/test-netfilter.c             | 1 -
 tests/test-opts-visitor.c          | 1 -
 tests/test-qdev-global-props.c     | 1 -
 tests/test-qemu-opts.c             | 1 -
 tests/test-qga.c                   | 1 -
 tests/test-qmp-commands.c          | 1 -
 tests/test-qmp-event.c             | 1 -
 tests/test-qmp-input-strict.c      | 1 -
 tests/test-qmp-input-visitor.c     | 1 -
 tests/test-qmp-output-visitor.c    | 1 -
 tests/test-rcu-list.c              | 1 -
 tests/test-rfifolock.c             | 1 -
 tests/test-string-input-visitor.c  | 1 -
 tests/test-string-output-visitor.c | 1 -
 tests/test-thread-pool.c           | 1 -
 tests/test-throttle.c              | 1 -
 tests/test-timed-average.c         | 1 -
 tests/test-visitor-serialization.c | 1 -
 tests/test-vmstate.c               | 1 -
 tests/test-write-threshold.c       | 1 -
 tests/test-x86-cpuid.c             | 1 -
 tests/tmp105-test.c                | 1 -
 tests/tpci200-test.c               | 1 -
 tests/usb-hcd-ehci-test.c          | 1 -
 tests/usb-hcd-ohci-test.c          | 1 -
 tests/usb-hcd-uhci-test.c          | 1 -
 tests/usb-hcd-xhci-test.c          | 1 -
 tests/vhost-user-test.c            | 1 -
 tests/virtio-9p-test.c             | 1 -
 tests/virtio-balloon-test.c        | 1 -
 tests/virtio-blk-test.c            | 1 -
 tests/virtio-console-test.c        | 1 -
 tests/virtio-net-test.c            | 1 -
 tests/virtio-rng-test.c            | 1 -
 tests/virtio-scsi-test.c           | 1 -
 tests/virtio-serial-test.c         | 1 -
 tests/vmxnet3-test.c               | 1 -
 tests/wdt_ib700-test.c             | 1 -
 117 files changed, 118 deletions(-)

diff --git a/tests/ac97-test.c b/tests/ac97-test.c
index 75cab8f..e0d177b 100644
--- a/tests/ac97-test.c
+++ b/tests/ac97-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
diff --git a/tests/ahci-test.c b/tests/ahci-test.c
index 6869f7f..57dc44c 100644
--- a/tests/ahci-test.c
+++ b/tests/ahci-test.c
@@ -24,7 +24,6 @@
 
 #include "qemu/osdep.h"
 #include <getopt.h>
-#include <glib.h>
 
 #include "libqtest.h"
 #include "libqos/libqos-pc.h"
diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index 0352814..e4c6a3c 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include <glib/gstdio.h>
 #include "qemu-common.h"
 #include "libqtest.h"
diff --git a/tests/boot-order-test.c b/tests/boot-order-test.c
index a6d8bd5..fc1e794 100644
--- a/tests/boot-order-test.c
+++ b/tests/boot-order-test.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqos/fw_cfg.h"
 #include "libqtest.h"
 
diff --git a/tests/check-qdict.c b/tests/check-qdict.c
index a43056c..42da1e6 100644
--- a/tests/check-qdict.c
+++ b/tests/check-qdict.c
@@ -10,7 +10,6 @@
  * See the COPYING.LIB file in the top-level directory.
  */
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qapi/qmp/qint.h"
 #include "qapi/qmp/qdict.h"
diff --git a/tests/check-qfloat.c b/tests/check-qfloat.c
index 3102608..1da2cda 100644
--- a/tests/check-qfloat.c
+++ b/tests/check-qfloat.c
@@ -11,7 +11,6 @@
  *
  */
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qapi/qmp/qfloat.h"
 #include "qemu-common.h"
diff --git a/tests/check-qint.c b/tests/check-qint.c
index c86f7df..b6e4555 100644
--- a/tests/check-qint.c
+++ b/tests/check-qint.c
@@ -10,7 +10,6 @@
  * See the COPYING.LIB file in the top-level directory.
  */
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qapi/qmp/qint.h"
 #include "qemu-common.h"
diff --git a/tests/check-qjson.c b/tests/check-qjson.c
index 99de6f5..0e158f6 100644
--- a/tests/check-qjson.c
+++ b/tests/check-qjson.c
@@ -11,7 +11,6 @@
  *
  */
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qapi/qmp/qstring.h"
 #include "qapi/qmp/qint.h"
diff --git a/tests/check-qlist.c b/tests/check-qlist.c
index f231d5f..e16da5e 100644
--- a/tests/check-qlist.c
+++ b/tests/check-qlist.c
@@ -10,7 +10,6 @@
  * See the COPYING.LIB file in the top-level directory.
  */
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qapi/qmp/qint.h"
 #include "qapi/qmp/qlist.h"
diff --git a/tests/check-qnull.c b/tests/check-qnull.c
index fd9c68f..05d562d 100644
--- a/tests/check-qnull.c
+++ b/tests/check-qnull.c
@@ -7,7 +7,6 @@
  * See the COPYING.LIB file in the top-level directory.
  */
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qapi/qmp/qobject.h"
 #include "qemu-common.h"
diff --git a/tests/check-qom-interface.c b/tests/check-qom-interface.c
index 09354de..719ddcf 100644
--- a/tests/check-qom-interface.c
+++ b/tests/check-qom-interface.c
@@ -10,7 +10,6 @@
  * See the COPYING.LIB file in the top-level directory.
  */
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qom/object.h"
 #include "qemu/module.h"
diff --git a/tests/check-qom-proplist.c b/tests/check-qom-proplist.c
index ffffd87..42defe7 100644
--- a/tests/check-qom-proplist.c
+++ b/tests/check-qom-proplist.c
@@ -19,7 +19,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qapi/error.h"
 #include "qom/object.h"
diff --git a/tests/check-qstring.c b/tests/check-qstring.c
index 9877b42..239e9d9 100644
--- a/tests/check-qstring.c
+++ b/tests/check-qstring.c
@@ -10,7 +10,6 @@
  * See the COPYING.LIB file in the top-level directory.
  */
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qapi/qmp/qstring.h"
 #include "qemu-common.h"
diff --git a/tests/device-introspect-test.c b/tests/device-introspect-test.c
index 4477926..37debc1 100644
--- a/tests/device-introspect-test.c
+++ b/tests/device-introspect-test.c
@@ -18,7 +18,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "qemu-common.h"
 #include "qapi/qmp/qstring.h"
 #include "libqtest.h"
diff --git a/tests/display-vga-test.c b/tests/display-vga-test.c
index 5706d33..06b244e 100644
--- a/tests/display-vga-test.c
+++ b/tests/display-vga-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 
 static void pci_cirrus(void)
diff --git a/tests/drive_del-test.c b/tests/drive_del-test.c
index fe03236..74e43c2 100644
--- a/tests/drive_del-test.c
+++ b/tests/drive_del-test.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 
 static void drive_add(void)
diff --git a/tests/ds1338-test.c b/tests/ds1338-test.c
index 2792415..26968bc 100644
--- a/tests/ds1338-test.c
+++ b/tests/ds1338-test.c
@@ -21,8 +21,6 @@
 #include "libqtest.h"
 #include "libqos/i2c.h"
 
-#include <glib.h>
-
 #define IMX25_I2C_0_BASE 0x43F80000
 
 #define DS1338_ADDR 0x68
diff --git a/tests/e1000-test.c b/tests/e1000-test.c
index a42b381..59cab68 100644
--- a/tests/e1000-test.c
+++ b/tests/e1000-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
diff --git a/tests/eepro100-test.c b/tests/eepro100-test.c
index e17eed0..ed23258 100644
--- a/tests/eepro100-test.c
+++ b/tests/eepro100-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 
 static void test_device(gconstpointer data)
diff --git a/tests/endianness-test.c b/tests/endianness-test.c
index cc5bccd..2197972 100644
--- a/tests/endianness-test.c
+++ b/tests/endianness-test.c
@@ -12,7 +12,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "libqtest.h"
 #include "qemu/bswap.h"
diff --git a/tests/es1370-test.c b/tests/es1370-test.c
index 824dc31..199fe19 100644
--- a/tests/es1370-test.c
+++ b/tests/es1370-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
diff --git a/tests/fdc-test.c b/tests/fdc-test.c
index 53df1d0..738c6b4 100644
--- a/tests/fdc-test.c
+++ b/tests/fdc-test.c
@@ -24,7 +24,6 @@
 
 #include "qemu/osdep.h"
 
-#include <glib.h>
 
 #include "libqtest.h"
 #include "qemu-common.h"
diff --git a/tests/fw_cfg-test.c b/tests/fw_cfg-test.c
index b4392c2..688342b 100644
--- a/tests/fw_cfg-test.c
+++ b/tests/fw_cfg-test.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "libqtest.h"
 #include "hw/nvram/fw_cfg_keys.h"
diff --git a/tests/hd-geo-test.c b/tests/hd-geo-test.c
index c8e669a..12ee392 100644
--- a/tests/hd-geo-test.c
+++ b/tests/hd-geo-test.c
@@ -16,7 +16,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "qemu-common.h"
 #include "libqtest.h"
 
diff --git a/tests/i440fx-test.c b/tests/i440fx-test.c
index 05029e9..bff999c 100644
--- a/tests/i440fx-test.c
+++ b/tests/i440fx-test.c
@@ -13,7 +13,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include <sys/mman.h>
 
 #include "libqtest.h"
diff --git a/tests/i82801b11-test.c b/tests/i82801b11-test.c
index c3b5ebb..a6e3159 100644
--- a/tests/i82801b11-test.c
+++ b/tests/i82801b11-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
diff --git a/tests/ide-test.c b/tests/ide-test.c
index 67e5c1f..fed1b2e 100644
--- a/tests/ide-test.c
+++ b/tests/ide-test.c
@@ -24,7 +24,6 @@
 
 #include "qemu/osdep.h"
 
-#include <glib.h>
 
 #include "libqtest.h"
 #include "libqos/libqos.h"
diff --git a/tests/intel-hda-test.c b/tests/intel-hda-test.c
index 1be6add..b0ca7e0 100644
--- a/tests/intel-hda-test.c
+++ b/tests/intel-hda-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 
 #define HDA_ID "hda0"
diff --git a/tests/ioh3420-test.c b/tests/ioh3420-test.c
index 93eb2f7..b54c4b9 100644
--- a/tests/ioh3420-test.c
+++ b/tests/ioh3420-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
diff --git a/tests/ipmi-bt-test.c b/tests/ipmi-bt-test.c
index 812907f..be9005e 100644
--- a/tests/ipmi-bt-test.c
+++ b/tests/ipmi-bt-test.c
@@ -29,7 +29,6 @@
 #include <netinet/ip.h>
 #include <netinet/tcp.h>
 
-#include <glib.h>
 
 #include "libqtest.h"
 #include "qemu-common.h"
diff --git a/tests/ipmi-kcs-test.c b/tests/ipmi-kcs-test.c
index 42c4b97..3750389 100644
--- a/tests/ipmi-kcs-test.c
+++ b/tests/ipmi-kcs-test.c
@@ -24,7 +24,6 @@
 
 #include "qemu/osdep.h"
 
-#include <glib.h>
 
 #include "libqtest.h"
 
diff --git a/tests/ipoctal232-test.c b/tests/ipoctal232-test.c
index 846aaf5..6849141 100644
--- a/tests/ipoctal232-test.c
+++ b/tests/ipoctal232-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
diff --git a/tests/ivshmem-test.c b/tests/ivshmem-test.c
index c027ff1..010860a 100644
--- a/tests/ivshmem-test.c
+++ b/tests/ivshmem-test.c
@@ -9,7 +9,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include <glib/gstdio.h>
 #include <sys/mman.h>
 #include "contrib/ivshmem-server/ivshmem-server.h"
diff --git a/tests/libqos/ahci.c b/tests/libqos/ahci.c
index ac6c155..f3be5500 100644
--- a/tests/libqos/ahci.c
+++ b/tests/libqos/ahci.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "libqtest.h"
 #include "libqos/ahci.h"
diff --git a/tests/libqos/fw_cfg.c b/tests/libqos/fw_cfg.c
index 76894d5..4d9dc3f 100644
--- a/tests/libqos/fw_cfg.c
+++ b/tests/libqos/fw_cfg.c
@@ -13,7 +13,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqos/fw_cfg.h"
 #include "libqtest.h"
 #include "qemu/bswap.h"
diff --git a/tests/libqos/i2c-imx.c b/tests/libqos/i2c-imx.c
index 51c3468..1c4b431 100644
--- a/tests/libqos/i2c-imx.c
+++ b/tests/libqos/i2c-imx.c
@@ -20,7 +20,6 @@
 #include "qemu/osdep.h"
 #include "libqos/i2c.h"
 
-#include <glib.h>
 
 #include "libqtest.h"
 
diff --git a/tests/libqos/i2c-omap.c b/tests/libqos/i2c-omap.c
index 2028f2f..f603fdf 100644
--- a/tests/libqos/i2c-omap.c
+++ b/tests/libqos/i2c-omap.c
@@ -9,7 +9,6 @@
 #include "qemu/osdep.h"
 #include "libqos/i2c.h"
 
-#include <glib.h>
 
 #include "qemu/bswap.h"
 #include "libqtest.h"
diff --git a/tests/libqos/libqos.c b/tests/libqos/libqos.c
index 79b0b29..c7ba441 100644
--- a/tests/libqos/libqos.c
+++ b/tests/libqos/libqos.c
@@ -1,5 +1,4 @@
 #include "qemu/osdep.h"
-#include <glib.h>
 #include <sys/wait.h>
 
 #include "libqtest.h"
diff --git a/tests/libqos/malloc-generic.c b/tests/libqos/malloc-generic.c
index 6000df2..33ce90b 100644
--- a/tests/libqos/malloc-generic.c
+++ b/tests/libqos/malloc-generic.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqos/malloc-generic.h"
 #include "libqos/malloc.h"
 
diff --git a/tests/libqos/malloc-pc.c b/tests/libqos/malloc-pc.c
index eee706b..dd2b900 100644
--- a/tests/libqos/malloc-pc.c
+++ b/tests/libqos/malloc-pc.c
@@ -17,7 +17,6 @@
 #include "hw/nvram/fw_cfg_keys.h"
 
 #include "qemu-common.h"
-#include <glib.h>
 
 #define PAGE_SIZE (4096)
 
diff --git a/tests/libqos/malloc.c b/tests/libqos/malloc.c
index 793fe69..b8eff5f 100644
--- a/tests/libqos/malloc.c
+++ b/tests/libqos/malloc.c
@@ -14,7 +14,6 @@
 #include "libqos/malloc.h"
 #include "qemu-common.h"
 #include "qemu/host-utils.h"
-#include <glib.h>
 
 typedef QTAILQ_HEAD(MemList, MemBlock) MemList;
 
diff --git a/tests/libqos/pci-pc.c b/tests/libqos/pci-pc.c
index 77f15e5..1ae2d37 100644
--- a/tests/libqos/pci-pc.c
+++ b/tests/libqos/pci-pc.c
@@ -19,7 +19,6 @@
 #include "qemu-common.h"
 #include "qemu/host-utils.h"
 
-#include <glib.h>
 
 #define ACPI_PCIHP_ADDR         0xae00
 #define PCI_EJ_BASE             0x0008
diff --git a/tests/libqos/pci.c b/tests/libqos/pci.c
index 0e104e1..ed78d91 100644
--- a/tests/libqos/pci.c
+++ b/tests/libqos/pci.c
@@ -14,7 +14,6 @@
 #include "libqos/pci.h"
 
 #include "hw/pci/pci_regs.h"
-#include <glib.h>
 
 void qpci_device_foreach(QPCIBus *bus, int vendor_id, int device_id,
                          void (*func)(QPCIDevice *dev, int devfn, void *data),
diff --git a/tests/libqos/usb.c b/tests/libqos/usb.c
index 87efb90..f794d92 100644
--- a/tests/libqos/usb.c
+++ b/tests/libqos/usb.c
@@ -12,7 +12,6 @@
  * See the COPYING file in the top-level directory.
  */
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 #include "hw/usb/uhci-regs.h"
 #include "libqos/usb.h"
diff --git a/tests/libqos/virtio-mmio.c b/tests/libqos/virtio-mmio.c
index a4382f3..e15b480 100644
--- a/tests/libqos/virtio-mmio.c
+++ b/tests/libqos/virtio-mmio.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 #include "libqos/virtio.h"
 #include "libqos/virtio-mmio.h"
diff --git a/tests/libqos/virtio-pci.c b/tests/libqos/virtio-pci.c
index fde2ff0..9d45e20 100644
--- a/tests/libqos/virtio-pci.c
+++ b/tests/libqos/virtio-pci.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 #include "libqos/virtio.h"
 #include "libqos/virtio-pci.h"
diff --git a/tests/libqos/virtio.c b/tests/libqos/virtio.c
index 613dece..d792635 100644
--- a/tests/libqos/virtio.c
+++ b/tests/libqos/virtio.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 #include "libqos/virtio.h"
 
diff --git a/tests/libqtest.c b/tests/libqtest.c
index b12a9e4..5c82348 100644
--- a/tests/libqtest.c
+++ b/tests/libqtest.c
@@ -17,7 +17,6 @@
 #include "qemu/osdep.h"
 #include "libqtest.h"
 
-#include <glib.h>
 #include <sys/socket.h>
 #include <sys/wait.h>
 #include <sys/un.h>
diff --git a/tests/m48t59-test.c b/tests/m48t59-test.c
index a751fd3..0f921ef 100644
--- a/tests/m48t59-test.c
+++ b/tests/m48t59-test.c
@@ -13,7 +13,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "libqtest.h"
 
diff --git a/tests/ne2000-test.c b/tests/ne2000-test.c
index 3727875..b7cf3dd 100644
--- a/tests/ne2000-test.c
+++ b/tests/ne2000-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
diff --git a/tests/nvme-test.c b/tests/nvme-test.c
index ec06893..c8bece4 100644
--- a/tests/nvme-test.c
+++ b/tests/nvme-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
diff --git a/tests/pc-cpu-test.c b/tests/pc-cpu-test.c
index 6b34ca5..4428cea 100644
--- a/tests/pc-cpu-test.c
+++ b/tests/pc-cpu-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qemu-common.h"
 #include "libqtest.h"
diff --git a/tests/pcnet-test.c b/tests/pcnet-test.c
index 2ddf496..efb1ef4 100644
--- a/tests/pcnet-test.c
+++ b/tests/pcnet-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
diff --git a/tests/pvpanic-test.c b/tests/pvpanic-test.c
index d435833..3bfa678 100644
--- a/tests/pvpanic-test.c
+++ b/tests/pvpanic-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 
 static void test_panic(void)
diff --git a/tests/pxe-test.c b/tests/pxe-test.c
index 875e4c4..b2cc355 100644
--- a/tests/pxe-test.c
+++ b/tests/pxe-test.c
@@ -12,7 +12,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include <glib/gstdio.h>
 #include "qemu-common.h"
 #include "libqtest.h"
diff --git a/tests/q35-test.c b/tests/q35-test.c
index a105f10..71538fc 100644
--- a/tests/q35-test.c
+++ b/tests/q35-test.c
@@ -10,7 +10,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 #include "libqos/pci.h"
 #include "libqos/pci-pc.h"
diff --git a/tests/qom-test.c b/tests/qom-test.c
index bd5cdde..23493a2 100644
--- a/tests/qom-test.c
+++ b/tests/qom-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qemu-common.h"
 #include "qemu/cutils.h"
diff --git a/tests/rcutorture.c b/tests/rcutorture.c
index 244f0f2..4002ecf 100644
--- a/tests/rcutorture.c
+++ b/tests/rcutorture.c
@@ -61,7 +61,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "qemu/atomic.h"
 #include "qemu/rcu.h"
 #include "qemu/thread.h"
diff --git a/tests/rtc-test.c b/tests/rtc-test.c
index fa7029a..a086efd 100644
--- a/tests/rtc-test.c
+++ b/tests/rtc-test.c
@@ -12,7 +12,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "libqtest.h"
 #include "hw/timer/mc146818rtc_regs.h"
diff --git a/tests/rtl8139-test.c b/tests/rtl8139-test.c
index 54e5aa7..13de7ee 100644
--- a/tests/rtl8139-test.c
+++ b/tests/rtl8139-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 #include "libqos/pci-pc.h"
 #include "qemu/timer.h"
diff --git a/tests/spapr-phb-test.c b/tests/spapr-phb-test.c
index f53911d..21004a7 100644
--- a/tests/spapr-phb-test.c
+++ b/tests/spapr-phb-test.c
@@ -8,7 +8,6 @@
  * See the COPYING file in the top-level directory.
  */
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "libqtest.h"
 
diff --git a/tests/tco-test.c b/tests/tco-test.c
index ac11175..0d13aa8 100644
--- a/tests/tco-test.c
+++ b/tests/tco-test.c
@@ -7,7 +7,6 @@
  * See the COPYING file in the top-level directory.
  */
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "libqtest.h"
 #include "libqos/pci.h"
diff --git a/tests/test-aio.c b/tests/test-aio.c
index 687dfa0..982339c 100644
--- a/tests/test-aio.c
+++ b/tests/test-aio.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "block/aio.h"
 #include "qapi/error.h"
 #include "qemu/timer.h"
diff --git a/tests/test-base64.c b/tests/test-base64.c
index 922e839..ec122ce 100644
--- a/tests/test-base64.c
+++ b/tests/test-base64.c
@@ -19,7 +19,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qapi/error.h"
 #include "qemu/base64.h"
diff --git a/tests/test-bitops.c b/tests/test-bitops.c
index 5050950..eb19a36 100644
--- a/tests/test-bitops.c
+++ b/tests/test-bitops.c
@@ -7,7 +7,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "qemu/bitops.h"
 
 typedef struct {
diff --git a/tests/test-blockjob-txn.c b/tests/test-blockjob-txn.c
index 828389b..d3030f1 100644
--- a/tests/test-blockjob-txn.c
+++ b/tests/test-blockjob-txn.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "qapi/error.h"
 #include "qemu/main-loop.h"
 #include "block/blockjob.h"
diff --git a/tests/test-coroutine.c b/tests/test-coroutine.c
index dd4ced9..91f252c 100644
--- a/tests/test-coroutine.c
+++ b/tests/test-coroutine.c
@@ -12,7 +12,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "qemu/coroutine.h"
 #include "qemu/coroutine_int.h"
 
diff --git a/tests/test-crypto-cipher.c b/tests/test-crypto-cipher.c
index 66d1c63..1b5130d 100644
--- a/tests/test-crypto-cipher.c
+++ b/tests/test-crypto-cipher.c
@@ -19,7 +19,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "crypto/init.h"
 #include "crypto/cipher.h"
diff --git a/tests/test-crypto-hash.c b/tests/test-crypto-hash.c
index 735d6d7..6e0e89f 100644
--- a/tests/test-crypto-hash.c
+++ b/tests/test-crypto-hash.c
@@ -19,7 +19,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "crypto/init.h"
 #include "crypto/hash.h"
diff --git a/tests/test-crypto-secret.c b/tests/test-crypto-secret.c
index aa26c20..0b1fe8d 100644
--- a/tests/test-crypto-secret.c
+++ b/tests/test-crypto-secret.c
@@ -19,7 +19,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "crypto/init.h"
 #include "crypto/secret.h"
diff --git a/tests/test-cutils.c b/tests/test-cutils.c
index fb8f5b5..64e3e95 100644
--- a/tests/test-cutils.c
+++ b/tests/test-cutils.c
@@ -26,7 +26,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qemu/cutils.h"
 
diff --git a/tests/test-filter-mirror.c b/tests/test-filter-mirror.c
index f60bf2a..ffaaffa 100644
--- a/tests/test-filter-mirror.c
+++ b/tests/test-filter-mirror.c
@@ -9,7 +9,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 #include "qemu/iov.h"
 #include "qemu/sockets.h"
diff --git a/tests/test-filter-redirector.c b/tests/test-filter-redirector.c
index b93012c..280e4b6 100644
--- a/tests/test-filter-redirector.c
+++ b/tests/test-filter-redirector.c
@@ -51,7 +51,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 #include "qemu/iov.h"
 #include "qemu/sockets.h"
diff --git a/tests/test-hbitmap.c b/tests/test-hbitmap.c
index abe1427..71d0098 100644
--- a/tests/test-hbitmap.c
+++ b/tests/test-hbitmap.c
@@ -10,7 +10,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "qemu/hbitmap.h"
 
 #define LOG_BITS_PER_LONG          (BITS_PER_LONG == 32 ? 5 : 6)
diff --git a/tests/test-int128.c b/tests/test-int128.c
index cacf6be..4390123 100644
--- a/tests/test-int128.c
+++ b/tests/test-int128.c
@@ -7,7 +7,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "qemu/int128.h"
 
 /* clang doesn't support __noclone__ but it does have a mechanism for
diff --git a/tests/test-io-task.c b/tests/test-io-task.c
index 5a97750..a36cb82 100644
--- a/tests/test-io-task.c
+++ b/tests/test-io-task.c
@@ -19,7 +19,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "io/task.h"
 #include "qapi/error.h"
diff --git a/tests/test-iov.c b/tests/test-iov.c
index 3f25268..46ae25e 100644
--- a/tests/test-iov.c
+++ b/tests/test-iov.c
@@ -1,5 +1,4 @@
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "qemu-common.h"
 #include "qemu/iov.h"
 #include "qemu/sockets.h"
diff --git a/tests/test-logging.c b/tests/test-logging.c
index ac8deed..5ef5bb8 100644
--- a/tests/test-logging.c
+++ b/tests/test-logging.c
@@ -25,7 +25,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qemu-common.h"
 #include "include/qemu/log.h"
diff --git a/tests/test-mul64.c b/tests/test-mul64.c
index 1282ec5..9be775d 100644
--- a/tests/test-mul64.c
+++ b/tests/test-mul64.c
@@ -7,7 +7,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "qemu/host-utils.h"
 
 
diff --git a/tests/test-netfilter.c b/tests/test-netfilter.c
index 7d105c3..8b5a9b2 100644
--- a/tests/test-netfilter.c
+++ b/tests/test-netfilter.c
@@ -9,7 +9,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 
 /* add a netfilter to a netdev and then remove it */
diff --git a/tests/test-opts-visitor.c b/tests/test-opts-visitor.c
index 008e677..d75b114 100644
--- a/tests/test-opts-visitor.c
+++ b/tests/test-opts-visitor.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qemu/config-file.h"     /* qemu_add_opts() */
 #include "qemu/option.h"          /* qemu_opts_parse() */
diff --git a/tests/test-qdev-global-props.c b/tests/test-qdev-global-props.c
index f0cc31e..48e5b73 100644
--- a/tests/test-qdev-global-props.c
+++ b/tests/test-qdev-global-props.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "hw/qdev.h"
 #include "qom/object.h"
diff --git a/tests/test-qemu-opts.c b/tests/test-qemu-opts.c
index 32abed5..a505a3e 100644
--- a/tests/test-qemu-opts.c
+++ b/tests/test-qemu-opts.c
@@ -12,7 +12,6 @@
 #include "qapi/qmp/qstring.h"
 #include "qemu/config-file.h"
 
-#include <glib.h>
 
 static QemuOptsList opts_list_01 = {
     .name = "opts_list_01",
diff --git a/tests/test-qga.c b/tests/test-qga.c
index 72a89de..9c9039f 100644
--- a/tests/test-qga.c
+++ b/tests/test-qga.c
@@ -1,6 +1,5 @@
 #include "qemu/osdep.h"
 #include <locale.h>
-#include <glib.h>
 #include <glib/gstdio.h>
 #include <sys/socket.h>
 #include <sys/un.h>
diff --git a/tests/test-qmp-commands.c b/tests/test-qmp-commands.c
index 5c3edd7..e8f619d 100644
--- a/tests/test-qmp-commands.c
+++ b/tests/test-qmp-commands.c
@@ -1,5 +1,4 @@
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "qemu-common.h"
 #include "qapi/qmp/types.h"
 #include "test-qmp-commands.h"
diff --git a/tests/test-qmp-event.c b/tests/test-qmp-event.c
index a296fdb..633dc87 100644
--- a/tests/test-qmp-event.c
+++ b/tests/test-qmp-event.c
@@ -12,7 +12,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qemu-common.h"
 #include "test-qapi-types.h"
diff --git a/tests/test-qmp-input-strict.c b/tests/test-qmp-input-strict.c
index 4602529..d5f57c5 100644
--- a/tests/test-qmp-input-strict.c
+++ b/tests/test-qmp-input-strict.c
@@ -12,7 +12,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qemu-common.h"
 #include "qapi/error.h"
diff --git a/tests/test-qmp-input-visitor.c b/tests/test-qmp-input-visitor.c
index cee07ce..3b6b39e 100644
--- a/tests/test-qmp-input-visitor.c
+++ b/tests/test-qmp-input-visitor.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qemu-common.h"
 #include "qapi/error.h"
diff --git a/tests/test-qmp-output-visitor.c b/tests/test-qmp-output-visitor.c
index 1f80e69..f8a7a27 100644
--- a/tests/test-qmp-output-visitor.c
+++ b/tests/test-qmp-output-visitor.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qemu-common.h"
 #include "qapi/error.h"
diff --git a/tests/test-rcu-list.c b/tests/test-rcu-list.c
index 79d3750..1514d7e 100644
--- a/tests/test-rcu-list.c
+++ b/tests/test-rcu-list.c
@@ -21,7 +21,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "qemu/atomic.h"
 #include "qemu/rcu.h"
 #include "qemu/thread.h"
diff --git a/tests/test-rfifolock.c b/tests/test-rfifolock.c
index 9a3cb24..471a811 100644
--- a/tests/test-rfifolock.c
+++ b/tests/test-rfifolock.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "qemu-common.h"
 #include "qemu/rfifolock.h"
 
diff --git a/tests/test-string-input-visitor.c b/tests/test-string-input-visitor.c
index 5a56920..7fe7a9c 100644
--- a/tests/test-string-input-visitor.c
+++ b/tests/test-string-input-visitor.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qemu-common.h"
 #include "qapi/error.h"
diff --git a/tests/test-string-output-visitor.c b/tests/test-string-output-visitor.c
index 1ecd75b..edff523 100644
--- a/tests/test-string-output-visitor.c
+++ b/tests/test-string-output-visitor.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qemu-common.h"
 #include "qapi/error.h"
diff --git a/tests/test-thread-pool.c b/tests/test-thread-pool.c
index 88dc731..b0e1f32 100644
--- a/tests/test-thread-pool.c
+++ b/tests/test-thread-pool.c
@@ -1,5 +1,4 @@
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "qemu-common.h"
 #include "block/aio.h"
 #include "block/thread-pool.h"
diff --git a/tests/test-throttle.c b/tests/test-throttle.c
index c02be80..e9ac0a0 100644
--- a/tests/test-throttle.c
+++ b/tests/test-throttle.c
@@ -13,7 +13,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include <math.h>
 #include "block/aio.h"
 #include "qapi/error.h"
diff --git a/tests/test-timed-average.c b/tests/test-timed-average.c
index 1cc4ab3..e2bcf5f 100644
--- a/tests/test-timed-average.c
+++ b/tests/test-timed-average.c
@@ -11,7 +11,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qemu/timed-average.h"
 
diff --git a/tests/test-visitor-serialization.c b/tests/test-visitor-serialization.c
index 7b14b5a..777469f 100644
--- a/tests/test-visitor-serialization.c
+++ b/tests/test-visitor-serialization.c
@@ -12,7 +12,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include <float.h>
 
 #include "qemu-common.h"
diff --git a/tests/test-vmstate.c b/tests/test-vmstate.c
index d19b16a..41fd841 100644
--- a/tests/test-vmstate.c
+++ b/tests/test-vmstate.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qemu-common.h"
 #include "migration/migration.h"
diff --git a/tests/test-write-threshold.c b/tests/test-write-threshold.c
index fdbc802..97ca12f 100644
--- a/tests/test-write-threshold.c
+++ b/tests/test-write-threshold.c
@@ -7,7 +7,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "block/block_int.h"
 #include "block/write-threshold.h"
 
diff --git a/tests/test-x86-cpuid.c b/tests/test-x86-cpuid.c
index 8eb0bc6..ff22500 100644
--- a/tests/test-x86-cpuid.c
+++ b/tests/test-x86-cpuid.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "hw/i386/topology.h"
 
diff --git a/tests/tmp105-test.c b/tests/tmp105-test.c
index 235cae0..a7940a4 100644
--- a/tests/tmp105-test.c
+++ b/tests/tmp105-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "libqtest.h"
 #include "libqos/i2c.h"
diff --git a/tests/tpci200-test.c b/tests/tpci200-test.c
index cb2b00c..0321ec2 100644
--- a/tests/tpci200-test.c
+++ b/tests/tpci200-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
diff --git a/tests/usb-hcd-ehci-test.c b/tests/usb-hcd-ehci-test.c
index a0f13ef..eb247ad 100644
--- a/tests/usb-hcd-ehci-test.c
+++ b/tests/usb-hcd-ehci-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 #include "libqos/pci-pc.h"
 #include "hw/usb/uhci-regs.h"
diff --git a/tests/usb-hcd-ohci-test.c b/tests/usb-hcd-ohci-test.c
index efd6669..4758813 100644
--- a/tests/usb-hcd-ohci-test.c
+++ b/tests/usb-hcd-ohci-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 #include "libqos/usb.h"
 
diff --git a/tests/usb-hcd-uhci-test.c b/tests/usb-hcd-uhci-test.c
index 71ff2ea..5cd59ad 100644
--- a/tests/usb-hcd-uhci-test.c
+++ b/tests/usb-hcd-uhci-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 #include "libqos/usb.h"
 #include "hw/usb/uhci-regs.h"
diff --git a/tests/usb-hcd-xhci-test.c b/tests/usb-hcd-xhci-test.c
index 7e2e212..22513e9 100644
--- a/tests/usb-hcd-xhci-test.c
+++ b/tests/usb-hcd-xhci-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 #include "libqos/usb.h"
 
diff --git a/tests/vhost-user-test.c b/tests/vhost-user-test.c
index 6961596..2724fe9 100644
--- a/tests/vhost-user-test.c
+++ b/tests/vhost-user-test.c
@@ -9,7 +9,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "libqtest.h"
 #include "qemu/option.h"
diff --git a/tests/virtio-9p-test.c b/tests/virtio-9p-test.c
index 59d0f1f..1e39335 100644
--- a/tests/virtio-9p-test.c
+++ b/tests/virtio-9p-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 #include "qemu-common.h"
 
diff --git a/tests/virtio-balloon-test.c b/tests/virtio-balloon-test.c
index b010ce9..0d0046b 100644
--- a/tests/virtio-balloon-test.c
+++ b/tests/virtio-balloon-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
diff --git a/tests/virtio-blk-test.c b/tests/virtio-blk-test.c
index 3a66630..8272ba8 100644
--- a/tests/virtio-blk-test.c
+++ b/tests/virtio-blk-test.c
@@ -9,7 +9,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 #include "libqos/virtio.h"
 #include "libqos/virtio-pci.h"
diff --git a/tests/virtio-console-test.c b/tests/virtio-console-test.c
index 0b9c2a5..6d6414d 100644
--- a/tests/virtio-console-test.c
+++ b/tests/virtio-console-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
diff --git a/tests/virtio-net-test.c b/tests/virtio-net-test.c
index 04cfcd5..e5c1448 100644
--- a/tests/virtio-net-test.c
+++ b/tests/virtio-net-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 #include "qemu-common.h"
 #include "qemu/sockets.h"
diff --git a/tests/virtio-rng-test.c b/tests/virtio-rng-test.c
index 771dbd7..e1b2640 100644
--- a/tests/virtio-rng-test.c
+++ b/tests/virtio-rng-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 #include "libqos/pci.h"
 
diff --git a/tests/virtio-scsi-test.c b/tests/virtio-scsi-test.c
index d78747a..5f1a8ae 100644
--- a/tests/virtio-scsi-test.c
+++ b/tests/virtio-scsi-test.c
@@ -9,7 +9,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 #include "block/scsi.h"
 #include "libqos/virtio.h"
diff --git a/tests/virtio-serial-test.c b/tests/virtio-serial-test.c
index 480d4ab..b14d943 100644
--- a/tests/virtio-serial-test.c
+++ b/tests/virtio-serial-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
diff --git a/tests/vmxnet3-test.c b/tests/vmxnet3-test.c
index 6ef0e2f..159c0ad 100644
--- a/tests/vmxnet3-test.c
+++ b/tests/vmxnet3-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
diff --git a/tests/wdt_ib700-test.c b/tests/wdt_ib700-test.c
index efe3370..9c1d78b 100644
--- a/tests/wdt_ib700-test.c
+++ b/tests/wdt_ib700-test.c
@@ -8,7 +8,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "libqtest.h"
 #include "qemu/timer.h"
 
-- 
2.1.4


