Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJoa2-0001Rp-4k
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2015 16:00:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoZw-0001EU-7Y
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 16:00:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoZt-0005dJ-0d
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 16:00:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52978)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZJoZj-0005VK-8E; Mon, 27 Jul 2015 16:00:39 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E7F08425B5;
	Mon, 27 Jul 2015 23:00:37 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 2793BA57;
	Mon, 27 Jul 2015 22:54:21 +0300 (MSK)
Received: (nullmailer pid 9525 invoked by uid 1000);
	Mon, 27 Jul 2015 19:54:20 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 27 Jul 2015 22:54:08 +0300
Message-Id: <f6288b9c88bae7d76d8bfe17e672976d79079296.1438026619.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
References: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 05/10] make: Clean build messages
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
X-List-Received-Date: Mon, 27 Jul 2015 20:00:54 -0000

From: Stefan Weil <sw@weilnetz.de>

We want to have uniform build messages, so fix some messages
which did not follow the standard pattern.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 Makefile       | 2 +-
 tests/Makefile | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index c9be643..340d9c8 100644
--- a/Makefile
+++ b/Makefile
@@ -135,7 +135,7 @@ endif
 	 else \
 	  mv $@.tmp $@; \
 	  cp -p $@ $@.old; \
-	 fi, "  GEN  $@");
+	 fi, "  GEN   $@");
 
 defconfig:
 	rm -f config-all-devices.mak $(SUBDIR_DEVICES_MAK)
diff --git a/tests/Makefile b/tests/Makefile
index 8d26736..7494582 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -487,10 +487,10 @@ check-report-unit.xml: $(check-unit-y)
 # Reports and overall runs
 
 check-report.xml: $(patsubst %,check-report-qtest-%.xml, $(QTEST_TARGETS)) check-report-unit.xml
-	$(call quiet-command,$(SRC_PATH)/scripts/gtester-cat $^ > $@, "  GEN    $@")
+	$(call quiet-command,$(SRC_PATH)/scripts/gtester-cat $^ > $@, "  GEN   $@")
 
 check-report.html: check-report.xml
-	$(call quiet-command,gtester-report $< > $@, "  GEN    $@")
+	$(call quiet-command,gtester-report $< > $@, "  GEN   $@")
 
 
 # Other tests
-- 
2.1.4


