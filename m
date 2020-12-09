Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmpuG-0004ib-KU
	for mharc-qemu-trivial@gnu.org; Tue, 08 Dec 2020 22:12:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kmpuF-0004e5-1P; Tue, 08 Dec 2020 22:12:43 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhouyang789@huawei.com>)
 id 1kmpuD-0008Qn-Ap; Tue, 08 Dec 2020 22:12:42 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CrMXd38Zmzhp6R;
 Wed,  9 Dec 2020 11:12:01 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Wed, 9 Dec 2020
 11:12:18 +0800
From: zhouyang <zhouyang789@huawei.com>
To: <alex.bennee@linaro.org>
CC: <qemu-devel@nongnu.org>, <alex.chen@huawei.com>, <hunongda@huawei.com>,
 <qemu-trivial@nongnu.org>
Subject: [PATCH v2 5/5] contrib: Open brace '{' following struct go on the
 same line
Date: Wed, 9 Dec 2020 11:04:47 +0800
Message-ID: <20201209030447.2135652-6-zhouyang789@huawei.com>
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
X-List-Received-Date: Wed, 09 Dec 2020 03:12:43 -0000

I found some style problems whil check the code using checkpatch.pl.
This commit fixs the issue below:
ERROR: that open brace { should be on the previous line

Signed-off-by: zhouyang <zhouyang789@huawei.com>
---
 contrib/plugins/howvec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/contrib/plugins/howvec.c b/contrib/plugins/howvec.c
index 9d6fa33297..600f7facc1 100644
--- a/contrib/plugins/howvec.c
+++ b/contrib/plugins/howvec.c
@@ -145,8 +145,7 @@ typedef struct {
     int table_sz;
 } ClassSelector;
 
-static ClassSelector class_tables[] =
-{
+static ClassSelector class_tables[] = {
     { "aarch64", aarch64_insn_classes, ARRAY_SIZE(aarch64_insn_classes) },
     { "sparc",   sparc32_insn_classes, ARRAY_SIZE(sparc32_insn_classes) },
     { "sparc64", sparc64_insn_classes, ARRAY_SIZE(sparc64_insn_classes) },
-- 
2.23.0


