Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTqUU-0000jq-4d
	for mharc-qemu-trivial@gnu.org; Thu, 11 Feb 2016 07:36:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqUR-0000ew-Od
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:36:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqUQ-0002S9-Rr
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:36:55 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46080)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aTqUK-0002Qe-4d; Thu, 11 Feb 2016 07:36:48 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7FBE34146C;
	Thu, 11 Feb 2016 15:36:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 2B18EA9A;
	Thu, 11 Feb 2016 15:19:06 +0300 (MSK)
Received: (nullmailer pid 11189 invoked by uid 1000);
	Thu, 11 Feb 2016 12:19:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Feb 2016 15:18:58 +0300
Message-Id: <0d769044d669223fb973c7e8739522fc2bc185fb.1455192968.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
References: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Cao jin <caoj.fnst@cn.fujitsu.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 09/14] ES1370: QOMify
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
X-List-Received-Date: Thu, 11 Feb 2016 12:36:57 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/audio/es1370.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
index 96acbc6..8449b5f 100644
--- a/hw/audio/es1370.c
+++ b/hw/audio/es1370.c
@@ -289,6 +289,10 @@ struct chan_bits {
                        uint32_t *old_freq, uint32_t *new_freq);
 };
 
+#define TYPE_ES1370 "ES1370"
+#define ES1370(obj) \
+    OBJECT_CHECK(ES1370State, (obj), TYPE_ES1370)
+
 static void es1370_dac1_calc_freq (ES1370State *s, uint32_t ctl,
                                    uint32_t *old_freq, uint32_t *new_freq);
 static void es1370_dac2_and_adc_calc_freq (ES1370State *s, uint32_t ctl,
@@ -1014,7 +1018,7 @@ static void es1370_on_reset (void *opaque)
 
 static void es1370_realize(PCIDevice *dev, Error **errp)
 {
-    ES1370State *s = DO_UPCAST (ES1370State, dev, dev);
+    ES1370State *s = ES1370(dev);
     uint8_t *c = s->dev.config;
 
     c[PCI_STATUS + 1] = PCI_STATUS_DEVSEL_SLOW >> 8;
@@ -1039,7 +1043,7 @@ static void es1370_realize(PCIDevice *dev, Error **errp)
 
 static int es1370_init (PCIBus *bus)
 {
-    pci_create_simple (bus, -1, "ES1370");
+    pci_create_simple (bus, -1, TYPE_ES1370);
     return 0;
 }
 
@@ -1060,7 +1064,7 @@ static void es1370_class_init (ObjectClass *klass, void *data)
 }
 
 static const TypeInfo es1370_info = {
-    .name          = "ES1370",
+    .name          = TYPE_ES1370,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof (ES1370State),
     .class_init    = es1370_class_init,
-- 
2.1.4


