Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTGBy-00025b-EC
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 15:46:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55102)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTGBu-0001wW-7d
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 15:46:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTGBt-0001eL-4H
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 15:46:50 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41218)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTGBd-0001af-3T; Wed, 04 Mar 2015 15:46:33 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5C77A40928;
	Wed,  4 Mar 2015 23:46:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2246293F;
	Wed,  4 Mar 2015 20:07:07 +0300 (MSK)
Received: (nullmailer pid 17497 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:24 +0300
Message-Id: <f13ce7a6f4892dd6920078f992eb79a425e290fb.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 07/47] qemu-options: fix/document -incoming
	options
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
X-List-Received-Date: Wed, 04 Mar 2015 20:46:51 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index ee4b223..303d13c 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3195,12 +3195,30 @@ Set TB size.
 ETEXI
 
 DEF("incoming", HAS_ARG, QEMU_OPTION_incoming, \
-    "-incoming p     prepare for incoming migration, listen on port p\n",
+    "-incoming tcp:[host]:port[,to=maxport][,ipv4][,ipv6]\n" \
+    "-incoming rdma:host:port[,ipv4][,ipv6]\n" \
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
+@item -incoming rdma:@var{host}:@var{port}[,ipv4][,ipv6]
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


