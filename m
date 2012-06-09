Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SdFn0-0005bP-Ka
	for mharc-qemu-trivial@gnu.org; Sat, 09 Jun 2012 03:08:50 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SdFmx-0005TA-DG
	for qemu-trivial@nongnu.org; Sat, 09 Jun 2012 03:08:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SdFmv-0005wy-Ok
	for qemu-trivial@nongnu.org; Sat, 09 Jun 2012 03:08:46 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:46170)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SdFms-0005w6-Jq; Sat, 09 Jun 2012 03:08:42 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	615177280025; Sat,  9 Jun 2012 09:08:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id wMb0SJj1TYpi; Sat,  9 Jun 2012 09:08:39 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id EBA067280026; Sat,  9 Jun 2012 09:08:39 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Sat,  9 Jun 2012 09:08:38 +0200
Message-Id: <1339225719-5434-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/2] Makefile: Remove BUILD_DIR from qapi-dir
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
X-List-Received-Date: Sat, 09 Jun 2012 07:08:49 -0000

qapi-dir does not need an absolute path. All other build directories
are relative. When BUILD_DIR is removed, the build output looks better
(no long lines with absolute paths when everything else uses short
lines):

  GEN   qapi-generated/qga-qapi-types.c
  CC    qapi-generated/qga-qapi-types.o
  GEN   qapi-generated/qga-qapi-visit.c
  CC    qapi-generated/qga-qapi-visit.o
  GEN   qapi-generated/qga-qmp-marshal.c
  CC    qapi-generated/qga-qmp-marshal.o

Using a relative path also avoids potential problems when BUILD_DIR
includes blanks.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 32550cb..8880a3e 100644
--- a/Makefile
+++ b/Makefile
@@ -171,7 +171,7 @@ fsdev/virtfs-proxy-helper$(EXESUF): LIBS += -lcap
 qemu-img-cmds.h: $(SRC_PATH)/qemu-img-cmds.hx
 	$(call quiet-command,sh $(SRC_PATH)/scripts/hxtool -h < $< > $@,"  GEN   $@")
 
-qapi-dir := $(BUILD_DIR)/qapi-generated
+qapi-dir := qapi-generated
 qemu-ga$(EXESUF): LIBS = $(LIBS_QGA)
 qemu-ga$(EXESUF): QEMU_CFLAGS += -I $(qapi-dir)
 
-- 
1.7.10


