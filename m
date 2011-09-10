Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R2Uno-0004do-4E
	for mharc-qemu-trivial@gnu.org; Sat, 10 Sep 2011 17:09:28 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1R2Unk-0004Qz-00
	for qemu-trivial@nongnu.org; Sat, 10 Sep 2011 17:09:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1R2Uni-0001nn-PE
	for qemu-trivial@nongnu.org; Sat, 10 Sep 2011 17:09:23 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:48147)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1R2Ung-0001nV-C5; Sat, 10 Sep 2011 17:09:20 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	DEEE27282F85; Sat, 10 Sep 2011 23:09:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 11SVFNWjaguc; Sat, 10 Sep 2011 23:09:16 +0200 (CEST)
Received: from flocke.weilnetz.de (p54ADA89C.dip.t-dialin.net [84.173.168.156])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	D5B817282F84; Sat, 10 Sep 2011 23:09:16 +0200 (CEST)
Received: from stefan by flocke.weilnetz.de with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1R2Unc-0003oL-CB; Sat, 10 Sep 2011 23:09:16 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Sat, 10 Sep 2011 23:09:14 +0200
Message-Id: <1315688954-14621-1-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH] qemu-doc: Remove URL which is no longer
	available
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
X-List-Received-Date: Sat, 10 Sep 2011 21:09:25 -0000

http://perso.magic.fr/l_indien/ was removed several years ago.
There is obviously no mirror or any other replacement for it.

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 qemu-doc.texi |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 31199f6..a1e86c1 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -1493,8 +1493,7 @@ PREP Non Volatile RAM
 PC compatible keyboard and mouse.
 @end itemize
 
-QEMU uses the Open Hack'Ware Open Firmware Compatible BIOS available at
-@url{http://perso.magic.fr/l_indien/OpenHackWare/index.htm}.
+QEMU uses the Open Hack'Ware Open Firmware Compatible BIOS.
 
 Since version 0.9.1, QEMU uses OpenBIOS @url{http://www.openbios.org/}
 for the g3beige and mac99 PowerMac machines. OpenBIOS is a free (GPL
@@ -1528,9 +1527,6 @@ These variables are not used by Open Hack'Ware.
 @c man end
 
 
-More information is available at
-@url{http://perso.magic.fr/l_indien/qemu-ppc/}.
-
 @node Sparc32 System emulator
 @section Sparc32 System emulator
 @cindex system emulation (Sparc32)
-- 
1.7.2.5


