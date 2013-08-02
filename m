Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V5GEZ-0001D8-J8
	for mharc-qemu-trivial@gnu.org; Fri, 02 Aug 2013 10:21:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V5GES-0000y0-RR
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 10:21:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V5GEN-0007If-TF
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 10:21:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34134)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V5GED-0007Fu-Oz; Fri, 02 Aug 2013 10:21:13 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2DDCD40422;
	Fri,  2 Aug 2013 18:21:13 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1E93D4A2;
	Fri,  2 Aug 2013 18:21:13 +0400 (MSK)
Received: (nullmailer pid 7222 invoked by uid 1000);
	Fri, 02 Aug 2013 14:21:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri,  2 Aug 2013 18:20:45 +0400
Message-Id: <1375453248-7178-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1375453248-7178-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1375453248-7178-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 1/4] qemu-ga: build it even if !system
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
X-List-Received-Date: Fri, 02 Aug 2013 14:21:34 -0000

Move qemu-ga build check out of if softmmu.. into its own section.
We want to build qemu-ga for _guest_ even if system build isn't
done.  It is controlled separately using --enable-guest-agent.
Additionally, give error message if guest agent is requested but
not supported.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |   11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/configure b/configure
index f0761ea..293f167 100755
--- a/configure
+++ b/configure
@@ -231,7 +231,7 @@ libusb=""
 usb_redir=""
 glx=""
 zlib="yes"
-guest_agent="yes"
+guest_agent=""
 want_tools="yes"
 libiscsi=""
 coroutine=""
@@ -3444,10 +3444,15 @@ if test "$softmmu" = yes ; then
       virtfs=no
     fi
   fi
+fi
+if [ "$guest_agent" != "no" ]; then
   if [ "$linux" = "yes" -o "$bsd" = "yes" -o "$solaris" = "yes" ] ; then
-    if [ "$guest_agent" = "yes" ]; then
       tools="qemu-ga\$(EXESUF) $tools"
-    fi
+      guest_agent=yes
+  elif [ "$guest_agent" != yes ]; then
+      guest_agent=no
+  else
+      error_exit "Guest agent is not supported on this platform"
   fi
 fi
 
-- 
1.7.10.4


