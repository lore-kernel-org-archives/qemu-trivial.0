Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1srYH8-0007GC-UT
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2024 03:41:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1srYH5-00071v-Lr; Fri, 20 Sep 2024 03:41:55 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1srYH3-0000EM-W3; Fri, 20 Sep 2024 03:41:55 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 739729085C;
 Fri, 20 Sep 2024 10:41:18 +0300 (MSK)
Received: from think4mjt.tls.msk.ru (mjtthink.wg.tls.msk.ru [192.168.177.146])
 by tsrv.corpit.ru (Postfix) with ESMTP id 1C62A1409DF;
 Fri, 20 Sep 2024 10:41:38 +0300 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Bibo Mao <maobibo@loongson.cn>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PULL 06/22] hw/loongarch/virt: Add description for virt machine type
Date: Fri, 20 Sep 2024 10:41:18 +0300
Message-Id: <20240920074134.664961-7-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240920074134.664961-1-mjt@tls.msk.ru>
References: <20240920074134.664961-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Sep 2024 07:41:57 -0000

From: Bibo Mao <maobibo@loongson.cn>

The description about virt machine type is removed by mistake, add
new description here. Here is output result with command
"./qemu-system-loongarch64 -M help"

Supported machines are:
none                 empty machine
virt                 QEMU LoongArch Virtual Machine (default)
x-remote             Experimental remote machine

Without the patch, it shows as follows:
Supported machines are:
none                 empty machine
virt                 (null) (default)
x-remote             Experimental remote machine

Fixes: ef2f11454c(hw/loongarch/virt: Replace Loongson IPI with LoongArch IPI)
Signed-off-by: Bibo Mao <maobibo@loongson.cn>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/loongarch/virt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 81b1f9486f..75980b6e3c 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -1403,6 +1403,7 @@ static void virt_class_init(ObjectClass *oc, void *data)
     mc->init = virt_init;
     mc->default_cpu_type = LOONGARCH_CPU_TYPE_NAME("la464");
     mc->default_ram_id = "loongarch.ram";
+    mc->desc = "QEMU LoongArch Virtual Machine";
     mc->max_cpus = LOONGARCH_MAX_CPUS;
     mc->is_default = 1;
     mc->default_kernel_irqchip_split = false;
-- 
2.39.5


