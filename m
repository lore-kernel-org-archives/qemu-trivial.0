Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VSkoG-0006tL-9x
	for mharc-qemu-trivial@gnu.org; Sun, 06 Oct 2013 05:39:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSko9-0006fS-VZ
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:39:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSko5-0003Ob-JX
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:39:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57207)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VSknv-0003LO-MW; Sun, 06 Oct 2013 05:39:11 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1D38640D03;
	Sun,  6 Oct 2013 13:39:10 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B7D5451D;
	Sun,  6 Oct 2013 13:33:03 +0400 (MSK)
Received: (nullmailer pid 25830 invoked by uid 1000);
	Sun, 06 Oct 2013 09:33:02 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sun,  6 Oct 2013 13:32:59 +0400
Message-Id: <1381051979-25742-15-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 14/14] migration: Fix compiler warning ('caps'
	may be used uninitialized)
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
X-List-Received-Date: Sun, 06 Oct 2013 09:39:30 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
---
 migration.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/migration.c b/migration.c
index b4f8462..2b1ab20 100644
--- a/migration.c
+++ b/migration.c
@@ -150,6 +150,7 @@ MigrationCapabilityStatusList *qmp_query_migrate_capabilities(Error **errp)
     MigrationState *s = migrate_get_current();
     int i;
 
+    caps = NULL; /* silence compiler warning */
     for (i = 0; i < MIGRATION_CAPABILITY_MAX; i++) {
         if (head == NULL) {
             head = g_malloc0(sizeof(*caps));
-- 
1.7.10.4


