Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhNVK-0003a3-MZ
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 14:20:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51889)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNVE-0003Tz-Dx
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:20:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNV9-0006qc-Vk
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:20:36 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60471)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhNUz-0006oN-Ti; Mon, 05 May 2014 14:20:22 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9A27D40754;
	Mon,  5 May 2014 22:20:20 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6D45B6AD;
	Mon,  5 May 2014 22:02:07 +0400 (MSK)
Received: (nullmailer pid 24244 invoked by uid 1000);
	Mon, 05 May 2014 18:02:06 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon,  5 May 2014 22:01:55 +0400
Message-Id: <1399312923-24129-15-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 14/22] hw/9pfs: Add include file for exported
	symbol
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
X-List-Received-Date: Mon, 05 May 2014 18:20:41 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


