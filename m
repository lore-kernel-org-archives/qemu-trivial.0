Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VN4LI-0007ZM-03
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 13:18:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4LA-0007K1-FF
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:18:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4L6-0006Cc-16
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:18:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60357)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VN4Kz-00068W-KO; Fri, 20 Sep 2013 13:17:50 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F105D419D0;
	Fri, 20 Sep 2013 21:17:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 814A4519;
	Fri, 20 Sep 2013 20:58:22 +0400 (MSK)
Received: (nullmailer pid 32199 invoked by uid 1000);
	Fri, 20 Sep 2013 16:58:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Fri, 20 Sep 2013 20:58:16 +0400
Message-Id: <1379696296-32105-18-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 17/17] tests/.gitignore: ignore test-throttle
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
X-List-Received-Date: Fri, 20 Sep 2013 17:18:06 -0000

From: Fam Zheng <famz@redhat.com>

Signed-off-by: Fam Zheng <famz@redhat.com>
Reviewed-by: Benoit Canet <benoit@irqsave.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/.gitignore |    1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index d11cc22..ae5280e 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -5,6 +5,7 @@ check-qjson
 check-qlist
 check-qstring
 test-aio
+test-throttle
 test-cutils
 test-hbitmap
 test-iov
-- 
1.7.10.4


