Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RPhYN-00078J-7R
	for mharc-qemu-trivial@gnu.org; Sun, 13 Nov 2011 16:25:27 -0500
Received: from eggs.gnu.org ([140.186.70.92]:40195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RPhYL-00077f-7T
	for qemu-trivial@nongnu.org; Sun, 13 Nov 2011 16:25:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RPhYK-0001vI-5F
	for qemu-trivial@nongnu.org; Sun, 13 Nov 2011 16:25:25 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:57638)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RPhYK-0001uL-0g
	for qemu-trivial@nongnu.org; Sun, 13 Nov 2011 16:25:24 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	75C0E72825C8; Sun, 13 Nov 2011 22:25:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 33nL7b1PPqPy; Sun, 13 Nov 2011 22:24:32 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id EFCB672825EF; Sun, 13 Nov 2011 22:24:31 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@non-gnu.org
Date: Sun, 13 Nov 2011 22:24:26 +0100
Message-Id: <1321219467-12000-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Anthony Liguori <aliguori@us.ibm.com>
Subject: [Qemu-trivial] [PATCH 1.0 1/2] Fix spelling in documentation and
	comments (similiar -> similar)
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
X-List-Received-Date: Sun, 13 Nov 2011 21:25:26 -0000

This bug was detected by codespell.
In mips_mipssim.c a grammatical error was fixed, too.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 docs/libcacard.txt |    2 +-
 hw/mips_mipssim.c  |    2 +-
 qemu-doc.texi      |    4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/libcacard.txt b/docs/libcacard.txt
index 5dee6fa..ae010d2 100644
--- a/docs/libcacard.txt
+++ b/docs/libcacard.txt
@@ -399,7 +399,7 @@ functions:
       This function will automatically generate the appropriate new reader
       events and add the reader to the list.
 
-  To create a new card, the virtual card emulator will call a similiar
+  To create a new card, the virtual card emulator will call a similar
   function.
 
            VCard *vcard_new(VCardEmul *card_emul,
diff --git a/hw/mips_mipssim.c b/hw/mips_mipssim.c
index 7407158..b56cba6 100644
--- a/hw/mips_mipssim.c
+++ b/hw/mips_mipssim.c
@@ -1,7 +1,7 @@
 /*
  * QEMU/mipssim emulation
  *
- * Emulates a very simple machine model similiar to the one use by the
+ * Emulates a very simple machine model similar to the one used by the
  * proprietary MIPS emulator.
  * 
  * Copyright (c) 2007 Thiemo Seufer
diff --git a/qemu-doc.texi b/qemu-doc.texi
index 149e9bd..154b82d 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -1749,7 +1749,7 @@ PC Keyboard
 IDE controller
 @end itemize
 
-The mipssim pseudo board emulation provides an environment similiar
+The mipssim pseudo board emulation provides an environment similar
 to what the proprietary MIPS emulator uses for running Linux.
 It supports:
 
@@ -2141,7 +2141,7 @@ Xtensa emulator pseudo board "sim"
 Avnet LX60/LX110/LX200 board
 @end itemize
 
-The sim pseudo board emulation provides an environment similiar
+The sim pseudo board emulation provides an environment similar
 to one provided by the proprietary Tensilica ISS.
 It supports:
 
-- 
1.7.2.5


