Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kef7P-0006hl-Ew
	for mharc-qemu-trivial@gnu.org; Mon, 16 Nov 2020 09:04:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangxinhao1@huawei.com>)
 id 1kef7M-0006dN-Ra; Mon, 16 Nov 2020 09:04:28 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangxinhao1@huawei.com>)
 id 1kef7E-0004dG-H5; Mon, 16 Nov 2020 09:04:28 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CZW522bP6zkWwS;
 Mon, 16 Nov 2020 22:03:34 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Mon, 16 Nov 2020
 22:03:43 +0800
From: Xinhao Zhang <zhangxinhao1@huawei.com>
To: <qemu-devel@nongnu.org>
CC: <alistair@alistair23.me>, <dengkai1@huawei.com>, <alex.chen@huawei.com>,
 <qemu-trivial@nongnu.org>
Subject: [PATCH] hw/core/register.c: Don't use '#' flag of printf format
Date: Mon, 16 Nov 2020 22:01:48 +0800
Message-ID: <20201116140148.2850128-1-zhangxinhao1@huawei.com>
X-Mailer: git-send-email 2.29.0-rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhangxinhao1@huawei.com; helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 08:22:57
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
X-List-Received-Date: Mon, 16 Nov 2020 14:04:29 -0000

Fix code style. Don't use '#' flag of printf format ('%#') in
format strings, use '0x' prefix instead

Signed-off-by: Xinhao Zhang <zhangxinhao1@huawei.com>
Signed-off-by: Kai Deng <dengkai1@huawei.com>
---
 hw/core/register.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/core/register.c b/hw/core/register.c
index 31038bd7cc..7986913130 100644
--- a/hw/core/register.c
+++ b/hw/core/register.c
@@ -80,7 +80,7 @@ void register_write(RegisterInfo *reg, uint64_t val, uint64_t we,
 
     if (!ac || !ac->name) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: write to undefined device state "
-                      "(written value: %#" PRIx64 ")\n", prefix, val);
+                      "(written value: 0x%" PRIx64 ")\n", prefix, val);
         return;
     }
 
@@ -89,14 +89,14 @@ void register_write(RegisterInfo *reg, uint64_t val, uint64_t we,
     test = (old_val ^ val) & ac->rsvd;
     if (test) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: change of value in reserved bit"
-                      "fields: %#" PRIx64 ")\n", prefix, test);
+                      "fields: 0x%" PRIx64 ")\n", prefix, test);
     }
 
     test = val & ac->unimp;
     if (test) {
         qemu_log_mask(LOG_UNIMP,
-                      "%s:%s writing %#" PRIx64 " to unimplemented bits:" \
-                      " %#" PRIx64 "\n",
+                      "%s:%s writing 0x%" PRIx64 " to unimplemented bits:" \
+                      " 0x%" PRIx64 "\n",
                       prefix, reg->access->name, val, ac->unimp);
     }
 
@@ -112,7 +112,7 @@ void register_write(RegisterInfo *reg, uint64_t val, uint64_t we,
     }
 
     if (debug) {
-        qemu_log("%s:%s: write of value %#" PRIx64 "\n", prefix, ac->name,
+        qemu_log("%s:%s: write of value 0x%" PRIx64 "\n", prefix, ac->name,
                  new_val);
     }
 
@@ -150,7 +150,7 @@ uint64_t register_read(RegisterInfo *reg, uint64_t re, const char* prefix,
     }
 
     if (debug) {
-        qemu_log("%s:%s: read of value %#" PRIx64 "\n", prefix,
+        qemu_log("%s:%s: read of value 0x%" PRIx64 "\n", prefix,
                  ac->name, ret);
     }
 
@@ -193,7 +193,7 @@ void register_write_memory(void *opaque, hwaddr addr,
 
     if (!reg) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: write to unimplemented register " \
-                      "at address: %#" PRIx64 "\n", reg_array->prefix, addr);
+                      "at address: 0x%" PRIx64 "\n", reg_array->prefix, addr);
         return;
     }
 
@@ -222,7 +222,7 @@ uint64_t register_read_memory(void *opaque, hwaddr addr,
 
     if (!reg) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s:  read to unimplemented register " \
-                      "at address: %#" PRIx64 "\n", reg_array->prefix, addr);
+                      "at address: 0x%" PRIx64 "\n", reg_array->prefix, addr);
         return 0;
     }
 
-- 
2.29.0-rc1


