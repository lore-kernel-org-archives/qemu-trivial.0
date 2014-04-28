Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WeduG-0000HP-Ig
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 01:15:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wedu9-0008TV-Je
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:15:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wedu4-0002N2-N0
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:15:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45491)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wedtp-0002Kq-BH; Mon, 28 Apr 2014 01:14:41 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 92C354303D;
	Mon, 28 Apr 2014 09:14:40 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0A62A2B4;
	Mon, 28 Apr 2014 09:08:26 +0400 (MSK)
Received: (nullmailer pid 19139 invoked by uid 1000);
	Mon, 28 Apr 2014 05:08:25 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 28 Apr 2014 09:07:52 +0400
Message-Id: <1398661684-19059-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Cole Robinson <crobinso@redhat.com>
Subject: [Qemu-trivial] [PULL 06/18] tests/.gitignore: Ignore test-rfifolock
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
X-List-Received-Date: Mon, 28 Apr 2014 05:15:06 -0000

From: Cole Robinson <crobinso@redhat.com>

Signed-off-by: Cole Robinson <crobinso@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/.gitignore |    1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index 3aa1e95..c71c110 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -23,6 +23,7 @@ test-qmp-input-strict
 test-qmp-input-visitor
 test-qmp-marshal.c
 test-qmp-output-visitor
+test-rfifolock
 test-string-input-visitor
 test-string-output-visitor
 test-thread-pool
-- 
1.7.10.4


