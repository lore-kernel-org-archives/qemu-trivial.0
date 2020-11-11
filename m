Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kcr1Z-0004QF-41
	for mharc-qemu-trivial@gnu.org; Wed, 11 Nov 2020 09:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kcr1W-0004Jz-9G; Wed, 11 Nov 2020 09:22:58 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kcr1K-0000cJ-Vs; Wed, 11 Nov 2020 09:22:57 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CWRl84XnSzhk1Y;
 Wed, 11 Nov 2020 22:22:28 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Wed, 11 Nov 2020
 22:22:30 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <peter.maydell@linaro.org>, <zhang.zhanghailiang@huawei.com>,
 <ganqixin@huawei.com>, Chen Qun <kuhn.chenqun@huawei.com>, Euler Robot
 <euler.robot@huawei.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, Juan Quintela <quintela@redhat.com>, "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>
Subject: [PATCH v2 5/5] migration: fix uninitialized variable warning in
 migrate_send_rp_req_pages()
Date: Wed, 11 Nov 2020 22:22:03 +0800
Message-ID: <20201111142203.2359370-6-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201111142203.2359370-1-kuhn.chenqun@huawei.com>
References: <20201111142203.2359370-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 07:07:25
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 11 Nov 2020 14:22:58 -0000

After the WITH_QEMU_LOCK_GUARD macro is added, the compiler cannot identify
 that the statements in the macro must be executed. As a result, some variables
 assignment statements in the macro may be considered as unexecuted by the compiler.

When the -Wmaybe-uninitialized capability is enabled on GCC9,the compiler showed warning:
migration/migration.c: In function ‘migrate_send_rp_req_pages’:
migration/migration.c:384:8: warning: ‘received’ may be used uninitialized in this function [-Wmaybe-uninitialized]
 384 |     if (received) {
     |        ^

Add a default value for 'received' to prevented the warning.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Juan Quintela <quintela@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
---
 migration/migration.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 9bb4fee5ac..de90486a61 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -361,7 +361,7 @@ int migrate_send_rp_req_pages(MigrationIncomingState *mis,
                               RAMBlock *rb, ram_addr_t start, uint64_t haddr)
 {
     void *aligned = (void *)(uintptr_t)(haddr & (-qemu_ram_pagesize(rb)));
-    bool received;
+    bool received = false;
 
     WITH_QEMU_LOCK_GUARD(&mis->page_request_mutex) {
         received = ramblock_recv_bitmap_test_byte_offset(rb, start);
-- 
2.27.0


