Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1keUZp-0006m2-Rh
	for mharc-qemu-trivial@gnu.org; Sun, 15 Nov 2020 21:49:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1keUZk-0006Yp-Ib; Sun, 15 Nov 2020 21:49:04 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1keUZh-0002sV-Lu; Sun, 15 Nov 2020 21:49:04 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CZD6M3Xjpz15Jdf;
 Mon, 16 Nov 2020 10:48:43 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Mon, 16 Nov 2020
 10:48:49 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <zhang.zhanghailiang@huawei.com>, <ganqixin@huawei.com>, Chen Qun
 <kuhn.chenqun@huawei.com>, Euler Robot <euler.robot@huawei.com>, "Artyom
 Tarasenko" <atar4qemu@gmail.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v3 4/7] target/sparc/translate: silence the compiler warnings
Date: Mon, 16 Nov 2020 10:48:07 +0800
Message-ID: <20201116024810.2415819-5-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201116024810.2415819-1-kuhn.chenqun@huawei.com>
References: <20201116024810.2415819-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 21:16:58
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Mon, 16 Nov 2020 02:49:05 -0000

When using -Wimplicit-fallthrough in our CFLAGS on GCC9, the compiler showed warning:
target/sparc/translate.c: In function ‘gen_st_asi’:
target/sparc/translate.c:2320:12: warning: this statement may fall through [-Wimplicit-fallthrough=]
 2320 |         if (!(dc->def->features & CPU_FEATURE_HYPV)) {
      |            ^
target/sparc/translate.c:2329:5: note: here
 2329 |     case GET_ASI_DIRECT:
      |     ^~~~

The "fall through" statement place is not correctly identified by the compiler.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Artyom Tarasenko <atar4qemu@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
---
 target/sparc/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 1a4efd4ed6..a3d9aaa46b 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -2324,8 +2324,8 @@ static void gen_st_asi(DisasContext *dc, TCGv src, TCGv addr,
         }
         /* in OpenSPARC T1+ CPUs TWINX ASIs in store instructions
          * are ST_BLKINIT_ ASIs */
-        /* fall through */
 #endif
+        /* fall through */
     case GET_ASI_DIRECT:
         gen_address_mask(dc, addr);
         tcg_gen_qemu_st_tl(src, addr, da.mem_idx, da.memop);
-- 
2.27.0


