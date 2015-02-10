Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL7mr-0005UB-Pe
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 05:11:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47386)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL7mk-0005Id-Ki
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 05:11:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL7mg-0003tD-Q5
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 05:11:14 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36913)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL7ma-0003pu-MB; Tue, 10 Feb 2015 05:11:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 73187418C0;
	Tue, 10 Feb 2015 13:11:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E1023937;
	Tue, 10 Feb 2015 09:34:44 +0300 (MSK)
Received: (nullmailer pid 9427 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:35 +0300
Message-Id: <3ff64f1f9391a9b71d4dd58c6c4bbaa1db3dd430.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>, Michael Tokarev <mjt@tls.msk.ru>,
	Anthony Liguori <aliguori@amazon.com>, Amit Shah <amit.shah@redhat.com>
Subject: [Qemu-trivial] [PULL 46/46] virtio: Fix warning caused by missing
	'static' attribute
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
X-List-Received-Date: Tue, 10 Feb 2015 10:11:19 -0000

From: Stefan Weil <sw@weilnetz.de>

Warning from the Sparse static analysis tool:

hw/char/virtio-serial-bus.c:31:3:
 warning: symbol 'vserdevices' was not declared. Should it be static?

Cc: Amit Shah <amit.shah@redhat.com>
Cc: Anthony Liguori <aliguori@amazon.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/char/virtio-serial-bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/virtio-serial-bus.c b/hw/char/virtio-serial-bus.c
index 37a6f44..47fbb34 100644
--- a/hw/char/virtio-serial-bus.c
+++ b/hw/char/virtio-serial-bus.c
@@ -26,7 +26,7 @@
 #include "hw/virtio/virtio-serial.h"
 #include "hw/virtio/virtio-access.h"
 
-struct VirtIOSerialDevices {
+static struct VirtIOSerialDevices {
     QLIST_HEAD(, VirtIOSerial) devices;
 } vserdevices;
 
-- 
2.1.4


