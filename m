Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wee3u-0002Xh-5P
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 01:25:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wee3o-0002IW-3g
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:25:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wee3j-0005J1-5m
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:24:59 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wee3V-0005Fv-Gg; Mon, 28 Apr 2014 01:24:41 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E110C4303F;
	Mon, 28 Apr 2014 09:24:40 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7921E2BB;
	Mon, 28 Apr 2014 09:08:27 +0400 (MSK)
Received: (nullmailer pid 19164 invoked by uid 1000);
	Mon, 28 Apr 2014 05:08:26 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 28 Apr 2014 09:08:02 +0400
Message-Id: <1398661684-19059-17-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 16/18] po/Makefile: fix $SRC_PATH reference
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
X-List-Received-Date: Mon, 28 Apr 2014 05:25:04 -0000

The rule for messages.po appears to be slightly wrong.
Move the `cd' command within parens.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Tested-by: Stefan Weil <sw@weilnetz.de>
---
 po/Makefile |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/po/Makefile b/po/Makefile
index 705166e..669f865 100644
--- a/po/Makefile
+++ b/po/Makefile
@@ -37,8 +37,8 @@ install: $(OBJS)
 	$(call quiet-command, msgfmt -o $@ $<, "  GEN   $@")
 
 $(PO_PATH)/messages.po: $(SRC_PATH)/ui/gtk.c
-	$(call quiet-command, cd $(SRC_PATH) && \
-	 (xgettext -o - --from-code=UTF-8 --foreign-user \
+	$(call quiet-command, ( cd $(SRC_PATH) && \
+          xgettext -o - --from-code=UTF-8 --foreign-user \
 	    --package-name=QEMU --package-version=$(VERSION) \
 	    --msgid-bugs-address=qemu-devel@nongnu.org -k_ -C ui/gtk.c | \
 	  sed -e s/CHARSET/UTF-8/) >$@, "  GEN   $@")
-- 
1.7.10.4


