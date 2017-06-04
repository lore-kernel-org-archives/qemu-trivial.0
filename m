Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dHXnw-0005HB-KB
	for mharc-qemu-trivial@gnu.org; Sun, 04 Jun 2017 11:51:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXnu-0005Eg-4n
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:50:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dHXnt-0003CX-E2
	for qemu-trivial@nongnu.org; Sun, 04 Jun 2017 11:50:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45749)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dHXno-000349-60; Sun, 04 Jun 2017 11:50:52 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3E84F404E6;
	Sun,  4 Jun 2017 18:45:28 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 1B7EB5E7;
	Sun,  4 Jun 2017 18:45:28 +0300 (MSK)
Received: (nullmailer pid 16364 invoked by uid 1000);
	Sun, 04 Jun 2017 15:45:27 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  4 Jun 2017 18:45:09 +0300
Message-Id: <7c933ad61b8f3f5133757c8cbaedd712e5be6f78.1496591095.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
References: <cover.1496591095.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 05/22] tests/libqtest: Print error instead of
 aborting when env variable is missing
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
X-List-Received-Date: Sun, 04 Jun 2017 15:50:59 -0000

From: Thomas Huth <thuth@redhat.com>

When you currently try to run a test directly from the command line
without setting the QTEST_QEMU_BINARY environment variable first,
you are presented with an unhelpful assertion message like this:

 ERROR:tests/libqtest.c:163:qtest_init_without_qmp_handshake:
 assertion failed: (qemu_binary != NULL)
 Aborted (core dumped)

Let's replace the assert() with a more user friendly error message
instead.

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/libqtest.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/libqtest.c b/tests/libqtest.c
index 84ecbd2bd8..4a5492a603 100644
--- a/tests/libqtest.c
+++ b/tests/libqtest.c
@@ -160,7 +160,10 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
     const char *qemu_binary;
 
     qemu_binary = getenv("QTEST_QEMU_BINARY");
-    g_assert(qemu_binary != NULL);
+    if (!qemu_binary) {
+        fprintf(stderr, "Environment variable QTEST_QEMU_BINARY required\n");
+        exit(1);
+    }
 
     s = g_malloc(sizeof(*s));
 
-- 
2.11.0


