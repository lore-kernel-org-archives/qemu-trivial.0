Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIJmD-0000fr-OD
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 11:50:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37219)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJm7-0000bH-Mm
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:50:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJm3-0000dF-FX
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:50:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38912)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XIJlu-0000Zm-2L; Fri, 15 Aug 2014 11:50:30 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 14F3043081;
	Fri, 15 Aug 2014 19:50:28 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E08256F1;
	Fri, 15 Aug 2014 19:15:15 +0400 (MSK)
Received: (nullmailer pid 17933 invoked by uid 1000);
	Fri, 15 Aug 2014 15:15:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 19:15:06 +0400
Message-Id: <1408115711-17836-16-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Hu Tao <hutao@cn.fujitsu.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 15/20] vl: free err
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
X-List-Received-Date: Fri, 15 Aug 2014 15:50:48 -0000

From: Hu Tao <hutao@cn.fujitsu.com>

err is not freed after use, thus causing memory leak. This patch fixes
it.

Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
Cc: qemu-trivial@nongnu.org
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/vl.c b/vl.c
index 9783133..b796c67 100644
--- a/vl.c
+++ b/vl.c
@@ -2918,6 +2918,7 @@ out:
     g_free(dummy);
     if (err) {
         qerror_report_err(err);
+        error_free(err);
         return -1;
     }
     return 0;
-- 
1.7.10.4


