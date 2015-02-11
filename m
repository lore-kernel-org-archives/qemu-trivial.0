Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLOfV-0003gW-71
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 23:12:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54646)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YLOfQ-0003Wf-5L
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 23:12:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YLOfI-0004D6-2H
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 23:12:48 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:23238)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YLOfH-0004BF-GU; Tue, 10 Feb 2015 23:12:39 -0500
Received: from 172.24.2.119 (EHLO szxeml430-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHD48398; Wed, 11 Feb 2015 12:12:33 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml430-hub.china.huawei.com
	(10.82.67.185) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 11 Feb 2015 12:12:23 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 11 Feb 2015 12:12:11 +0800
Message-ID: <1423627934-11676-9-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1423627934-11676-1-git-send-email-arei.gonglei@huawei.com>
References: <1423627934-11676-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH 08/11] xtensa: Remove superfluous '\n' around
	error_report()
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
X-List-Received-Date: Wed, 11 Feb 2015 04:12:49 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/xtensa/sim.c    |  2 +-
 hw/xtensa/xtfpga.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
index 37ea9ae..328d209 100644
--- a/hw/xtensa/sim.c
+++ b/hw/xtensa/sim.c
@@ -64,7 +64,7 @@ static void xtensa_sim_init(MachineState *machine)
     for (n = 0; n < smp_cpus; n++) {
         cpu = cpu_xtensa_init(cpu_model);
         if (cpu == NULL) {
-            error_report("unable to find CPU definition '%s'\n",
+            error_report("unable to find CPU definition '%s'",
                          cpu_model);
             exit(EXIT_FAILURE);
         }
diff --git a/hw/xtensa/xtfpga.c b/hw/xtensa/xtfpga.c
index e5a6bba..bb90eb2 100644
--- a/hw/xtensa/xtfpga.c
+++ b/hw/xtensa/xtfpga.c
@@ -190,7 +190,7 @@ static void lx_init(const LxBoardDesc *board, MachineState *machine)
     for (n = 0; n < smp_cpus; n++) {
         cpu = cpu_xtensa_init(cpu_model);
         if (cpu == NULL) {
-            error_report("unable to find CPU definition '%s'\n",
+            error_report("unable to find CPU definition '%s'",
                          cpu_model);
             exit(EXIT_FAILURE);
         }
@@ -235,7 +235,7 @@ static void lx_init(const LxBoardDesc *board, MachineState *machine)
                 board->flash_size / board->flash_sector_size,
                 4, 0x0000, 0x0000, 0x0000, 0x0000, be);
         if (flash == NULL) {
-            error_report("unable to mount pflash\n");
+            error_report("unable to mount pflash");
             exit(EXIT_FAILURE);
         }
     }
@@ -287,7 +287,7 @@ static void lx_init(const LxBoardDesc *board, MachineState *machine)
             uint32_t dtb_addr = tswap32(cur_lowmem);
 
             if (!fdt) {
-                error_report("could not load DTB '%s'\n", dtb_filename);
+                error_report("could not load DTB '%s'", dtb_filename);
                 exit(EXIT_FAILURE);
             }
 
@@ -307,7 +307,7 @@ static void lx_init(const LxBoardDesc *board, MachineState *machine)
                                                   lowmem_end - cur_lowmem);
             }
             if (initrd_size < 0) {
-                error_report("could not load initrd '%s'\n", initrd_filename);
+                error_report("could not load initrd '%s'", initrd_filename);
                 exit(EXIT_FAILURE);
             }
             initrd_location.start = tswap32(cur_lowmem);
@@ -333,7 +333,7 @@ static void lx_init(const LxBoardDesc *board, MachineState *machine)
             if (success > 0 && is_linux) {
                 entry_point = ep;
             } else {
-                error_report("could not load kernel '%s'\n",
+                error_report("could not load kernel '%s'",
                              kernel_filename);
                 exit(EXIT_FAILURE);
             }
-- 
1.7.12.4



