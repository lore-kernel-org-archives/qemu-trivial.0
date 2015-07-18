Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZGTVw-0002u9-3q
	for mharc-qemu-trivial@gnu.org; Sat, 18 Jul 2015 10:54:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1ZGTVt-0002p5-7W
	for qemu-trivial@nongnu.org; Sat, 18 Jul 2015 10:54:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1ZGTVs-0002VA-Ak
	for qemu-trivial@nongnu.org; Sat, 18 Jul 2015 10:54:53 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:58551)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1ZGTVn-0002UL-KM; Sat, 18 Jul 2015 10:54:47 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 8E2EB17F6DE; Sat, 18 Jul 2015 16:54:45 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 18 Jul 2015 16:54:44 +0200
Message-Id: <1437231284-17455-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH for-2.4] tests: Fix broken targets
	check-report-qtest-*
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
X-List-Received-Date: Sat, 18 Jul 2015 14:54:54 -0000

They need QTEST_QEMU_IMG. Without it, the tests raise an assertion:

$ make -C bin check-report-qtest-i386.xml
make: Entering directory 'bin'
GTESTER check-report-qtest-i386.xml
blkdebug: Suspended request 'A'
blkdebug: Resuming request 'A'
ahci-test: tests/libqos/libqos.c:162:
 mkimg: Assertion `qemu_img_path' failed.
main-loop: WARNING: I/O thread spun for 1000 iterations

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 tests/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/Makefile b/tests/Makefile
index 2c4b8dc..8d26736 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -478,6 +478,7 @@ $(patsubst %, check-%, $(check-unit-y)): check-%: %
 
 $(patsubst %, check-report-qtest-%.xml, $(QTEST_TARGETS)): check-report-qtest-%.xml: $(check-qtest-y)
 	$(call quiet-command,QTEST_QEMU_BINARY=$*-softmmu/qemu-system-$* \
+		QTEST_QEMU_IMG=qemu-img$(EXESUF) \
 	  gtester -q $(GTESTER_OPTIONS) -o $@ -m=$(SPEED) $(check-qtest-$*-y),"GTESTER $@")
 
 check-report-unit.xml: $(check-unit-y)
-- 
2.1.4


