Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XoCie-0002bW-2g
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 09:46:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60743)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCiX-0002Oq-Tx
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:46:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XoCiT-00081O-Ly
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 09:46:49 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:54595)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XoCiJ-0007yS-TY; Tue, 11 Nov 2014 09:46:36 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B346641DF2;
	Tue, 11 Nov 2014 17:46:34 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A078A6D9;
	Tue, 11 Nov 2014 17:46:34 +0300 (MSK)
Received: (nullmailer pid 14558 invoked by uid 1000);
	Tue, 11 Nov 2014 14:46:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 11 Nov 2014 17:46:23 +0300
Message-Id: <3a0614c6c782cb760ec925f1662037c1c6038f0c.1415716845.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
References: <cover.1415716845.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Zhu Guihua <zhugh.fnst@cn.fujitsu.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 01/11] icc_bus: fix typo ICC_BRIGDE ->
	ICC_BRIDGE
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
X-List-Received-Date: Tue, 11 Nov 2014 14:46:54 -0000

From: Zhu Guihua <zhugh.fnst@cn.fujitsu.com>

Rename ICC_BRIGDE for better readability.

Signed-off-by: Zhu Guihua <zhugh.fnst@cn.fujitsu.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/cpu/icc_bus.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/cpu/icc_bus.c b/hw/cpu/icc_bus.c
index 9575fd6..6646ea2 100644
--- a/hw/cpu/icc_bus.c
+++ b/hw/cpu/icc_bus.c
@@ -73,11 +73,11 @@ typedef struct ICCBridgeState {
     MemoryRegion apic_container;
 } ICCBridgeState;
 
-#define ICC_BRIGDE(obj) OBJECT_CHECK(ICCBridgeState, (obj), TYPE_ICC_BRIDGE)
+#define ICC_BRIDGE(obj) OBJECT_CHECK(ICCBridgeState, (obj), TYPE_ICC_BRIDGE)
 
 static void icc_bridge_init(Object *obj)
 {
-    ICCBridgeState *s = ICC_BRIGDE(obj);
+    ICCBridgeState *s = ICC_BRIDGE(obj);
     SysBusDevice *sb = SYS_BUS_DEVICE(obj);
 
     qbus_create_inplace(&s->icc_bus, sizeof(s->icc_bus), TYPE_ICC_BUS,
-- 
1.7.10.4


