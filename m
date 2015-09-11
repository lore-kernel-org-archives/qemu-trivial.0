Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaMP0-0005er-8Y
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 07:21:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMOv-0005VV-Bm
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:21:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMOu-000275-57
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:21:53 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41991)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaMOp-000224-Mq; Fri, 11 Sep 2015 07:21:47 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F04A54143A;
	Fri, 11 Sep 2015 14:21:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id BAF1BA74;
	Fri, 11 Sep 2015 14:03:53 +0300 (MSK)
Received: (nullmailer pid 22801 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:48 +0300
Message-Id: <c11b05836ead1e6354aa31857d31c0d908e7e08c.1441969369.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
References: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 24/26] hw/gpio/zaurus: Remove meaningless
	blank Property
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Sep 2015 11:21:54 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/gpio/zaurus.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/gpio/zaurus.c b/hw/gpio/zaurus.c
index 24a7727..aa8ee5f 100644
--- a/hw/gpio/zaurus.c
+++ b/hw/gpio/zaurus.c
@@ -235,10 +235,6 @@ static const VMStateDescription vmstate_scoop_regs = {
     },
 };
 
-static Property scoop_sysbus_properties[] = {
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void scoop_sysbus_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -247,7 +243,6 @@ static void scoop_sysbus_class_init(ObjectClass *klass, void *data)
     k->init = scoop_init;
     dc->desc = "Scoop2 Sharp custom ASIC";
     dc->vmsd = &vmstate_scoop_regs;
-    dc->props = scoop_sysbus_properties;
 }
 
 static const TypeInfo scoop_sysbus_info = {
-- 
2.1.4


