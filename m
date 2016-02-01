Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQ9FK-0007Vh-Rr
	for mharc-qemu-trivial@gnu.org; Mon, 01 Feb 2016 02:50:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aQ9FJ-0007UZ-CJ
	for qemu-trivial@nongnu.org; Mon, 01 Feb 2016 02:50:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aQ9FI-0003gw-8l
	for qemu-trivial@nongnu.org; Mon, 01 Feb 2016 02:50:01 -0500
Received: from [59.151.112.132] (port=21979 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aQ9FC-0003g1-0K; Mon, 01 Feb 2016 02:49:54 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3186635"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 01 Feb 2016 15:49:48 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id E72D54182517;
	Mon,  1 Feb 2016 15:48:57 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 1 Feb 2016 15:49:42 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 1 Feb 2016 15:49:56 +0800
Message-ID: <1454312996-19395-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: E72D54182517.A8340
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com
Subject: [Qemu-trivial] [PATCH] ES1370: QOMify
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
X-List-Received-Date: Mon, 01 Feb 2016 07:50:02 -0000

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
 hw/audio/es1370.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/audio/es1370.c b/hw/audio/es1370.c
index 592578b..089dd0e 100644
--- a/hw/audio/es1370.c
+++ b/hw/audio/es1370.c
@@ -288,6 +288,10 @@ struct chan_bits {
                        uint32_t *old_freq, uint32_t *new_freq);
 };
 
+#define TYPE_ES1370 "ES1370"
+#define ES1370(obj) \
+    OBJECT_CHECK(ES1370State, (obj), TYPE_ES1370)
+
 static void es1370_dac1_calc_freq (ES1370State *s, uint32_t ctl,
                                    uint32_t *old_freq, uint32_t *new_freq);
 static void es1370_dac2_and_adc_calc_freq (ES1370State *s, uint32_t ctl,
@@ -1013,7 +1017,7 @@ static void es1370_on_reset (void *opaque)
 
 static void es1370_realize(PCIDevice *dev, Error **errp)
 {
-    ES1370State *s = DO_UPCAST (ES1370State, dev, dev);
+    ES1370State *s = ES1370(dev);
     uint8_t *c = s->dev.config;
 
     c[PCI_STATUS + 1] = PCI_STATUS_DEVSEL_SLOW >> 8;
@@ -1059,7 +1063,7 @@ static void es1370_class_init (ObjectClass *klass, void *data)
 }
 
 static const TypeInfo es1370_info = {
-    .name          = "ES1370",
+    .name          = TYPE_ES1370,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof (ES1370State),
     .class_init    = es1370_class_init,
-- 
2.1.0




