Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz8I6-0007mg-Uw
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 13:16:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8Hy-0007Xs-9M
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:16:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8Ht-0002uB-Le
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:16:34 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:42798)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xz8Hj-0002l7-02; Thu, 11 Dec 2014 13:16:19 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BC4EF41D44;
	Thu, 11 Dec 2014 21:16:16 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7D9A48C4;
	Thu, 11 Dec 2014 21:16:16 +0300 (MSK)
Received: (nullmailer pid 22962 invoked by uid 1000);
	Thu, 11 Dec 2014 18:16:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Dec 2014 21:15:52 +0300
Message-Id: <8b310fc4f9eb2570bfb92a725bd094ce203800da.1418321644.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
References: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 04/20] acpi-build: Make DPRINTF working for
	acpi-build
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
X-List-Received-Date: Thu, 11 Dec 2014 18:16:38 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/acpi-build.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 76dfaea..a4d0c0c 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -68,6 +68,14 @@
 
 #define ACPI_BUILD_TABLE_SIZE             0x20000
 
+/* #define DEBUG_ACPI_BUILD */
+#ifdef DEBUG_ACPI_BUILD
+#define ACPI_BUILD_DPRINTF(fmt, ...)        \
+    do {printf("ACPI_BUILD: " fmt, ## __VA_ARGS__); } while (0)
+#else
+#define ACPI_BUILD_DPRINTF(fmt, ...)
+#endif
+
 typedef struct AcpiCpuInfo {
     DECLARE_BITMAP(found_cpus, ACPI_CPU_HOTPLUG_ID_LIMIT);
 } AcpiCpuInfo;
@@ -246,8 +254,6 @@ static void acpi_get_pci_info(PcPciInfo *info)
 #define ACPI_BUILD_APPNAME6 "BOCHS "
 #define ACPI_BUILD_APPNAME4 "BXPC"
 
-#define ACPI_BUILD_DPRINTF(level, fmt, ...) do {} while (0)
-
 #define ACPI_BUILD_TABLE_FILE "etc/acpi/tables"
 #define ACPI_BUILD_RSDP_FILE "etc/acpi/rsdp"
 #define ACPI_BUILD_TPMLOG_FILE "etc/tpm/log"
@@ -1569,7 +1575,7 @@ void acpi_build(PcGuestInfo *guest_info, AcpiBuildTables *tables)
 
     table_offsets = g_array_new(false, true /* clear */,
                                         sizeof(uint32_t));
-    ACPI_BUILD_DPRINTF(3, "init ACPI tables\n");
+    ACPI_BUILD_DPRINTF("init ACPI tables\n");
 
     bios_linker_loader_alloc(tables->linker, ACPI_BUILD_TABLE_FILE,
                              64 /* Ensure FACS is aligned */,
@@ -1750,17 +1756,17 @@ void acpi_setup(PcGuestInfo *guest_info)
     AcpiBuildState *build_state;
 
     if (!guest_info->fw_cfg) {
-        ACPI_BUILD_DPRINTF(3, "No fw cfg. Bailing out.\n");
+        ACPI_BUILD_DPRINTF("No fw cfg. Bailing out.\n");
         return;
     }
 
     if (!guest_info->has_acpi_build) {
-        ACPI_BUILD_DPRINTF(3, "ACPI build disabled. Bailing out.\n");
+        ACPI_BUILD_DPRINTF("ACPI build disabled. Bailing out.\n");
         return;
     }
 
     if (!acpi_enabled) {
-        ACPI_BUILD_DPRINTF(3, "ACPI disabled. Bailing out.\n");
+        ACPI_BUILD_DPRINTF("ACPI disabled. Bailing out.\n");
         return;
     }
 
-- 
2.1.3


