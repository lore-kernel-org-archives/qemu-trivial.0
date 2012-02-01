Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RsfGo-0002Cx-Ix
	for mharc-qemu-trivial@gnu.org; Wed, 01 Feb 2012 13:51:02 -0500
Received: from eggs.gnu.org ([140.186.70.92]:40949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RsfGj-0001sB-6B
	for qemu-trivial@nongnu.org; Wed, 01 Feb 2012 13:51:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RsfGf-0002aQ-CK
	for qemu-trivial@nongnu.org; Wed, 01 Feb 2012 13:50:57 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:46988)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RsfGY-0002ZW-CY; Wed, 01 Feb 2012 13:50:46 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RsfGU-0004kT-Pg; Wed, 01 Feb 2012 18:50:42 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  1 Feb 2012 18:50:42 +0000
Message-Id: <1328122242-18230-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] Makefile: Remove linux-headers/asm symlink
	on distclean
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
X-List-Received-Date: Wed, 01 Feb 2012 18:51:01 -0000

configure creates a linux-headers/asm symlink. Remove this when
doing a distclean.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index d172cbf..2560b59 100644
--- a/Makefile
+++ b/Makefile
@@ -233,6 +233,7 @@ distclean: clean
 	rm -f qemu-doc.log qemu-doc.pdf qemu-doc.pg qemu-doc.toc qemu-doc.tp
 	rm -f qemu-doc.vr
 	rm -f config.log
+	rm -f linux-headers/asm
 	rm -f qemu-tech.info qemu-tech.aux qemu-tech.cp qemu-tech.dvi qemu-tech.fn qemu-tech.info qemu-tech.ky qemu-tech.log qemu-tech.pdf qemu-tech.pg qemu-tech.toc qemu-tech.tp qemu-tech.vr
 	for d in $(TARGET_DIRS) $(QEMULIBS); do \
 	rm -rf $$d || exit 1 ; \
-- 
1.7.1


