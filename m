Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmpuD-0004aW-OK
	for mharc-qemu-trivial@gnu.org; Tue, 08 Dec 2020 22:12:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kmpuA-0004YZ-Lj; Tue, 08 Dec 2020 22:12:38 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kmpu7-0008N2-C8; Tue, 08 Dec 2020 22:12:38 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CrMXd3pPHzhpbL;
 Wed,  9 Dec 2020 11:12:01 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Wed, 9 Dec 2020
 11:12:16 +0800
From: zhouyang <zhouyang789@huawei.com>
To: <alex.bennee@linaro.org>
CC: <qemu-devel@nongnu.org>, <alex.chen@huawei.com>, <hunongda@huawei.com>,
 <qemu-trivial@nongnu.org>
Subject: [PATCH v2 2/5] contrib: Fix some code style problems,
 ERROR: "foo * bar" should be "foo *bar"
Date: Wed, 9 Dec 2020 11:04:44 +0800
Message-ID: <20201209030447.2135652-3-zhouyang789@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201209030447.2135652-1-zhouyang789@huawei.com>
References: <20201209030447.2135652-1-zhouyang789@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=zhouyang789@huawei.com; helo=szxga06-in.huawei.com
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
X-List-Received-Date: Wed, 09 Dec 2020 03:12:39 -0000

I am reading contrib related code and found some style problems while
check the code using checkpatch.pl. This commit fixs the issue below:
ERROR: "foo * bar" should be "foo *bar"

Signed-off-by: zhouyang <zhouyang789@huawei.com>
---
 contrib/plugins/howvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/plugins/howvec.c b/contrib/plugins/howvec.c
index 6e602aaccf..2f892da17d 100644
--- a/contrib/plugins/howvec.c
+++ b/contrib/plugins/howvec.c
@@ -235,7 +235,7 @@ static void vcpu_insn_exec_before(unsigned int cpu_index, void *udata)
     (*count)++;
 }
 
-static uint64_t * find_counter(struct qemu_plugin_insn *insn)
+static uint64_t *find_counter(struct qemu_plugin_insn *insn)
 {
     int i;
     uint64_t *cnt = NULL;
-- 
2.23.0


