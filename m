Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kcMy2-0005iu-AF
	for mharc-qemu-trivial@gnu.org; Tue, 10 Nov 2020 01:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kcMxs-0005dY-Do; Tue, 10 Nov 2020 01:17:12 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kcMxp-0003YE-1v; Tue, 10 Nov 2020 01:17:12 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CVd1F2G8Vz74xv;
 Tue, 10 Nov 2020 14:16:49 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Tue, 10 Nov 2020
 14:16:48 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <pbonzini@redhat.com>, <kwolf@redhat.com>, <mreitz@redhat.com>,
 <stefanha@redhat.com>, <dnbrdsky@gmail.com>,
 <zhang.zhanghailiang@huawei.com>, <kuhn.chenqun@huawei.com>, Gan Qixin
 <ganqixin@huawei.com>
Subject: [PATCH 1/4] block/accounting.c: Use lock guard macros
Date: Mon, 9 Nov 2020 23:43:24 +0800
Message-ID: <20201109154327.325675-2-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201109154327.325675-1-ganqixin@huawei.com>
References: <20201109154327.325675-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=ganqixin@huawei.com;
 helo=szxga07-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 01:02:06
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 10 Nov 2020 06:17:12 -0000

Replace manual lock()/unlock() calls with lock guard macros
(QEMU_LOCK_GUARD/WITH_QEMU_LOCK_GUARD) in block/accounting.c.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
 block/accounting.c | 32 +++++++++++++++-----------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/block/accounting.c b/block/accounting.c
index 8d41c8a83a..2030851d79 100644
--- a/block/accounting.c
+++ b/block/accounting.c
@@ -199,29 +199,27 @@ static void block_account_one_io(BlockAcctStats *stats, BlockAcctCookie *cookie,
         return;
     }
 
-    qemu_mutex_lock(&stats->lock);
-
-    if (failed) {
-        stats->failed_ops[cookie->type]++;
-    } else {
-        stats->nr_bytes[cookie->type] += cookie->bytes;
-        stats->nr_ops[cookie->type]++;
-    }
+    WITH_QEMU_LOCK_GUARD(&stats->lock) {
+        if (failed) {
+            stats->failed_ops[cookie->type]++;
+        } else {
+            stats->nr_bytes[cookie->type] += cookie->bytes;
+            stats->nr_ops[cookie->type]++;
+        }
 
-    block_latency_histogram_account(&stats->latency_histogram[cookie->type],
-                                    latency_ns);
+        block_latency_histogram_account(&stats->latency_histogram[cookie->type],
+                                        latency_ns);
 
-    if (!failed || stats->account_failed) {
-        stats->total_time_ns[cookie->type] += latency_ns;
-        stats->last_access_time_ns = time_ns;
+        if (!failed || stats->account_failed) {
+            stats->total_time_ns[cookie->type] += latency_ns;
+            stats->last_access_time_ns = time_ns;
 
-        QSLIST_FOREACH(s, &stats->intervals, entries) {
-            timed_average_account(&s->latency[cookie->type], latency_ns);
+            QSLIST_FOREACH(s, &stats->intervals, entries) {
+                timed_average_account(&s->latency[cookie->type], latency_ns);
+            }
         }
     }
 
-    qemu_mutex_unlock(&stats->lock);
-
     cookie->type = BLOCK_ACCT_NONE;
 }
 
-- 
2.23.0


