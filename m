Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxvlw-0004La-Dm
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 07:14:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39922)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yxvlr-0004E9-G3
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:14:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yxvlo-0001Tw-N5
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:14:43 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:18562)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxvln-0001Jr-Vm; Thu, 28 May 2015 07:14:40 -0400
Received: from 172.24.2.119 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMA87047; Thu, 28 May 2015 19:14:25 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml432-hub.china.huawei.com (10.82.67.209) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 19:14:16 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 19:13:43 +0800
Message-ID: <1432811625-13392-3-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432811625-13392-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432811625-13392-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mjt@tls.msk.ru,
	shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH 2/4] hw/alpha/dp264.c: Fix memory leak
	spotted by valgrind
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
X-List-Received-Date: Thu, 28 May 2015 11:14:44 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==7055== 58 bytes in 1 blocks are definitely lost in loss record 1,471 of 2,192
==7055==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==7055==    by 0x24410F: malloc_and_trace (vl.c:2556)
==7055==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==7055==    by 0x64DEFD7: g_strndup (in /usr/lib64/libglib-2.0.so.0.3600.3)
==7055==    by 0x650181A: g_vasprintf (in /usr/lib64/libglib-2.0.so.0.3600.3)
==7055==    by 0x64DF0CC: g_strdup_vprintf (in /usr/lib64/libglib-2.0.so.0.3600.3)
==7055==    by 0x64DF188: g_strdup_printf (in /usr/lib64/libglib-2.0.so.0.3600.3)
==7055==    by 0x242F81: qemu_find_file (vl.c:2121)
==7055==    by 0x217A32: clipper_init (dp264.c:105)
==7055==    by 0x2484DA: main (vl.c:4249)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/alpha/dp264.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index 9fe7e8b..0c5395f 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -56,6 +56,7 @@ static void clipper_init(MachineState *machine)
     qemu_irq rtc_irq;
     long size, i;
     const char *palcode_filename;
+    char *filename;
     uint64_t palcode_entry, palcode_low, palcode_high;
     uint64_t kernel_entry, kernel_low, kernel_high;
 
@@ -102,18 +103,20 @@ static void clipper_init(MachineState *machine)
        but one explicitly written for the emulation, we might as
        well load it directly from and ELF image.  */
     palcode_filename = (bios_name ? bios_name : "palcode-clipper");
-    palcode_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, palcode_filename);
-    if (palcode_filename == NULL) {
+    filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, palcode_filename);
+    if (filename == NULL) {
         hw_error("no palcode provided\n");
         exit(1);
     }
-    size = load_elf(palcode_filename, cpu_alpha_superpage_to_phys,
+    size = load_elf(filename, cpu_alpha_superpage_to_phys,
                     NULL, &palcode_entry, &palcode_low, &palcode_high,
                     0, EM_ALPHA, 0);
     if (size < 0) {
-        hw_error("could not load palcode '%s'\n", palcode_filename);
+        hw_error("could not load palcode '%s'\n", filename);
+        g_free(filename);
         exit(1);
     }
+    g_free(filename);
 
     /* Start all cpus at the PALcode RESET entry point.  */
     for (i = 0; i < smp_cpus; ++i) {
-- 
2.0.4



