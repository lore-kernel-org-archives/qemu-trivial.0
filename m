Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kkpDG-0006XZ-JQ
	for mharc-qemu-trivial@gnu.org; Thu, 03 Dec 2020 09:04:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kkpDF-0006UG-9o; Thu, 03 Dec 2020 09:04:01 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kkpD9-0006w3-S0; Thu, 03 Dec 2020 09:04:01 -0500
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CmyGh3D59zkkmR;
 Thu,  3 Dec 2020 22:03:08 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Thu, 3 Dec 2020
 22:03:29 +0800
From: Alex Chen <alex.chen@huawei.com>
To: <stefanha@redhat.com>, <mjt@tls.msk.ru>
CC: <alex.chen@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-trivial@nongnu.org>, <zhang.zhanghailiang@huawei.com>
Subject: [PATCH] readline: Fix possible array index out of bounds in
 readline_hist_add()
Date: Thu, 3 Dec 2020 13:50:43 +0000
Message-ID: <20201203135043.117072-1-alex.chen@huawei.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=alex.chen@huawei.com;
 helo=szxga04-in.huawei.com
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
X-List-Received-Date: Thu, 03 Dec 2020 14:04:01 -0000

When the 'cmdline' is the last entry in 'rs->history' array, there is
no need to put this entry to the end of the array, partly because it is
the last entry, and partly because the next operition will lead to array
index out of bounds.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
---
 util/readline.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/util/readline.c b/util/readline.c
index e534460da6..f1ac6e4769 100644
--- a/util/readline.c
+++ b/util/readline.c
@@ -240,6 +240,9 @@ static void readline_hist_add(ReadLineState *rs, const char *cmdline)
         }
         if (strcmp(hist_entry, cmdline) == 0) {
         same_entry:
+            if (idx == READLINE_MAX_CMDS - 1) {
+                return;
+            }
             new_entry = hist_entry;
             /* Put this entry at the end of history */
             memmove(&rs->history[idx], &rs->history[idx + 1],
-- 
2.19.1


