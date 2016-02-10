Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTSek-0006w4-Qb
	for mharc-qemu-trivial@gnu.org; Wed, 10 Feb 2016 06:09:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTSei-0006t9-4o
	for qemu-trivial@nongnu.org; Wed, 10 Feb 2016 06:09:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTSeg-0004k9-Pu
	for qemu-trivial@nongnu.org; Wed, 10 Feb 2016 06:09:56 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46493)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aTSea-0004hx-Vx; Wed, 10 Feb 2016 06:09:49 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1ABB1410B1;
	Wed, 10 Feb 2016 14:09:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 5A3F7AE8;
	Wed, 10 Feb 2016 14:09:48 +0300 (MSK)
Received: (nullmailer pid 14563 invoked by uid 1000);
	Wed, 10 Feb 2016 11:09:48 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed, 10 Feb 2016 14:09:46 +0300
Message-Id: <1455102586-14523-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Pierre Morel <pmorel@linux.vnet.ibm.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH v2] s390x: remove s390-zipl.rom
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
X-List-Received-Date: Wed, 10 Feb 2016 11:09:57 -0000

This is an s390 boot rom which was used in s390-virtio machine.
but since commit 3538fb6f89dd9bb2e7e59de2bfad52a45321c744
"s390x: remove s390-virtio machine", this file isn't used.
The only place it is referenced in the code is an unused
define ZIPL_FIRMWARE.  There's also comment in hw/s390/ipl.c
which I'm modifying too, to refer to s390-ccw.rom instead.

Cc: Pierre Morel <pmorel@linux.vnet.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
--
v2: fix commit comment, restoring line which
    has been eaten by git.
---
 Makefile               |   1 -
 hw/s390x/ipl.c         |   2 +-
 hw/s390x/s390-virtio.c |   1 -
 pc-bios/README         |   4 ----
 pc-bios/s390-zipl.rom  | Bin 3304 -> 0 bytes
 5 files changed, 1 insertion(+), 7 deletions(-)
 delete mode 100644 pc-bios/s390-zipl.rom

diff --git a/Makefile b/Makefile
index 30b1b2d..f9fae3a 100644
--- a/Makefile
+++ b/Makefile
@@ -400,7 +400,6 @@ efi-pcnet.rom efi-rtl8139.rom efi-virtio.rom \
 qemu-icon.bmp qemu_logo_no_text.svg \
 bamboo.dtb petalogix-s3adsp1800.dtb petalogix-ml605.dtb \
 multiboot.bin linuxboot.bin kvmvapic.bin \
-s390-zipl.rom \
 s390-ccw.img \
 spapr-rtas.bin slof.bin \
 palcode-clipper \
diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 6992add..4e6a0ac 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -106,7 +106,7 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
             /* Adjust ELF start address to final location */
             ipl->bios_start_addr += fwbase;
         } else {
-            /* Try to load non-ELF file (e.g. s390-zipl.rom) */
+            /* Try to load non-ELF file (e.g. s390-ccw.rom) */
             bios_size = load_image_targphys(bios_filename, ZIPL_IMAGE_START,
                                             4096);
             ipl->bios_start_addr = ZIPL_IMAGE_START;
diff --git a/hw/s390x/s390-virtio.c b/hw/s390x/s390-virtio.c
index 9efb9c6..c320878 100644
--- a/hw/s390x/s390-virtio.c
+++ b/hw/s390x/s390-virtio.c
@@ -54,7 +54,6 @@
 #endif
 
 #define MAX_BLK_DEVS                    10
-#define ZIPL_FILENAME                   "s390-zipl.rom"
 #define S390_MACHINE                    "s390-virtio"
 #define TYPE_S390_MACHINE               MACHINE_TYPE_NAME(S390_MACHINE)
 
diff --git a/pc-bios/README b/pc-bios/README
index d260c1b..9f65ffa 100644
--- a/pc-bios/README
+++ b/pc-bios/README
@@ -35,10 +35,6 @@
 	10ec:8139 -> pxe-rtl8139.rom
 	1af4:1000 -> pxe-virtio.rom
 
-- The S390 zipl loader is an addition to the official IBM s390-tools
-  package. That fork is maintained in its own git repository at:
-  git://repo.or.cz/s390-tools.git
-
 - The sources for the Alpha palcode image is available from:
   git://github.com/rth7680/qemu-palcode.git
 
diff --git a/pc-bios/s390-zipl.rom b/pc-bios/s390-zipl.rom
deleted file mode 100644
index 3115128efe465a024b2deb780573358ae1b829a4..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 3304
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

-- 
2.1.4


