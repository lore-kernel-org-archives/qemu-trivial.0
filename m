Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kcr1b-0004WD-BR
	for mharc-qemu-trivial@gnu.org; Wed, 11 Nov 2020 09:23:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kcr1W-0004Kf-KS; Wed, 11 Nov 2020 09:22:58 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kcr1I-0000c1-Fz; Wed, 11 Nov 2020 09:22:58 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CWRl33WM9z15TDv;
 Wed, 11 Nov 2020 22:22:23 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Wed, 11 Nov 2020
 22:22:24 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <peter.maydell@linaro.org>, <zhang.zhanghailiang@huawei.com>,
 <ganqixin@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>, Euler Robot
 <euler.robot@huawei.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>
Subject: [PATCH v2 1/5] hw/rdma/rdma_backend: fix uninitialized variable
 warning in rdma_poll_cq()
Date: Wed, 11 Nov 2020 22:21:59 +0800
Message-ID: <20201111142203.2359370-2-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201111142203.2359370-1-kuhn.chenqun@huawei.com>
References: <20201111142203.2359370-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 07:50:46
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
X-List-Received-Date: Wed, 11 Nov 2020 14:22:59 -0000

After the WITH_QEMU_LOCK_GUARD macro is added, the compiler cannot identify
 that the statements in the macro must be executed. As a result, some variables
 assignment statements in the macro may be considered as unexecuted by the compiler.

When the -Wmaybe-uninitialized capability is enabled on GCC9,the compiler showed warning:
hw/rdma/rdma_backend.c: In function ‘rdma_poll_cq’:
hw/rdma/rdma_utils.h:25:5: warning: ‘ne’ may be used uninitialized in this function [-Wmaybe-uninitialized]
 25 |     error_report("%s: " fmt, "rdma", ## __VA_ARGS__)
    |     ^~~~~~~~~~~~
hw/rdma/rdma_backend.c:93:12: note: ‘ne’ was declared here
 93 |     int i, ne, total_ne = 0;
    |            ^~

Add a default value for 'ne' to prevented the warning.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Reviewed-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
---
Cc: Yuval Shaia <yuval.shaia.ml@gmail.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
---
 hw/rdma/rdma_backend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/rdma/rdma_backend.c b/hw/rdma/rdma_backend.c
index 5de010b1fa..2fe4a3501c 100644
--- a/hw/rdma/rdma_backend.c
+++ b/hw/rdma/rdma_backend.c
@@ -90,7 +90,7 @@ static void clean_recv_mads(RdmaBackendDev *backend_dev)
 
 static int rdma_poll_cq(RdmaDeviceResources *rdma_dev_res, struct ibv_cq *ibcq)
 {
-    int i, ne, total_ne = 0;
+    int i, ne = 0, total_ne = 0;
     BackendCtx *bctx;
     struct ibv_wc wc[2];
     RdmaProtectedGSList *cqe_ctx_list;
-- 
2.27.0


