Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwEyc-0000Cl-Mv
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 18:02:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51862)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEyY-00006J-NT
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 18:02:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEyX-0006Wd-PP
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 18:02:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40991)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwEyS-0006T9-Ng; Sun, 24 Sep 2017 18:02:04 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A111341C96;
	Mon, 25 Sep 2017 01:02:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6F614B7D;
	Mon, 25 Sep 2017 00:22:55 +0300 (MSK)
Received: (nullmailer pid 28270 invoked by uid 1000);
	Sun, 24 Sep 2017 21:22:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 25 Sep 2017 00:22:33 +0300
Message-Id: <85209bc943b0b429b0077cf49a60a001edc4613f.1506288070.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 15/31] MAINTAINERS: update docs/devel/ entries
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
X-List-Received-Date: Sun, 24 Sep 2017 22:02:11 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

moved in commit ac06724a7158

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1a5cd3c05c..f4444467e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1440,7 +1440,7 @@ F: tests/test-qapi-*.c
 F: tests/test-qmp-*.c
 F: tests/test-visitor-serialization.c
 F: scripts/qapi*
-F: docs/qapi*
+F: docs/devel/qapi*
 T: git git://repo.or.cz/qemu/armbru.git qapi-next
=20
 QAPI Schema
@@ -1492,7 +1492,7 @@ M: Markus Armbruster <armbru@redhat.com>
 S: Supported
 F: qmp.c
 F: monitor.c
-F: docs/*qmp-*
+F: docs/devel/*qmp-*
 F: scripts/qmp/
 F: tests/qmp-test.c
 T: git git://repo.or.cz/qemu/armbru.git qapi-next
@@ -1523,7 +1523,7 @@ S: Maintained
 F: trace/
 F: scripts/tracetool.py
 F: scripts/tracetool/
-F: docs/tracing.txt
+F: docs/devel/tracing.txt
 T: git git://github.com/stefanha/qemu.git tracing
=20
 TPM
@@ -1546,7 +1546,7 @@ F: include/migration/
 F: migration/
 F: scripts/vmstate-static-checker.py
 F: tests/vmstate-static-checker-data/
-F: docs/migration.txt
+F: docs/devel/migration.txt
 F: qapi/migration.json
=20
 Seccomp
@@ -1945,5 +1945,5 @@ Documentation
 Build system architecture
 M: Daniel P. Berrange <berrange@redhat.com>
 S: Odd Fixes
-F: docs/build-system.txt
+F: docs/devel/build-system.txt
=20
--=20
2.11.0


