Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TPerJ-0004hE-3W
	for mharc-qemu-trivial@gnu.org; Sat, 20 Oct 2012 15:37:21 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53021)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TPerF-0004YK-UZ
	for qemu-trivial@nongnu.org; Sat, 20 Oct 2012 15:37:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TPerF-0005Dt-3H
	for qemu-trivial@nongnu.org; Sat, 20 Oct 2012 15:37:17 -0400
Received: from 38.0.169.217.in-addr.arpa ([217.169.0.38]:55886
	helo=mnementh.archaic.org.uk) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1TPerC-0005DK-QT; Sat, 20 Oct 2012 15:37:15 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1TPer2-0007L2-Jt; Sat, 20 Oct 2012 20:37:04 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 20 Oct 2012 20:37:04 +0100
Message-Id: <1350761824-28185-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 217.169.0.38
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] configure: Remove stray debug output
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
X-List-Received-Date: Sat, 20 Oct 2012 19:37:19 -0000

Rather than printing a message saying we're silently falling
back to gthread coroutines when running on MacOS, actually
do it silently.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I guess this is a self-falsifying echo :-)

 configure | 2 --
 1 file changed, 2 deletions(-)

diff --git a/configure b/configure
index 9f33c7d..e07baf3 100755
--- a/configure
+++ b/configure
@@ -2900,8 +2900,6 @@ EOF
     else
 	coroutine_backend=gthread
     fi
-  else
-    echo "Silently falling back into gthread backend under darwin"
   fi
 elif test "$coroutine" = "gthread" ; then
   coroutine_backend=gthread
-- 
1.7.11.4


