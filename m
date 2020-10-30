Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kYITv-0001gv-Js
	for mharc-qemu-trivial@gnu.org; Thu, 29 Oct 2020 20:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kYITt-0001bK-Gl; Thu, 29 Oct 2020 20:41:25 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:2062)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kYITq-00014Q-FP; Thu, 29 Oct 2020 20:41:25 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CMk5G3LnWzhd5x;
 Fri, 30 Oct 2020 08:41:22 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Fri, 30 Oct 2020
 08:41:13 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <zhang.zhanghailiang@huawei.com>, <ganqixin@huawei.com>, Chen Qun
 <kuhn.chenqun@huawei.com>, Euler Robot <euler.robot@huawei.com>, Thomas Huth
 <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 8/8] target/ppc: replaced the TODO with LOG_UNIMP and add
 break for silence warnings
Date: Fri, 30 Oct 2020 08:40:46 +0800
Message-ID: <20201030004046.2191790-9-kuhn.chenqun@huawei.com>
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
target/ppc/mmu_helper.c: In function ‘dump_mmu’:
target/ppc/mmu_helper.c:1351:12: warning: this statement may fall through [-Wimplicit-fallthrough=]
 1351 |         if (ppc64_v3_radix(env_archcpu(env))) {
      |            ^
target/ppc/mmu_helper.c:1358:5: note: here
 1358 |     default:
      |     ^~~~~~~

Use "qemu_log_mask(LOG_UNIMP**)" instead of the TODO comment.
And add the break statement to fix it.

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
---
v1->v2: replace the TODO by a LOG_UNIMP call and add break statement(Base on Philippe's comments)

Cc: Thomas Huth <thuth@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/ppc/mmu_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 8972714775..12723362b7 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1349,11 +1349,12 @@ void dump_mmu(CPUPPCState *env)
         break;
     case POWERPC_MMU_3_00:
         if (ppc64_v3_radix(env_archcpu(env))) {
-            /* TODO - Unsupported */
+            qemu_log_mask(LOG_UNIMP, "%s: the PPC64 MMU unsupported\n",
+                          __func__);
         } else {
             dump_slb(env_archcpu(env));
-            break;
         }
+        break;
 #endif
     default:
         qemu_log_mask(LOG_UNIMP, "%s: unimplemented\n", __func__);
-- 
2.27.0


