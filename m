Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnjni-0008GT-8U
	for mharc-qemu-trivial@gnu.org; Fri, 01 Sep 2017 07:07:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1dnjnX-00086m-9m
	for qemu-trivial@nongnu.org; Fri, 01 Sep 2017 07:07:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <otubo@redhat.com>) id 1dnjnS-0005DD-NY
	for qemu-trivial@nongnu.org; Fri, 01 Sep 2017 07:07:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57686)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <otubo@redhat.com>)
	id 1dnjn9-00058b-1V; Fri, 01 Sep 2017 07:07:15 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 299DF461FB;
	Fri,  1 Sep 2017 11:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 299DF461FB
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=otubo@redhat.com
Received: from vader.redhat.com (ovpn-117-156.ams2.redhat.com [10.36.117.156])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0EE2871C48;
	Fri,  1 Sep 2017 11:07:08 +0000 (UTC)
From: Eduardo Otubo <otubo@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	qemu-block@nongnu.org,
	jsnow@redhat.com
Date: Fri,  1 Sep 2017 13:07:06 +0200
Message-Id: <20170901110706.429-1-otubo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 01 Sep 2017 11:07:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] isa-fdc: assert replaced by proper error exit
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Sep 2017 11:07:48 -0000

When not available, isa-fdc falls into assert instead of proper error
exit. This patch fixes this behavior.

Signed-off-by: Eduardo Otubo <otubo@redhat.com>
---
 hw/block/fdc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 401129073b..0b6def4e1d 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -2699,11 +2699,15 @@ static void isabus_fdc_realize(DeviceState *dev, Error **errp)
     fdctrl->dma_chann = isa->dma;
     if (fdctrl->dma_chann != -1) {
         fdctrl->dma = isa_get_dma(isa_bus_from_device(isadev), isa->dma);
-        assert(fdctrl->dma);
+        if (!fdctrl->dma) {
+            error_setg(errp, "isa-fdc not supported");
+            goto error;
+        }
     }
 
     qdev_set_legacy_instance_id(dev, isa->iobase, 2);
     fdctrl_realize_common(dev, fdctrl, &err);
+error:
     if (err != NULL) {
         error_propagate(errp, err);
         return;
-- 
2.13.5


