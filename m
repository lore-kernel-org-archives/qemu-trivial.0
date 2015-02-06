Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YJqT9-0008Nt-6m
	for mharc-qemu-trivial@gnu.org; Fri, 06 Feb 2015 16:29:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41594)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqT7-0008Lt-KD
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:29:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqT4-0002io-Bh
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:29:41 -0500
Received: from p54ac902a.dip0.t-ipconnect.de ([84.172.144.42]:45995 helo=edv32)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@bib.uni-mannheim.de>) id 1YJqT4-0002ii-2s
	for qemu-trivial@nongnu.org; Fri, 06 Feb 2015 16:29:38 -0500
Received: from stefan by edv32 with local (Exim 4.84)
	(envelope-from <stefan@bib.uni-mannheim.de>)
	id 1YJqBZ-0007hE-Ca; Fri, 06 Feb 2015 22:11:33 +0100
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnug.org,
	qemu-trivial@nongnu.org
Date: Fri,  6 Feb 2015 22:11:13 +0100
Message-Id: <1423257073-29548-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 84.172.144.42
Cc: Amit Shah <amit.shah@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Anthony Liguori <aliguori@amazon.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-trivial] [PATCH] virtio: Fix warning caused by missing
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
X-List-Received-Date: Fri, 06 Feb 2015 21:29:42 -0000

Warning from the Sparse static analysis tool:

hw/char/virtio-serial-bus.c:31:3:
 warning: symbol 'vserdevices' was not declared. Should it be static?

Cc: Amit Shah <amit.shah@redhat.com>
Cc: Anthony Liguori <aliguori@amazon.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
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


