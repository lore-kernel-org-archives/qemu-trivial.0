Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhNDl-00048h-DJ
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 14:02:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNDd-0003sn-3K
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:02:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNDY-00018n-5z
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:02:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52255)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhNDM-00015k-F1; Mon, 05 May 2014 14:02:08 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 744AC40751;
	Mon,  5 May 2014 22:02:06 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 55E4F66D;
	Mon,  5 May 2014 22:02:06 +0400 (MSK)
Received: (nullmailer pid 24216 invoked by uid 1000);
	Mon, 05 May 2014 18:02:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon,  5 May 2014 22:01:45 +0400
Message-Id: <1399312923-24129-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 04/22] tests/tcg: Fix compilation of test_path
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
X-List-Received-Date: Mon, 05 May 2014 18:02:30 -0000

From: Peter Maydell <peter.maydell@linaro.org>

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
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/tcg/Makefile    |    2 --
 tests/tcg/test_path.c |    7 -------
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
1.7.10.4


