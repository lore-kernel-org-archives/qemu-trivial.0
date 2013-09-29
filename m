Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQJ7o-0002ca-Iz
	for mharc-qemu-trivial@gnu.org; Sun, 29 Sep 2013 11:41:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VQJ7i-0002Vm-Iw
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 11:41:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VQJ7e-00028n-8e
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 11:41:30 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:38874
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VQJ7V-00026T-61; Sun, 29 Sep 2013 11:41:17 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 84C45180651; Sun, 29 Sep 2013 17:41:12 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sun, 29 Sep 2013 17:41:12 +0200
Message-Id: <1380469272-19230-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] migration: Fix compiler warning ('caps' may
	be used uninitialized)
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
X-List-Received-Date: Sun, 29 Sep 2013 15:41:35 -0000

The QEMU buildbot default_i386_debian_6_0 shows this warning:

  CC    migration.o
migration.c: In function 'qmp_query_migrate_capabilities':
migration.c:149: warning:
 'caps' may be used uninitialized in this function

While changing this code, I also replaced g_malloc0
by the type safe g_new0.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

Buildbot URL:
http://buildbot.b1-systems.de/qemu/builders/default_i386_debian_6_0/builds/775/steps/compile/logs/stdio

 migration.c |   12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/migration.c b/migration.c
index 200d404..8dcb6ce 100644
--- a/migration.c
+++ b/migration.c
@@ -145,17 +145,15 @@ uint64_t migrate_max_downtime(void)
 
 MigrationCapabilityStatusList *qmp_query_migrate_capabilities(Error **errp)
 {
-    MigrationCapabilityStatusList *head = NULL;
-    MigrationCapabilityStatusList *caps;
+    MigrationCapabilityStatusList *head =
+        g_new0(MigrationCapabilityStatusList, 1);
+    MigrationCapabilityStatusList *caps = head;
     MigrationState *s = migrate_get_current();
     int i;
 
     for (i = 0; i < MIGRATION_CAPABILITY_MAX; i++) {
-        if (head == NULL) {
-            head = g_malloc0(sizeof(*caps));
-            caps = head;
-        } else {
-            caps->next = g_malloc0(sizeof(*caps));
+        if (i > 0) {
+            caps->next = g_new0(MigrationCapabilityStatusList, i);
             caps = caps->next;
         }
         caps->value =
-- 
1.7.10.4


