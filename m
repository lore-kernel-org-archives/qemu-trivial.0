Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnRaz-00057y-Lp
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 06:51:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRas-0004vh-Sc
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:51:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRap-0004Ji-QI
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:50:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33052)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnRak-0004GJ-1S; Fri, 14 Jun 2013 06:50:50 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 47BA641663;
	Fri, 14 Jun 2013 14:50:49 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 285BA518; Fri, 14 Jun 2013 14:50:47 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 14 Jun 2013 14:50:20 +0400
Message-Id: <1371207042-17980-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 04/26] configure: Disable host-bsd USB on
	FreeBSD
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
X-List-Received-Date: Fri, 14 Jun 2013 10:51:04 -0000

From: Ed Maste <emaste@freebsd.org>

It hasn't built since FreeBSD 8.x, and is disabled by a patch in the
FreeBSD ports tree.  FreeBSD is migrating to QEMU's libusb support.

Signed-off-by: Ed Maste <emaste@freebsd.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index e197b91..a3f0b7a 100755
--- a/configure
+++ b/configure
@@ -553,7 +553,9 @@ esac
 
 if [ "$bsd" = "yes" ] ; then
   if [ "$darwin" != "yes" ] ; then
-    usb="bsd"
+    if [ "$targetos" != "FreeBSD" ]; then
+      usb="bsd"
+    fi
     bsd_user="yes"
   fi
 fi
-- 
1.7.10.4


