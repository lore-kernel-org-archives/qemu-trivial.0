Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kl60V-0001YM-LU
	for mharc-qemu-trivial@gnu.org; Fri, 04 Dec 2020 03:00:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kl60T-0001YC-Sd; Fri, 04 Dec 2020 02:59:57 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kl60R-0002Vi-4m; Fri, 04 Dec 2020 02:59:57 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CnQ8K4j1Vz6vxX;
 Fri,  4 Dec 2020 15:59:13 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Fri, 4 Dec 2020
 15:59:32 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <kuhn.chenqun@huawei.com>, <zhang.zhanghailiang@huawei.com>, Gan Qixin
 <ganqixin@huawei.com>, Euler Robot <euler.robot@huawei.com>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: [PATCH] ppc/e500: Free irqs array to avoid memleak
Date: Fri, 4 Dec 2020 15:58:22 +0800
Message-ID: <20201204075822.359832-1-ganqixin@huawei.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=ganqixin@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Dec 2020 07:59:58 -0000

When running qom-test, a memory leak occurred in the ppce500_init function,
this patch free irqs array to fix it.

ASAN shows memory leak stack:

Direct leak of 40 byte(s) in 1 object(s) allocated from:
    #0 0xfffc5ceee1f0 in __interceptor_calloc (/lib64/libasan.so.5+0xee1f0)
    #1 0xfffc5c806800 in g_malloc0 (/lib64/libglib-2.0.so.0+0x56800)
    #2 0xaaacf9999244 in ppce500_init qemu/hw/ppc/e500.c:859
    #3 0xaaacf97434e8 in machine_run_board_init qemu/hw/core/machine.c:1134
    #4 0xaaacf9c9475c in qemu_init qemu/softmmu/vl.c:4369
    #5 0xaaacf94785a0 in main qemu/softmmu/main.c:49

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/e500.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index ae39b9358e..74f33af88e 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -925,6 +925,7 @@ void ppce500_init(MachineState *machine)
                                 ccsr_addr_space);
 
     mpicdev = ppce500_init_mpic(pms, ccsr_addr_space, irqs);
+    g_free(irqs);
 
     /* Serial */
     if (serial_hd(0)) {
-- 
2.27.0


