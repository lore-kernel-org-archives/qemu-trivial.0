Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guCjY-0000gn-JO
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 03:51:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45497)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1guCjT-0000dM-0X
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 03:50:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1guCjS-0002og-63
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 03:50:58 -0500
Received: from mga05.intel.com ([192.55.52.43]:41881)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1guCjR-0002Sx-0d; Thu, 14 Feb 2019 03:50:58 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Feb 2019 00:50:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,368,1544515200"; d="scan'208";a="126382366"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga003.jf.intel.com with ESMTP; 14 Feb 2019 00:50:24 -0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: mst@redhat.com, laurent@vivier.eu, imammedo@redhat.com, philmd@redhat.com,
	thuth@redhat.com, Wei Yang <richardw.yang@linux.intel.com>
Date: Thu, 14 Feb 2019 16:49:38 +0800
Message-Id: <20190214084939.20640-3-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190214084939.20640-1-richardw.yang@linux.intel.com>
References: <20190214084939.20640-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.43
Subject: [Qemu-trivial] [Patch v4 2/3] hw/acpi: remove unused function
 acpi_table_add_builtin()
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
X-List-Received-Date: Thu, 14 Feb 2019 08:50:59 -0000

Function acpi_table_add_builtin() is not used anymore.

Remove the definition and declaration.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/core.c         | 6 ------
 include/hw/acpi/acpi.h | 1 -
 2 files changed, 7 deletions(-)

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index d6f0709691..e9b1a85e54 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -305,12 +305,6 @@ out:
 
 static bool acpi_table_builtin = false;
 
-void acpi_table_add_builtin(const QemuOpts *opts, Error **errp)
-{
-    acpi_table_builtin = true;
-    acpi_table_add(opts, errp);
-}
-
 unsigned acpi_table_len(void *current)
 {
     struct acpi_table_header *hdr = current - sizeof(hdr->_length);
diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
index c20ace0d0b..4a8bbaf1b5 100644
--- a/include/hw/acpi/acpi.h
+++ b/include/hw/acpi/acpi.h
@@ -190,7 +190,6 @@ uint8_t *acpi_table_first(void);
 uint8_t *acpi_table_next(uint8_t *current);
 unsigned acpi_table_len(void *current);
 void acpi_table_add(const QemuOpts *opts, Error **errp);
-void acpi_table_add_builtin(const QemuOpts *opts, Error **errp);
 
 typedef struct AcpiSlicOem AcpiSlicOem;
 struct AcpiSlicOem {
-- 
2.19.1


