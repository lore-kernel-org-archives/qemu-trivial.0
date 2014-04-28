Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WerLB-0005oc-Bg
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 15:35:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WerL8-0005mp-Go
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 15:35:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WerL7-0002Jl-5h
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 15:35:46 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:47952)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WerL4-0002Is-VW; Mon, 28 Apr 2014 15:35:43 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WerL2-0006Ml-9L; Mon, 28 Apr 2014 20:35:40 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 28 Apr 2014 20:35:40 +0100
Message-Id: <1398713740-24446-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] tests/tcg: Fix compilation of test_path
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
X-List-Received-Date: Mon, 28 Apr 2014 19:35:47 -0000

The test_path binary is (unlike the other test binaries in tests/tcg)
actually intended to be compiled with the same compiler used to build
the main QEMU executables. It actually #includes a number of the
QEMU source files in an attempt to unit-test the util/path.c functions,
and so if it is not compiled with the same compiler used by configure
to set CONFIG_ settings then it is liable to fail to build.
Fix the makefile to build it with CC, not CC_I386, and fix the test
itself not to include a lot of unnecessary trace related source
files which cause the build to fail if the trace backend is anything
other than 'simple'.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
The particular build failure you usually hit is that CC is an
x86-64 compiler supporting __int128_t whereas CC_I386 does not,
and then the code in the headers using those types blows up.

The whole attempt to unit test by compiling bits of the .c files
seems terribly fragile to me; this is the only test we have that
does it, so if anybody has a better approach to testing these path.c
functions I'd like to know.

Stefan, you added the trace .c files in commit 6d4adef48dd6bb but
I can't work out why they're needed -- the test builds fine for
me without them whether we configured using the default or simple
backends, and it definitely doesn't compile if we used the default
backend and the test includes the trace .c files...

 tests/tcg/Makefile    | 4 ++--
 tests/tcg/test_path.c | 6 ------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/tests/tcg/Makefile b/tests/tcg/Makefile
index 24e3154..2ffa067 100644
--- a/tests/tcg/Makefile
+++ b/tests/tcg/Makefile
@@ -81,10 +81,10 @@ run-test_path: test_path
 # rules to compile tests
 
 test_path: test_path.o
-	$(CC_I386) $(LDFLAGS) -o $@ $^ $(LIBS)
+	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)
 
 test_path.o: test_path.c
-	$(CC_I386) $(QEMU_INCLUDES) $(GLIB_CFLAGS) $(CFLAGS) -c -o $@ $^
+	$(CC) $(QEMU_INCLUDES) $(GLIB_CFLAGS) $(CFLAGS) -c -o $@ $^
 
 hello-i386: hello-i386.c
 	$(CC_I386) -nostdlib $(CFLAGS) -static $(LDFLAGS) -o $@ $<
diff --git a/tests/tcg/test_path.c b/tests/tcg/test_path.c
index f8dd36a..c77fdbf 100644
--- a/tests/tcg/test_path.c
+++ b/tests/tcg/test_path.c
@@ -6,12 +6,6 @@
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


