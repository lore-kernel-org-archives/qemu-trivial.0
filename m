Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y3Yff-0006PD-Gf
	for mharc-qemu-trivial@gnu.org; Tue, 23 Dec 2014 18:15:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Y3Yfd-0006P6-SS
	for qemu-trivial@nongnu.org; Tue, 23 Dec 2014 18:15:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Y3YfO-0000OG-6F
	for qemu-trivial@nongnu.org; Tue, 23 Dec 2014 18:15:17 -0500
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:54650)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Y3YfN-0000Lm-Po
	for qemu-trivial@nongnu.org; Tue, 23 Dec 2014 18:15:02 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Y3Xup-0004gf-RY; Tue, 23 Dec 2014 22:26:55 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 23 Dec 2014 22:26:53 +0000
Message-Id: <1419373615-17989-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1419373615-17989-1-git-send-email-peter.maydell@linaro.org>
References: <1419373615-17989-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/3] tests/hd-geo-test.c: Remove unused
	test_image variable
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
X-List-Received-Date: Tue, 23 Dec 2014 23:15:18 -0000

Remove unused variable test_image; this silences a clang warning.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/hd-geo-test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/hd-geo-test.c b/tests/hd-geo-test.c
index 7cc8dff..00afc20 100644
--- a/tests/hd-geo-test.c
+++ b/tests/hd-geo-test.c
@@ -22,8 +22,6 @@
 #include "qemu-common.h"
 #include "libqtest.h"
 
-static const char test_image[] = "/tmp/qtest.XXXXXX";
-
 static char *create_test_img(int secs)
 {
     char *template = strdup("/tmp/qtest.XXXXXX");
-- 
1.9.1


