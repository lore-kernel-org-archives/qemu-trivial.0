Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goHB9-0003WV-PV
	for mharc-qemu-trivial@gnu.org; Mon, 28 Jan 2019 19:23:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1goHB6-0003SX-Hf
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2019 19:23:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1goGy3-0000EM-Ql
	for qemu-trivial@nongnu.org; Mon, 28 Jan 2019 19:09:34 -0500
Received: from mga03.intel.com ([134.134.136.65]:3979)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1goGxw-00008S-Hv; Mon, 28 Jan 2019 19:09:27 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Jan 2019 16:09:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,535,1539673200"; d="scan'208";a="110542239"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.37])
	by orsmga007.jf.intel.com with ESMTP; 28 Jan 2019 16:09:22 -0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Cc: mst@redhat.com, laurent@vivier.eu, imammedo@redhat.com,
	Wei Yang <richardw.yang@linux.intel.com>
Date: Tue, 29 Jan 2019 08:08:20 +0800
Message-Id: <20190129000820.31190-4-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190129000820.31190-1-richardw.yang@linux.intel.com>
References: <20190125060157.29935-1-richardw.yang@linux.intel.com>
	<20190129000820.31190-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: [Qemu-trivial] [PATCH v2 3/3] hw/acpi: remove unnecessary variable
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
X-List-Received-Date: Tue, 29 Jan 2019 00:23:01 -0000

acpi_table_builtin is now always false, it is not necessary to check it
again.

This patch just removes it.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
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


