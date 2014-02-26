Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WIo4y-0001Eb-2w
	for mharc-qemu-trivial@gnu.org; Wed, 26 Feb 2014 18:39:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WIo4v-00017X-Ht
	for qemu-trivial@nongnu.org; Wed, 26 Feb 2014 18:39:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WIo4u-0002YK-Lr
	for qemu-trivial@nongnu.org; Wed, 26 Feb 2014 18:39:53 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:46288)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WIo4s-0002Xd-1t; Wed, 26 Feb 2014 18:39:50 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WIo4p-0006SK-0x; Wed, 26 Feb 2014 23:39:47 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 26 Feb 2014 23:39:46 +0000
Message-Id: <1393457987-24791-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <andreas.faerber@web.de>,
	Richard Henderson <rth@twiddle.net>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] tests/test-int128: Don't use __noclone__
	attribute on clang
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
X-List-Received-Date: Wed, 26 Feb 2014 23:39:54 -0000

clang doesn't support the __noclone__ attribute and emits a warning about
it. Fortunately clang also implements a mechanism for asking if a particular
attribute is implemented; use it. We assume that if the compiler doesn't
support __has_attribute() then it must be GCC and must support __noclone__.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
__has_attribute and friends are a clang feature it would be nice if
the GCC devs stole :-)  If they'd had it from the start it would have
obviated all the horrible specific-version-of-gcc checks that compiler.h
has to do...

This is the only file in the tree using __noclone__ so it seems simplest
to fix this here rather than putting it in compiler.h.

 tests/test-int128.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tests/test-int128.c b/tests/test-int128.c
index 5aca032..0772ef7 100644
--- a/tests/test-int128.c
+++ b/tests/test-int128.c
@@ -11,6 +11,19 @@
 #include "qemu/int128.h"
 #include "qemu/osdep.h"
 
+/* clang doesn't support __noclone__ but it does have a mechanism for
+ * telling us this. We assume that if we don't have __has_attribute()
+ * then this is GCC and that GCC always supports __noclone__.
+ */
+#if defined(__has_attribute)
+#if !__has_attribute(__noclone__)
+#define ATTRIBUTE_NOCLONE
+#endif
+#endif
+#ifndef ATTRIBUTE_NOCLONE
+#define ATTRIBUTE_NOCLONE __attribute__((__noclone__))
+#endif
+
 static uint32_t tests[8] = {
     0x00000000, 0x00000001, 0x7FFFFFFE, 0x7FFFFFFF,
     0x80000000, 0x80000001, 0xFFFFFFFE, 0xFFFFFFFF,
@@ -164,7 +177,7 @@ static void test_gt(void)
 
 /* Make sure to test undefined behavior at runtime! */
 
-static void __attribute__((__noinline__, __noclone__))
+static void __attribute__((__noinline__)) ATTRIBUTE_NOCLONE
 test_rshift_one(uint32_t x, int n, uint64_t h, uint64_t l)
 {
     Int128 a = expand(x);
-- 
1.8.5.4


