Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kjegi-0003KR-Kb
	for mharc-qemu-trivial@gnu.org; Mon, 30 Nov 2020 03:37:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kjegg-0003Fy-K1; Mon, 30 Nov 2020 03:37:34 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:2101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kjege-0000TX-Jp; Mon, 30 Nov 2020 03:37:34 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Ckz9x6VtSzhgLH;
 Mon, 30 Nov 2020 16:37:09 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Mon, 30 Nov 2020
 16:37:22 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <thuth@redhat.com>, <kuhn.chenqun@huawei.com>,
 <zhang.zhanghailiang@huawei.com>, Gan Qixin <ganqixin@huawei.com>, "Michael
 S . Tsirkin" <mst@redhat.com>
Subject: [PATCH v2 05/12] mc146818rtc: put it into the 'misc' category
Date: Mon, 30 Nov 2020 16:36:23 +0800
Message-ID: <20201130083630.2520597-6-ganqixin@huawei.com>
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
X-List-Received-Date: Mon, 30 Nov 2020 08:37:35 -0000

The category of the mc146818rtc device is not set, put it into the 'misc'
category.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: Michael S. Tsirkin <mst@redhat.com>
---
 hw/rtc/mc146818rtc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index 7a38540cb9..39edca0996 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -1039,6 +1039,7 @@ static void rtc_class_initfn(ObjectClass *klass, void *data)
     dc->vmsd = &vmstate_rtc;
     isa->build_aml = rtc_build_aml;
     device_class_set_props(dc, mc146818rtc_properties);
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo mc146818rtc_info = {
-- 
2.23.0


