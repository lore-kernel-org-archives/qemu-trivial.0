Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goddP-0001HG-7h
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jan 2019 19:21:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1goddM-0001Fy-U0
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 19:21:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1goddF-000433-Ae
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 19:21:35 -0500
Received: from mga01.intel.com ([192.55.52.88]:3451)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1godd5-0003zp-Px; Tue, 29 Jan 2019 19:21:25 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jan 2019 16:07:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,538,1539673200"; d="scan'208";a="142536323"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.37])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jan 2019 16:07:29 -0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: mst@redhat.com, laurent@vivier.eu, imammedo@redhat.com, philmd@redhat.com,
	Wei Yang <richardw.yang@linux.intel.com>
Date: Wed, 30 Jan 2019 08:06:52 +0800
Message-Id: <20190130000653.16267-3-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190130000653.16267-1-richardw.yang@linux.intel.com>
References: <20190130000653.16267-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Subject: [Qemu-trivial] [PATCH v3 2/3] hw/acpi: remove unused function
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
X-List-Received-Date: Wed, 30 Jan 2019 00:21:42 -0000

Function acpi_table_add_builtin() is not used anymore.

Remove the definition and declaration.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daud茅 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud茅 <philmd@redhat.com>
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


