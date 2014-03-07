Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WLrkc-0001Pn-82
	for mharc-qemu-trivial@gnu.org; Fri, 07 Mar 2014 05:11:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WLrkZ-0001Ka-8T
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 05:11:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WLrkY-0001nz-Fx
	for qemu-trivial@nongnu.org; Fri, 07 Mar 2014 05:11:31 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:39468
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WLrkU-0001n3-1T; Fri, 07 Mar 2014 05:11:26 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id E6F0C17FF44; Fri,  7 Mar 2014 11:11:22 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri,  7 Mar 2014 11:11:22 +0100
Message-Id: <1394187082-31986-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-stable@nongnu.org, qemu-devel@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH] tests: Fix 'make test' for i686 hosts (build
	regression)
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
X-List-Received-Date: Fri, 07 Mar 2014 10:11:32 -0000

'make test' is broken at least since commit
baacf04799ace72a9c735dd9306a1ceaf305e7cf. Several source files were moved
to util/, and some of them there split, so add the missing prefix and new
files to fix the compiler and linker errors.

There remain more issues, but these changes allow running the test on a
Linux i686 host.

Cc: qemu-stable@nongnu.org
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

'make test' shows several problems where the results from native
execution and user mode emulation differ. Obviously the TCG code
or at least one helper function don't work as expected.

The patch might be useful for QEMU stable, too. I did not use it
with older versions, so I still don't know whether there was a TCG
regression and when it occurred.

Running 'make test' on an x86_64 host is currently not possible.
There is at least one -m32 compiler option missing, and a 32 bit
version of glib2.0 must be installed (not available for Debian
wheezy, so I had to stop here).

Regards
Stefan

 tests/tcg/test_path.c |   13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/tests/tcg/test_path.c b/tests/tcg/test_path.c
index a064eea..f8dd36a 100644
--- a/tests/tcg/test_path.c
+++ b/tests/tcg/test_path.c
@@ -1,12 +1,15 @@
 /* Test path override code */
 #define _GNU_SOURCE
 #include "config-host.h"
-#include "iov.c"
-#include "cutils.c"
-#include "path.c"
-#include "trace.c"
+#include "util/cutils.c"
+#include "util/hexdump.c"
+#include "util/iov.c"
+#include "util/path.c"
+#include "util/qemu-timer-common.c"
+#include "trace/control.c"
+#include "../trace/generated-events.c"
 #ifdef CONFIG_TRACE_SIMPLE
-#include "../trace/simple.c"
+#include "trace/simple.c"
 #endif
 
 #include <stdarg.h>
-- 
1.7.9.5


