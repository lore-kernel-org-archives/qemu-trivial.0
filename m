Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uka5d-0007aQ-O3
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jun 2013 09:18:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1Uka5a-0007WU-Om
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2013 09:18:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1Uka5W-00057C-4L
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2013 09:18:50 -0400
Received: from [216.171.111.232] (port=59505 helo=freebsd.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1Uka5V-00056y-OX
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2013 09:18:46 -0400
Received: from emaste (uid 1001) (envelope-from emaste@freebsd.org) id 9d053
	by freebsd.org (DragonFly Mail Agent 1);
	Thu, 06 Jun 2013 09:18:45 -0400
From: Ed Maste <emaste@freebsd.org>
To: qemu-devel@nongnu.org
Date: Thu,  6 Jun 2013 09:18:44 -0400
Message-Id: <1370524724-39136-1-git-send-email-emaste@freebsd.org>
X-Mailer: git-send-email 1.7.11.5
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.171.111.232
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] configure: Disable host-bsd USB on FreeBSD
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
X-List-Received-Date: Thu, 06 Jun 2013 13:18:52 -0000

It hasn't built since FreeBSD 8.x, and is disabled by a patch in the
FreeBSD ports tree.  FreeBSD is migrating to QEMU's libusb support.

Signed-off-by: Ed Maste <emaste@freebsd.org>
---
 configure | 4 +++-
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
1.7.11.5


