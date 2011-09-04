Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R0ClQ-0007c1-19
	for mharc-qemu-trivial@gnu.org; Sun, 04 Sep 2011 09:29:32 -0400
Received: from eggs.gnu.org ([140.186.70.92]:54223)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1R0ClO-0007VW-7C
	for qemu-trivial@nongnu.org; Sun, 04 Sep 2011 09:29:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1R0ClN-0000iC-B2
	for qemu-trivial@nongnu.org; Sun, 04 Sep 2011 09:29:30 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:45294)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1R0ClL-0000hk-45; Sun, 04 Sep 2011 09:29:27 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	95FD37283065; Sun,  4 Sep 2011 15:29:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id aMyTnvPzbIlz; Sun,  4 Sep 2011 15:29:26 +0200 (CEST)
Received: from flocke.weilnetz.de (p5086ED72.dip.t-dialin.net [80.134.237.114])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	030FD7283053; Sun,  4 Sep 2011 15:29:26 +0200 (CEST)
Received: from stefan by flocke.weilnetz.de with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1R0ClR-0002zC-7w; Sun, 04 Sep 2011 15:29:33 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Sun,  4 Sep 2011 15:29:32 +0200
Message-Id: <1315142972-11450-1-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>,
	Anthony Liguori <aliguori@us.ibm.com>
Subject: [Qemu-trivial] [PATCH] configure: Remove relicts from
	--enable-io-thread
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
X-List-Received-Date: Sun, 04 Sep 2011 13:29:31 -0000

Commit 12d4536f7d911b6d87a766ad7300482ea663cea2 removed
configure option --enable-io-thread.

Remove help message which is now no longer valid.

Cc: Anthony Liguori <aliguori@us.ibm.com>
Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 configure |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/configure b/configure
index e242ece..048ab4b 100755
--- a/configure
+++ b/configure
@@ -1025,7 +1025,6 @@ echo "  --disable-linux-aio      disable Linux AIO support"
 echo "  --enable-linux-aio       enable Linux AIO support"
 echo "  --disable-attr           disables attr and xattr support"
 echo "  --enable-attr            enable attr and xattr support"
-echo "  --enable-io-thread       enable IO thread"
 echo "  --disable-blobs          disable installing provided firmware blobs"
 echo "  --enable-docs            enable documentation build"
 echo "  --disable-docs           disable documentation build"
-- 
1.7.2.5


