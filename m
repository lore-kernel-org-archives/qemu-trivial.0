Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1THfD6-0006FZ-IO
	for mharc-qemu-trivial@gnu.org; Fri, 28 Sep 2012 14:22:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1THfD4-0006BV-Jb
	for qemu-trivial@nongnu.org; Fri, 28 Sep 2012 14:22:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1THfD3-0004Ft-Ps
	for qemu-trivial@nongnu.org; Fri, 28 Sep 2012 14:22:46 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:45795)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1THdAN-0000eO-Mm; Fri, 28 Sep 2012 12:11:51 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	29CC8728003C; Fri, 28 Sep 2012 18:11:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id aOG-K66hTWLD; Fri, 28 Sep 2012 18:11:49 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id BF390728003D; Fri, 28 Sep 2012 18:11:49 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 28 Sep 2012 18:11:49 +0200
Message-Id: <1348848709-14118-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] vnc: Fix spelling (hellmen -> hellman) in
	comment
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
X-List-Received-Date: Fri, 28 Sep 2012 18:22:47 -0000

The algorithm was named after Martin E. Hellman.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 ui/vnc-tls.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/vnc-tls.c b/ui/vnc-tls.c
index 3aaa939..a7f7d07 100644
--- a/ui/vnc-tls.c
+++ b/ui/vnc-tls.c
@@ -49,7 +49,7 @@ static int vnc_tls_initialize(void)
     if (gnutls_global_init () < 0)
         return 0;
 
-    /* XXX ought to re-generate diffie-hellmen params periodically */
+    /* XXX ought to re-generate diffie-hellman params periodically */
     if (gnutls_dh_params_init (&dh_params) < 0)
         return 0;
     if (gnutls_dh_params_generate2 (dh_params, DH_BITS) < 0)
-- 
1.7.10


