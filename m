Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WgJyq-0000ZR-S4
	for mharc-qemu-trivial@gnu.org; Fri, 02 May 2014 16:22:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WgJyk-0000Wv-3c
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 16:22:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WgJyf-0005u9-4o
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 16:22:41 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:47088)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WgJye-0005tx-VM
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 16:22:37 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id F27901800ED; Fri,  2 May 2014 22:22:32 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri,  2 May 2014 22:22:32 +0200
Message-Id: <1399062152-2249-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
	Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-trivial] [PATCH] hw/9pfs: Add include file for exported symbol
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
X-List-Received-Date: Fri, 02 May 2014 20:22:47 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/9pfs/virtio-9p-local.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/9pfs/virtio-9p-local.c b/hw/9pfs/virtio-9p-local.c
index 56b302c..3b0b6a9 100644
--- a/hw/9pfs/virtio-9p-local.c
+++ b/hw/9pfs/virtio-9p-local.c
@@ -14,6 +14,7 @@
 #include "hw/virtio/virtio.h"
 #include "virtio-9p.h"
 #include "virtio-9p-xattr.h"
+#include "fsdev/qemu-fsdev.h"   /* local_ops */
 #include <arpa/inet.h>
 #include <pwd.h>
 #include <grp.h>
-- 
1.7.10.4


