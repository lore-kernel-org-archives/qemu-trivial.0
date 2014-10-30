Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xjf6P-0004Pl-9J
	for mharc-qemu-trivial@gnu.org; Wed, 29 Oct 2014 22:04:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Xjf6J-0004OR-9u
	for qemu-trivial@nongnu.org; Wed, 29 Oct 2014 22:04:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Xjf6C-0001bZ-4m
	for qemu-trivial@nongnu.org; Wed, 29 Oct 2014 22:04:35 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:17618)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1Xjf6B-0001ZT-3B; Wed, 29 Oct 2014 22:04:28 -0400
Received: from 172.24.2.119 (EHLO szxeml423-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AWI23901; Thu, 30 Oct 2014 10:04:21 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml423-hub.china.huawei.com
	(10.82.67.162) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 30 Oct 2014 10:03:54 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Thu, 30 Oct 2014 10:03:28 +0800
Message-ID: <1414634608-31292-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020207.54519CA5.0105, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: a37866ab66890c5f2f7d093c92cac790
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: kbastian@mail.uni-paderborn.de,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH] target-tricore: check return value before
	using it
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
X-List-Received-Date: Thu, 30 Oct 2014 02:04:40 -0000

We reference the return value of cpu before checking whether it is NULL,
The checking code is after that which violates code style.

It makes no difference if the cpu is NULL, qemu process will terminate.
But one will be 'Segmentation fault' and the other will report a error
which is what we want.

Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
---
 hw/tricore/tricore_testboard.c | 2 +-
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
1.7.12.4



