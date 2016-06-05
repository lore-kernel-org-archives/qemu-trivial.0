Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9Sqh-0001WE-4l
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 03:51:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60318)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9Sqb-0001Qr-VG
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:51:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9Sqa-0005ad-4s
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:51:48 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39306)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9SqJ-0005Wt-JG; Sun, 05 Jun 2016 03:51:31 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 544C340910;
	Sun,  5 Jun 2016 10:51:26 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id D2556AE1;
	Sun,  5 Jun 2016 10:43:33 +0300 (MSK)
Received: (nullmailer pid 1103 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Jan Vesely <jano.vesely@gmail.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:42:44 +0300
Message-Id: <3ba1e5ae7d9a531c70b0ddd70d8e2a7394bdf84a.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 07/52] po/Makefile: call rm -f directly
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
X-List-Received-Date: Sun, 05 Jun 2016 07:51:53 -0000

From: Jan Vesely <jano.vesely@gmail.com>

Default variables are undefined in rules.mak and this is what the rest
of the build system uses.
Fixes make clean in ./po/

Signed-off-by: Jan Vesely <jano.vesely@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 po/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/po/Makefile b/po/Makefile
index b271f79..7bab09d 100644
--- a/po/Makefile
+++ b/po/Makefile
@@ -32,7 +32,7 @@ update: $(SRCS)
 build: $(OBJS)
 
 clean:
-	$(RM) $(OBJS)
+	rm -f $(OBJS)
 
 install: $(OBJS)
 	for obj in $(OBJS); do \
-- 
2.1.4


