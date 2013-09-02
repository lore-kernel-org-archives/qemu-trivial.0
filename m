Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGSCW-0000KH-6J
	for mharc-qemu-trivial@gnu.org; Mon, 02 Sep 2013 07:21:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGSCP-00006Q-Rd
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:21:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGSCL-0003GM-Ma
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:21:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40733)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VGSCA-0003E5-UC; Mon, 02 Sep 2013 07:21:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8C40E40243;
	Mon,  2 Sep 2013 15:21:21 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id EA2B7213;
	Mon,  2 Sep 2013 15:01:57 +0400 (MSK)
Received: (nullmailer pid 14657 invoked by uid 1000);
	Mon, 02 Sep 2013 11:01:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Mon,  2 Sep 2013 15:01:35 +0400
Message-Id: <1378119695-14568-16-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Alex Bligh <alex@alex.org.uk>
Subject: [Qemu-trivial] [PULL 15/15] aio / timers: use g_usleep() not sleep()
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
X-List-Received-Date: Mon, 02 Sep 2013 11:21:42 -0000

From: Alex Bligh <alex@alex.org.uk>

sleep() apparently doesn't exist under mingw. Use g_usleep for
portability.

Signed-off-by: Alex Bligh <alex@alex.org.uk>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/test-aio.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/test-aio.c b/tests/test-aio.c
index 07a1f61..532a1de 100644
--- a/tests/test-aio.c
+++ b/tests/test-aio.c
@@ -396,7 +396,7 @@ static void test_timer_schedule(void)
     g_assert(!aio_poll(ctx, false));
     g_assert_cmpint(data.n, ==, 0);
 
-    sleep(1);
+    g_usleep(1 * G_USEC_PER_SEC);
     g_assert_cmpint(data.n, ==, 0);
 
     g_assert(aio_poll(ctx, false));
@@ -729,7 +729,7 @@ static void test_source_timer_schedule(void)
 
     g_assert_cmpint(data.n, ==, 0);
 
-    sleep(1);
+    g_usleep(1 * G_USEC_PER_SEC);
     g_assert_cmpint(data.n, ==, 0);
 
     g_assert(g_main_context_iteration(NULL, false));
@@ -739,7 +739,7 @@ static void test_source_timer_schedule(void)
     do {
         g_assert(g_main_context_iteration(NULL, true));
     } while (qemu_clock_get_ns(data.clock_type) <= expiry);
-    sleep(1);
+    g_usleep(1 * G_USEC_PER_SEC);
     g_main_context_iteration(NULL, false);
 
     g_assert_cmpint(data.n, ==, 2);
-- 
1.7.10.4


