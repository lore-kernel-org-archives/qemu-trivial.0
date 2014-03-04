Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WKime-0001YS-W0
	for mharc-qemu-trivial@gnu.org; Tue, 04 Mar 2014 01:24:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60532)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKimW-0001JP-2C
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:24:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKimR-0004CR-OC
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:24:47 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:49371)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WKimE-00048q-PI; Tue, 04 Mar 2014 01:24:30 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 356F84084F;
	Tue,  4 Mar 2014 10:24:30 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 53A3066E;
	Tue,  4 Mar 2014 10:16:05 +0400 (MSK)
Received: (nullmailer pid 16584 invoked by uid 1000);
	Tue, 04 Mar 2014 06:16:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  4 Mar 2014 10:15:55 +0400
Message-Id: <1393913761-16516-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 07/13] tests/test-int128: Don't use
	__noclone__ attribute on clang
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
X-List-Received-Date: Tue, 04 Mar 2014 06:24:53 -0000

From: Peter Maydell <peter.maydell@linaro.org>

clang doesn't support the __noclone__ attribute and emits a warning about
it. Fortunately clang also implements a mechanism for asking if a particular
attribute is implemented; use it. We assume that if the compiler doesn't
support __has_attribute() then it must be GCC and must support __noclone__.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/test-int128.c |   15 ++++++++++++++-
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
1.7.10.4


