Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSfD9-0003Ce-KX
	for mharc-qemu-trivial@gnu.org; Wed, 14 Oct 2020 07:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kSfD7-0003AW-OY; Wed, 14 Oct 2020 07:44:49 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:49882 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kSfD5-0007uQ-FK; Wed, 14 Oct 2020 07:44:49 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id BD79E4EEA73786A28C5E;
 Wed, 14 Oct 2020 19:44:41 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Wed, 14 Oct 2020
 19:44:32 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <mreitz@redhat.com>, <vsementsov@virtuozzo.com>, <stefanha@redhat.com>,
 <fam@euphon.net>, <eblake@redhat.com>, <jsnow@redhat.com>,
 <quintela@redhat.com>, <dgilbert@redhat.com>,
 <zhang.zhanghailiang@huawei.com>, <ganqixin@huawei.com>,
 <qemu-block@nongnu.org>, Chen Qun <kuhn.chenqun@huawei.com>, Euler Robot
 <euler.robot@huawei.com>, Laurent Vivier <laurent@vivier.eu>, Li Qiang
 <liq3ea@gmail.com>
Subject: [PATCH v3] migration/block-dirty-bitmap: fix uninitialized variable
 warning
Date: Wed, 14 Oct 2020 19:44:30 +0800
Message-ID: <20201014114430.1898684-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=kuhn.chenqun@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/14 07:44:42
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Wed, 14 Oct 2020 11:44:50 -0000

A default value is provided for the variable 'bitmap_name' to avoid compiler warning.

The compiler show warning:
migration/block-dirty-bitmap.c:1090:13: warning: ‘bitmap_name’
may be used uninitialized in this function [-Wmaybe-uninitialized]
       g_strlcpy(s->bitmap_name, bitmap_name, sizeof(s->bitmap_name));
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
v2->v3: Placing the declaration at the beginning of the block(Base on Max's suggestion).

Cc: Max Reitz <mreitz@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Li Qiang <liq3ea@gmail.com>
---
 migration/block-dirty-bitmap.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 5bef793ac0..114987961a 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -1071,18 +1071,15 @@ static int dirty_bitmap_load_header(QEMUFile *f, DBMLoadState *s,
             return -EINVAL;
         }
 
-        if (!s->cancelled) {
-            if (bitmap_alias_map) {
-                bitmap_name = g_hash_table_lookup(bitmap_alias_map,
-                                                  s->bitmap_alias);
-                if (!bitmap_name) {
-                    error_report("Error: Unknown bitmap alias '%s' on node "
-                                 "'%s' (alias '%s')", s->bitmap_alias,
-                                 s->bs->node_name, s->node_alias);
-                    cancel_incoming_locked(s);
-                }
-            } else {
-                bitmap_name = s->bitmap_alias;
+        bitmap_name = s->bitmap_alias;
+        if (!s->cancelled && bitmap_alias_map) {
+            bitmap_name = g_hash_table_lookup(bitmap_alias_map,
+                                              s->bitmap_alias);
+            if (!bitmap_name) {
+                error_report("Error: Unknown bitmap alias '%s' on node "
+                             "'%s' (alias '%s')", s->bitmap_alias,
+                             s->bs->node_name, s->node_alias);
+                cancel_incoming_locked(s);
             }
         }
 
-- 
2.23.0


