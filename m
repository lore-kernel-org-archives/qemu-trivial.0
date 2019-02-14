Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1guCjR-0000aW-70
	for mharc-qemu-trivial@gnu.org; Thu, 14 Feb 2019 03:50:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45440)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1guCjO-0000XF-U2
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 03:50:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1guCjM-0002d8-8N
	for qemu-trivial@nongnu.org; Thu, 14 Feb 2019 03:50:54 -0500
Received: from mga05.intel.com ([192.55.52.43]:41876)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1guCjB-0002QD-RW; Thu, 14 Feb 2019 03:50:45 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Feb 2019 00:50:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,368,1544515200"; d="scan'208";a="126382388"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga003.jf.intel.com with ESMTP; 14 Feb 2019 00:50:26 -0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: mst@redhat.com, laurent@vivier.eu, imammedo@redhat.com, philmd@redhat.com,
	thuth@redhat.com, Wei Yang <richardw.yang@linux.intel.com>
Date: Thu, 14 Feb 2019 16:49:39 +0800
Message-Id: <20190214084939.20640-4-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190214084939.20640-1-richardw.yang@linux.intel.com>
References: <20190214084939.20640-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.43
Subject: [Qemu-trivial] [Patch v4 3/3] hw/acpi: remove unnecessary variable
 acpi_table_builtin
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

acpi_table_builtin is now always false, it is not necessary to check it
again.

This patch just removes it.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/acpi/core.c b/hw/acpi/core.c
index e9b1a85e54..f9c96535d1 100644
--- a/hw/acpi/core.c
+++ b/hw/acpi/core.c
@@ -303,8 +303,6 @@ out:
     error_propagate(errp, err);
 }
 
-static bool acpi_table_builtin = false;
-
 unsigned acpi_table_len(void *current)
 {
     struct acpi_table_header *hdr = current - sizeof(hdr->_length);
@@ -320,7 +318,7 @@ void *acpi_table_hdr(void *h)
 
 uint8_t *acpi_table_first(void)
 {
-    if (acpi_table_builtin || !acpi_tables) {
+    if (!acpi_tables) {
         return NULL;
     }
     return acpi_table_hdr(acpi_tables + ACPI_TABLE_PFX_SIZE);
-- 
2.19.1


