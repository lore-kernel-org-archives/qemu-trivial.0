Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z08Pk-000801-Dy
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 09:09:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08Pj-0007xy-0R
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:08:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08Pi-0004zD-4Q
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:08:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36757)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z08Pd-0004uU-E9; Wed, 03 Jun 2015 09:08:53 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BB9324079D;
	Wed,  3 Jun 2015 16:08:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id A053EA51;
	Wed,  3 Jun 2015 16:08:52 +0300 (MSK)
Received: (nullmailer pid 27426 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:27 +0300
Message-Id: <d370dfa9f3703cf0af07d96d50ed567413e8ec65.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 07/30] hw/i386/acpi-build: decref after use
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
X-List-Received-Date: Wed, 03 Jun 2015 13:08:59 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==16447== 48 bytes in 2 blocks are definitely lost in loss record 2,033 of 3,310
==16447==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==16447==    by 0x2E4FD7: malloc_and_trace (vl.c:2546)
==16447==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==16447==    by 0x53EC3F: qint_from_int (qint.c:33)
==16447==    by 0x53B426: qmp_output_type_int (qmp-output-visitor.c:162)
==16447==    by 0x539257: visit_type_uint32 (qapi-visit-core.c:147)
==16447==    by 0x471D07: property_get_uint32_ptr (object.c:1651)
==16447==    by 0x47000C: object_property_get (object.c:822)
==16447==    by 0x472428: object_property_get_qobject (qom-qobject.c:37)
==16447==    by 0x25701A: build_append_pci_bus_devices (acpi-build.c:520)
==16447==    by 0x25902E: build_ssdt (acpi-build.c:1004)
==16447==    by 0x25A0A8: acpi_build (acpi-build.c:1420)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/acpi-build.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 2c7399b..15fd4c5 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -596,6 +596,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         }
     }
     aml_append(parent_scope, method);
+    qobject_decref(bsel);
 }
 
 static void
-- 
2.1.4


