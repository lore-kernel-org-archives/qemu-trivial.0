Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rl30h-0007sK-OE
	for mharc-qemu-trivial@gnu.org; Wed, 11 Jan 2012 13:34:55 -0500
Received: from eggs.gnu.org ([140.186.70.92]:53309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rl30e-0007fT-Kn
	for qemu-trivial@nongnu.org; Wed, 11 Jan 2012 13:34:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rl30d-0002VE-Pl
	for qemu-trivial@nongnu.org; Wed, 11 Jan 2012 13:34:52 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:49162)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Rl30W-0002Tb-Gm; Wed, 11 Jan 2012 13:34:44 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	069987280009; Wed, 11 Jan 2012 19:34:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id sAd6-tMwRGL0; Wed, 11 Jan 2012 19:34:43 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id C6CB3728000C; Wed, 11 Jan 2012 19:34:43 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Wed, 11 Jan 2012 19:34:29 +0100
Message-Id: <1326306870-14484-2-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1326306870-14484-1-git-send-email-sw@weilnetz.de>
References: <1326306870-14484-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	"M. Mohan Kumar" <mohan@in.ibm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 1/2] virtfs-proxy-helper: Fix compilation on
	newer systems
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
X-List-Received-Date: Wed, 11 Jan 2012 18:34:53 -0000

Include file attr/xattr.h is not available on "newer" systems
(for example Fedora 12 or Debian Squeeze).

See comments in qemu-xattr.h for more information.
This file handles the system dependencies automatically.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 fsdev/virtfs-proxy-helper.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index 7f8def5..ce7eb79 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -27,13 +27,13 @@
 #include <stdbool.h>
 #include <sys/vfs.h>
 #include <sys/stat.h>
-#include <attr/xattr.h>
 #include <sys/ioctl.h>
 #include <linux/fs.h>
 #ifdef CONFIG_LINUX_MAGIC_H
 #include <linux/magic.h>
 #endif
 #include "qemu-common.h"
+#include "qemu-xattr.h"
 #include "virtio-9p-marshal.h"
 #include "hw/9pfs/virtio-9p-proxy.h"
 #include "fsdev/virtio-9p-marshal.h"
-- 
1.7.2.5


