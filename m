Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kcMy9-0005n4-56
	for mharc-qemu-trivial@gnu.org; Tue, 10 Nov 2020 01:17:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kcMxu-0005e2-3L; Tue, 10 Nov 2020 01:17:14 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kcMxr-0003Zh-38; Tue, 10 Nov 2020 01:17:13 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CVd1L18nvzhjjP;
 Tue, 10 Nov 2020 14:16:54 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Tue, 10 Nov 2020
 14:16:52 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <pbonzini@redhat.com>, <kwolf@redhat.com>, <mreitz@redhat.com>,
 <stefanha@redhat.com>, <dnbrdsky@gmail.com>,
 <zhang.zhanghailiang@huawei.com>, <kuhn.chenqun@huawei.com>, Gan Qixin
 <ganqixin@huawei.com>
Subject: [PATCH 3/4] block/throttle-groups.c: Use lock guard macros
Date: Mon, 9 Nov 2020 23:43:26 +0800
Message-ID: <20201109154327.325675-4-ganqixin@huawei.com>
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
X-List-Received-Date: Tue, 10 Nov 2020 06:17:14 -0000

Replace manual lock()/unlock() calls with lock guard macros
(QEMU_LOCK_GUARD/WITH_QEMU_LOCK_GUARD) in block/throttle-groups.c.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
 block/throttle-groups.c | 48 ++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/block/throttle-groups.c b/block/throttle-groups.c
index e2f2813c0f..badb93a3be 100644
--- a/block/throttle-groups.c
+++ b/block/throttle-groups.c
@@ -546,7 +546,7 @@ void throttle_group_register_tgm(ThrottleGroupMember *tgm,
     tgm->aio_context = ctx;
     qatomic_set(&tgm->restart_pending, 0);
 
-    qemu_mutex_lock(&tg->lock);
+    QEMU_LOCK_GUARD(&tg->lock);
     /* If the ThrottleGroup is new set this ThrottleGroupMember as the token */
     for (i = 0; i < 2; i++) {
         if (!tg->tokens[i]) {
@@ -565,8 +565,6 @@ void throttle_group_register_tgm(ThrottleGroupMember *tgm,
     qemu_co_mutex_init(&tgm->throttled_reqs_lock);
     qemu_co_queue_init(&tgm->throttled_reqs[0]);
     qemu_co_queue_init(&tgm->throttled_reqs[1]);
-
-    qemu_mutex_unlock(&tg->lock);
 }
 
 /* Unregister a ThrottleGroupMember from its group, removing it from the list,
@@ -594,25 +592,25 @@ void throttle_group_unregister_tgm(ThrottleGroupMember *tgm)
     /* Wait for throttle_group_restart_queue_entry() coroutines to finish */
     AIO_WAIT_WHILE(tgm->aio_context, qatomic_read(&tgm->restart_pending) > 0);
 
-    qemu_mutex_lock(&tg->lock);
-    for (i = 0; i < 2; i++) {
-        assert(tgm->pending_reqs[i] == 0);
-        assert(qemu_co_queue_empty(&tgm->throttled_reqs[i]));
-        assert(!timer_pending(tgm->throttle_timers.timers[i]));
-        if (tg->tokens[i] == tgm) {
-            token = throttle_group_next_tgm(tgm);
-            /* Take care of the case where this is the last tgm in the group */
-            if (token == tgm) {
-                token = NULL;
+    WITH_QEMU_LOCK_GUARD(&tg->lock) {
+        for (i = 0; i < 2; i++) {
+            assert(tgm->pending_reqs[i] == 0);
+            assert(qemu_co_queue_empty(&tgm->throttled_reqs[i]));
+            assert(!timer_pending(tgm->throttle_timers.timers[i]));
+            if (tg->tokens[i] == tgm) {
+                token = throttle_group_next_tgm(tgm);
+                /* Take care of the case where this is the last tgm in the group */
+                if (token == tgm) {
+                    token = NULL;
+                }
+                tg->tokens[i] = token;
             }
-            tg->tokens[i] = token;
         }
-    }
 
-    /* remove the current tgm from the list */
-    QLIST_REMOVE(tgm, round_robin);
-    throttle_timers_destroy(&tgm->throttle_timers);
-    qemu_mutex_unlock(&tg->lock);
+        /* remove the current tgm from the list */
+        QLIST_REMOVE(tgm, round_robin);
+        throttle_timers_destroy(&tgm->throttle_timers);
+    }
 
     throttle_group_unref(&tg->ts);
     tgm->throttle_state = NULL;
@@ -638,14 +636,14 @@ void throttle_group_detach_aio_context(ThrottleGroupMember *tgm)
     assert(qemu_co_queue_empty(&tgm->throttled_reqs[1]));
 
     /* Kick off next ThrottleGroupMember, if necessary */
-    qemu_mutex_lock(&tg->lock);
-    for (i = 0; i < 2; i++) {
-        if (timer_pending(tt->timers[i])) {
-            tg->any_timer_armed[i] = false;
-            schedule_next_request(tgm, i);
+     WITH_QEMU_LOCK_GUARD(&tg->lock) {
+        for (i = 0; i < 2; i++) {
+            if (timer_pending(tt->timers[i])) {
+                tg->any_timer_armed[i] = false;
+                schedule_next_request(tgm, i);
+            }
         }
     }
-    qemu_mutex_unlock(&tg->lock);
 
     throttle_timers_detach_aio_context(tt);
     tgm->aio_context = NULL;
-- 
2.23.0


