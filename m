Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kdPow-0003ZY-7q
	for mharc-qemu-trivial@gnu.org; Thu, 12 Nov 2020 22:32:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kdPou-0003UY-6v; Thu, 12 Nov 2020 22:32:16 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kdPoq-0002p9-OV; Thu, 12 Nov 2020 22:32:15 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CXPCV6zB0z15VqL;
 Fri, 13 Nov 2020 11:31:50 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Fri, 13 Nov 2020
 11:31:54 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <thuth@redhat.com>, <laurent@vivier.eu>, <philmd@redhat.com>,
 <armbru@redhat.com>, <mst@redhat.com>, <kuhn.chenqun@huawei.com>,
 <zhang.zhanghailiang@huawei.com>, Gan Qixin <ganqixin@huawei.com>
Subject: [PATCH v3 3/4] nand: put it into the 'storage' category
Date: Thu, 12 Nov 2020 20:58:23 +0800
Message-ID: <20201112125824.763182-4-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201112125824.763182-1-ganqixin@huawei.com>
References: <20201112125824.763182-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=ganqixin@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 22:32:01
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 13 Nov 2020 03:32:16 -0000

The category of the nand device is not set, put it into the 'storage'
category.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/block/nand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/nand.c b/hw/block/nand.c
index bcceb64ebb..1d7a48a2ec 100644
--- a/hw/block/nand.c
+++ b/hw/block/nand.c
@@ -449,6 +449,7 @@ static void nand_class_init(ObjectClass *klass, void *data)
     dc->reset = nand_reset;
     dc->vmsd = &vmstate_nand;
     device_class_set_props(dc, nand_properties);
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 }
 
 static const TypeInfo nand_info = {
-- 
2.23.0


