Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wb7Oo-00064q-H1
	for mharc-qemu-trivial@gnu.org; Fri, 18 Apr 2014 07:56:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Wb7Oh-0005hs-UH
	for qemu-trivial@nongnu.org; Fri, 18 Apr 2014 07:56:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1Wb7Oc-0002MJ-Uk
	for qemu-trivial@nongnu.org; Fri, 18 Apr 2014 07:55:59 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:52127)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1Wb7OI-0002IY-GR; Fri, 18 Apr 2014 07:55:34 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 6773617F97D; Fri, 18 Apr 2014 13:55:32 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 18 Apr 2014 13:55:31 +0200
Message-Id: <1397822131-24372-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org, qemu-stable@nongnu.org
Subject: [Qemu-trivial] [PATCH] po/Makefile: Fix source path for in-tree
	builds
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
X-List-Received-Date: Fri, 18 Apr 2014 11:56:04 -0000

Use an absolute value for SRC_PATH. This fixes a build problem:

$ LANG=C make -C po update
make: Entering directory `/qemu/po'
  GEN   ../po/messages.po
/bin/sh: 1: cannot create ../po/messages.po: Directory nonexistent
make: *** [../po/messages.po] Error 2
make: Leaving directory `/qemu/po'

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 po/Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/po/Makefile b/po/Makefile
index 705166e..576b172 100644
--- a/po/Makefile
+++ b/po/Makefile
@@ -2,7 +2,7 @@
 # process and also within the source tree to update the translation files.
 
 # Set SRC_PATH for in-tree builds without configuration.
-SRC_PATH=..
+SRC_PATH=$(shell cd .. && pwd)
 
 -include ../config-host.mak
 include $(SRC_PATH)/rules.mak
-- 
1.7.10.4


