Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kkjPj-0002JP-E9
	for mharc-qemu-trivial@gnu.org; Thu, 03 Dec 2020 02:52:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kkjPh-0002HV-BI; Thu, 03 Dec 2020 02:52:29 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kkjPe-00047b-MH; Thu, 03 Dec 2020 02:52:28 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cmp2R1jmczhlmm;
 Thu,  3 Dec 2020 15:51:59 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Thu, 3 Dec 2020
 15:52:14 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <kwolf@redhat.com>, <pbonzini@redhat.com>, <armbru@redhat.com>,
 <kuhn.chenqun@huawei.com>, <zhang.zhanghailiang@huawei.com>, Gan Qixin
 <ganqixin@huawei.com>
Subject: [PATCH v2 2/4] block/curl: Use lock guard macros
Date: Thu, 3 Dec 2020 15:50:53 +0800
Message-ID: <20201203075055.127773-3-ganqixin@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201203075055.127773-1-ganqixin@huawei.com>
References: <20201203075055.127773-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=ganqixin@huawei.com;
 helo=szxga06-in.huawei.com
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
X-List-Received-Date: Thu, 03 Dec 2020 07:52:29 -0000

Replace manual lock()/unlock() calls with lock guard macros
(QEMU_LOCK_GUARD/WITH_QEMU_LOCK_GUARD) in block/curl.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
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
2.27.0


