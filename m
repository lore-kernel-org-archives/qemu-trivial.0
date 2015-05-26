Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yx407-0001O5-RS
	for mharc-qemu-trivial@gnu.org; Mon, 25 May 2015 21:49:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yx404-0001LG-Ml
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 21:49:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yx400-000342-EG
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 21:49:48 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:24351)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yx3zz-00033U-Ru; Mon, 25 May 2015 21:49:44 -0400
Received: from 172.24.2.119 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BGN88725; Tue, 26 May 2015 09:46:27 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml427-hub.china.huawei.com (10.82.67.182) with Microsoft SMTP
	Server id 14.3.158.1; Tue, 26 May 2015 09:46:20 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 26 May 2015 09:46:07 +0800
Message-ID: <1432604767-5964-4-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432604767-5964-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432604767-5964-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.5563D073.00D9, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 3f1a16e41715a43027f2f88f0d8f3f1e
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH v2 3/3] hw/i386/acpi-build: decref after use
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
X-List-Received-Date: Tue, 26 May 2015 01:49:50 -0000

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
---
 hw/i386/acpi-build.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d0a5c85..1b566c9 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -648,6 +648,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         }
     }
     aml_append(parent_scope, method);
+    qobject_decref(bsel);
 }
 
 static void
-- 
2.0.4



