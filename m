Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wf5us-0004T5-Hh
	for mharc-qemu-trivial@gnu.org; Tue, 29 Apr 2014 07:09:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54105)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Wf5uq-0004RJ-HF
	for qemu-trivial@nongnu.org; Tue, 29 Apr 2014 07:09:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Wf5up-0003ea-HE
	for qemu-trivial@nongnu.org; Tue, 29 Apr 2014 07:09:36 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:47958)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Wf5un-0003b4-Jv; Tue, 29 Apr 2014 07:09:33 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Wf5ue-0006de-D2; Tue, 29 Apr 2014 12:09:24 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 29 Apr 2014 12:09:24 +0100
Message-Id: <1398769764-25493-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH v2] tests/tcg: Fix compilation of test_path
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
X-List-Received-Date: Tue, 29 Apr 2014 11:09:37 -0000

The test_path binary is (unlike the other test binaries in tests/tcg)
actually intended to be compiled with the same compiler used to build
the main QEMU executables. It actually #includes a number of the
QEMU source files in an attempt to unit-test the util/path.c functions,
and so if it is not compiled with the same compiler used by configure
to set CONFIG_ settings then it is liable to fail to build.
Fix the makefile to build it with the default C compiler rules, not
CC_I386, and fix the test itself not to include a lot of unnecessary
trace related source files which cause the build to fail if the trace
backend is anything other than 'simple'.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Changes v1->v2:
 * drop the CC lines entirely, and drop define of _GNU_SOURCE
   since we can get that from our cflags via the default .c->.o rule

 tests/tcg/Makefile    | 2 --
 tests/tcg/test_path.c | 7 -------
 2 files changed, 9 deletions(-)

diff --git a/tests/tcg/Makefile b/tests/tcg/Makefile
index 24e3154..89e3342 100644
--- a/tests/tcg/Makefile
+++ b/tests/tcg/Makefile
@@ -81,10 +81,8 @@ run-test_path: test_path
 # rules to compile tests
 
 test_path: test_path.o
-	$(CC_I386) $(LDFLAGS) -o $@ $^ $(LIBS)
 
 test_path.o: test_path.c
-	$(CC_I386) $(QEMU_INCLUDES) $(GLIB_CFLAGS) $(CFLAGS) -c -o $@ $^
 
 hello-i386: hello-i386.c
 	$(CC_I386) -nostdlib $(CFLAGS) -static $(LDFLAGS) -o $@ $<
diff --git a/tests/tcg/test_path.c b/tests/tcg/test_path.c
index f8dd36a..1c29bce 100644
--- a/tests/tcg/test_path.c
+++ b/tests/tcg/test_path.c
@@ -1,17 +1,10 @@
 /* Test path override code */
-#define _GNU_SOURCE
 #include "config-host.h"
 #include "util/cutils.c"
 #include "util/hexdump.c"
 #include "util/iov.c"
 #include "util/path.c"
 #include "util/qemu-timer-common.c"
-#include "trace/control.c"
-#include "../trace/generated-events.c"
-#ifdef CONFIG_TRACE_SIMPLE
-#include "trace/simple.c"
-#endif
-
 #include <stdarg.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-- 
1.9.2


