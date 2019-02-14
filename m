Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guCjP-0000YN-Vp
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 03:50:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1guCjO-0000Wj-8G
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 03:50:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1guCjF-0002as-P1
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 03:50:50 -0500
Received: from mga05.intel.com ([192.55.52.43]:41879)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1guCj9-0002Qh-6h; Thu, 14 Feb 2019 03:50:41 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Feb 2019 00:50:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,368,1544515200"; d="scan'208";a="126382349"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga003.jf.intel.com with ESMTP; 14 Feb 2019 00:50:21 -0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: mst@redhat.com, laurent@vivier.eu, imammedo@redhat.com, philmd@redhat.com,
	thuth@redhat.com, Wei Yang <richardw.yang@linux.intel.com>
Date: Thu, 14 Feb 2019 16:49:37 +0800
Message-Id: <20190214084939.20640-2-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190214084939.20640-1-richardw.yang@linux.intel.com>
References: <20190214084939.20640-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.43
Subject: [Qemu-trivial] [Patch v4 1/3] hw/i386/pc.c: remove unused function
 pc_acpi_init()
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
X-List-Received-Date: Thu, 14 Feb 2019 08:50:55 -0000

Function pc_acpi_init() is not used anymore.

Remove the definition and declaration.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/i386/pc.c         | 27 ---------------------------
 include/hw/i386/pc.h |  1 -
 2 files changed, 28 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 5317e08f60..734d3268fa 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1280,33 +1280,6 @@ void pc_pci_as_mapping_init(Object *owner, MemoryRegion *system_memory,
                                         pci_address_space, -1);
 }
 
-void pc_acpi_init(const char *default_dsdt)
-{
-    char *filename;
-
-    if (acpi_tables != NULL) {
-        /* manually set via -acpitable, leave it alone */
-        return;
-    }
-
-    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, default_dsdt);
-    if (filename == NULL) {
-        warn_report("failed to find %s", default_dsdt);
-    } else {
-        QemuOpts *opts = qemu_opts_create(qemu_find_opts("acpi"), NULL, 0,
-                                          &error_abort);
-        Error *err = NULL;
-
-        qemu_opt_set(opts, "file", filename, &error_abort);
-
-        acpi_table_add_builtin(opts, &err);
-        if (err) {
-            warn_reportf_err(err, "failed to load %s: ", filename);
-        }
-        g_free(filename);
-    }
-}
-
 void xen_load_linux(PCMachineState *pcms)
 {
     int i;
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 9d29c4b1df..541124ba6d 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -187,7 +187,6 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, int level);
 
 void pc_cpus_init(PCMachineState *pcms);
 void pc_hot_add_cpu(const int64_t id, Error **errp);
-void pc_acpi_init(const char *default_dsdt);
 
 void pc_guest_info_init(PCMachineState *pcms);
 
-- 
2.19.1


