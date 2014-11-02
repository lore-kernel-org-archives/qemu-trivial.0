Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xku6L-0005FH-V2
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 07:17:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54470)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xku6E-00050p-Fq
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:17:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xku6A-0007LB-D3
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 07:17:38 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56521)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xku60-0007E5-JO; Sun, 02 Nov 2014 07:17:24 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 552C5402C4;
	Sun,  2 Nov 2014 15:17:23 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 611C3715;
	Sun,  2 Nov 2014 14:58:49 +0300 (MSK)
Received: (nullmailer pid 14970 invoked by uid 1000);
	Sun, 02 Nov 2014 11:58:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:22 +0300
Message-Id: <8ef2b256b94696a3a4bd8aa69a2b0fd7bc246f07.1414929285.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
References: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: [Qemu-trivial] [PULL 10/23] target-tricore: check return value
	before using it
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
X-List-Received-Date: Sun, 02 Nov 2014 12:17:43 -0000

From: zhanghailiang <zhang.zhanghailiang@huawei.com>

We reference the return value of cpu before checking whether it is NULL,
The checking code is after that which violates code style.

It makes no difference if the cpu is NULL, qemu process will terminate.
But one will be 'Segmentation fault' and the other will report a error
which is what we want.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/tricore/tricore_testboard.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboard.c
index eeb4922..a059a20 100644
--- a/hw/tricore/tricore_testboard.c
+++ b/hw/tricore/tricore_testboard.c
@@ -71,11 +71,11 @@ static void tricore_testboard_init(MachineState *machine, int board_id)
         machine->cpu_model = "tc1796";
     }
     cpu = cpu_tricore_init(machine->cpu_model);
-    env = &cpu->env;
     if (!cpu) {
         error_report("Unable to find CPU definition");
         exit(1);
     }
+    env = &cpu->env;
     memory_region_init_ram(ext_cram, NULL, "powerlink_ext_c.ram", 2*1024*1024, &error_abort);
     vmstate_register_ram_global(ext_cram);
     memory_region_init_ram(ext_dram, NULL, "powerlink_ext_d.ram", 4*1024*1024, &error_abort);
-- 
1.7.10.4


