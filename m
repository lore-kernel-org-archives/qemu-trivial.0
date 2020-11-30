Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kjegm-0003NI-AQ
	for mharc-qemu-trivial@gnu.org; Mon, 30 Nov 2020 03:37:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kjegh-0003J4-Q9; Mon, 30 Nov 2020 03:37:35 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kjege-0000Tp-Id; Mon, 30 Nov 2020 03:37:35 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Ckz9x6LGlzhfp4;
 Mon, 30 Nov 2020 16:37:09 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Mon, 30 Nov 2020
 16:37:19 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <thuth@redhat.com>, <kuhn.chenqun@huawei.com>,
 <zhang.zhanghailiang@huawei.com>, Gan Qixin <ganqixin@huawei.com>, "Xiao
 Guangrong" <xiaoguangrong.eric@gmail.com>
Subject: [PATCH v2 04/12] nvdimm: put it into the 'storage' category
Date: Mon, 30 Nov 2020 16:36:22 +0800
Message-ID: <20201130083630.2520597-5-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201130083630.2520597-1-ganqixin@huawei.com>
References: <20201130083630.2520597-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.32; envelope-from=ganqixin@huawei.com;
 helo=szxga06-in.huawei.com
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
X-List-Received-Date: Mon, 30 Nov 2020 08:37:36 -0000

The category of the nvdimm device is not set, put it into the 'storage'
category.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
---
 hw/mem/nvdimm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/mem/nvdimm.c b/hw/mem/nvdimm.c
index e1574bc07c..e30695b2ce 100644
--- a/hw/mem/nvdimm.c
+++ b/hw/mem/nvdimm.c
@@ -236,6 +236,7 @@ static void nvdimm_class_init(ObjectClass *oc, void *data)
 
     nvc->read_label_data = nvdimm_read_label_data;
     nvc->write_label_data = nvdimm_write_label_data;
+    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);
 }
 
 static TypeInfo nvdimm_info = {
-- 
2.23.0


