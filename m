Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9isN-0003xS-J2
	for mharc-qemu-trivial@gnu.org; Thu, 06 Sep 2012 16:40:35 -0400
Received: from eggs.gnu.org ([208.118.235.92]:51111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T9isM-0003xA-75
	for qemu-trivial@nongnu.org; Thu, 06 Sep 2012 16:40:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T9isL-0003fm-B7
	for qemu-trivial@nongnu.org; Thu, 06 Sep 2012 16:40:34 -0400
Received: from smtp02.smtpout.orange.fr ([80.12.242.124]:42948
	helo=smtp.smtpout.orange.fr) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T9isL-0003eH-4i
	for qemu-trivial@nongnu.org; Thu, 06 Sep 2012 16:40:33 -0400
Received: from treguer.bzh.lan ([90.32.35.254]) by mwinf5d56 with ME
	id vwgW1j0075UzRF603wgWbM; Thu, 06 Sep 2012 22:40:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: qemu-devel@nongnu.org
Date: Thu,  6 Sep 2012 22:40:30 +0200
Message-Id: <1346964030-17633-1-git-send-email-yann.morin.1998@free.fr>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 80.12.242.124
Cc: qemu-trivial@nongnu.org, "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [Qemu-trivial] [PATCH] configure: fix seccomp check
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
X-List-Received-Date: Thu, 06 Sep 2012 20:40:35 -0000

Currently, if libseccomp is missing but the user explicitly requested
seccomp support using --enable-seccomp, configure silently ignores the
situation and disables seccomp support.

This is unlike all other tests that explicitly fail in such situation.

Fix that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 configure |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configure b/configure
index c5888fa..23abb46 100755
--- a/configure
+++ b/configure
@@ -1429,10 +1429,10 @@ if test "$seccomp" != "no" ; then
         LIBS=`$pkg_config --libs libseccomp`
 	seccomp="yes"
     else
-	seccomp="no"
 	if test "$seccomp" = "yes"; then
             feature_not_found "libseccomp"
 	fi
+	seccomp="no"
     fi
 fi
 ##########################################
-- 
1.7.2.5


