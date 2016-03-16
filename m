Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1agHMM-0004UG-J8
	for mharc-qemu-trivial@gnu.org; Wed, 16 Mar 2016 15:43:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1agHMK-0004Qr-Dy
	for qemu-trivial@nongnu.org; Wed, 16 Mar 2016 15:43:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1agHMJ-0006Ua-KV
	for qemu-trivial@nongnu.org; Wed, 16 Mar 2016 15:43:56 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:60071)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1agHMF-0006TL-HK; Wed, 16 Mar 2016 15:43:51 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id E8CFA17F6A3; Wed, 16 Mar 2016 20:43:47 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Date: Wed, 16 Mar 2016 20:43:37 +0100
Message-Id: <1458157417-15856-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.221.198.45
Cc: Igor Mammedov <imammedo@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-trivial] [PATCH] acpi: Add missing GCC_FMT_ATTR
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
X-List-Received-Date: Wed, 16 Mar 2016 19:43:57 -0000

This fixes a compiler warning when compiling with -Wextra.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 include/hw/acpi/aml-build.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
index 66f48ec..2c994b3 100644
--- a/include/hw/acpi/aml-build.h
+++ b/include/hw/acpi/aml-build.h
@@ -369,6 +369,7 @@ build_rsdt(GArray *table_data, GArray *linker, GArray *table_offsets,
            const char *oem_id, const char *oem_table_id);
 
 int
-build_append_named_dword(GArray *array, const char *name_format, ...);
+build_append_named_dword(GArray *array, const char *name_format, ...)
+GCC_FMT_ATTR(2, 3);
 
 #endif
-- 
2.1.4


