Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aoZ0I-000571-0G
	for mharc-qemu-trivial@gnu.org; Fri, 08 Apr 2016 12:11:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aoZ0G-00053u-5k
	for qemu-trivial@nongnu.org; Fri, 08 Apr 2016 12:11:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1aoZ0F-0001pV-Bt
	for qemu-trivial@nongnu.org; Fri, 08 Apr 2016 12:11:24 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:41377)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1aoZ0A-0001nv-C9; Fri, 08 Apr 2016 12:11:18 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id EDFBD17F4A5; Fri,  8 Apr 2016 18:11:14 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Stefan Weil <sw@weilnetz.de>
Date: Fri,  8 Apr 2016 18:11:13 +0200
Message-Id: <1460131873-8571-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.221.198.45
Subject: [Qemu-trivial] [PATCH] configure: Use uniform description for devel
 packages
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
X-List-Received-Date: Fri, 08 Apr 2016 16:11:25 -0000

As all other devel packages are written in the form "name devel",
use this form for libcap devel and libattr devel, too.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 9101257..adf70bd 100755
--- a/configure
+++ b/configure
@@ -4576,7 +4576,7 @@ if test "$softmmu" = yes ; then
       tools="$tools fsdev/virtfs-proxy-helper\$(EXESUF)"
     else
       if test "$virtfs" = yes; then
-        error_exit "VirtFS is supported only on Linux and requires libcap-devel and libattr-devel"
+        error_exit "VirtFS is supported only on Linux and requires libcap devel and libattr devel"
       fi
       virtfs=no
     fi
-- 
2.1.4


