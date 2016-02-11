Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTqLO-0006Ly-SR
	for mharc-qemu-trivial@gnu.org; Thu, 11 Feb 2016 07:27:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqLL-0006Gc-Th
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:27:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqLL-00006w-4a
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:27:31 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57974)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aTqLG-00005Q-7M; Thu, 11 Feb 2016 07:27:26 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 40C7641457;
	Thu, 11 Feb 2016 15:19:06 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 512A7A8A;
	Thu, 11 Feb 2016 15:19:05 +0300 (MSK)
Received: (nullmailer pid 11183 invoked by uid 1000);
	Thu, 11 Feb 2016 12:19:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Feb 2016 15:18:55 +0300
Message-Id: <5b648de0ee6f705dc5792a97fd69e761bba9f1cd.1455192968.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
References: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Wei Yang <richard.weiyang@gmail.com>
Subject: [Qemu-trivial] [PULL 06/14] rdma: remove check on time_spent when
	calculating mbs
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
X-List-Received-Date: Thu, 11 Feb 2016 12:27:33 -0000

From: Wei Yang <richard.weiyang@gmail.com>

Within the if statement, time_spent is assured to be non-zero.

This patch just removes the check on time_spent when calculating mbs.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 migration/migration.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 82604d2..a64cfcd 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1691,8 +1691,8 @@ static void *migration_thread(void *opaque)
             double bandwidth = (double)transferred_bytes / time_spent;
             max_size = bandwidth * migrate_max_downtime() / 1000000;
 
-            s->mbps = time_spent ? (((double) transferred_bytes * 8.0) /
-                    ((double) time_spent / 1000.0)) / 1000.0 / 1000.0 : -1;
+            s->mbps = (((double) transferred_bytes * 8.0) /
+                    ((double) time_spent / 1000.0)) / 1000.0 / 1000.0;
 
             trace_migrate_transferred(transferred_bytes, time_spent,
                                       bandwidth, max_size);
-- 
2.1.4


