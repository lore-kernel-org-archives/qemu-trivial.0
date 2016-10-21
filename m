Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bxdpM-0004et-76
	for mharc-qemu-trivial@gnu.org; Fri, 21 Oct 2016 13:41:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bxdpJ-0004cq-CD
	for qemu-trivial@nongnu.org; Fri, 21 Oct 2016 13:41:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bxdpI-0001Kl-PI
	for qemu-trivial@nongnu.org; Fri, 21 Oct 2016 13:41:53 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47395)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1bxdpG-0001HS-7Z; Fri, 21 Oct 2016 13:41:50 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bxdpC-0007ZD-H1; Fri, 21 Oct 2016 18:41:46 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org, Juan Quintela <quintela@redhat.com>,
	Amit Shah <amit.shah@redhat.com>
Date: Fri, 21 Oct 2016 18:41:45 +0100
Message-Id: <1477071705-30634-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH] migration: Remove unneeded NULL check from
 migrate_fd_error()
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
X-List-Received-Date: Fri, 21 Oct 2016 17:41:54 -0000

All the callers of migrate_fd_error() pass a non-NULL
error parameter, and if any did pass NULL then we would
segfault in error_copy(), so remove the unnecessary
NULL check earlier in the function.
(Spotted by Coverity.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This seems better than making migrate_fd_error() allow
a NULL pointer, which doesn't seem like a useful thing.
I'm guessing a bit though, because there's no doc comment
for this function in the header file...
---
 migration/migration.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index 4d417b7..d216b93 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -922,7 +922,7 @@ static void migrate_fd_cleanup(void *opaque)
 
 void migrate_fd_error(MigrationState *s, const Error *error)
 {
-    trace_migrate_fd_error(error ? error_get_pretty(error) : "");
+    trace_migrate_fd_error(error_get_pretty(error));
     assert(s->to_dst_file == NULL);
     migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
                       MIGRATION_STATUS_FAILED);
-- 
2.7.4


