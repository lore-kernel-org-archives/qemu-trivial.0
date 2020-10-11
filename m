Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kRbWA-0000Tf-Dw
	for mharc-qemu-trivial@gnu.org; Sun, 11 Oct 2020 09:36:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kRYY3-0000yP-VK; Sun, 11 Oct 2020 06:25:51 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:51950 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kRYY1-0003CG-W9; Sun, 11 Oct 2020 06:25:51 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id CCB34F6EF7D28400F5FE;
 Sun, 11 Oct 2020 18:25:43 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Sun, 11 Oct 2020
 18:25:36 +0800
From: Bihong Yu <yubihong@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <quintela@redhat.com>, <dgilbert@redhat.com>, <alex.chen@huawei.com>,
 <wanghao232@huawei.com>, <zhengchuan@huawei.com>, <yubihong@huawei.com>
Subject: [PATCH v1 1/8] migration: Do not use C99 // comments
Date: Sun, 11 Oct 2020 18:57:36 +0800
Message-ID: <1602413863-19513-2-git-send-email-yubihong@huawei.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1602413863-19513-1-git-send-email-yubihong@huawei.com>
References: <1602413863-19513-1-git-send-email-yubihong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=yubihong@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 06:25:44
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 11 Oct 2020 09:35:56 -0400
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
X-List-Received-Date: Sun, 11 Oct 2020 10:25:52 -0000

Signed-off-by:Bihong Yu <yubihong@huawei.com>
Reviewed-by: Chuan Zheng <zhengchuan@huawei.com>
Signed-off-by: Bihong Yu <yubihong@huawei.com>
---
 migration/block.c | 2 +-
 migration/rdma.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/block.c b/migration/block.c
index 737b649..4b8576b 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -40,7 +40,7 @@
 #define MAX_IO_BUFFERS 512
 #define MAX_PARALLEL_IO 16
 
-//#define DEBUG_BLK_MIGRATION
+/* #define DEBUG_BLK_MIGRATION */
 
 #ifdef DEBUG_BLK_MIGRATION
 #define DPRINTF(fmt, ...) \
diff --git a/migration/rdma.c b/migration/rdma.c
index 0340841..0eb42b7 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1288,7 +1288,7 @@ const char *print_wrid(int wrid)
  * workload information or LRU information is available, do not attempt to use
  * this feature except for basic testing.
  */
-//#define RDMA_UNREGISTRATION_EXAMPLE
+/* #define RDMA_UNREGISTRATION_EXAMPLE */
 
 /*
  * Perform a non-optimized memory unregistration after every transfer
-- 
1.8.3.1


