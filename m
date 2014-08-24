Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLXyK-00048R-HR
	for mharc-qemu-trivial@gnu.org; Sun, 24 Aug 2014 09:36:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXyD-0003uE-3X
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:36:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XLXy8-0006ot-Ln
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 09:36:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:32988)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XLXxy-0006ka-PF; Sun, 24 Aug 2014 09:36:18 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E7F2F44A04;
	Sun, 24 Aug 2014 17:36:17 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6F5256B3;
	Sun, 24 Aug 2014 17:31:04 +0400 (MSK)
Received: (nullmailer pid 30087 invoked by uid 1000);
	Sun, 24 Aug 2014 13:31:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun, 24 Aug 2014 17:30:59 +0400
Message-Id: <1408887062-30022-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408887062-30022-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 08/11] po: Fix Makefile rules for in-tree
	builds without configuration
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
X-List-Received-Date: Sun, 24 Aug 2014 13:36:37 -0000

From: Stefan Weil <sw@weilnetz.de>

Adding 'update' to the phony targets fixes this error:

$ LANG=C make -C po update
make: Entering directory `/qemu/po'
  LINK  update
/qemu/po/de_DE.po: file not recognized: File format not recognized
collect2: error: ld returned 1 exit status
make: *** [update] Error 1
make: Leaving directory `/qemu/po'

Some other phony targets (build, install) were also added, and the
existing .PHONY statement was moved to a more prominent position at
the beginning of the Makefile.

The patch also fixes a 2nd bug. The default target should be 'all',
but instead 'modules' (from rules.mak) was the default. Fix this by
adding 'all' as a target before any include statement.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 po/Makefile |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/po/Makefile b/po/Makefile
index 669f865..1ab241a 100644
--- a/po/Makefile
+++ b/po/Makefile
@@ -4,6 +4,11 @@
 # Set SRC_PATH for in-tree builds without configuration.
 SRC_PATH=..
 
+# The default target must come before any include statements.
+all:
+
+.PHONY:	all build clean install update
+
 -include ../config-host.mak
 include $(SRC_PATH)/rules.mak
 
@@ -45,5 +50,3 @@ $(PO_PATH)/messages.po: $(SRC_PATH)/ui/gtk.c
 
 $(PO_PATH)/%.po: $(PO_PATH)/messages.po
 	$(call quiet-command, msgmerge -q $@ $< > $@.bak && mv $@.bak $@, "  GEN   $@")
-
-.PHONY: clean all
-- 
1.7.10.4


