Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z08Pr-0008Cu-C2
	for mharc-qemu-trivial@gnu.org; Wed, 03 Jun 2015 09:09:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08Pj-0007xz-BS
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:09:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z08Pi-0004zF-48
	for qemu-trivial@nongnu.org; Wed, 03 Jun 2015 09:08:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35151)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z08Pd-0004uJ-EC; Wed, 03 Jun 2015 09:08:53 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9B95D4079C;
	Wed,  3 Jun 2015 16:08:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 845A2A4F;
	Wed,  3 Jun 2015 16:08:52 +0300 (MSK)
Received: (nullmailer pid 27432 invoked by uid 1000);
	Wed, 03 Jun 2015 13:08:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jun 2015 16:08:30 +0300
Message-Id: <c18f855697ab6b64a895f37cf47fd7061ce9e798.1433336870.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
References: <cover.1433336870.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 10/30] hw/alpha/dp264.c: Fix memory leak
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
X-List-Received-Date: Wed, 03 Jun 2015 13:09:05 -0000

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
2.1.4


