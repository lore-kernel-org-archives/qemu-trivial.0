Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rl30e-0007gT-Sn
	for mharc-qemu-trivial@gnu.org; Wed, 11 Jan 2012 13:34:52 -0500
Received: from eggs.gnu.org ([140.186.70.92]:53285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rl30b-0007SN-H3
	for qemu-trivial@nongnu.org; Wed, 11 Jan 2012 13:34:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Rl30a-0002Ub-Ek
	for qemu-trivial@nongnu.org; Wed, 11 Jan 2012 13:34:49 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:49170)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Rl30X-0002Tm-PS; Wed, 11 Jan 2012 13:34:46 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	40E07728000C; Wed, 11 Jan 2012 19:34:45 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Cjl+uGn5+V2V; Wed, 11 Jan 2012 19:34:44 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id DD4AE728000D; Wed, 11 Jan 2012 19:34:44 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Wed, 11 Jan 2012 19:34:30 +0100
Message-Id: <1326306870-14484-3-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1326306870-14484-1-git-send-email-sw@weilnetz.de>
References: <1326306870-14484-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	"M. Mohan Kumar" <mohan@in.ibm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 2/2] virtfs-proxy-helper: Clean include files
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
X-List-Received-Date: Wed, 11 Jan 2012 18:34:51 -0000

The common standard include files are already included via qemu-common.h,
and for the socket related include files there is qemu_socket.h, so the
code can be reduced by some lines.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 fsdev/virtfs-proxy-helper.c |   15 ++-------------
 1 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
index ce7eb79..21e9b16 100644
--- a/fsdev/virtfs-proxy-helper.c
+++ b/fsdev/virtfs-proxy-helper.c
@@ -8,31 +8,20 @@
  * This work is licensed under the terms of the GNU GPL, version 2. See
  * the COPYING file in the top-level directory.
  */
-#include <stdio.h>
-#include <sys/socket.h>
-#include <string.h>
-#include <sys/un.h>
-#include <limits.h>
-#include <signal.h>
-#include <errno.h>
-#include <stdlib.h>
+
 #include <sys/resource.h>
-#include <sys/stat.h>
 #include <getopt.h>
-#include <unistd.h>
 #include <syslog.h>
 #include <sys/capability.h>
 #include <sys/fsuid.h>
-#include <stdarg.h>
-#include <stdbool.h>
 #include <sys/vfs.h>
-#include <sys/stat.h>
 #include <sys/ioctl.h>
 #include <linux/fs.h>
 #ifdef CONFIG_LINUX_MAGIC_H
 #include <linux/magic.h>
 #endif
 #include "qemu-common.h"
+#include "qemu_socket.h"
 #include "qemu-xattr.h"
 #include "virtio-9p-marshal.h"
 #include "hw/9pfs/virtio-9p-proxy.h"
-- 
1.7.2.5


