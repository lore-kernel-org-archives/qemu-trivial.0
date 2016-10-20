Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bxIxN-0000GR-6S
	for mharc-qemu-trivial@gnu.org; Thu, 20 Oct 2016 15:24:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1bxIxL-0000Ff-SP
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 15:24:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1bxIxL-0002xU-3P
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 15:24:47 -0400
Received: from mail.weilnetz.de ([37.221.199.173]:41438)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1bxIxG-0002tX-S3; Thu, 20 Oct 2016 15:24:42 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id 5D34711810A9;
	Thu, 20 Oct 2016 21:24:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 0ILndWTWzblc; Thu, 20 Oct 2016 21:24:39 +0200 (CEST)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
	by mail.weilnetz.de (Postfix) with ESMTP id 55CAB11810A3;
	Thu, 20 Oct 2016 21:24:39 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 330D94673AF; Thu, 20 Oct 2016 21:24:39 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Date: Thu, 20 Oct 2016 21:24:38 +0200
Message-Id: <20161020192438.18564-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Subject: [Qemu-trivial] [PATCH] qemu-ga: Remove stray 'q' in documentation
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
X-List-Received-Date: Thu, 20 Oct 2016 19:24:48 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 qemu-ga.texi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-ga.texi b/qemu-ga.texi
index 0e53bf6..4c7a8fd 100644
--- a/qemu-ga.texi
+++ b/qemu-ga.texi
@@ -30,7 +30,7 @@ set user's password
 @end itemize
 
 qemu-ga will read a system configuration file on startup (located at
-q@file{/etc/qemu/qemu-ga.conf} by default), then parse remaining
+@file{/etc/qemu/qemu-ga.conf} by default), then parse remaining
 configuration options on the command line. For the same key, the last
 option wins, but the lists accumulate (see below for configuration
 file format).
-- 
2.9.3


