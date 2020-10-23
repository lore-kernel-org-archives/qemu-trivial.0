Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kVqJw-0000RB-7h
	for mharc-qemu-trivial@gnu.org; Fri, 23 Oct 2020 02:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kVqJq-0000CZ-6t; Fri, 23 Oct 2020 02:12:54 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:47520 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kVqJn-0000wl-RL; Fri, 23 Oct 2020 02:12:53 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 93D45756E6E4B91F8C0F;
 Fri, 23 Oct 2020 14:12:45 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Fri, 23 Oct 2020
 14:12:37 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <pannengyuan@huawei.com>, <lvivier@redhat.com>,
 <zhang.zhanghailiang@huawei.com>, <ganqixin@huawei.com>, Euler Robot
 <euler.robot@huawei.com>, Kevin Wolf <kwolf@redhat.com>, Li Qiang
 <liq3ea@gmail.com>, Chen Qun <kuhn.chenqun@huawei.com>
Subject: [PATCH RESEND v2 6/7] blockdev: Fix a memleak in
 drive_backup_prepare()
Date: Fri, 23 Oct 2020 14:12:17 +0800
Message-ID: <20201023061218.2080844-7-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201023061218.2080844-1-kuhn.chenqun@huawei.com>
References: <20201023061218.2080844-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=kuhn.chenqun@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 02:12:37
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
X-List-Received-Date: Fri, 23 Oct 2020 06:12:54 -0000

From: Pan Nengyuan <pannengyuan@huawei.com>

'local_err' seems forgot to propagate in error path, it'll cause
a memleak. Fix it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Li Qiang <liq3ea@gmail.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
 blockdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/blockdev.c b/blockdev.c
index fe6fb5dc1d..6fd68f74f3 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -1827,6 +1827,7 @@ static void drive_backup_prepare(BlkActionState *common, Error **errp)
     if (set_backing_hd) {
         bdrv_set_backing_hd(target_bs, source, &local_err);
         if (local_err) {
+            error_propagate(errp, local_err);
             goto unref;
         }
     }
-- 
2.23.0


