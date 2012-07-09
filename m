Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SoIpG-0006SG-Ir
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jul 2012 14:36:50 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SoIpD-0006HG-Ap
	for qemu-trivial@nongnu.org; Mon, 09 Jul 2012 14:36:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SoIp8-0000Td-Me
	for qemu-trivial@nongnu.org; Mon, 09 Jul 2012 14:36:46 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:55399)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SoIp5-0000Su-GW; Mon, 09 Jul 2012 14:36:39 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	7DB6672800C0; Mon,  9 Jul 2012 20:36:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id UXy8kf3JkMCk; Mon,  9 Jul 2012 20:36:37 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 02DBF72800C1; Mon,  9 Jul 2012 20:36:36 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Mon,  9 Jul 2012 20:36:36 +0200
Message-Id: <1341858996-16953-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] make: Remove 'build-all' rule
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
X-List-Received-Date: Mon, 09 Jul 2012 18:36:48 -0000

It is not needed, because the 'all' rule does the same.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 Makefile |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index bad0e31..76dae56 100644
--- a/Makefile
+++ b/Makefile
@@ -6,7 +6,7 @@ BUILD_DIR=$(CURDIR)
 # All following code might depend on configuration variables
 ifneq ($(wildcard config-host.mak),)
 # Put the all: rule here so that config-host.mak can contain dependencies.
-all: build-all
+all:
 include config-host.mak
 include $(SRC_PATH)/rules.mak
 config-host.mak: $(SRC_PATH)/configure
@@ -31,7 +31,7 @@ Makefile: ;
 configure: ;
 
 .PHONY: all clean cscope distclean dvi html info install install-doc \
-	pdf recurse-all speed tar tarbin test build-all
+	pdf recurse-all speed tar tarbin test
 
 $(call set-vpath, $(SRC_PATH))
 
@@ -82,7 +82,7 @@ defconfig:
 
 -include config-all-devices.mak
 
-build-all: $(DOCS) $(TOOLS) $(HELPERS-y) recurse-all
+all: $(DOCS) $(TOOLS) $(HELPERS-y) recurse-all
 
 config-host.h: config-host.h-timestamp
 config-host.h-timestamp: config-host.mak
-- 
1.7.10


