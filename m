Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ia3Av-0001vr-VJ
	for mharc-qemu-trivial@gnu.org; Wed, 27 Nov 2019 14:40:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48481)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ia3At-0001sc-U9
 for qemu-trivial@nongnu.org; Wed, 27 Nov 2019 14:40:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ia3As-0000SX-Sd
 for qemu-trivial@nongnu.org; Wed, 27 Nov 2019 14:40:31 -0500
Received: from relay.sw.ru ([185.231.240.75]:55118)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ia3An-0000Fh-GC; Wed, 27 Nov 2019 14:40:27 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ia3Aj-0004YS-EB; Wed, 27 Nov 2019 22:40:21 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: kraxel@redhat.com,
	vsementsov@virtuozzo.com,
	qemu-trivial@nongnu.org
Subject: [PATCH v6] hw/usb: rename Error ** parameter to more common errp
Date: Wed, 27 Nov 2019 22:40:21 +0300
Message-Id: <20191127194021.23607-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
X-List-Received-Date: Wed, 27 Nov 2019 19:40:33 -0000

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 hw/usb/dev-network.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/dev-network.c b/hw/usb/dev-network.c
index 5de6213cc4..b81a8abe83 100644
--- a/hw/usb/dev-network.c
+++ b/hw/usb/dev-network.c
@@ -1342,7 +1342,7 @@ static NetClientInfo net_usbnet_info = {
     .cleanup = usbnet_cleanup,
 };
 
-static void usb_net_realize(USBDevice *dev, Error **errrp)
+static void usb_net_realize(USBDevice *dev, Error **errp)
 {
     USBNetState *s = USB_NET(dev);
 
-- 
2.21.0


