Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YnwpU-00053v-45
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 18:21:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YnwpO-00052Z-LV
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 18:21:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YnwpK-0004Iz-FE
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 18:21:06 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:44397)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YnwpK-0004In-8K
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 18:21:02 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id AE30A20C84
	for <qemu-trivial@nongnu.org>; Thu, 30 Apr 2015 18:21:01 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute6.internal (MEProxy); Thu, 30 Apr 2015 18:21:01 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=VneO3jOal0QHbfh+
	FNdO6rHdY7w=; b=yERwQcdpDq1hlPwUOQ0TLjjey/F+5ZPQkN/rp8WcENxXjUfL
	/hxwgcHtRrwwsZyAHoCXobSnL3whPkNS9vHmcnh8RmUig5HPLZ96iEnTRxFdBRh2
	0VQxAToRL8blzmp/VmiwisTRYUVNI3zMtA2Wd342MYPOUa2XcDlH3JhUn1I=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:subject:to:x-sasl-enc:x-sasl-enc; s=
	smtpout; bh=VneO3jOal0QHbfh+FNdO6rHdY7w=; b=HUj7IzUXlwPQZNNZRYwF
	1BvdjDWbEk8/eaqiRbEdPfBpageFMomYlXQzQfNIORXZiwTSl8l2vXbC6R7H817t
	4ROD/zfVB8QO2CErwsqP3pLJBK9xr3dN0yTkcJNL7/gZGMKsvDkhRmrnPx6YW3zx
	EsC/0xOMlkn0AXGiE0Sur/k=
X-Sasl-enc: k766/tjlSUjWrnOhcb/Dj0NwUeIPKd/6NZpanrPNUZhy 1430432461
Received: from localhost (unknown [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 61E916800F4;
	Thu, 30 Apr 2015 18:21:01 -0400 (EDT)
Date: Thu, 30 Apr 2015 18:21:38 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20150430222138.GA9389@flamenco>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-49fPQBmWLec2iSkVvt2QPkskq9-_JVVWuyjsyRh9wCA@mail.gmail.com>
	<55428253.5020300@weilnetz.de> <55428D0E.8070706@msgid.tls.msk.ru>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.111.4.25
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Stefan Weil <sw@weilnetz.de>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH] tests: consolidate common includes under
	libqtest.h
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
X-List-Received-Date: Thu, 30 Apr 2015 22:21:10 -0000

On Thu, Apr 30, 2015 at 23:14:06 +0300, Michael Tokarev wrote:
> 30.04.2015 22:16, Emilio G. Cota wrote:
> > ARRAY_SIZE is defined in osdep.h so having an unconditional
> > definition here is fragile.
>
> Fragile in what sense?  Nothing in that file includes osdep.h.

Fragile in that future, unrelated header changes will make this
redefinition show up.

> Somehow initially I thought this patch actually FIXES a warning
> of this sort.  But it looks lile it is only fixes a potential
> warning. Oh well...  :)

I was hit by this warning-turned-error, although wasn't using 100%
upstream code, see below.

On Thu, Apr 30, 2015 at 21:02:44 +0100, Peter Maydell wrote:
> On 30 April 2015 at 20:28, Stefan Weil <sw@weilnetz.de> wrote:
> > Am 30.04.2015 um 21:16 schrieb Emilio G. Cota:
> >>
> >> ARRAY_SIZE is defined in osdep.h so having an unconditional
> >> definition here is fragile.
> 
> FWIW, the original patch of this failed to build on x86 too,
> so I don't think we currently include osdep.h from this file in
> any circumstances... Where do you get the ARRAY_SIZE definition
> from that presumably lets you build without this one?

I probably got ARRAY_SIZE from CCAN's headers, was tinkering
with it.
(CCAN http://ccodearchive.net/ is a library of useful modules, and
array_size is one of them.)

> Can we include qemu-common.h in these libqos standalone test
> executables? I forget... The rtl8139 test seems to though, so
> I guess it's OK.

On Thu, Apr 30, 2015 at 21:28:19 +0200, Stefan Weil wrote:
> Why not include osdep.h via qemu-common.h and remove all other
> include statements which then are no longer needed? I'd prefer that
> variant.

Something like the appended?

Cheers,

		Emilio

commit eb415d0695bb49d9df78aedaf4ed3c7083a1a574
Author: Emilio G. Cota <cota@braap.org>
Date:   Thu Apr 30 18:00:01 2015 -0400

    tests: consolidate common includes under libqtest.h
    
    Source files in tests/ include very common headers,
    such as glib.h or qemu/osdep.h.
    
    Consolidate these includes by including qemu-common.h from
    libqtest.h, which is a common include in tests/.
    
    Two things worth mentioning:
    
    - i440fx-test drops its ARRAY_SIZE definition, which comes now
      from osdep.h via qemu-common.h.
    
    - vhost-user-test.c does keep its include of glib.h, since
      it has to do some contortions to support old glib versions.
      See commit "bd95939f qtest: fix qtest for vhost-user".
    
    Signed-off-by: Emilio G. Cota <cota@braap.org>

diff --git a/tests/ac97-test.c b/tests/ac97-test.c
index af30ea1..4cc1a42 100644
--- a/tests/ac97-test.c
+++ b/tests/ac97-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void nop(void)
diff --git a/tests/ahci-test.c b/tests/ahci-test.c
index 7c23bb2..2ac5fc2 100644
--- a/tests/ahci-test.c
+++ b/tests/ahci-test.c
@@ -22,18 +22,13 @@
  * THE SOFTWARE.
  */
 
-#include <stdint.h>
-#include <string.h>
-#include <stdio.h>
 #include <getopt.h>
-#include <glib.h>
 
 #include "libqtest.h"
 #include "libqos/libqos-pc.h"
 #include "libqos/ahci.h"
 #include "libqos/pci-pc.h"
 
-#include "qemu-common.h"
 #include "qemu/host-utils.h"
 
 #include "hw/pci/pci_ids.h"
diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
index 735ac61..e623a79 100644
--- a/tests/bios-tables-test.c
+++ b/tests/bios-tables-test.c
@@ -10,13 +10,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <string.h>
-#include <stdio.h>
-#include <glib.h>
 #include <glib/gstdio.h>
-#include "qemu-common.h"
 #include "libqtest.h"
-#include "qemu/compiler.h"
 #include "hw/i386/acpi-defs.h"
 #include "hw/i386/smbios.h"
 #include "qemu/bitmap.h"
diff --git a/tests/boot-order-test.c b/tests/boot-order-test.c
index 360a691..3637fa5 100644
--- a/tests/boot-order-test.c
+++ b/tests/boot-order-test.c
@@ -10,8 +10,6 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <string.h>
-#include <glib.h>
 #include "libqos/fw_cfg.h"
 #include "libqtest.h"
 
diff --git a/tests/display-vga-test.c b/tests/display-vga-test.c
index 17f5910..5b163e4 100644
--- a/tests/display-vga-test.c
+++ b/tests/display-vga-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 
 static void pci_cirrus(void)
 {
diff --git a/tests/drive_del-test.c b/tests/drive_del-test.c
index 8951f6f..b10ec42 100644
--- a/tests/drive_del-test.c
+++ b/tests/drive_del-test.c
@@ -10,8 +10,6 @@
  * See the COPYING.LIB file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
 
 static void drive_add(void)
diff --git a/tests/e1000-test.c b/tests/e1000-test.c
index 81f164d..814c278 100644
--- a/tests/e1000-test.c
+++ b/tests/e1000-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void test_device(gconstpointer data)
diff --git a/tests/eepro100-test.c b/tests/eepro100-test.c
index bf82526..086dc67 100644
--- a/tests/eepro100-test.c
+++ b/tests/eepro100-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 
 static void test_device(gconstpointer data)
 {
diff --git a/tests/endianness-test.c b/tests/endianness-test.c
index 92e17d2..c1159ab 100644
--- a/tests/endianness-test.c
+++ b/tests/endianness-test.c
@@ -11,14 +11,7 @@
  *
  */
 
-#include <glib.h>
-#include <stdio.h>
-#include <string.h>
-#include <stdlib.h>
-#include <unistd.h>
-
 #include "libqtest.h"
-#include "qemu/bswap.h"
 
 typedef struct TestCase TestCase;
 struct TestCase {
diff --git a/tests/es1370-test.c b/tests/es1370-test.c
index cc23fb5..597525c 100644
--- a/tests/es1370-test.c
+++ b/tests/es1370-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void nop(void)
diff --git a/tests/fdc-test.c b/tests/fdc-test.c
index 3c6c83c..9e6a53b 100644
--- a/tests/fdc-test.c
+++ b/tests/fdc-test.c
@@ -22,14 +22,7 @@
  * THE SOFTWARE.
  */
 
-#include <stdint.h>
-#include <string.h>
-#include <stdio.h>
-
-#include <glib.h>
-
 #include "libqtest.h"
-#include "qemu-common.h"
 
 #define TEST_IMAGE_SIZE 1440 * 1024
 
diff --git a/tests/fw_cfg-test.c b/tests/fw_cfg-test.c
index 9be78e9..4a1899a 100644
--- a/tests/fw_cfg-test.c
+++ b/tests/fw_cfg-test.c
@@ -10,9 +10,6 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <string.h>
-#include <glib.h>
-
 #include "libqtest.h"
 #define NO_QEMU_PROTOS
 #include "hw/nvram/fw_cfg.h"
diff --git a/tests/hd-geo-test.c b/tests/hd-geo-test.c
index 00afc20..16f5c96 100644
--- a/tests/hd-geo-test.c
+++ b/tests/hd-geo-test.c
@@ -15,11 +15,6 @@
  * Improvements welcome.
  */
 
-#include <glib.h>
-#include <stdlib.h>
-#include <string.h>
-#include <unistd.h>
-#include "qemu-common.h"
 #include "libqtest.h"
 
 static char *create_test_img(int secs)
diff --git a/tests/i440fx-test.c b/tests/i440fx-test.c
index d0bc8de..fe8fa4d 100644
--- a/tests/i440fx-test.c
+++ b/tests/i440fx-test.c
@@ -12,13 +12,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
-#include <stdio.h>
-#include <unistd.h>
-#include <errno.h>
 #include <sys/mman.h>
-#include <stdlib.h>
 
 #include "libqtest.h"
 #include "libqos/pci.h"
@@ -27,8 +21,6 @@
 
 #define BROKEN 1
 
-#define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
-
 typedef struct TestData
 {
     int num_cpus;
diff --git a/tests/i82801b11-test.c b/tests/i82801b11-test.c
index 78d9ce0..359bb97 100644
--- a/tests/i82801b11-test.c
+++ b/tests/i82801b11-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void nop(void)
diff --git a/tests/ide-test.c b/tests/ide-test.c
index 78382e9..c3549f9 100644
--- a/tests/ide-test.c
+++ b/tests/ide-test.c
@@ -22,18 +22,11 @@
  * THE SOFTWARE.
  */
 
-#include <stdint.h>
-#include <string.h>
-#include <stdio.h>
-
-#include <glib.h>
-
 #include "libqtest.h"
 #include "libqos/libqos.h"
 #include "libqos/pci-pc.h"
 #include "libqos/malloc-pc.h"
 
-#include "qemu-common.h"
 #include "hw/pci/pci_ids.h"
 #include "hw/pci/pci_regs.h"
 
diff --git a/tests/intel-hda-test.c b/tests/intel-hda-test.c
index d89b407..53acd86 100644
--- a/tests/intel-hda-test.c
+++ b/tests/intel-hda-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 
 #define HDA_ID "hda0"
 #define CODEC_DEVICES " -device hda-output,bus=" HDA_ID ".0" \
diff --git a/tests/ioh3420-test.c b/tests/ioh3420-test.c
index c991a5f..f7a9a7e 100644
--- a/tests/ioh3420-test.c
+++ b/tests/ioh3420-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void nop(void)
diff --git a/tests/ipoctal232-test.c b/tests/ipoctal232-test.c
index 3ac1714..9263a8a 100644
--- a/tests/ipoctal232-test.c
+++ b/tests/ipoctal232-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void nop(void)
diff --git a/tests/libqos/ahci.c b/tests/libqos/ahci.c
index 843cf72..011fe56 100644
--- a/tests/libqos/ahci.c
+++ b/tests/libqos/ahci.c
@@ -22,13 +22,10 @@
  * THE SOFTWARE.
  */
 
-#include <glib.h>
-
 #include "libqtest.h"
 #include "libqos/ahci.h"
 #include "libqos/pci-pc.h"
 
-#include "qemu-common.h"
 #include "qemu/host-utils.h"
 
 #include "hw/pci/pci_ids.h"
diff --git a/tests/libqos/fw_cfg.c b/tests/libqos/fw_cfg.c
index ef00fed..803ac6a 100644
--- a/tests/libqos/fw_cfg.c
+++ b/tests/libqos/fw_cfg.c
@@ -12,10 +12,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
 #include "libqos/fw_cfg.h"
 #include "libqtest.h"
-#include "qemu/bswap.h"
 
 void qfw_cfg_select(QFWCFG *fw_cfg, uint16_t key)
 {
diff --git a/tests/libqos/i2c-omap.c b/tests/libqos/i2c-omap.c
index 3d4d45d..4de46e4 100644
--- a/tests/libqos/i2c-omap.c
+++ b/tests/libqos/i2c-omap.c
@@ -8,11 +8,6 @@
  */
 #include "libqos/i2c.h"
 
-#include <glib.h>
-#include <string.h>
-
-#include "qemu/osdep.h"
-#include "qemu/bswap.h"
 #include "libqtest.h"
 
 enum OMAPI2CRegisters {
diff --git a/tests/libqos/libqos.c b/tests/libqos/libqos.c
index 7e72078..4523a2b 100644
--- a/tests/libqos/libqos.c
+++ b/tests/libqos/libqos.c
@@ -1,8 +1,3 @@
-#include <stdio.h>
-#include <stdlib.h>
-#include <glib.h>
-#include <unistd.h>
-#include <fcntl.h>
 #include <sys/wait.h>
 
 #include "libqtest.h"
diff --git a/tests/libqos/pci-pc.c b/tests/libqos/pci-pc.c
index 6dba0db..395e5f1 100644
--- a/tests/libqos/pci-pc.c
+++ b/tests/libqos/pci-pc.c
@@ -15,11 +15,8 @@
 
 #include "hw/pci/pci_regs.h"
 
-#include "qemu-common.h"
 #include "qemu/host-utils.h"
 
-#include <glib.h>
-
 #define ACPI_PCIHP_ADDR         0xae00
 #define PCI_EJ_BASE             0x0008
 
diff --git a/tests/libqos/usb.c b/tests/libqos/usb.c
index 41d89b8..4ffae88 100644
--- a/tests/libqos/usb.c
+++ b/tests/libqos/usb.c
@@ -11,10 +11,7 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  */
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 #include "hw/usb/uhci-regs.h"
 #include "libqos/usb.h"
 
diff --git a/tests/libqos/virtio-mmio.c b/tests/libqos/virtio-mmio.c
index b3e62e7..ac1c9a3 100644
--- a/tests/libqos/virtio-mmio.c
+++ b/tests/libqos/virtio-mmio.c
@@ -7,8 +7,6 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <stdio.h>
 #include "libqtest.h"
 #include "libqos/virtio.h"
 #include "libqos/virtio-mmio.h"
diff --git a/tests/libqos/virtio-pci.c b/tests/libqos/virtio-pci.c
index f9fb924..573b238 100644
--- a/tests/libqos/virtio-pci.c
+++ b/tests/libqos/virtio-pci.c
@@ -7,8 +7,6 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <stdio.h>
 #include "libqtest.h"
 #include "libqos/virtio.h"
 #include "libqos/virtio-pci.h"
diff --git a/tests/libqos/virtio.c b/tests/libqos/virtio.c
index 3205b88..80a1fe6 100644
--- a/tests/libqos/virtio.c
+++ b/tests/libqos/virtio.c
@@ -7,7 +7,6 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
 #include "libqtest.h"
 #include "libqos/virtio.h"
 
diff --git a/tests/libqtest.c b/tests/libqtest.c
index a525dc5..03b6064 100644
--- a/tests/libqtest.c
+++ b/tests/libqtest.c
@@ -16,20 +16,11 @@
  */
 #include "libqtest.h"
 
-#include <glib.h>
 #include <sys/types.h>
 #include <sys/socket.h>
 #include <sys/wait.h>
 #include <sys/un.h>
-#include <inttypes.h>
-#include <errno.h>
-#include <stdio.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include <string.h>
-
-#include "qemu/compiler.h"
-#include "qemu/osdep.h"
+
 #include "qapi/qmp/json-parser.h"
 #include "qapi/qmp/json-streamer.h"
 #include "qapi/qmp/qjson.h"
diff --git a/tests/libqtest.h b/tests/libqtest.h
index 4b54b5d..c56eb7e 100644
--- a/tests/libqtest.h
+++ b/tests/libqtest.h
@@ -19,11 +19,9 @@
 
 #include <stddef.h>
 #include <stdint.h>
-#include <stdbool.h>
-#include <stdarg.h>
 #include <sys/types.h>
 #include "qapi/qmp/qdict.h"
-#include "glib-compat.h"
+#include "qemu-common.h"
 
 typedef struct QTestState QTestState;
 
diff --git a/tests/m48t59-test.c b/tests/m48t59-test.c
index 71b4f28..8626722 100644
--- a/tests/m48t59-test.c
+++ b/tests/m48t59-test.c
@@ -12,12 +12,6 @@
  *
  */
 
-#include <glib.h>
-#include <stdio.h>
-#include <string.h>
-#include <stdlib.h>
-#include <unistd.h>
-
 #include "libqtest.h"
 
 #define RTC_SECONDS             0x9
diff --git a/tests/ne2000-test.c b/tests/ne2000-test.c
index 61a678a..1469130 100644
--- a/tests/ne2000-test.c
+++ b/tests/ne2000-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void pci_nop(void)
diff --git a/tests/nvme-test.c b/tests/nvme-test.c
index ff38b5e..38b25d6 100644
--- a/tests/nvme-test.c
+++ b/tests/nvme-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void nop(void)
diff --git a/tests/pc-cpu-test.c b/tests/pc-cpu-test.c
index a0122d3..3cd9018 100644
--- a/tests/pc-cpu-test.c
+++ b/tests/pc-cpu-test.c
@@ -7,12 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
-
-#include "qemu-common.h"
 #include "libqtest.h"
-#include "qemu/osdep.h"
 #include "qapi/qmp/types.h"
 
 struct PCTestData {
diff --git a/tests/pcnet-test.c b/tests/pcnet-test.c
index 84af4f3..d13d872 100644
--- a/tests/pcnet-test.c
+++ b/tests/pcnet-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void pci_nop(void)
diff --git a/tests/pvpanic-test.c b/tests/pvpanic-test.c
index a7ad6b3..57bd991 100644
--- a/tests/pvpanic-test.c
+++ b/tests/pvpanic-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 
 static void test_panic(void)
 {
diff --git a/tests/qom-test.c b/tests/qom-test.c
index 4246382..0f85dbd 100644
--- a/tests/qom-test.c
+++ b/tests/qom-test.c
@@ -7,12 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
-
-#include "qemu-common.h"
 #include "libqtest.h"
-#include "qemu/osdep.h"
 #include "qapi/qmp/types.h"
 
 static const char *blacklist_x86[] = {
diff --git a/tests/rtc-test.c b/tests/rtc-test.c
index 4243624..f6ac508 100644
--- a/tests/rtc-test.c
+++ b/tests/rtc-test.c
@@ -11,12 +11,6 @@
  *
  */
 
-#include <glib.h>
-#include <stdio.h>
-#include <string.h>
-#include <stdlib.h>
-#include <unistd.h>
-
 #include "libqtest.h"
 #include "hw/timer/mc146818rtc_regs.h"
 
diff --git a/tests/rtl8139-test.c b/tests/rtl8139-test.c
index 4e0bf02..20058a8 100644
--- a/tests/rtl8139-test.c
+++ b/tests/rtl8139-test.c
@@ -7,12 +7,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
 #include "libqos/pci-pc.h"
-#include "qemu/osdep.h"
-#include "qemu-common.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void nop(void)
diff --git a/tests/spapr-phb-test.c b/tests/spapr-phb-test.c
index b629de4..0a679c6 100644
--- a/tests/spapr-phb-test.c
+++ b/tests/spapr-phb-test.c
@@ -7,7 +7,6 @@
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
  */
-#include <glib.h>
 
 #include "libqtest.h"
 
diff --git a/tests/tmp105-test.c b/tests/tmp105-test.c
index 99db538..41a7a43 100644
--- a/tests/tmp105-test.c
+++ b/tests/tmp105-test.c
@@ -7,8 +7,6 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-
 #include "libqtest.h"
 #include "libqos/i2c.h"
 #include "hw/misc/tmp105_regs.h"
diff --git a/tests/tpci200-test.c b/tests/tpci200-test.c
index 9ae0127..312f9d3 100644
--- a/tests/tpci200-test.c
+++ b/tests/tpci200-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void nop(void)
diff --git a/tests/usb-hcd-ehci-test.c b/tests/usb-hcd-ehci-test.c
index 75073bf..c79ca79 100644
--- a/tests/usb-hcd-ehci-test.c
+++ b/tests/usb-hcd-ehci-test.c
@@ -7,12 +7,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
-#include <stdio.h>
 #include "libqtest.h"
 #include "libqos/pci-pc.h"
-#include "qemu/osdep.h"
 #include "hw/usb/uhci-regs.h"
 #include "hw/usb/ehci-regs.h"
 #include "libqos/usb.h"
diff --git a/tests/usb-hcd-ohci-test.c b/tests/usb-hcd-ohci-test.c
index fa592d4..27d0e81 100644
--- a/tests/usb-hcd-ohci-test.c
+++ b/tests/usb-hcd-ohci-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 #include "libqos/usb.h"
 
 
diff --git a/tests/usb-hcd-uhci-test.c b/tests/usb-hcd-uhci-test.c
index a96b716..b595687 100644
--- a/tests/usb-hcd-uhci-test.c
+++ b/tests/usb-hcd-uhci-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 #include "libqos/usb.h"
 #include "hw/usb/uhci-regs.h"
 
diff --git a/tests/usb-hcd-xhci-test.c b/tests/usb-hcd-xhci-test.c
index 56ab367..50e6700 100644
--- a/tests/usb-hcd-xhci-test.c
+++ b/tests/usb-hcd-xhci-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 #include "libqos/usb.h"
 
 
diff --git a/tests/vhost-user-test.c b/tests/vhost-user-test.c
index 75fedf0..636df12 100644
--- a/tests/vhost-user-test.c
+++ b/tests/vhost-user-test.c
@@ -12,7 +12,6 @@
 #include <glib.h>
 
 #include "libqtest.h"
-#include "qemu/option.h"
 #include "sysemu/char.h"
 #include "sysemu/sysemu.h"
 
diff --git a/tests/virtio-9p-test.c b/tests/virtio-9p-test.c
index 1fae477..80c17e2 100644
--- a/tests/virtio-9p-test.c
+++ b/tests/virtio-9p-test.c
@@ -7,12 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <stdlib.h>
-#include <string.h>
-#include <glib.h>
 #include "libqtest.h"
-#include "qemu-common.h"
-#include "qemu/osdep.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void pci_nop(void)
diff --git a/tests/virtio-balloon-test.c b/tests/virtio-balloon-test.c
index becebb5..6e2aefb 100644
--- a/tests/virtio-balloon-test.c
+++ b/tests/virtio-balloon-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void pci_nop(void)
diff --git a/tests/virtio-blk-test.c b/tests/virtio-blk-test.c
index 4078321..ceba28f 100644
--- a/tests/virtio-blk-test.c
+++ b/tests/virtio-blk-test.c
@@ -8,11 +8,6 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include <stdio.h>
 #include "libqtest.h"
 #include "libqos/virtio.h"
 #include "libqos/virtio-pci.h"
@@ -21,7 +16,6 @@
 #include "libqos/malloc.h"
 #include "libqos/malloc-pc.h"
 #include "libqos/malloc-generic.h"
-#include "qemu/bswap.h"
 
 #define QVIRTIO_BLK_F_BARRIER       0x00000001
 #define QVIRTIO_BLK_F_SIZE_MAX      0x00000002
diff --git a/tests/virtio-console-test.c b/tests/virtio-console-test.c
index 6be96e8..02f6fda 100644
--- a/tests/virtio-console-test.c
+++ b/tests/virtio-console-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void console_pci_nop(void)
diff --git a/tests/virtio-net-test.c b/tests/virtio-net-test.c
index ea7478c..a9979f2 100644
--- a/tests/virtio-net-test.c
+++ b/tests/virtio-net-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 #include "libqos/pci.h"
 
 #define PCI_SLOT_HP             0x06
diff --git a/tests/virtio-rng-test.c b/tests/virtio-rng-test.c
index 41c1cdb..3b4d614 100644
--- a/tests/virtio-rng-test.c
+++ b/tests/virtio-rng-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 #include "libqos/pci.h"
 
 #define PCI_SLOT_HP             0x06
diff --git a/tests/virtio-scsi-test.c b/tests/virtio-scsi-test.c
index 989f825..6eed7a0 100644
--- a/tests/virtio-scsi-test.c
+++ b/tests/virtio-scsi-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void pci_nop(void)
diff --git a/tests/virtio-serial-test.c b/tests/virtio-serial-test.c
index bf030a6..a99e196 100644
--- a/tests/virtio-serial-test.c
+++ b/tests/virtio-serial-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void pci_nop(void)
diff --git a/tests/vmxnet3-test.c b/tests/vmxnet3-test.c
index a2ebed3..c28035c 100644
--- a/tests/vmxnet3-test.c
+++ b/tests/vmxnet3-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void nop(void)
diff --git a/tests/wdt_ib700-test.c b/tests/wdt_ib700-test.c
index 513a533..2a1eafa 100644
--- a/tests/wdt_ib700-test.c
+++ b/tests/wdt_ib700-test.c
@@ -7,10 +7,7 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include <glib.h>
-#include <string.h>
 #include "libqtest.h"
-#include "qemu/osdep.h"
 
 #define NS_PER_SEC 1000000000ULL
 

