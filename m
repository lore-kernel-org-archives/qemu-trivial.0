Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZGTVj-0002Z8-Nq
	for mharc-qemu-trivial@gnu.org; Sat, 18 Jul 2015 10:54:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41465)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1ZGTVh-0002W4-P4
	for qemu-trivial@nongnu.org; Sat, 18 Jul 2015 10:54:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1ZGTVg-0002Nv-RY
	for qemu-trivial@nongnu.org; Sat, 18 Jul 2015 10:54:41 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:58546)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1ZGTVc-0002NE-9n; Sat, 18 Jul 2015 10:54:36 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 9A0A517F6DE; Sat, 18 Jul 2015 16:54:33 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 18 Jul 2015 16:54:32 +0200
Message-Id: <1437231272-17389-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH for-2.4] make: Clean build messages
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
X-List-Received-Date: Sat, 18 Jul 2015 14:54:42 -0000

We want to have uniform build messages, so fix some messages
which did not follow the standard pattern.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

This is an optional trivial patch for 2.4.

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


