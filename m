Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z6zpK-0003ss-Op
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 07:23:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zpG-0003jz-3c
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:23:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z6zpF-00056C-1U
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 07:23:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56943)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z6zoz-00052x-AW; Mon, 22 Jun 2015 07:23:25 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 692F941E47;
	Mon, 22 Jun 2015 14:23:24 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 582CAA6A;
	Mon, 22 Jun 2015 14:16:32 +0300 (MSK)
Received: (nullmailer pid 9276 invoked by uid 1000);
	Mon, 22 Jun 2015 11:16:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Jun 2015 14:16:25 +0300
Message-Id: <1c6391fb03e7086bd60707a6291a3a3ff5ec7bf7.1434971627.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
References: <cover.1434971627.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Fam Zheng <famz@redhat.com>
Subject: [Qemu-trivial] [PULL 18/21] Makefile: Add "make ctags"
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
X-List-Received-Date: Mon, 22 Jun 2015 11:23:43 -0000

From: Fam Zheng <famz@redhat.com>

This generates ctags file

Signed-off-by: Fam Zheng <famz@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 Makefile | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 8d36076..e0343f3 100644
--- a/Makefile
+++ b/Makefile
@@ -6,7 +6,7 @@ BUILD_DIR=$(CURDIR)
 # Before including a proper config-host.mak, assume we are in the source tree
 SRC_PATH=.
 
-UNCHECKED_GOALS := %clean TAGS cscope
+UNCHECKED_GOALS := %clean TAGS cscope ctags
 
 # All following code might depend on configuration variables
 ifneq ($(wildcard config-host.mak),)
@@ -432,6 +432,11 @@ endif
 test speed: all
 	$(MAKE) -C tests/tcg $@
 
+.PHONY: ctags
+ctags:
+	rm -f $@
+	find "$(SRC_PATH)" -name '*.[hc]' -exec ctags --append {} +
+
 .PHONY: TAGS
 TAGS:
 	rm -f $@
-- 
2.1.4


