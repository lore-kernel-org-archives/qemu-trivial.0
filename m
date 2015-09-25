Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZfZYs-0004ta-7O
	for mharc-qemu-trivial@gnu.org; Fri, 25 Sep 2015 16:25:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZfZYp-0004sg-3N
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 16:25:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZfZYl-0002Wd-U9
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 16:25:39 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:40939)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ZfZYl-0002WQ-F6
	for qemu-trivial@nongnu.org; Fri, 25 Sep 2015 16:25:35 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 1BEBD17F539; Fri, 25 Sep 2015 22:25:33 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Date: Fri, 25 Sep 2015 22:25:32 +0200
Message-Id: <1443212732-8975-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.221.198.45
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Add NSIS file for W32, W64 hosts
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
X-List-Received-Date: Fri, 25 Sep 2015 20:25:40 -0000

The NSIS installer configuration is maintained by me.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7aff162..1ed349d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -262,6 +262,7 @@ L: qemu-devel@nongnu.org
 M: Stefan Weil <sw@weilnetz.de>
 S: Maintained
 F: *win32*
+F: qemu.nsi
 
 ARM Machines
 ------------
-- 
2.1.4


