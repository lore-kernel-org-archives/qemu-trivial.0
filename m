Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vp0sl-0004Vk-33
	for mharc-qemu-trivial@gnu.org; Fri, 06 Dec 2013 14:16:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp0sd-0004Dw-Lw
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:16:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp0sZ-0006DP-8X
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:16:03 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56474)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vp0sL-00067b-09; Fri, 06 Dec 2013 14:15:45 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5B56A40DD0;
	Fri,  6 Dec 2013 23:15:44 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 3E7B652D;
	Fri,  6 Dec 2013 23:15:44 +0400 (MSK)
Received: (nullmailer pid 19209 invoked by uid 1000);
	Fri, 06 Dec 2013 19:15:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Fri,  6 Dec 2013 23:15:28 +0400
Message-Id: <1386357341-19147-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386357341-19147-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1386357341-19147-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 01/14] trace: Remove trace.h from console.h
	(less dependencies)
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
X-List-Received-Date: Fri, 06 Dec 2013 19:16:08 -0000

From: Stefan Weil <sw@weilnetz.de>

This reduces the dependencies on trace.h.
Only two source files which need console.h also need trace.h.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/vmware_vga.c |    1 +
 include/ui/console.h    |    1 -
 ui/console.c            |    1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index a6a8cdc..aba292c 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -23,6 +23,7 @@
  */
 #include "hw/hw.h"
 #include "hw/loader.h"
+#include "trace.h"
 #include "ui/console.h"
 #include "hw/pci/pci.h"
 
diff --git a/include/ui/console.h b/include/ui/console.h
index 98edf41..4156a87 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -6,7 +6,6 @@
 #include "qapi/qmp/qdict.h"
 #include "qemu/notify.h"
 #include "monitor/monitor.h"
-#include "trace.h"
 #include "qapi-types.h"
 #include "qapi/error.h"
 
diff --git a/ui/console.c b/ui/console.c
index 199ba69..61ed219 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -27,6 +27,7 @@
 #include "qemu/timer.h"
 #include "qmp-commands.h"
 #include "sysemu/char.h"
+#include "trace.h"
 
 //#define DEBUG_CONSOLE
 #define DEFAULT_BACKSCROLL 512
-- 
1.7.10.4


