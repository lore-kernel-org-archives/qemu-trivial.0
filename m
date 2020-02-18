Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j3yxV-0001h6-2X
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2020 04:14:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39112)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j3yxS-0001Wf-Dd
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:14:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kuhn.chenqun@huawei.com>) id 1j3yxQ-0000wc-H3
 for qemu-trivial@nongnu.org; Tue, 18 Feb 2020 04:14:22 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:43358 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1j3yxM-0000s1-7D; Tue, 18 Feb 2020 04:14:16 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 0727F7A2547525B3808B;
 Tue, 18 Feb 2020 17:14:08 +0800 (CST)
Received: from HGHY4C002233111.china.huawei.com (10.133.205.93) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.439.0; Tue, 18 Feb 2020 17:14:00 +0800
From: <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>, <jcmvbkbc@gmail.com>,
 <crwulff@gmail.com>, <marex@denx.de>, <edgar.iglesias@gmail.com>,
 <david@gibson.dropbear.id.au>
CC: <zhang.zhanghailiang@huawei.com>, <qemu-trivial@nongnu.org>,
 <pbonzini@redhat.com>, <pannengyuan@huawei.com>, Chen Qun
 <kuhn.chenqun@huawei.com>
Subject: [PATCH 2/3] hw/ppc/virtex_ml507:fix leak of fdevice tree blob
Date: Tue, 18 Feb 2020 17:11:53 +0800
Message-ID: <20200218091154.21696-3-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.14.1.windows.1
In-Reply-To: <20200218091154.21696-1-kuhn.chenqun@huawei.com>
References: <20200218091154.21696-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.205.93]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.32
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
X-List-Received-Date: Tue, 18 Feb 2020 09:14:23 -0000

From: Chen Qun <kuhn.chenqun@huawei.com>

The device tree blob returned by load_device_tree is malloced.
We should free it after cpu_physical_memory_write().

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
 hw/ppc/virtex_ml507.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 91dd00ee91..4eef70069f 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -188,6 +188,7 @@ static int xilinx_load_device_tree(hwaddr addr,
     if (r < 0)
         fprintf(stderr, "couldn't set /chosen/bootargs\n");
     cpu_physical_memory_write(addr, fdt, fdt_size);
+    g_free(fdt);
     return fdt_size;
 }
 
-- 
2.23.0



