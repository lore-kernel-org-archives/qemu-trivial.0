Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YBfya-0008Jw-7J
	for mharc-qemu-trivial@gnu.org; Thu, 15 Jan 2015 03:40:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBfyX-0008Ew-Jn
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:40:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBfyT-0002mU-9L
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:40:21 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:55971)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YBfyI-0002bD-6S; Thu, 15 Jan 2015 03:40:06 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3B62040D9F;
	Thu, 15 Jan 2015 11:30:53 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 96B9E8CB;
	Thu, 15 Jan 2015 11:30:52 +0300 (MSK)
Received: (nullmailer pid 31343 invoked by uid 1000);
	Thu, 15 Jan 2015 08:30:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 15 Jan 2015 11:30:40 +0300
Message-Id: <9c6d5c1ade0b681b6f93c3d9d214389355cc563c.1421310394.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
References: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 02/12] tests/hd-geo-test.c: Remove unused
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
X-List-Received-Date: Thu, 15 Jan 2015 08:40:22 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Remove unused variable test_image; this silences a clang warning.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


