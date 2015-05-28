Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxx71-0007xI-EJ
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:40:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41013)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yxx6u-0007lG-NL
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:40:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yxx6t-00082l-PA
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:40:32 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:57982)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxx6k-0007jS-2B; Thu, 28 May 2015 08:40:22 -0400
Received: from 172.24.2.119 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COQ01167; Thu, 28 May 2015 20:40:08 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml426-hub.china.huawei.com (10.82.67.181) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:39:57 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:39:42 +0800
Message-ID: <1432816784-12436-3-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432816784-12436-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432816784-12436-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mjt@tls.msk.ru,
	shannon.zhao@linaro.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH v2 2/4] hw/alpha/dp264.c: Fix memory leak
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
X-List-Received-Date: Thu, 28 May 2015 12:40:37 -0000

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
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/alpha/dp264.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index 9fe7e8b..f86e7bb 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -55,7 +55,7 @@ static void clipper_init(MachineState *machine)
     ISABus *isa_bus;
     qemu_irq rtc_irq;
     long size, i;
-    const char *palcode_filename;
+    char *palcode_filename;
     uint64_t palcode_entry, palcode_low, palcode_high;
     uint64_t kernel_entry, kernel_low, kernel_high;
 
@@ -101,8 +101,8 @@ static void clipper_init(MachineState *machine)
     /* Load PALcode.  Given that this is not "real" cpu palcode,
        but one explicitly written for the emulation, we might as
        well load it directly from and ELF image.  */
-    palcode_filename = (bios_name ? bios_name : "palcode-clipper");
-    palcode_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, palcode_filename);
+    palcode_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS,
+                                bios_name ? bios_name : "palcode-clipper");
     if (palcode_filename == NULL) {
         hw_error("no palcode provided\n");
         exit(1);
@@ -114,6 +114,7 @@ static void clipper_init(MachineState *machine)
         hw_error("could not load palcode '%s'\n", palcode_filename);
         exit(1);
     }
+    g_free(palcode_filename);
 
     /* Start all cpus at the PALcode RESET entry point.  */
     for (i = 0; i < smp_cpus; ++i) {
-- 
2.0.4



