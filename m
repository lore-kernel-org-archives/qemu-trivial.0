Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaNL2-0006jA-TN
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 08:21:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49044)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaNKx-0006bF-NH
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 08:21:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaNKw-0000S3-Us
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 08:21:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51688)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaNKs-0000MP-Cz; Fri, 11 Sep 2015 08:21:46 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4B2A74143F;
	Fri, 11 Sep 2015 15:21:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 17B69A81;
	Fri, 11 Sep 2015 14:03:54 +0300 (MSK)
Received: (nullmailer pid 22797 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:46 +0300
Message-Id: <01630e24b0993adb4874b5416e897646c964bb8f.1441969369.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
References: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: [Qemu-trivial] [PULL 22/26] hw/s390x/s390-virtio-bus: Remove
	meaningless blank Property
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
X-List-Received-Date: Fri, 11 Sep 2015 12:21:52 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
Acked-by: Cornelia Huck <cornelia.huck@de.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/s390x/s390-virtio-bus.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/s390x/s390-virtio-bus.c b/hw/s390x/s390-virtio-bus.c
index 77aec8a..98cb129 100644
--- a/hw/s390x/s390-virtio-bus.c
+++ b/hw/s390x/s390-virtio-bus.c
@@ -577,17 +577,12 @@ static const TypeInfo s390_virtio_blk = {
     .class_init    = s390_virtio_blk_class_init,
 };
 
-static Property s390_virtio_serial_properties[] = {
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void s390_virtio_serial_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     VirtIOS390DeviceClass *k = VIRTIO_S390_DEVICE_CLASS(klass);
 
     k->realize = s390_virtio_serial_realize;
-    dc->props = s390_virtio_serial_properties;
     set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
-- 
2.1.4


