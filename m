Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTCuY-0000Sk-4P
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 12:16:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTCuS-0000HB-Vl
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:16:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTCuR-0000xB-PZ
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:16:36 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34428)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTCuO-0000vS-Ps; Wed, 04 Mar 2015 12:16:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1C52B408A4;
	Wed,  4 Mar 2015 20:16:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id AAC4997C;
	Wed,  4 Mar 2015 20:07:11 +0300 (MSK)
Received: (nullmailer pid 17522 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:36 +0300
Message-Id: <bdca54700098f4806e17eb58d37ff0a0991d20ad.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 19/47] xtensa: Remove superfluous '\n' around
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
X-List-Received-Date: Wed, 04 Mar 2015 17:16:40 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


