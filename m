Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kcMy2-0005jO-Gx
	for mharc-qemu-trivial@gnu.org; Tue, 10 Nov 2020 01:17:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kcMxt-0005dj-21; Tue, 10 Nov 2020 01:17:13 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kcMxp-0003ZJ-6U; Tue, 10 Nov 2020 01:17:12 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CVd1L0yKtzhjjM;
 Tue, 10 Nov 2020 14:16:54 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Tue, 10 Nov 2020
 14:16:50 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <pbonzini@redhat.com>, <kwolf@redhat.com>, <mreitz@redhat.com>,
 <stefanha@redhat.com>, <dnbrdsky@gmail.com>,
 <zhang.zhanghailiang@huawei.com>, <kuhn.chenqun@huawei.com>, Gan Qixin
 <ganqixin@huawei.com>
Subject: [PATCH 2/4] block/curl.c: Use lock guard macros
Date: Mon, 9 Nov 2020 23:43:25 +0800
Message-ID: <20201109154327.325675-3-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201109154327.325675-1-ganqixin@huawei.com>
References: <20201109154327.325675-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=ganqixin@huawei.com;
 helo=szxga05-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 01:17:02
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 10 Nov 2020 06:17:13 -0000

Replace manual lock()/unlock() calls with lock guard macros
(QEMU_LOCK_GUARD/WITH_QEMU_LOCK_GUARD) in block/curl.c.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
 block/curl.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/block/curl.c b/block/curl.c
index 4f907c47be..d24a4c5897 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -564,23 +564,23 @@ static void curl_detach_aio_context(BlockDriverState *bs)
     BDRVCURLState *s = bs->opaque;
     int i;
 
-    qemu_mutex_lock(&s->mutex);
-    for (i = 0; i < CURL_NUM_STATES; i++) {
-        if (s->states[i].in_use) {
-            curl_clean_state(&s->states[i]);
+    WITH_QEMU_LOCK_GUARD(&s->mutex) {
+        for (i = 0; i < CURL_NUM_STATES; i++) {
+            if (s->states[i].in_use) {
+                curl_clean_state(&s->states[i]);
+            }
+            if (s->states[i].curl) {
+                curl_easy_cleanup(s->states[i].curl);
+                s->states[i].curl = NULL;
+            }
+            g_free(s->states[i].orig_buf);
+            s->states[i].orig_buf = NULL;
         }
-        if (s->states[i].curl) {
-            curl_easy_cleanup(s->states[i].curl);
-            s->states[i].curl = NULL;
+        if (s->multi) {
+            curl_multi_cleanup(s->multi);
+            s->multi = NULL;
         }
-        g_free(s->states[i].orig_buf);
-        s->states[i].orig_buf = NULL;
-    }
-    if (s->multi) {
-        curl_multi_cleanup(s->multi);
-        s->multi = NULL;
     }
-    qemu_mutex_unlock(&s->mutex);
 
     timer_del(&s->timer);
 }
-- 
2.23.0


