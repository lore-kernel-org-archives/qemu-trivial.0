Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VfUwK-0004RD-9K
	for mharc-qemu-trivial@gnu.org; Sun, 10 Nov 2013 08:20:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VfUwD-0004Ka-Uk
	for qemu-trivial@nongnu.org; Sun, 10 Nov 2013 08:20:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VfUwC-0005If-O5
	for qemu-trivial@nongnu.org; Sun, 10 Nov 2013 08:20:25 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:45242
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VfUwA-0005Hv-71; Sun, 10 Nov 2013 08:20:22 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id C75AC18088C; Sun, 10 Nov 2013 14:20:18 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sun, 10 Nov 2013 14:20:17 +0100
Message-Id: <1384089617-4084-2-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1384089617-4084-1-git-send-email-sw@weilnetz.de>
References: <1384089617-4084-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Gerd Hoffmann <kraxel@redhat.com>, Anthony Liguori <aliguori@amazon.com>
Subject: [Qemu-trivial] [PATCH 2/2] trace: Remove trace.h from
	hw/usb/hcd-ehci.h (less dependencies)
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
Only one source file which needs hcd-ehci.h also needs trace.h.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

This patch reduces the number of .o files which depend on trace.h
in a default QEMU build from 382 to 379.

That's not a big reduction, but now there is no longer a .h file
which directly includes trace.h, so future improvements (splitting
trace headers, one header per source file, no longer compile 379
files after each change of trace-events) are easier to implement.

 hw/usb/hcd-ehci.c |    1 +
 hw/usb/hcd-ehci.h |    1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
index 22bdbf4..0ba38c9 100644
--- a/hw/usb/hcd-ehci.c
+++ b/hw/usb/hcd-ehci.c
@@ -28,6 +28,7 @@
  */
 
 #include "hw/usb/hcd-ehci.h"
+#include "trace.h"
 
 /* Capability Registers Base Address - section 2.2 */
 #define CAPLENGTH        0x0000  /* 1-byte, 0x0001 reserved */
diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
index 065c9fa..1ad4b96 100644
--- a/hw/usb/hcd-ehci.h
+++ b/hw/usb/hcd-ehci.h
@@ -21,7 +21,6 @@
 #include "qemu/timer.h"
 #include "hw/usb.h"
 #include "monitor/monitor.h"
-#include "trace.h"
 #include "sysemu/dma.h"
 #include "sysemu/sysemu.h"
 #include "hw/pci/pci.h"
-- 
1.7.9.5


