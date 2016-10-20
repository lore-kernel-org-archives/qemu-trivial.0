Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bxJ92-0001T2-LN
	for mharc-qemu-trivial@gnu.org; Thu, 20 Oct 2016 15:36:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1bxJ90-0001No-KJ
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 15:36:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1bxJ8z-0007DS-Vp
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2016 15:36:50 -0400
Received: from mail.weilnetz.de ([37.221.199.173]:41695)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1bxJ8t-0007BU-Rc; Thu, 20 Oct 2016 15:36:43 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id 62EE811810A9;
	Thu, 20 Oct 2016 21:36:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 54Tlo0rH2hOK; Thu, 20 Oct 2016 21:36:41 +0200 (CEST)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
	by mail.weilnetz.de (Postfix) with ESMTP id 7472511810A3;
	Thu, 20 Oct 2016 21:36:41 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 69B1A4673AF; Thu, 20 Oct 2016 21:36:41 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Date: Thu, 20 Oct 2016 21:36:32 +0200
Message-Id: <20161020193632.18682-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.199.173
Subject: [Qemu-trivial] [PATCH] Makefile: Fix help text for target
 'installer'
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
X-List-Received-Date: Thu, 20 Oct 2016 19:36:51 -0000

The NSIS based installer currently does not install qemu-ga.
It installs the executables and other files for the QEMU system emulation.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 3bcb056..69595ad 100644
--- a/Makefile
+++ b/Makefile
@@ -695,7 +695,7 @@ help:
 	@echo  ''
 ifdef CONFIG_WIN32
 	@echo  'Windows targets:'
-	@echo  '  installer       - Build NSIS-based installer for qemu-ga'
+	@echo  '  installer       - Build NSIS-based installer for QEMU'
 ifdef QEMU_GA_MSI_ENABLED
 	@echo  '  msi             - Build MSI-based installer for qemu-ga'
 endif
-- 
2.9.3


