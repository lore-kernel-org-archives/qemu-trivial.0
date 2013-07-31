Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V4TgH-0001Qt-ER
	for mharc-qemu-trivial@gnu.org; Wed, 31 Jul 2013 06:30:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51205)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V4TgB-0001QT-2F
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 06:30:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V4TaB-0006hP-9G
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 06:24:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38048)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V4TZz-0006Ie-Q3; Wed, 31 Jul 2013 06:24:28 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A42CC43565;
	Wed, 31 Jul 2013 14:24:16 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 889FE4C3;
	Wed, 31 Jul 2013 14:24:16 +0400 (MSK)
Received: (nullmailer pid 22242 invoked by uid 1000);
	Wed, 31 Jul 2013 10:24:16 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed, 31 Jul 2013 14:24:15 +0400
Message-Id: <1375266255-22207-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH] qemu-ga: build it even if !system
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
X-List-Received-Date: Wed, 31 Jul 2013 10:30:56 -0000

Move qemu-ga build check out of if softmmu.. into if tools section.
We want to build qemu-ga for _guest_ even if system build isn't
done.  It is controlled separately using --enable-guest-agent.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/configure b/configure
index f0761ea..0105fd2 100755
--- a/configure
+++ b/configure
@@ -3430,6 +3430,9 @@ if test "$want_tools" = "yes" ; then
   tools="qemu-img\$(EXESUF) qemu-io\$(EXESUF) $tools"
   if [ "$linux" = "yes" -o "$bsd" = "yes" -o "$solaris" = "yes" ] ; then
     tools="qemu-nbd\$(EXESUF) $tools"
+    if [ "$guest_agent" = "yes" ]; then
+      tools="qemu-ga\$(EXESUF) $tools"
+    fi
   fi
 fi
 if test "$softmmu" = yes ; then
@@ -3444,11 +3447,6 @@ if test "$softmmu" = yes ; then
       virtfs=no
     fi
   fi
-  if [ "$linux" = "yes" -o "$bsd" = "yes" -o "$solaris" = "yes" ] ; then
-    if [ "$guest_agent" = "yes" ]; then
-      tools="qemu-ga\$(EXESUF) $tools"
-    fi
-  fi
 fi
 
 # Mac OS X ships with a broken assembler
-- 
1.7.10.4


