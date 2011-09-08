Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R1gxK-0000Za-Re
	for mharc-qemu-trivial@gnu.org; Thu, 08 Sep 2011 11:55:58 -0400
Received: from eggs.gnu.org ([140.186.70.92]:39070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1R1gxF-0000DN-Cy
	for qemu-trivial@nongnu.org; Thu, 08 Sep 2011 11:55:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1R1gxE-0006Gx-7V
	for qemu-trivial@nongnu.org; Thu, 08 Sep 2011 11:55:53 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:48866)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1R1gx1-0006Ce-Pl; Thu, 08 Sep 2011 11:55:39 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	7D78B728307C; Thu,  8 Sep 2011 17:55:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id fmP16jerg8wV; Thu,  8 Sep 2011 17:55:33 +0200 (CEST)
Received: from flocke.weilnetz.de (p54ADA0D2.dip.t-dialin.net [84.173.160.210])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	63EC5728307B; Thu,  8 Sep 2011 17:55:33 +0200 (CEST)
Received: from stefan by flocke.weilnetz.de with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1R1gwu-0001ta-Uo; Thu, 08 Sep 2011 17:55:32 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu,  8 Sep 2011 17:55:32 +0200
Message-Id: <1315497332-7258-1-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>,
	Riku Voipio <riku.voipio@iki.fi>, Kevin Wolf <kwolf@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>
Subject: [Qemu-trivial] [PATCH] Fix include statements for qemu-common.h
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
X-List-Received-Date: Thu, 08 Sep 2011 15:55:57 -0000

* qemu-common.h is not a system include file, so it should be included
  with "" instead of <>. Otherwise incremental builds might fail
  because only local include files are checked for changes.

* linux-user/syscall.c included the file twice.

Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Riku Voipio <riku.voipio@iki.fi>
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 hw/virtio-blk.c      |    2 +-
 linux-user/syscall.c |    3 +--
 nbd.h                |    2 +-
 qemu-nbd.c           |    2 +-
 slirp/libslirp.h     |    2 +-
 5 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/virtio-blk.c b/hw/virtio-blk.c
index 4df23f4..d5d4757 100644
--- a/hw/virtio-blk.c
+++ b/hw/virtio-blk.c
@@ -11,7 +11,7 @@
  *
  */
 
-#include <qemu-common.h>
+#include "qemu-common.h"
 #include "qemu-error.h"
 #include "trace.h"
 #include "blockdev.h"
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 6bdf4e6..e87e174 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -60,7 +60,7 @@ int __clone2(int (*fn)(void *), void *child_stack_base,
 #include <netinet/ip.h>
 #include <netinet/tcp.h>
 #include <linux/wireless.h>
-#include <qemu-common.h>
+#include "qemu-common.h"
 #ifdef TARGET_GPROF
 #include <sys/gmon.h>
 #endif
@@ -96,7 +96,6 @@ int __clone2(int (*fn)(void *), void *child_stack_base,
 #include "cpu-uname.h"
 
 #include "qemu.h"
-#include "qemu-common.h"
 
 #if defined(CONFIG_USE_NPTL)
 #define CLONE_NPTL_FLAGS2 (CLONE_SETTLS | \
diff --git a/nbd.h b/nbd.h
index 96f77fe..273cfa1 100644
--- a/nbd.h
+++ b/nbd.h
@@ -21,7 +21,7 @@
 
 #include <sys/types.h>
 
-#include <qemu-common.h>
+#include "qemu-common.h"
 
 #include "block_int.h"
 
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 0b25a4d..3a39145 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -16,7 +16,7 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <qemu-common.h>
+#include "qemu-common.h"
 #include "block_int.h"
 #include "nbd.h"
 
diff --git a/slirp/libslirp.h b/slirp/libslirp.h
index 67c70e3..a755123 100644
--- a/slirp/libslirp.h
+++ b/slirp/libslirp.h
@@ -1,7 +1,7 @@
 #ifndef _LIBSLIRP_H
 #define _LIBSLIRP_H
 
-#include <qemu-common.h>
+#include "qemu-common.h"
 
 #ifdef CONFIG_SLIRP
 
-- 
1.7.2.5


