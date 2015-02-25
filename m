Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQTVk-0006EW-Dr
	for mharc-qemu-trivial@gnu.org; Tue, 24 Feb 2015 23:23:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQTVb-0005o4-3O
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 23:23:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQTVW-0006XS-9b
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 23:23:39 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:11275)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YQTVQ-0006Ss-CH; Tue, 24 Feb 2015 23:23:29 -0500
Received: from 172.24.2.119 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BCH13697; Wed, 25 Feb 2015 12:23:20 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml427-hub.china.huawei.com
	(10.82.67.182) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 25 Feb 2015 12:23:12 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 25 Feb 2015 12:22:34 +0800
Message-ID: <1424838157-5524-9-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1424838157-5524-1-git-send-email-arei.gonglei@huawei.com>
References: <1424838157-5524-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.54ED4E3D.0004, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: d20a4cf456a421bd92c5ba3134a7608f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH v2 08/11] xtensa: Remove superfluous '\n'
	around error_report()
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
X-List-Received-Date: Wed, 25 Feb 2015 04:23:40 -0000

From: Gonglei <arei.gonglei@huawei.com>

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
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



