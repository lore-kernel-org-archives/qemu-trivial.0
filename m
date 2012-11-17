Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TZlS5-00013I-80
	for mharc-qemu-trivial@gnu.org; Sat, 17 Nov 2012 11:41:05 -0500
Received: from eggs.gnu.org ([208.118.235.92]:34320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TZlRz-0000jp-OH
	for qemu-trivial@nongnu.org; Sat, 17 Nov 2012 11:41:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TZlRw-0006pp-Mf
	for qemu-trivial@nongnu.org; Sat, 17 Nov 2012 11:40:59 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:33674)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TZlRq-0006ow-BW; Sat, 17 Nov 2012 11:40:50 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	4AE5D7280030; Sat, 17 Nov 2012 17:40:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id IXQ+0mYQwDM9; Sat, 17 Nov 2012 17:40:44 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 281B4728003A; Sat, 17 Nov 2012 17:40:44 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org,
	Anthony Liguori <aliguori@us.ibm.com>
Date: Sat, 17 Nov 2012 17:40:43 +0100
Message-Id: <1353170443-18168-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] qemu-common: Add definition for O_NONBLOCK
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
X-List-Received-Date: Sat, 17 Nov 2012 16:41:03 -0000

backends/rng-random.c which was added by commit
5c74521d249486fa3e749dbbf6d56a70d4d7235f needs
macro O_NONBLOCK.

The macro O_NONBLOCK is not defined for all hosts.
Adding a default definition fixes builds for MinGW.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

This is a build fix. Therefore I'd appreciate if it could be
committed soon.

Thanks
Stefan W.

 qemu-common.h |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/qemu-common.h b/qemu-common.h
index ac9985c..3a5616c 100644
--- a/qemu-common.h
+++ b/qemu-common.h
@@ -55,6 +55,9 @@ typedef struct MigrationParams MigrationParams;
 #ifndef O_BINARY
 #define O_BINARY 0
 #endif
+#ifndef O_NONBLOCK
+#define O_NONBLOCK 0
+#endif
 #ifndef MAP_ANONYMOUS
 #define MAP_ANONYMOUS MAP_ANON
 #endif
-- 
1.7.10.4


