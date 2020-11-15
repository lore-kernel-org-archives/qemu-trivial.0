Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1keaj3-00073p-Hx
	for mharc-qemu-trivial@gnu.org; Mon, 16 Nov 2020 04:23:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1keaiv-0006tY-GB; Mon, 16 Nov 2020 04:22:57 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ganqixin@huawei.com>)
 id 1keaip-0004DG-Rw; Mon, 16 Nov 2020 04:22:57 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CZNrl2FqBzkZ18;
 Mon, 16 Nov 2020 17:22:31 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Mon, 16 Nov 2020
 17:22:42 +0800
From: Gan Qixin <ganqixin@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <thuth@redhat.com>, <kuhn.chenqun@huawei.com>,
 <zhang.zhanghailiang@huawei.com>, Gan Qixin <ganqixin@huawei.com>, "Peter
 Maydell" <peter.maydell@linaro.org>
Subject: [PATCH 11/13] spitz: put some Spitz-family devices into the correct
 category
Date: Mon, 16 Nov 2020 02:49:01 +0800
Message-ID: <20201115184903.1292715-12-ganqixin@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201115184903.1292715-1-ganqixin@huawei.com>
References: <20201115184903.1292715-1-ganqixin@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=ganqixin@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:22:28
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Mon, 16 Nov 2020 09:23:02 -0000

Some Spitz-family devices have no category, put them into the correct category.

Signed-off-by: Gan Qixin <ganqixin@huawei.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/spitz.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 32bdeacfd3..0e5e8a4634 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -1218,6 +1218,7 @@ static void corgi_ssp_class_init(ObjectClass *klass, void *data)
     k->realize = corgi_ssp_realize;
     k->transfer = corgi_ssp_transfer;
     dc->vmsd = &vmstate_corgi_ssp_regs;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static const TypeInfo corgi_ssp_info = {
@@ -1247,6 +1248,7 @@ static void spitz_lcdtg_class_init(ObjectClass *klass, void *data)
     k->realize = spitz_lcdtg_realize;
     k->transfer = spitz_lcdtg_transfer;
     dc->vmsd = &vmstate_spitz_lcdtg_regs;
+    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
 }
 
 static const TypeInfo spitz_lcdtg_info = {
-- 
2.23.0


