Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynk7f-0006nb-If
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 04:47:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynk7a-0006e4-Ra
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 04:47:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynk7a-0004bU-0X
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 04:47:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52453)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ynk7V-0004ZO-PI; Thu, 30 Apr 2015 04:46:57 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C2B5142BC3;
	Thu, 30 Apr 2015 11:46:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E79CC960;
	Thu, 30 Apr 2015 08:08:59 +0300 (MSK)
Received: (nullmailer pid 4360 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:46 +0300
Message-Id: <56e7a6da4d31e61c025b79941c038d8fa1bd5883.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, "Emilio G. Cota" <cota@braap.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 33/42] qemu-char: remove unused list node from
	FDCharDriver
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
X-List-Received-Date: Thu, 30 Apr 2015 08:47:03 -0000

From: "Emilio G. Cota" <cota@braap.org>

Signed-off-by: Emilio G. Cota <cota@braap.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-char.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/qemu-char.c b/qemu-char.c
index a405d76..d0c1564 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -973,7 +973,6 @@ typedef struct FDCharDriver {
     CharDriverState *chr;
     GIOChannel *fd_in, *fd_out;
     int max_size;
-    QTAILQ_ENTRY(FDCharDriver) node;
 } FDCharDriver;
 
 /* Called with chr_write_lock held.  */
-- 
2.1.4


