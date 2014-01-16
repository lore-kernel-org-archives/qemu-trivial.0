Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W3r0D-0004Yb-IJ
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jan 2014 12:45:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3r07-0004MR-Hm
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:45:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3r03-0001tY-2o
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:45:07 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57659)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W3qzt-0001iG-Kk; Thu, 16 Jan 2014 12:44:53 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 392E7415C3;
	Thu, 16 Jan 2014 21:35:24 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 1804A633;
	Thu, 16 Jan 2014 21:35:24 +0400 (MSK)
Received: (nullmailer pid 16387 invoked by uid 1000);
	Thu, 16 Jan 2014 17:35:23 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Thu, 16 Jan 2014 21:35:09 +0400
Message-Id: <1389893719-16336-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Namhyung Kim <namhyung@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 01/11] docs: Fix typo in QMP WAKEUP example
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
X-List-Received-Date: Thu, 16 Jan 2014 17:45:12 -0000

From: Namhyung Kim <namhyung@gmail.com>

Cc: qemu-trivial@nongnu.org
Signed-off-by: Namhyung Kim <namhyung@gmail.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/qmp/qmp-events.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/qmp/qmp-events.txt b/docs/qmp/qmp-events.txt
index 6b87e97..a378c87 100644
--- a/docs/qmp/qmp-events.txt
+++ b/docs/qmp/qmp-events.txt
@@ -479,7 +479,7 @@ Data: None.
 
 Example:
 
-{ "event": "WATCHDOG",
+{ "event": "WAKEUP",
      "timestamp": { "seconds": 1344522075, "microseconds": 745528 } }
 
 WATCHDOG
-- 
1.7.10.4


