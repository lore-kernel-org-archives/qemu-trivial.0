Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9SqT-0001J7-IJ
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 03:51:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9SqQ-0001F5-Ri
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:51:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9SqP-0005Y2-1y
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:51:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35420)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9SqJ-0005Ws-Iu; Sun, 05 Jun 2016 03:51:31 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6892640912;
	Sun,  5 Jun 2016 10:51:26 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id D7A12B34;
	Sun,  5 Jun 2016 10:43:39 +0300 (MSK)
Received: (nullmailer pid 1128 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:42:56 +0300
Message-Id: <eb2a83a495257acf2a90a98114187cdd75c26e63.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 19/52] monitor: Typo fix
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
X-List-Received-Date: Sun, 05 Jun 2016 07:51:39 -0000

From: Eric Blake <eblake@redhat.com>

s/partinal/partial/

Signed-off-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 monitor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/monitor.c b/monitor.c
index 404d594..a27e115 100644
--- a/monitor.c
+++ b/monitor.c
@@ -320,7 +320,7 @@ static void monitor_flush_locked(Monitor *mon)
             return;
         }
         if (rc > 0) {
-            /* partinal write */
+            /* partial write */
             QString *tmp = qstring_from_str(buf + rc);
             QDECREF(mon->outbuf);
             mon->outbuf = tmp;
-- 
2.1.4


