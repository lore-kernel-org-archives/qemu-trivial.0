Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKvyh-0003DD-1Q
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 15:57:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKvyZ-0002wt-5t
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 15:57:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKvyV-0000pH-0E
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 15:57:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50269)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VKvyG-0000iv-94; Sat, 14 Sep 2013 15:57:32 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id CE93F411BE;
	Sat, 14 Sep 2013 23:57:30 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 30AF9505;
	Sat, 14 Sep 2013 23:47:44 +0400 (MSK)
Received: (nullmailer pid 7701 invoked by uid 1000);
	Sat, 14 Sep 2013 19:47:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sat, 14 Sep 2013 23:47:32 +0400
Message-Id: <1379188061-7634-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379188061-7634-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379188061-7634-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 06/15] MAINTAINERS: Add missing entry to
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
X-List-Received-Date: Sat, 14 Sep 2013 19:57:55 -0000

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


