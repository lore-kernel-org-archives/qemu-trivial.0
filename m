Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dlD4f-000564-3V
	for mharc-qemu-trivial@gnu.org; Fri, 25 Aug 2017 07:46:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1dlD4d-00054y-3u
	for qemu-trivial@nongnu.org; Fri, 25 Aug 2017 07:46:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <frederic.konrad@adacore.com>) id 1dlD4c-0001US-6G
	for qemu-trivial@nongnu.org; Fri, 25 Aug 2017 07:46:51 -0400
Received: from mel.act-europe.fr ([194.98.77.210]:57764
	helo=smtp.eu.adacore.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <frederic.konrad@adacore.com>)
	id 1dlD4W-0001RP-IE; Fri, 25 Aug 2017 07:46:44 -0400
Received: from localhost (localhost [127.0.0.1])
	by filtered-smtp.eu.adacore.com (Postfix) with ESMTP id 90CAC82286;
	Fri, 25 Aug 2017 13:46:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at eu.adacore.com
Received: from smtp.eu.adacore.com ([127.0.0.1])
	by localhost (smtp.eu.adacore.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x3HzjyuCsnbY; Fri, 25 Aug 2017 13:46:42 +0200 (CEST)
Received: from localhost.localdomain.localdomain (unknown
	[IPv6:2a01:e35:87f0:3180:2b18:7e65:c33:7f62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.eu.adacore.com (Postfix) with ESMTPSA id 1C9C082284;
	Fri, 25 Aug 2017 13:46:41 +0200 (CEST)
From: KONRAD Frederic <frederic.konrad@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	thuth@redhat.com,
	frederic.konrad@adacore.com
Date: Fri, 25 Aug 2017 13:46:09 +0200
Message-Id: <1503661569-11408-1-git-send-email-frederic.konrad@adacore.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 194.98.77.210
Subject: [Qemu-trivial] [PATCH for-2.11] aux-to-i2c-bridge: don't allow user
 to create one
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
X-List-Received-Date: Fri, 25 Aug 2017 11:46:52 -0000

This device is private and is created once per aux-bus.
So don't allow the user to create one from command-line.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>
---
 hw/misc/auxbus.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 8a90ddd..1182745 100644
--- a/hw/misc/auxbus.c
+++ b/hw/misc/auxbus.c
@@ -210,6 +210,16 @@ struct AUXTOI2CState {
     I2CBus *i2c_bus;
 };
 
+static void aux_bridge_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(oc);
+
+    /* This device is private and is created only once for each
+     * aux-bus in aux_init_bus(..). So don't allow the user to add one.
+     */
+    dc->user_creatable = false;
+}
+
 static void aux_bridge_init(Object *obj)
 {
     AUXTOI2CState *s = AUXTOI2C(obj);
@@ -225,6 +235,7 @@ static inline I2CBus *aux_bridge_get_i2c_bus(AUXTOI2CState *bridge)
 static const TypeInfo aux_to_i2c_type_info = {
     .name = TYPE_AUXTOI2C,
     .parent = TYPE_DEVICE,
+    .class_init = aux_bridge_class_init,
     .instance_size = sizeof(AUXTOI2CState),
     .instance_init = aux_bridge_init
 };
-- 
1.8.3.1


