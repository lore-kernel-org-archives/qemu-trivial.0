Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WeMt8-0001y5-OB
	for mharc-qemu-trivial@gnu.org; Sun, 27 Apr 2014 07:04:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WeMt2-0001cQ-4k
	for qemu-trivial@nongnu.org; Sun, 27 Apr 2014 07:04:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WeMsw-0001ii-NS
	for qemu-trivial@nongnu.org; Sun, 27 Apr 2014 07:04:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51569)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WeMsm-0001hg-EY; Sun, 27 Apr 2014 07:04:28 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 49BAC42F06;
	Sun, 27 Apr 2014 15:04:25 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 32F5F64C;
	Sun, 27 Apr 2014 15:04:25 +0400 (MSK)
Received: (nullmailer pid 2238 invoked by uid 1000);
	Sun, 27 Apr 2014 11:04:25 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun, 27 Apr 2014 15:04:24 +0400
Message-Id: <1398596664-2203-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH] gitignore: cleanups #2
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
X-List-Received-Date: Sun, 27 Apr 2014 11:04:49 -0000

A few more cleanups for .gitignore file.
The final goal is to have only files in there which
are generated during build.  Things like .orig or
.gdbinit are definitely not generated during build.
Also, anchor a few more build-time directories.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .gitignore |    9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/.gitignore b/.gitignore
index 2748526..8a52709 100644
--- a/.gitignore
+++ b/.gitignore
@@ -18,8 +18,8 @@
 /*-darwin-user
 /*-linux-user
 /*-bsd-user
-libdis*
-libuser
+/libdis*
+/libuser
 /linux-headers/asm
 /qga/qapi-generated
 /qapi-generated
@@ -52,7 +52,6 @@ libuser
 /fsdev/virtfs-proxy-helper
 /fsdev/virtfs-proxy-helper.1
 /fsdev/virtfs-proxy-helper.pod
-/.gdbinit
 *.a
 *.aux
 *.cp
@@ -81,12 +80,8 @@ libuser
 *.pc
 .libs
 .sdk
-*.swp
-*.orig
-.pc
 *.gcda
 *.gcno
-patches
 /pc-bios/bios-pq/status
 /pc-bios/vgabios-pq/status
 /pc-bios/optionrom/linuxboot.asm
-- 
1.7.10.4


