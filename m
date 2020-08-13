Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k67p8-0008NS-2v
	for mharc-qemu-trivial@gnu.org; Thu, 13 Aug 2020 03:38:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1k67p5-0008Hn-Px; Thu, 13 Aug 2020 03:38:51 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4236 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1k67p4-0001nj-1R; Thu, 13 Aug 2020 03:38:51 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 1AD8A883EEDA8CFDD98A;
 Thu, 13 Aug 2020 15:38:47 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Thu, 13 Aug 2020
 15:38:39 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <pannengyuan@huawei.com>, <zhang.zhanghailiang@huawei.com>, Chen Qun
 <kuhn.chenqun@huawei.com>, Euler Robot <euler.robot@huawei.com>, "Richard
 Henderson" <richard.henderson@linaro.org>, Richard Henderson
 <rth@twiddle.net>
Subject: [PATCH 08/11] tcg/optimize: Remove redundant statement in
 tcg_optimize()
Date: Thu, 13 Aug 2020 15:37:09 +0800
Message-ID: <20200813073712.4001404-9-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200813073712.4001404-1-kuhn.chenqun@huawei.com>
References: <20200813073712.4001404-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191;
 envelope-from=kuhn.chenqun@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 03:38:37
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Thu, 13 Aug 2020 07:38:52 -0000

Clang static code analyzer show warning:
tcg/optimize.c:1267:17: warning: Value stored to 'nb_iargs' is never read
                nb_iargs = 2;
                ^          ~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>
---
 tcg/optimize.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 53aa8e5329..d5bea37290 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1264,7 +1264,6 @@ void tcg_optimize(TCGContext *s)
                 op->opc = opc = (opc == INDEX_op_movcond_i32
                                  ? INDEX_op_setcond_i32
                                  : INDEX_op_setcond_i64);
-                nb_iargs = 2;
             }
             goto do_default;
 
-- 
2.23.0


