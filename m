Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xoke2-0000CE-5D
	for mharc-qemu-trivial@gnu.org; Wed, 12 Nov 2014 22:00:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xokdv-0008Pp-6A
	for qemu-trivial@nongnu.org; Wed, 12 Nov 2014 22:00:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xokdo-0002d2-Oi
	for qemu-trivial@nongnu.org; Wed, 12 Nov 2014 22:00:19 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:17099)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xokdc-0002Hf-Ge; Wed, 12 Nov 2014 22:00:01 -0500
Received: from 172.24.2.119 (EHLO szxeml415-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CCG98362; Thu, 13 Nov 2014 10:59:49 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml415-hub.china.huawei.com
	(10.82.67.154) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 13 Nov 2014 10:59:40 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 13 Nov 2014 10:59:37 +0800
Message-ID: <1415847577-5820-3-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1415847577-5820-1-git-send-email-arei.gonglei@huawei.com>
References: <1415847577-5820-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, peter.huangpeng@huawei.com,
	mst@redhat.com
Subject: [Qemu-trivial] [PATCH 2/2] acpi-build: Make DPRINTF working for
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
X-List-Received-Date: Thu, 13 Nov 2014 03:00:25 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/i386/acpi-build.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 4ab44bf..8cec9aa 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -67,6 +67,14 @@
 
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
@@ -245,8 +253,6 @@ static void acpi_get_pci_info(PcPciInfo *info)
 #define ACPI_BUILD_APPNAME6 "BOCHS "
 #define ACPI_BUILD_APPNAME4 "BXPC"
 
-#define ACPI_BUILD_DPRINTF(level, fmt, ...) do {} while (0)
-
 #define ACPI_BUILD_TABLE_FILE "etc/acpi/tables"
 #define ACPI_BUILD_RSDP_FILE "etc/acpi/rsdp"
 #define ACPI_BUILD_TPMLOG_FILE "etc/tpm/log"
@@ -1573,7 +1579,7 @@ void acpi_build(PcGuestInfo *guest_info, AcpiBuildTables *tables)
 
     table_offsets = g_array_new(false, true /* clear */,
                                         sizeof(uint32_t));
-    ACPI_BUILD_DPRINTF(3, "init ACPI tables\n");
+    ACPI_BUILD_DPRINTF("init ACPI tables\n");
 
     bios_linker_loader_alloc(tables->linker, ACPI_BUILD_TABLE_FILE,
                              64 /* Ensure FACS is aligned */,
@@ -1751,17 +1757,17 @@ void acpi_setup(PcGuestInfo *guest_info)
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
1.7.12.4



