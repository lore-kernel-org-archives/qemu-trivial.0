Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VN4Bj-0005AE-Hw
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 13:08:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4Bd-0004yM-FZ
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:08:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4BZ-0003HF-7e
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:08:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39713)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VN4BJ-0003DU-As; Fri, 20 Sep 2013 13:07:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 23B7B419CB;
	Fri, 20 Sep 2013 21:07:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D2FF350F;
	Fri, 20 Sep 2013 20:58:21 +0400 (MSK)
Received: (nullmailer pid 32173 invoked by uid 1000);
	Fri, 20 Sep 2013 16:58:20 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Fri, 20 Sep 2013 20:58:05 +0400
Message-Id: <1379696296-32105-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 06/17] MAINTAINERS: Add missing entry to
	filelist for TCI target
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
X-List-Received-Date: Fri, 20 Sep 2013 17:08:14 -0000

From: Stefan Weil <sw@weilnetz.de>

tci.c is also a maintained part of the TCI implementation.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS |    1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d128ed0..4d634f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -842,6 +842,7 @@ TCI target
 M: Stefan Weil <sw@weilnetz.de>
 S: Maintained
 F: tcg/tci/
+F: tci.c
 
 Stable branches
 ---------------
-- 
1.7.10.4


