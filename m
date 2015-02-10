Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLGke-0008NQ-Fi
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 14:45:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YLGkc-0008MV-9T
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 14:45:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YLGkb-0004ta-DX
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 14:45:38 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44408)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YLGkW-0004t2-Ho; Tue, 10 Feb 2015 14:45:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 925B0419B0;
	Tue, 10 Feb 2015 22:45:29 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7BE838FF;
	Tue, 10 Feb 2015 22:45:29 +0300 (MSK)
Received: (nullmailer pid 18526 invoked by uid 1000);
	Tue, 10 Feb 2015 19:45:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-trivial@nongnu.org
Date: Tue, 10 Feb 2015 22:45:26 +0300
Message-Id: <1423597526-18483-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: [Qemu-trivial] [PATCH] qemu-options: fix/document -incoming options
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
X-List-Received-Date: Tue, 10 Feb 2015 19:45:39 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index ee4b223..a2c071a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3195,12 +3195,30 @@ Set TB size.
 ETEXI
 
 DEF("incoming", HAS_ARG, QEMU_OPTION_incoming, \
-    "-incoming p     prepare for incoming migration, listen on port p\n",
+    "-incoming tcp:[host]:port[,to=maxport][,ipv4][,ipv6]\n" \
+    "-incoming rdma:[host]:port[,to=maxport][,ipv4][,ipv6]\n" \
+    "-incoming unix:socketpath\n" \
+    "                prepare for incoming migration, listen on\n" \
+    "                specified protocol and socket address\n" \
+    "-incoming fd:fd\n" \
+    "-incoming exec:cmdline\n" \
+    "                accept incoming migration on given file descriptor\n" \
+    "                or from given external command\n",
     QEMU_ARCH_ALL)
 STEXI
-@item -incoming @var{port}
+@item -incoming tcp:[@var{host}]:@var{port}[,to=@var{maxport}][,ipv4][,ipv6]
+@item -incoming rdma:[@var{host}]:@var{port}[,to=@var{maxport}][,ipv4][,ipv6]
 @findex -incoming
-Prepare for incoming migration, listen on @var{port}.
+Prepare for incoming migration, listen on a given tcp port.
+
+@item -incoming unix:@var{socketpath}
+Prepare for incoming migration, listen on a given unix socket.
+
+@item -incoming fd:@var{fd}
+Accept incoming migration from a given filedescriptor.
+
+@item -incoming exec:@var{cmdline}
+Accept incoming migration as an output from specified external command.
 ETEXI
 
 DEF("nodefaults", 0, QEMU_OPTION_nodefaults, \
-- 
2.1.4


