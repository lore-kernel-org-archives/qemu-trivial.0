Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk6HH-0000x0-3s
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 05:14:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk6HE-0000tN-Fb
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 05:14:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk6HD-0003mU-8L
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 05:14:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44735)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk6H7-0003iR-ME; Wed, 14 Sep 2016 05:14:37 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DBEAF41857;
	Wed, 14 Sep 2016 12:14:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 8CC70B00;
	Wed, 14 Sep 2016 10:58:59 +0300 (MSK)
Received: (nullmailer pid 17333 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Reda Sallahi <fullmanet@gmail.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:37 +0300
Message-Id: <525e244d9ccb0da5ab2135a57fced32e80ab5aaa.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 11/27] sh4: fix broken link to documentation
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Sep 2016 09:14:45 -0000

From: Reda Sallahi <fullmanet@gmail.com>

The page that was previously linked in the source code and the README file is
no longer available so it now returns a 404 error message.

This puts a previous snapshot from archive.org instead.

Signed-off-by: Reda Sallahi <fullmanet@gmail.com>
Acked-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/sh4/shix.c         | 2 +-
 target-sh4/README.sh4 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sh4/shix.c b/hw/sh4/shix.c
index ccc9e75..14d4007 100644
--- a/hw/sh4/shix.c
+++ b/hw/sh4/shix.c
@@ -23,7 +23,7 @@
  */
 /*
    Shix 2.0 board by Alexis Polti, described at
-   http://perso.enst.fr/~polti/realisations/shix20/
+   https://web.archive.org/web/20070917001736/perso.enst.fr/~polti/realisations/shix20
 
    More information in target-sh4/README.sh4
 */
diff --git a/target-sh4/README.sh4 b/target-sh4/README.sh4
index e578830..ece0464 100644
--- a/target-sh4/README.sh4
+++ b/target-sh4/README.sh4
@@ -25,7 +25,7 @@ Goals
 
 The primary model being worked on is the soft MMU target to be able to
 emulate the Shix 2.0 board by Alexis Polti, described at
-http://perso.enst.fr/~polti/realisations/shix20/
+https://web.archive.org/web/20070917001736/http://perso.enst.fr/~polti/realisations/shix20/
 
 Ultimately, qemu will be coupled with a system C or a verilog
 simulator to simulate the whole board functionalities.
-- 
2.1.4


