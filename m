Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZGNTC-0001dS-7s
	for mharc-qemu-trivial@gnu.org; Sat, 18 Jul 2015 04:27:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1ZGNT9-0001Zd-2z
	for qemu-trivial@nongnu.org; Sat, 18 Jul 2015 04:27:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1ZGNT8-0001IA-AS
	for qemu-trivial@nongnu.org; Sat, 18 Jul 2015 04:27:39 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:58081)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1ZGNT4-0001G8-2e; Sat, 18 Jul 2015 04:27:34 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 9AE0E17F820; Sat, 18 Jul 2015 10:27:30 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 18 Jul 2015 10:27:07 +0200
Message-Id: <1437208027-14584-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH for-2.4] disas/arm-a64: Add missing compiler
	attribute GCC_FMT_ATTR
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
X-List-Received-Date: Sat, 18 Jul 2015 08:27:40 -0000

Type fprintf_function which fits here was defined with this attribute.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

This is an optional trivial patch for 2.4 which fixes compiler warnings
in my build environment (with -Wextra).

 disas/arm-a64.cc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/disas/arm-a64.cc b/disas/arm-a64.cc
index b0803f9..b57256b 100644
--- a/disas/arm-a64.cc
+++ b/disas/arm-a64.cc
@@ -42,7 +42,7 @@ public:
         stream_ = stream;
     }
 
-    void SetPrintf(int (*printf_fn)(FILE *, const char *, ...)) {
+    void SetPrintf(fprintf_function printf_fn) {
         printf_ = printf_fn;
     }
 
@@ -53,7 +53,7 @@ protected:
     }
 
 private:
-    int (*printf_)(FILE *, const char *, ...);
+    fprintf_function printf_;
     FILE *stream_;
 };
 
-- 
2.1.4


