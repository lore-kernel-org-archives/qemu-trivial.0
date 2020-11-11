Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kd6uV-0007Pg-CL
	for mharc-qemu-trivial@gnu.org; Thu, 12 Nov 2020 02:20:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kd6uR-0007IG-Ft; Thu, 12 Nov 2020 02:20:43 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1kd6uO-0006E5-Tx; Thu, 12 Nov 2020 02:20:43 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CWtKf1SmfzkjfM;
 Thu, 12 Nov 2020 15:20:22 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Thu, 12 Nov 2020
 15:20:28 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <thuth@redhat.com>, <laurent@vivier.eu>, <philmd@redhat.com>,
 <armbru@redhat.com>, <mst@redhat.com>, <kuhn.chenqun@huawei.com>,
 <zhang.zhanghailiang@huawei.com>, Gan Qixin <ganqixin@huawei.com>
Subject: [PATCH v2 4/4] max111x: put it into the 'misc' category
Date: Thu, 12 Nov 2020 00:47:10 +0800
Message-ID: <20201111164710.644863-5-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201111164710.644863-1-ganqixin@huawei.com>
References: <20201111164710.644863-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=ganqixin@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 02:20:35
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
X-List-Received-Date: Thu, 12 Nov 2020 07:20:43 -0000

The category of the max111x device is not set, put it into the 'misc'
category.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
 hw/misc/max111x.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/misc/max111x.c b/hw/misc/max111x.c
index 7e6723f343..eae0f9b598 100644
--- a/hw/misc/max111x.c
+++ b/hw/misc/max111x.c
@@ -185,6 +185,7 @@ static void max111x_class_init(ObjectClass *klass, void *data)
     k->transfer = max111x_transfer;
     dc->reset = max111x_reset;
     dc->vmsd = &vmstate_max111x;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo max111x_info = {
-- 
2.23.0


