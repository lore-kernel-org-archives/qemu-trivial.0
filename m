Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kY8tz-0004Ys-Gv
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2020 10:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangxinhao1@huawei.com>)
 id 1kY8tx-0004TF-Eq; Thu, 29 Oct 2020 10:27:41 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangxinhao1@huawei.com>)
 id 1kY8tv-00064B-LE; Thu, 29 Oct 2020 10:27:41 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CMST02pQSzkc54;
 Thu, 29 Oct 2020 22:27:32 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Thu, 29 Oct 2020
 22:27:23 +0800
From: jokenzhang <zhangxinhao1@huawei.com>
To: <qemu-devel@nongnu.org>
CC: <qemu_oss@crudebyte.com>, <groug@kaod.org>, <dengkai1@huawei.com>,
 <alex.chen@huawei.com>, <qemu-trivial@nongnu.org>
Subject: [PATCH v2 3/3] hw/9pfs : add space before the open parenthesis '('
Date: Thu, 29 Oct 2020 22:26:19 +0800
Message-ID: <20201029142619.1309649-3-zhangxinhao1@huawei.com>
X-Mailer: git-send-email 2.29.0-rc1
In-Reply-To: <20201029142619.1309649-1-zhangxinhao1@huawei.com>
References: <20201029142619.1309649-1-zhangxinhao1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhangxinhao1@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 09:43:35
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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
X-List-Received-Date: Thu, 29 Oct 2020 14:27:42 -0000

Fix code style. Space required before the open parenthesis '('.

Signed-off-by: jokenzhang <zhangxinhao1@huawei.com>
Signed-off-by: Kai Deng <dengkai1@huawei.com>
Reported-by: Euler Robot <euler.robot@huawei.com>
---
 hw/9pfs/cofs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/9pfs/cofs.c b/hw/9pfs/cofs.c
index 55991916ec..0b321b456e 100644
--- a/hw/9pfs/cofs.c
+++ b/hw/9pfs/cofs.c
@@ -23,7 +23,7 @@ static ssize_t __readlink(V9fsState *s, V9fsPath *path, V9fsString *buf)
     ssize_t len, maxlen = PATH_MAX;
 
     buf->data = g_malloc(PATH_MAX);
-    for(;;) {
+    for (;;) {
         len = s->ops->readlink(&s->ctx, path, buf->data, maxlen);
         if (len < 0) {
             g_free(buf->data);
-- 
2.29.0-rc1


