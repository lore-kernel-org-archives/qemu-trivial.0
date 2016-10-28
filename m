Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c09CL-0002Ze-09
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:36:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c09CF-0002W3-Eg
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:35:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c09CA-0003l0-Dr
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:35:55 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40159)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c09C4-0003hu-PV; Fri, 28 Oct 2016 11:35:44 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1C8BD4373C;
	Fri, 28 Oct 2016 18:35:44 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 0CF8DB60;
	Fri, 28 Oct 2016 18:18:58 +0300 (MSK)
Received: (nullmailer pid 6081 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 28 Oct 2016 18:18:49 +0300
Message-Id: <6bd67f8968e3e4ef4190e02ff6c38c4db5557984.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 18/23] Makefile: Fix help text for target
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
X-List-Received-Date: Fri, 28 Oct 2016 15:36:00 -0000

From: Stefan Weil <sw@weilnetz.de>

The NSIS based installer currently does not install qemu-ga.
It installs the executables and other files for the QEMU system emulation.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Michael Roth <mdroth@linux.vnet.ibm.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


