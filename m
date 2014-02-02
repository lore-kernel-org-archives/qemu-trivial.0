Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W9zr1-000521-Bw
	for mharc-qemu-trivial@gnu.org; Sun, 02 Feb 2014 11:25:07 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9zpp-0002pQ-Fq
	for qemu-trivial@nongnu.org; Sun, 02 Feb 2014 11:25:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9zla-00084h-J1
	for qemu-trivial@nongnu.org; Sun, 02 Feb 2014 11:20:49 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:55346)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W9zkb-0007wY-FZ; Sun, 02 Feb 2014 11:18:29 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6554D4022A;
	Sun,  2 Feb 2014 20:18:28 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 90BF8632;
	Sun,  2 Feb 2014 20:12:46 +0400 (MSK)
Received: (nullmailer pid 1654 invoked by uid 1000);
	Sun, 02 Feb 2014 16:12:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sun,  2 Feb 2014 20:12:43 +0400
Message-Id: <1391357563-1592-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1391357563-1592-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1391357563-1592-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 7/7] tests/.gitignore: Ignore
	tests/check-qom-interface
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
X-List-Received-Date: Sun, 02 Feb 2014 16:25:05 -0000

From: Fam Zheng <famz@redhat.com>

Signed-off-by: Fam Zheng <famz@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/.gitignore |    1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index 1aed224..9ba9d96 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -4,6 +4,7 @@ check-qint
 check-qjson
 check-qlist
 check-qstring
+check-qom-interface
 test-aio
 test-bitops
 test-throttle
-- 
1.7.10.4


