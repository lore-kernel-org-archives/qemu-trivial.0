Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SkH5a-0003TA-72
	for mharc-qemu-trivial@gnu.org; Thu, 28 Jun 2012 11:57:02 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SkH5S-00032y-9t
	for qemu-trivial@nongnu.org; Thu, 28 Jun 2012 11:56:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SkH5M-0005h5-7w
	for qemu-trivial@nongnu.org; Thu, 28 Jun 2012 11:56:53 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:34745)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SkH5F-0005ew-0z; Thu, 28 Jun 2012 11:56:41 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	6F8A072800C2; Thu, 28 Jun 2012 17:56:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id xCKQmUA1dlZg; Thu, 28 Jun 2012 17:56:37 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id EA8C272800C3; Thu, 28 Jun 2012 17:56:37 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org,
	qemu-trivial <qemu-trivial@nongnu.org>
Date: Thu, 28 Jun 2012 17:56:37 +0200
Message-Id: <1340898997-15820-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] configure: Remove help for
	--disable-vnc-thread, --enable-vnc-thread
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
X-List-Received-Date: Thu, 28 Jun 2012 15:57:00 -0000

Commit 2624bab836662d37f08336408a99d97652fc9c4d removed these
configure arguments. Now the help text for both is removed, too.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure |    2 --
 1 file changed, 2 deletions(-)

diff --git a/configure b/configure
index 1459c52..c3e09fc 100755
--- a/configure
+++ b/configure
@@ -1043,8 +1043,6 @@ echo "  --disable-vnc-jpeg       disable JPEG lossy compression for VNC server"
 echo "  --enable-vnc-jpeg        enable JPEG lossy compression for VNC server"
 echo "  --disable-vnc-png        disable PNG compression for VNC server (default)"
 echo "  --enable-vnc-png         enable PNG compression for VNC server"
-echo "  --disable-vnc-thread     disable threaded VNC server"
-echo "  --enable-vnc-thread      enable threaded VNC server"
 echo "  --disable-curses         disable curses output"
 echo "  --enable-curses          enable curses output"
 echo "  --disable-curl           disable curl connectivity"
-- 
1.7.10


