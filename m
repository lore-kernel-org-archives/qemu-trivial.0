Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wk6ro-0005NC-EM
	for mharc-qemu-trivial@gnu.org; Tue, 13 May 2014 03:11:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhen-hual@hp.com>) id 1Wk6rd-0004zk-Un
	for qemu-trivial@nongnu.org; Tue, 13 May 2014 03:11:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhen-hual@hp.com>) id 1Wk6rV-0003Lw-Mu
	for qemu-trivial@nongnu.org; Tue, 13 May 2014 03:11:01 -0400
Received: from g2t2354.austin.hp.com ([15.217.128.53]:37304)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhen-hual@hp.com>)
	id 1Wk6qu-0002um-A5; Tue, 13 May 2014 03:10:16 -0400
Received: from g2t2360.austin.hp.com (g2t2360.austin.hp.com [16.197.8.247])
	by g2t2354.austin.hp.com (Postfix) with ESMTP id 05690147;
	Tue, 13 May 2014 07:10:16 +0000 (UTC)
Received: from piepie.asiapacific.hpqcorp.net (piepie.asiapacific.hpqcorp.net
	[16.187.245.80])
	by g2t2360.austin.hp.com (Postfix) with ESMTP id 9D96454;
	Tue, 13 May 2014 07:10:14 +0000 (UTC)
From: "Li, Zhen-Hua" <zhen-hual@hp.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>,
	<qemu-stable@nongnu.org>
Date: Tue, 13 May 2014 15:09:14 +0800
Message-Id: <1399964954-10842-5-git-send-email-zhen-hual@hp.com>
X-Mailer: git-send-email 2.0.0-rc0
In-Reply-To: <1399964954-10842-1-git-send-email-zhen-hual@hp.com>
References: <1399964954-10842-1-git-send-email-zhen-hual@hp.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 15.217.128.53
Cc: "Li, ZhenHua" <zhen-hual@hp.com>
Subject: [Qemu-trivial] [PATCH 4/4] Support more than 255 cpus: runtime check
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
X-List-Received-Date: Tue, 13 May 2014 07:11:10 -0000

From: "Li, ZhenHua" <zhen-hual@hp.com>

There is some runtime check for max cpu count. Make them support 4096 cpus.

Signed-off-by: Li, ZhenHua <zhen-hual@hp.com>
---
 hw/i386/acpi-build.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index c98df88..5c3bf10 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -272,7 +272,7 @@ static void GCC_FMT_ATTR(2, 3)
 build_append_nameseg(GArray *array, const char *format, ...)
 {
     /* It would be nicer to use g_string_vprintf but it's only there in 2.22 */
-    char s[] = "XXXX";
+    char s[] = "XXXXXX";
     int len;
     va_list args;
 
@@ -280,7 +280,7 @@ build_append_nameseg(GArray *array, const char *format, ...)
     len = vsnprintf(s, sizeof s, format, args);
     va_end(args);
 
-    assert(len == 4);
+    assert(len == 4 || len == 5 || len == 6);
     g_array_append_vals(array, s, len);
 }
 
@@ -680,7 +680,7 @@ build_append_notify_method(GArray *device, const char *name,
     for (i = 0; i < count; i++) {
         GArray *target = build_alloc_array();
         build_append_nameseg(target, format, i);
-        assert(i < 256); /* Fits in 1 byte */
+        assert(i < 4096); /* Fits in 1 byte */
         build_append_notify_target_ifequal(method, target, i, 1);
         build_free_array(target);
     }
@@ -1006,7 +1006,7 @@ build_ssdt(GArray *table_data, GArray *linker,
 
     /* The current AML generator can cover the APIC ID range [0..255],
      * inclusive, for VCPU hotplug. */
-    QEMU_BUILD_BUG_ON(ACPI_CPU_HOTPLUG_ID_LIMIT > 256);
+    QEMU_BUILD_BUG_ON(ACPI_CPU_HOTPLUG_ID_LIMIT > 4096);
     g_assert(acpi_cpus <= ACPI_CPU_HOTPLUG_ID_LIMIT);
 
     /* Copy header and patch values in the S3_ / S4_ / S5_ packages */
-- 
2.0.0-rc0


