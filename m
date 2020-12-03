Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kkjPm-0002QW-8W
	for mharc-qemu-trivial@gnu.org; Thu, 03 Dec 2020 02:52:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kkjPk-0002ME-Kw; Thu, 03 Dec 2020 02:52:32 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kkjPi-00049i-5a; Thu, 03 Dec 2020 02:52:32 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cmp2Q1QnczhlqS;
 Thu,  3 Dec 2020 15:51:58 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Thu, 3 Dec 2020
 15:52:16 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <kwolf@redhat.com>, <pbonzini@redhat.com>, <armbru@redhat.com>,
 <kuhn.chenqun@huawei.com>, <zhang.zhanghailiang@huawei.com>, Gan Qixin
 <ganqixin@huawei.com>
Subject: [PATCH v2 3/4] block/throttle-groups: Use lock guard macros
Date: Thu, 3 Dec 2020 15:50:54 +0800
Message-ID: <20201203075055.127773-4-ganqixin@huawei.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201203075055.127773-1-ganqixin@huawei.com>
References: <20201203075055.127773-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=ganqixin@huawei.com;
 helo=szxga05-in.huawei.com
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
X-List-Received-Date: Thu, 03 Dec 2020 07:52:33 -0000

Replace manual lock()/unlock() calls with lock guard macros
(QEMU_LOCK_GUARD/WITH_QEMU_LOCK_GUARD) in block/throttle-groups.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
---
 block/throttle-groups.c | 48 ++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 25 deletions(-)

diff --git a/block/throttle-groups.c b/block/throttle-groups.c
index e2f2813c0f..abd16ed9db 100644
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
+    WITH_QEMU_LOCK_GUARD(&tg->lock) {
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
2.27.0


