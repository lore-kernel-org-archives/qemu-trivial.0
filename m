Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ktmva-0000GO-8f
	for mharc-qemu-trivial@gnu.org; Mon, 28 Dec 2020 02:26:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1ktmvY-0000ES-AU; Mon, 28 Dec 2020 02:26:48 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhanghan64@huawei.com>)
 id 1ktmvI-0007lI-Dd; Mon, 28 Dec 2020 02:26:48 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D48GL6qY5z15kqN;
 Mon, 28 Dec 2020 15:25:30 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Mon, 28 Dec 2020
 15:26:08 +0800
From: Zhang Han <zhanghan64@huawei.com>
To: <armbru@redhat.com>
CC: <alex.chen@huawei.com>, <hunongda@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-trivial@nongnu.org>, <zhang.zhanghailiang@huawei.com>
Subject: [PATCH 3/4] qobject: spaces required around that operators
Date: Mon, 28 Dec 2020 15:11:28 +0800
Message-ID: <20201228071129.24563-4-zhanghan64@huawei.com>
X-Mailer: git-send-email 2.29.1.59.gf9b6481aed
In-Reply-To: <20201228071129.24563-1-zhanghan64@huawei.com>
References: <20201228071129.24563-1-zhanghan64@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhanghan64@huawei.com; helo=szxga04-in.huawei.com
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
X-List-Received-Date: Mon, 28 Dec 2020 07:26:48 -0000

Add spaces around operators.

Signed-off-by: Zhang Han <zhanghan64@huawei.com>
---
 qobject/qdict.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qobject/qdict.c b/qobject/qdict.c
index 2c07b3c87f..05ec950e05 100644
--- a/qobject/qdict.c
+++ b/qobject/qdict.c
@@ -42,8 +42,8 @@ static unsigned int tdb_hash(const char *name)
     unsigned   i;      /* Used to cycle through random values. */
 
     /* Set the initial value from the key size. */
-    for (value = 0x238F13AF * strlen(name), i=0; name[i]; i++)
-        value = (value + (((const unsigned char *)name)[i] << (i*5 % 24)));
+    for (value = 0x238F13AF * strlen(name), i = 0; name[i]; i++)
+        value = (value + (((const unsigned char *)name)[i] << (i * 5 % 24)));
 
     return (1103515243 * value + 12345);
 }
-- 
2.29.1.59.gf9b6481aed


