Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jAPa6-0008Mz-QX
	for mharc-qemu-trivial@gnu.org; Fri, 06 Mar 2020 21:52:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56237)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1jAPa4-0008Mf-PV
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 21:52:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1jAPa3-0006p3-SS
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 21:52:48 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3187 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1jAPa1-0006W4-EK; Fri, 06 Mar 2020 21:52:45 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id C605DD1FDEB630085179;
 Sat,  7 Mar 2020 10:52:38 +0800 (CST)
Received: from localhost.huawei.com (10.175.104.216) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.439.0; Sat, 7 Mar 2020 10:52:32 +0800
From: Pan Nengyuan <pannengyuan@huawei.com>
To: <qemu-devel@nongnu.org>
CC: <pbonzini@redhat.com>, <berrange@redhat.com>, <ehabkost@redhat.com>,
 <zhang.zhanghailiang@huawei.com>, <euler.robot@huawei.com>,
 <qemu-trivial@nongnu.org>, Pan Nengyuan <pannengyuan@huawei.com>
Subject: [PATCH] core/qdev: fix memleak in qdev_get_gpio_out_connector()
Date: Sat, 7 Mar 2020 11:07:56 +0800
Message-ID: <20200307030756.5913-1-pannengyuan@huawei.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.104.216]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
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
X-List-Received-Date: Sat, 07 Mar 2020 02:52:49 -0000

Fix a memory leak in qdev_get_gpio_out_connector().

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
---
 hw/core/qdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 3937d1eb1a..85f062def7 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -557,7 +557,7 @@ void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
 
 qemu_irq qdev_get_gpio_out_connector(DeviceState *dev, const char *name, int n)
 {
-    char *propname = g_strdup_printf("%s[%d]",
+    g_autofree char *propname = g_strdup_printf("%s[%d]",
                                      name ? name : "unnamed-gpio-out", n);
 
     qemu_irq ret = (qemu_irq)object_property_get_link(OBJECT(dev), propname,
-- 
2.18.2


