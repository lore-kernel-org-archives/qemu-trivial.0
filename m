Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TxG6n-0003WM-MT
	for mharc-qemu-trivial@gnu.org; Mon, 21 Jan 2013 07:04:13 -0500
Received: from eggs.gnu.org ([208.118.235.92]:37722)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TxG6i-0003H0-Gn
	for qemu-trivial@nongnu.org; Mon, 21 Jan 2013 07:04:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TxG6f-0007IK-LC
	for qemu-trivial@nongnu.org; Mon, 21 Jan 2013 07:04:08 -0500
Received: from
	1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa
	([2001:8b0:1d0::1]:60042 helo=mnementh.archaic.org.uk)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1TxG6Z-0007EI-3I; Mon, 21 Jan 2013 07:03:59 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1TxG6N-0001uS-Du; Mon, 21 Jan 2013 12:03:47 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 21 Jan 2013 12:03:47 +0000
Message-Id: <1358769827-7317-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH v2] qemu-pixman.h: Avoid mutual inclusion
	loop with console.h
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
X-List-Received-Date: Mon, 21 Jan 2013 12:04:11 -0000

Remove an unnecessary mutual inclusion loop between qemu-pixman.h and
console.h, since the former was only including the latter for
'PixelFormat*', which can be provided by typedefs.h.  This requires a
minor adjustment to the files which included qemu-pixman.h, since
they were relying on it implicitly dragging in all of console.h.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Stefan: I've made the obvious change to fix the spice compile issue,
but none of my systems have a new enough spice-protocol/spice-server
to allow me to configure with spice enabled. I'd appreciate it if
you could check it does indeed compile OK now...

 include/ui/qemu-pixman.h   |    2 +-
 include/ui/spice-display.h |    1 +
 ui/qemu-pixman.c           |    3 ++-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/ui/qemu-pixman.h b/include/ui/qemu-pixman.h
index 016fd87..b032f52 100644
--- a/include/ui/qemu-pixman.h
+++ b/include/ui/qemu-pixman.h
@@ -15,7 +15,7 @@
 #pragma GCC diagnostic error "-Wredundant-decls"
 #endif
 
-#include "console.h"
+#include "qemu/typedefs.h"
 
 /*
  * pixman image formats are defined to be native endian,
diff --git a/include/ui/spice-display.h b/include/ui/spice-display.h
index 8b192e9..46f9530 100644
--- a/include/ui/spice-display.h
+++ b/include/ui/spice-display.h
@@ -21,6 +21,7 @@
 
 #include "qemu/thread.h"
 #include "ui/qemu-pixman.h"
+#include "ui/console.h"
 #include "sysemu/sysemu.h"
 
 #define NUM_MEMSLOTS 8
diff --git a/ui/qemu-pixman.c b/ui/qemu-pixman.c
index 609335a..6dcbe90 100644
--- a/ui/qemu-pixman.c
+++ b/ui/qemu-pixman.c
@@ -3,7 +3,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include "ui/qemu-pixman.h"
+#include "qemu-common.h"
+#include "ui/console.h"
 
 int qemu_pixman_get_type(int rshift, int gshift, int bshift)
 {
-- 
1.7.9.5


