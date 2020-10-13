Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSJVQ-0002by-2b
	for mharc-qemu-trivial@gnu.org; Tue, 13 Oct 2020 08:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kSJVN-0002Zq-9Z; Tue, 13 Oct 2020 08:34:13 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5177 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kSJVK-0002YV-O9; Tue, 13 Oct 2020 08:34:13 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 6068FE123A333A2F22D7;
 Tue, 13 Oct 2020 20:34:02 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Tue, 13 Oct 2020
 20:33:56 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <mreitz@redhat.com>, <vsementsov@virtuozzo.com>, <stefanha@redhat.com>,
 <fam@euphon.net>, <eblake@redhat.com>, <jsnow@redhat.com>,
 <quintela@redhat.com>, <dgilbert@redhat.com>,
 <zhang.zhanghailiang@huawei.com>, <ganqixin@huawei.com>,
 <qemu-block@nongnu.org>, Chen Qun <kuhn.chenqun@huawei.com>, Euler Robot
 <euler.robot@huawei.com>, Laurent Vivier <laurent@vivier.eu>, Li Qiang
 <liq3ea@gmail.com>
Subject: [PATCH v2] migration/block-dirty-bitmap: fix uninitialized variable
 warning
Date: Tue, 13 Oct 2020 20:33:40 +0800
Message-ID: <20201013123340.1850548-1-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=kuhn.chenqun@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 08:34:04
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
X-List-Received-Date: Tue, 13 Oct 2020 12:34:13 -0000

A default value is provided for the variable 'bitmap_name' to avoid compiler warning.

The compiler show warning:
migration/block-dirty-bitmap.c:1090:13: warning: ‘bitmap_name’
may be used uninitialized in this function [-Wmaybe-uninitialized]
       g_strlcpy(s->bitmap_name, bitmap_name, sizeof(s->bitmap_name));
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Li Qiang <liq3ea@gmail.com>
---
 migration/block-dirty-bitmap.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index 5bef793ac0..bcb79c04ce 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -1064,15 +1064,13 @@ static int dirty_bitmap_load_header(QEMUFile *f, DBMLoadState *s,
     assert(nothing || s->cancelled || !!alias_map == !!bitmap_alias_map);
 
     if (s->flags & DIRTY_BITMAP_MIG_FLAG_BITMAP_NAME) {
-        const char *bitmap_name;
-
         if (!qemu_get_counted_string(f, s->bitmap_alias)) {
             error_report("Unable to read bitmap alias string");
             return -EINVAL;
         }
 
-        if (!s->cancelled) {
-            if (bitmap_alias_map) {
+        const char *bitmap_name = s->bitmap_alias;
+        if (!s->cancelled && bitmap_alias_map) {
                 bitmap_name = g_hash_table_lookup(bitmap_alias_map,
                                                   s->bitmap_alias);
                 if (!bitmap_name) {
@@ -1081,9 +1079,6 @@ static int dirty_bitmap_load_header(QEMUFile *f, DBMLoadState *s,
                                  s->bs->node_name, s->node_alias);
                     cancel_incoming_locked(s);
                 }
-            } else {
-                bitmap_name = s->bitmap_alias;
-            }
         }
 
         if (!s->cancelled) {
-- 
2.23.0


