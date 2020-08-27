Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kBFiU-0004vu-7B
	for mharc-qemu-trivial@gnu.org; Thu, 27 Aug 2020 07:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kBFiJ-0004iU-9n; Thu, 27 Aug 2020 07:05:06 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4663 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kuhn.chenqun@huawei.com>)
 id 1kBFiG-0007aF-PP; Thu, 27 Aug 2020 07:05:03 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 54DA8EB59F40A3DDEFF0;
 Thu, 27 Aug 2020 19:04:56 +0800 (CST)
Received: from huawei.com (10.175.104.175) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Thu, 27 Aug 2020
 19:04:46 +0800
From: Chen Qun <kuhn.chenqun@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <pannengyuan@huawei.com>, <zhang.zhanghailiang@huawei.com>, Chen Qun
 <kuhn.chenqun@huawei.com>, Euler Robot <euler.robot@huawei.com>, "Markus
 Armbruster" <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 08/10] usb/bus: Remove dead assignment in
 usb_get_fw_dev_path()
Date: Thu, 27 Aug 2020 19:03:09 +0800
Message-ID: <20200827110311.164316-9-kuhn.chenqun@huawei.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200827110311.164316-1-kuhn.chenqun@huawei.com>
References: <20200827110311.164316-1-kuhn.chenqun@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=kuhn.chenqun@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 02:12:47
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
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
X-List-Received-Date: Thu, 27 Aug 2020 11:05:09 -0000

Clang static code analyzer show warning:
qemu/hw/usb/bus.c:615:13: warning: Value stored to 'pos' is never read
            pos += snprintf(fw_path + pos, fw_len - pos, "%s@%lx",

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>

v2->v3: The format of the snprintf statement is modified(Base on Markus review).
---
 hw/usb/bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/usb/bus.c b/hw/usb/bus.c
index b17bda3b29..2b11041451 100644
--- a/hw/usb/bus.c
+++ b/hw/usb/bus.c
@@ -612,8 +612,8 @@ static char *usb_get_fw_dev_path(DeviceState *qdev)
             in++;
         } else {
             /* the device itself */
-            pos += snprintf(fw_path + pos, fw_len - pos, "%s@%lx",
-                            qdev_fw_name(qdev), nr);
+            snprintf(fw_path + pos, fw_len - pos, "%s@%lx",
+                     qdev_fw_name(qdev), nr);
             break;
         }
     }
-- 
2.23.0


