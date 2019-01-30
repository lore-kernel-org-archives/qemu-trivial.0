Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gog9V-00009U-VM
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jan 2019 22:03:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32957)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gog9T-00007w-I7
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 22:03:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1gog9R-0006hO-Ig
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 22:02:59 -0500
Received: from mga17.intel.com ([192.55.52.151]:39887)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1gog9M-0006SF-1e; Tue, 29 Jan 2019 22:02:52 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jan 2019 19:02:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,539,1539673200"; d="scan'208";a="271023100"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.37])
	by orsmga004.jf.intel.com with ESMTP; 29 Jan 2019 19:02:39 -0800
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: mst@redhat.com, imammedo@redhat.com,
	Wei Yang <richardw.yang@linux.intel.com>
Date: Wed, 30 Jan 2019 11:02:07 +0800
Message-Id: <20190130030207.6770-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.151
Subject: [Qemu-trivial] [PATCH] i386,
 acpi: cleanup build_facs by removing second unused argument
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
X-List-Received-Date: Wed, 30 Jan 2019 03:03:00 -0000

The second argument of build_facs() is not used, just remove it.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
---
 hw/i386/acpi-build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 236a20eaa8..023729c1f2 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -292,7 +292,7 @@ static void acpi_align_size(GArray *blob, unsigned align)
 
 /* FACS */
 static void
-build_facs(GArray *table_data, BIOSLinker *linker)
+build_facs(GArray *table_data)
 {
     AcpiFacsDescriptorRev1 *facs = acpi_data_push(table_data, sizeof *facs);
     memcpy(&facs->signature, "FACS", 4);
@@ -2643,7 +2643,7 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
      * requirements.
      */
     facs = tables_blob->len;
-    build_facs(tables_blob, tables->linker);
+    build_facs(tables_blob);
 
     /* DSDT is pointed to by FADT */
     dsdt = tables_blob->len;
-- 
2.19.1


