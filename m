Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kYITx-0001kB-2V
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2020 20:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kYITt-0001ao-8X; Thu, 29 Oct 2020 20:41:25 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:2060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kYITq-00014N-Dr; Thu, 29 Oct 2020 20:41:24 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CMk5G3Bpdzhd2m;
 Fri, 30 Oct 2020 08:41:22 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Fri, 30 Oct 2020
 08:41:09 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <zhang.zhanghailiang@huawei.com>, <ganqixin@huawei.com>, Chen Qun
 <kuhn.chenqun@huawei.com>, Euler Robot <euler.robot@huawei.com>, "Artyom
 Tarasenko" <atar4qemu@gmail.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PATCH v2 5/8] target/sparc/translate: silence the compiler warnings
Date: Fri, 30 Oct 2020 08:40:43 +0800
Message-ID: <20201030004046.2191790-6-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201030004046.2191790-1-kuhn.chenqun@huawei.com>
References: <20201030004046.2191790-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32;
 envelope-from=kuhn.chenqun@huawei.com; helo=szxga06-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 20:41:10
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
X-List-Received-Date: Fri, 30 Oct 2020 00:41:26 -0000

When using -Wimplicit-fallthrough in our CFLAGS, the compiler showed warning:
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


