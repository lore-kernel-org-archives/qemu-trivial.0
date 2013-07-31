Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V4Y8T-0007kT-Hd
	for mharc-qemu-trivial@gnu.org; Wed, 31 Jul 2013 11:16:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V4Y8N-0007cd-Pi
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 11:16:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V4Y8I-0004Rr-Ua
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 11:16:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59291)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V4Xyy-00012Q-Om; Wed, 31 Jul 2013 11:06:32 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 49169435B3;
	Wed, 31 Jul 2013 19:06:31 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2D09E4C3;
	Wed, 31 Jul 2013 19:06:31 +0400 (MSK)
Received: (nullmailer pid 24910 invoked by uid 1000);
	Wed, 31 Jul 2013 15:06:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed, 31 Jul 2013 19:06:30 +0400
Message-Id: <1375283190-24875-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Laszlo Ersek <lersek@redhat.com>
Subject: [Qemu-trivial] [PATCH v2] qemu-ga: build it even if !system
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
X-List-Received-Date: Wed, 31 Jul 2013 15:16:20 -0000

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
index f0761ea..50ea000 100755
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
@@ -3444,11 +3444,16 @@ if test "$softmmu" = yes ; then
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
+  else
+      error_exit "Guest agent is not supported on this platform"
   fi
+else
+  guest_agent=no
 fi
 
 # Mac OS X ships with a broken assembler
-- 
1.7.10.4


