Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dkAlN-0003nu-6j
	for mharc-qemu-trivial@gnu.org; Tue, 22 Aug 2017 11:06:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkAlG-0003fS-Dl
	for qemu-trivial@nongnu.org; Tue, 22 Aug 2017 11:06:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dkAlC-0001vR-QZ
	for qemu-trivial@nongnu.org; Tue, 22 Aug 2017 11:06:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60210)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dkAl1-0001lm-Jq; Tue, 22 Aug 2017 11:06:19 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 94E4BC04D313;
	Tue, 22 Aug 2017 15:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 94E4BC04D313
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-21.ams2.redhat.com [10.36.116.21])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 32C727E21E;
	Tue, 22 Aug 2017 15:06:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>, qemu-trivial@nongnu.org
Date: Tue, 22 Aug 2017 17:06:15 +0200
Message-Id: <1503414375-21009-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 22 Aug 2017 15:06:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] hw/misc/auxbus.c: Mark the aux-to-i2c-bridge
 device as non-hotpluggable
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
X-List-Received-Date: Tue, 22 Aug 2017 15:06:40 -0000

QEMU currently aborts if the user tries to do something like this:

$ aarch64-softmmu/qemu-system-aarch64 -S -M integratorcp -nographic
QEMU 2.9.93 monitor - type 'help' for more information
(qemu) device_add aux-to-i2c-bridge,id=x
(qemu) device_del x
**
ERROR:qemu/qdev-monitor.c:872:qdev_unplug: assertion failed: (hotplug_ctrl)
Aborted (core dumped)

Looks like the device is not hot-pluggable, so let's mark it
accordingly.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/misc/auxbus.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 8a90ddd..2c62515 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -222,9 +222,17 @@ static inline I2CBus *aux_bridge_get_i2c_bus(AUXTOI2CState *bridge)
     return bridge->i2c_bus;
 }
 
+static void aux_bridge_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    dc->hotpluggable = false;
+}
+
 static const TypeInfo aux_to_i2c_type_info = {
     .name = TYPE_AUXTOI2C,
     .parent = TYPE_DEVICE,
+    .class_init = aux_bridge_class_init,
     .instance_size = sizeof(AUXTOI2CState),
     .instance_init = aux_bridge_init
 };
-- 
1.8.3.1


