Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwFbJ-0002vL-U6
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 18:42:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwFbF-0002qE-Te
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 18:42:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwFbF-00085Q-38
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 18:42:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46967)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwFb9-00081g-Ri; Sun, 24 Sep 2017 18:42:04 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 63E8A41C97;
	Mon, 25 Sep 2017 01:42:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id EA89CC3B;
	Mon, 25 Sep 2017 00:22:56 +0300 (MSK)
Received: (nullmailer pid 28278 invoked by uid 1000);
	Sun, 24 Sep 2017 21:22:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: KONRAD Frederic <frederic.konrad@adacore.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 25 Sep 2017 00:22:37 +0300
Message-Id: <0aa6d8d3063477e615da8b9ff12e5bff9b0ac9bd.1506288070.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 19/31] aux-to-i2c-bridge: don't allow user to
 create one
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
X-List-Received-Date: Sun, 24 Sep 2017 22:42:11 -0000

From: KONRAD Frederic <frederic.konrad@adacore.com>

This device is private and is created once per aux-bus.
So don't allow the user to create one from command-line.

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: KONRAD Frederic <frederic.konrad@adacore.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/misc/auxbus.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
index 8a90ddda84..1182745044 100644
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
2.11.0


