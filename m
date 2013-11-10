Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VfUwL-0004RZ-3O
	for mharc-qemu-trivial@gnu.org; Sun, 10 Nov 2013 08:20:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VfUwE-0004LX-PV
	for qemu-trivial@nongnu.org; Sun, 10 Nov 2013 08:20:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VfUwD-0005JD-UF
	for qemu-trivial@nongnu.org; Sun, 10 Nov 2013 08:20:26 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:45238
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VfUwA-0005Hr-78; Sun, 10 Nov 2013 08:20:22 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 0E1151802B2; Sun, 10 Nov 2013 14:20:17 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sun, 10 Nov 2013 14:20:16 +0100
Message-Id: <1384089617-4084-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Gerd Hoffmann <kraxel@redhat.com>, Anthony Liguori <aliguori@amazon.com>
Subject: [Qemu-trivial] [PATCH 1/2] trace: Remove trace.h from console.h
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
X-List-Received-Date: Sun, 10 Nov 2013 13:20:28 -0000

This reduces the dependencies on trace.h.
Only two source files which need console.h also need trace.h.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

Without this patch, 449 .o files depend on trace.h and must
be rebuild whenever the file trace-events is changed.

The patch reduces this number to 382 for the default QEMU build.

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
index aad4fc9..11d5e6a 100644
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
1.7.9.5


