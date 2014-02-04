Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WAYn5-0003Kv-3i
	for mharc-qemu-trivial@gnu.org; Tue, 04 Feb 2014 00:43:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WAYn2-0003HU-6w
	for qemu-trivial@nongnu.org; Tue, 04 Feb 2014 00:43:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WAYn0-0003bo-To
	for qemu-trivial@nongnu.org; Tue, 04 Feb 2014 00:43:20 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:44661
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WAYmy-0003ak-7c; Tue, 04 Feb 2014 00:43:16 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id ACF4C17F6F8; Tue,  4 Feb 2014 06:43:10 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Tue,  4 Feb 2014 06:43:09 +0100
Message-Id: <1391492590-8844-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Stefan Weil <sw@weilnetz.de>, Laszlo Ersek <lersek@redhat.com>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] misc: Fix case Qemu -> QEMU
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
X-List-Received-Date: Tue, 04 Feb 2014 05:43:21 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 scripts/switch-timer-api |    2 +-
 tests/i440fx-test.c      |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/switch-timer-api b/scripts/switch-timer-api
index a369a08..b0e230b 100755
--- a/scripts/switch-timer-api
+++ b/scripts/switch-timer-api
@@ -20,7 +20,7 @@ sub Syntax
     print STDERR <<STOP;
 Usage: $FindBin::Script [options] FILE ...
 
-Translate each FILE to the new Qemu timer API. If no files
+Translate each FILE to the new QEMU timer API. If no files
 are passed, a reasonable guess is taken.
 
 Options:
diff --git a/tests/i440fx-test.c b/tests/i440fx-test.c
index fa3e3d6..bcd2181 100644
--- a/tests/i440fx-test.c
+++ b/tests/i440fx-test.c
@@ -350,7 +350,7 @@ static void test_i440fx_firmware(FirmwareTestFixture *fixture,
     qtest_start(cmdline);
     g_free(cmdline);
 
-    /* Qemu has loaded the firmware (because qtest_start() only returns after
+    /* QEMU has loaded the firmware (because qtest_start() only returns after
      * the QMP handshake completes). We must unlink the firmware blob right
      * here, because any assertion firing below would leak it in the
      * filesystem. This is also the reason why we recreate the blob every time
-- 
1.7.10.4


