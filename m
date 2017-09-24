Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwFbJ-0002v8-NB
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 18:42:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwFbF-0002qC-Tk
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 18:42:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwFbF-00085L-1a
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 18:42:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33161)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwFb9-00081c-S1; Sun, 24 Sep 2017 18:42:04 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 60C7F41C96;
	Mon, 25 Sep 2017 01:42:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 8545EB88;
	Mon, 25 Sep 2017 00:22:55 +0300 (MSK)
Received: (nullmailer pid 28298 invoked by uid 1000);
	Sun, 24 Sep 2017 21:22:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 25 Sep 2017 00:22:47 +0300
Message-Id: <e2a74ec97837bdb45c773ea5e6fcf26db6b0338b.1506288070.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 29/31] tests/boot-sector: Increase timeout to
 600 seconds
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Sep 2017 22:42:10 -0000

From: Thomas Huth <thuth@redhat.com>

If QEMU has been compiled with the flags --enable-tcg-interpreter and
--enable-debug, the guest is running incredibly slow. The pxe boot test
can take up to 400 seconds when testing the pseries ppc64 machine. While
we should still look for ways to speed up the test on the pseries machine,
it's better to increase the timeout in this test to 600 seconds anyway to
allow the test to pass successfully now with this unusal configuration
already.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/boot-sector.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/boot-sector.c b/tests/boot-sector.c
index 9ee85370b0..be29d5bb9b 100644
--- a/tests/boot-sector.c
+++ b/tests/boot-sector.c
@@ -137,9 +137,9 @@ void boot_sector_test(void)
     uint16_t signature;
     int i;
 
-    /* Wait at most 90 seconds */
+    /* Wait at most 600 seconds (test is slow with TCI and --enable-debug) */
 #define TEST_DELAY (1 * G_USEC_PER_SEC / 10)
-#define TEST_CYCLES MAX((90 * G_USEC_PER_SEC / TEST_DELAY), 1)
+#define TEST_CYCLES MAX((600 * G_USEC_PER_SEC / TEST_DELAY), 1)
 
     /* Poll until code has run and modified memory.  Once it has we know BIOS
      * initialization is done.  TODO: check that IP reached the halt
-- 
2.11.0


