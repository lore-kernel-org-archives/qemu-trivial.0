Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SvTre-0005Ir-HZ
	for mharc-qemu-trivial@gnu.org; Sun, 29 Jul 2012 09:48:58 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SvTrb-0005AP-Dk
	for qemu-trivial@nongnu.org; Sun, 29 Jul 2012 09:48:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SvTra-0002uZ-Iv
	for qemu-trivial@nongnu.org; Sun, 29 Jul 2012 09:48:55 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:44627)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SvTrY-0002uC-Aj; Sun, 29 Jul 2012 09:48:52 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	AA4E472800A0; Sun, 29 Jul 2012 15:48:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id SM+dAEkZiB6Z; Sun, 29 Jul 2012 15:48:49 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 9772872800C4; Sun, 29 Jul 2012 15:48:49 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sun, 29 Jul 2012 15:48:49 +0200
Message-Id: <1343569729-11218-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] Makefile: Remove generated hw/usb files in
	'clean' target
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
X-List-Received-Date: Sun, 29 Jul 2012 13:48:56 -0000

Commit f1ae32a1ecda8aaff7a355c9030c0d8c363f3a70 moved the
usb directory to hw, so the files which should be removed
are now hw/usb/*.{d,o}.

The new code removes these files and also any other generated
*.o and *.d files in directories below hw.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index e4c754d..30f9e91 100644
--- a/Makefile
+++ b/Makefile
@@ -215,7 +215,7 @@ clean:
 	rm -Rf .libs
 	rm -f slirp/*.o slirp/*.d audio/*.o audio/*.d block/*.o block/*.d net/*.o net/*.d fsdev/*.o fsdev/*.d ui/*.o ui/*.d qapi/*.o qapi/*.d qga/*.o qga/*.d
 	rm -f qom/*.o qom/*.d
-	rm -f usb/*.o usb/*.d hw/*.o hw/*.d
+	rm -f hw/*/*.o hw/*/*.d hw/*.o hw/*.d
 	rm -f qemu-img-cmds.h
 	rm -f trace/*.o trace/*.d
 	rm -f trace-dtrace.dtrace trace-dtrace.dtrace-timestamp
-- 
1.7.10


