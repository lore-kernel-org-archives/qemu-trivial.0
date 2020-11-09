Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kcMy6-0005m2-Ty
	for mharc-qemu-trivial@gnu.org; Tue, 10 Nov 2020 01:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kcMxt-0005dv-QO; Tue, 10 Nov 2020 01:17:13 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kcMxr-0003ZN-3G; Tue, 10 Nov 2020 01:17:13 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CVd1L0jyxzhjg7;
 Tue, 10 Nov 2020 14:16:54 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Tue, 10 Nov 2020
 14:16:54 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <pbonzini@redhat.com>, <kwolf@redhat.com>, <mreitz@redhat.com>,
 <stefanha@redhat.com>, <dnbrdsky@gmail.com>,
 <zhang.zhanghailiang@huawei.com>, <kuhn.chenqun@huawei.com>, Gan Qixin
 <ganqixin@huawei.com>
Subject: [PATCH 4/4] block/iscsi.c: Use lock guard macros
Date: Mon, 9 Nov 2020 23:43:27 +0800
Message-ID: <20201109154327.325675-5-ganqixin@huawei.com>
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
(QEMU_LOCK_GUARD/WITH_QEMU_LOCK_GUARD) in block/iscsi.c.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
 block/iscsi.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/block/iscsi.c b/block/iscsi.c
index e30a7e3606..f5f657b582 100644
--- a/block/iscsi.c
+++ b/block/iscsi.c
@@ -322,7 +322,7 @@ iscsi_aio_cancel(BlockAIOCB *blockacb)
     IscsiAIOCB *acb = (IscsiAIOCB *)blockacb;
     IscsiLun *iscsilun = acb->iscsilun;
 
-    qemu_mutex_lock(&iscsilun->mutex);
+    QEMU_LOCK_GUARD(&iscsilun->mutex);
 
     /* If it was cancelled or completed already, our work is done here */
     if (acb->cancelled || acb->status != -EINPROGRESS) {
@@ -339,8 +339,6 @@ iscsi_aio_cancel(BlockAIOCB *blockacb)
                                          iscsi_abort_task_cb, acb) < 0) {
         qemu_aio_unref(acb); /* since iscsi_abort_task_cb() won't be called */
     }
-
-    qemu_mutex_unlock(&iscsilun->mutex);
 }
 
 static const AIOCBInfo iscsi_aiocb_info = {
@@ -375,22 +373,22 @@ static void iscsi_timed_check_events(void *opaque)
 {
     IscsiLun *iscsilun = opaque;
 
-    qemu_mutex_lock(&iscsilun->mutex);
+    WITH_QEMU_LOCK_GUARD(&iscsilun->mutex) {
+        /* check for timed out requests */
+        iscsi_service(iscsilun->iscsi, 0);
 
-    /* check for timed out requests */
-    iscsi_service(iscsilun->iscsi, 0);
+        if (iscsilun->request_timed_out) {
+            iscsilun->request_timed_out = false;
+            iscsi_reconnect(iscsilun->iscsi);
+        }
 
-    if (iscsilun->request_timed_out) {
-        iscsilun->request_timed_out = false;
-        iscsi_reconnect(iscsilun->iscsi);
+        /*
+         * newer versions of libiscsi may return zero events. Ensure we are
+         * able to return to service once this situation changes.
+         */
+        iscsi_set_events(iscsilun);
     }
 
-    /* newer versions of libiscsi may return zero events. Ensure we are able
-     * to return to service once this situation changes. */
-    iscsi_set_events(iscsilun);
-
-    qemu_mutex_unlock(&iscsilun->mutex);
-
     timer_mod(iscsilun->event_timer,
               qemu_clock_get_ms(QEMU_CLOCK_REALTIME) + EVENT_INTERVAL);
 }
-- 
2.23.0


