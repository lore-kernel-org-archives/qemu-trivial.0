Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WEeCp-0002AD-HK
	for mharc-qemu-trivial@gnu.org; Sat, 15 Feb 2014 07:18:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeCi-00026G-VR
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:18:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeCe-00070M-RU
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:18:44 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:59782)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WEeCW-0006vW-9G; Sat, 15 Feb 2014 07:18:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8425341C27;
	Sat, 15 Feb 2014 16:18:22 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6C26621D;
	Sat, 15 Feb 2014 16:18:22 +0400 (MSK)
Received: (nullmailer pid 21820 invoked by uid 1000);
	Sat, 15 Feb 2014 12:18:22 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Feb 2014 16:18:11 +0400
Message-Id: <1392466700-21770-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 01/10] misc: Fix case Qemu -> QEMU
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
X-List-Received-Date: Sat, 15 Feb 2014 12:18:49 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
=20
-Translate each FILE to the new Qemu timer API. If no files
+Translate each FILE to the new QEMU timer API. If no files
 are passed, a reasonable guess is taken.
=20
 Options:
diff --git a/tests/i440fx-test.c b/tests/i440fx-test.c
index fa3e3d6..bcd2181 100644
--- a/tests/i440fx-test.c
+++ b/tests/i440fx-test.c
@@ -350,7 +350,7 @@ static void test_i440fx_firmware(FirmwareTestFixture =
*fixture,
     qtest_start(cmdline);
     g_free(cmdline);
=20
-    /* Qemu has loaded the firmware (because qtest_start() only returns =
after
+    /* QEMU has loaded the firmware (because qtest_start() only returns =
after
      * the QMP handshake completes). We must unlink the firmware blob ri=
ght
      * here, because any assertion firing below would leak it in the
      * filesystem. This is also the reason why we recreate the blob ever=
y time
--=20
1.7.10.4


