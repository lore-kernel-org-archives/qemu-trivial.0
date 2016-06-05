Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9SqZ-0001Oz-Am
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 03:51:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9SqV-0001L4-EZ
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:51:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9SqS-0005Yy-4T
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:51:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55169)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9SqJ-0005Wu-JQ; Sun, 05 Jun 2016 03:51:31 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6C2E440913;
	Sun,  5 Jun 2016 10:51:26 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id D822AAF4;
	Sun,  5 Jun 2016 10:43:35 +0300 (MSK)
Received: (nullmailer pid 1153 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:08 +0300
Message-Id: <18be9fa1ad86cddca48ec42b0d46bb0736d0d7df.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 31/52] all: Remove unnecessary glib.h includes
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
X-List-Received-Date: Sun, 05 Jun 2016 07:51:45 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Remove glib.h includes, as it is provided by osdep.h.

This commit was created with scripts/clean-includes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block/dmg.c                          | 1 -
 block/vhdx.c                         | 1 -
 block/vmdk.c                         | 1 -
 fsdev/9p-iov-marshal.c               | 1 -
 fsdev/9p-marshal.c                   | 1 -
 hw/9pfs/9p.h                         | 1 -
 hw/i386/acpi-build.c                 | 1 -
 hw/i386/pc_piix.c                    | 1 -
 include/hw/acpi/aml-build.h          | 1 -
 include/hw/acpi/bios-linker-loader.h | 1 -
 include/qemu/bitmap.h                | 1 -
 include/qemu/rcu.h                   | 1 -
 include/qom/object.h                 | 1 -
 include/sysemu/tpm_backend_int.h     | 1 -
 memory_mapping.c                     | 1 -
 migration/postcopy-ram.c             | 1 -
 page_cache.c                         | 1 -
 qapi/qmp-registry.c                  | 1 -
 qemu-bridge-helper.c                 | 1 -
 slirp/dnssearch.c                    | 1 -
 slirp/slirp.h                        | 1 -
 ui/sdl_zoom.c                        | 1 -
 ui/vnc-palette.c                     | 1 -
 util/coroutine-gthread.c             | 1 -
 util/hbitmap.c                       | 1 -
 util/memfd.c                         | 1 -
 util/oslib-win32.c                   | 1 -
 util/uri.c                           | 1 -
 vl.c                                 | 1 -
 29 files changed, 29 deletions(-)

diff --git a/block/dmg.c b/block/dmg.c
index 1ea5f22..06eb513 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -32,7 +32,6 @@
 #ifdef CONFIG_BZIP2
 #include <bzlib.h>
 #endif
-#include <glib.h>
 
 enum {
     /* Limit chunk sizes to prevent unreasonable amounts of memory being used
diff --git a/block/vhdx.c b/block/vhdx.c
index c0d24a2..f5605a2 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -27,7 +27,6 @@
 #include "migration/migration.h"
 
 #include <uuid/uuid.h>
-#include <glib.h>
 
 /* Options for VHDX creation */
 
diff --git a/block/vmdk.c b/block/vmdk.c
index 372e5ed..2205cc8 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -34,7 +34,6 @@
 #include "migration/migration.h"
 #include "qemu/cutils.h"
 #include <zlib.h>
-#include <glib.h>
 
 #define VMDK3_MAGIC (('C' << 24) | ('O' << 16) | ('W' << 8) | 'D')
 #define VMDK4_MAGIC (('K' << 24) | ('D' << 16) | ('M' << 8) | 'V')
diff --git a/fsdev/9p-iov-marshal.c b/fsdev/9p-iov-marshal.c
index fb40bdf..fce1ee9 100644
--- a/fsdev/9p-iov-marshal.c
+++ b/fsdev/9p-iov-marshal.c
@@ -12,7 +12,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include <glib/gprintf.h>
 #include <utime.h>
 #include <sys/uio.h>
diff --git a/fsdev/9p-marshal.c b/fsdev/9p-marshal.c
index 183d366..f56ef0e 100644
--- a/fsdev/9p-marshal.c
+++ b/fsdev/9p-marshal.c
@@ -12,7 +12,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include <glib/gprintf.h>
 #include <dirent.h>
 #include <utime.h>
diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
index 1a19418..83cba5f 100644
--- a/hw/9pfs/9p.h
+++ b/hw/9pfs/9p.h
@@ -4,7 +4,6 @@
 #include <dirent.h>
 #include <utime.h>
 #include <sys/resource.h>
-#include <glib.h>
 #include "standard-headers/linux/virtio_9p.h"
 #include "hw/virtio/virtio.h"
 #include "fsdev/file-op-9p.h"
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 279f0d7..d0ffc25 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -23,7 +23,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "acpi-build.h"
-#include <glib.h>
 #include "qemu-common.h"
 #include "qemu/bitmap.h"
 #include "qemu/error-report.h"
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 24e7042..a6a6604 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "hw/hw.h"
 #include "hw/loader.h"
diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 7eb51c7..0b01376 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -1,7 +1,6 @@
 #ifndef HW_ACPI_GEN_UTILS_H
 #define HW_ACPI_GEN_UTILS_H
 
-#include <glib.h>
 #include "hw/acpi/acpi-defs.h"
 
 /* Reserve RAM space for tables: add another order of magnitude. */
diff --git a/include/hw/acpi/bios-linker-loader.h b/include/hw/acpi/bios-linker-loader.h
index 82f1af6..80afcce 100644
--- a/include/hw/acpi/bios-linker-loader.h
+++ b/include/hw/acpi/bios-linker-loader.h
@@ -1,7 +1,6 @@
 #ifndef BIOS_LINKER_LOADER_H
 #define BIOS_LINKER_LOADER_H
 
-#include <glib.h>
 
 GArray *bios_linker_loader_init(void);
 
diff --git a/include/qemu/bitmap.h b/include/qemu/bitmap.h
index 0e33fa5..ec5146f 100644
--- a/include/qemu/bitmap.h
+++ b/include/qemu/bitmap.h
@@ -12,7 +12,6 @@
 #ifndef BITMAP_H
 #define BITMAP_H
 
-#include <glib.h>
 
 #include "qemu/bitops.h"
 
diff --git a/include/qemu/rcu.h b/include/qemu/rcu.h
index 56d3a68..83ae280 100644
--- a/include/qemu/rcu.h
+++ b/include/qemu/rcu.h
@@ -23,7 +23,6 @@
  * IBM's contributions to this file may be relicensed under LGPLv2 or later.
  */
 
-#include <glib.h>
 
 #include "qemu/thread.h"
 #include "qemu/queue.h"
diff --git a/include/qom/object.h b/include/qom/object.h
index 21bb5ff..99de539 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -14,7 +14,6 @@
 #ifndef QEMU_OBJECT_H
 #define QEMU_OBJECT_H
 
-#include <glib.h>
 #include "qapi-types.h"
 #include "qemu/queue.h"
 
diff --git a/include/sysemu/tpm_backend_int.h b/include/sysemu/tpm_backend_int.h
index 40f693a..cc0dcb3 100644
--- a/include/sysemu/tpm_backend_int.h
+++ b/include/sysemu/tpm_backend_int.h
@@ -22,7 +22,6 @@
 #ifndef TPM_TPM_BACKEND_H
 #define TPM_TPM_BACKEND_H
 
-#include <glib.h>
 
 typedef struct TPMBackendThread {
     GThreadPool *pool;
diff --git a/memory_mapping.c b/memory_mapping.c
index 2354b2b..e3e0d95 100644
--- a/memory_mapping.c
+++ b/memory_mapping.c
@@ -13,7 +13,6 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#include <glib.h>
 
 #include "qemu-common.h"
 #include "cpu.h"
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index cf7dcd2..47250b6 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -17,7 +17,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qemu-common.h"
 #include "migration/migration.h"
diff --git a/page_cache.c b/page_cache.c
index 37a66e4..a2809db 100644
--- a/page_cache.c
+++ b/page_cache.c
@@ -13,7 +13,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qemu-common.h"
 #include "qemu/host-utils.h"
diff --git a/qapi/qmp-registry.c b/qapi/qmp-registry.c
index 4332a68..68b24c9 100644
--- a/qapi/qmp-registry.c
+++ b/qapi/qmp-registry.c
@@ -13,7 +13,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "qapi/qmp/dispatch.h"
 
 static QTAILQ_HEAD(QmpCommandList, QmpCommand) qmp_commands =
diff --git a/qemu-bridge-helper.c b/qemu-bridge-helper.c
index 830fb9e..5396fbf 100644
--- a/qemu-bridge-helper.c
+++ b/qemu-bridge-helper.c
@@ -15,7 +15,6 @@
 
 #include "qemu/osdep.h"
 
-#include <glib.h>
 
 #include <sys/ioctl.h>
 #include <sys/socket.h>
diff --git a/slirp/dnssearch.c b/slirp/dnssearch.c
index aed2f13..4c70a64 100644
--- a/slirp/dnssearch.c
+++ b/slirp/dnssearch.c
@@ -23,7 +23,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "slirp.h"
 
 static const uint8_t RFC3397_OPT_DOMAIN_SEARCH = 119;
diff --git a/slirp/slirp.h b/slirp/slirp.h
index 5df755e..e3641f9 100644
--- a/slirp/slirp.h
+++ b/slirp/slirp.h
@@ -69,7 +69,6 @@ typedef char *caddr_t;
 #include <sys/stropts.h>
 #endif
 
-#include <glib.h>
 
 #include "debug.h"
 
diff --git a/ui/sdl_zoom.c b/ui/sdl_zoom.c
index 72622c2..b96196b 100644
--- a/ui/sdl_zoom.c
+++ b/ui/sdl_zoom.c
@@ -13,7 +13,6 @@
 
 #include "qemu/osdep.h"
 #include "sdl_zoom.h"
-#include <glib.h>
 
 static void sdl_zoom_rgb16(SDL_Surface *src, SDL_Surface *dst, int smooth,
                            SDL_Rect *dst_rect);
diff --git a/ui/vnc-palette.c b/ui/vnc-palette.c
index 3b89d1a..dc7c0ba 100644
--- a/ui/vnc-palette.c
+++ b/ui/vnc-palette.c
@@ -28,7 +28,6 @@
 
 #include "qemu/osdep.h"
 #include "vnc-palette.h"
-#include <glib.h>
 
 static VncPaletteEntry *palette_find(const VncPalette *palette,
                                      uint32_t color, unsigned int hash)
diff --git a/util/coroutine-gthread.c b/util/coroutine-gthread.c
index fb697eb..62bfb40 100644
--- a/util/coroutine-gthread.c
+++ b/util/coroutine-gthread.c
@@ -19,7 +19,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "qemu-common.h"
 #include "qemu/coroutine_int.h"
 
diff --git a/util/hbitmap.c b/util/hbitmap.c
index b22b87d..7121b11 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -10,7 +10,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 #include "qemu/hbitmap.h"
 #include "qemu/host-utils.h"
 #include "trace.h"
diff --git a/util/memfd.c b/util/memfd.c
index 7c40691..b374238 100644
--- a/util/memfd.c
+++ b/util/memfd.c
@@ -27,7 +27,6 @@
 
 #include "qemu/osdep.h"
 
-#include <glib.h>
 #include <glib/gprintf.h>
 
 #include <sys/mman.h>
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index c926db4..6debc2b 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -31,7 +31,6 @@
  */
 #include "qemu/osdep.h"
 #include <windows.h>
-#include <glib.h>
 #include "qapi/error.h"
 #include "sysemu/sysemu.h"
 #include "qemu/main-loop.h"
diff --git a/util/uri.c b/util/uri.c
index d109d6c..70a9cbc 100644
--- a/util/uri.c
+++ b/util/uri.c
@@ -52,7 +52,6 @@
  */
 
 #include "qemu/osdep.h"
-#include <glib.h>
 
 #include "qemu/uri.h"
 
diff --git a/vl.c b/vl.c
index 2f74fe8..fafc7df 100644
--- a/vl.c
+++ b/vl.c
@@ -51,7 +51,6 @@ int main(int argc, char **argv)
 #define main qemu_main
 #endif /* CONFIG_COCOA */
 
-#include <glib.h>
 
 #include "qemu/error-report.h"
 #include "qemu/sockets.h"
-- 
2.1.4


