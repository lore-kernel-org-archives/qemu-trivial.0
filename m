Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c09VY-000334-Dc
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:55:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37027)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c09VW-00030e-4t
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:55:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c09VV-0003Md-EJ
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:55:50 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51536)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c09VQ-0003Gt-NP; Fri, 28 Oct 2016 11:55:44 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A6E5C43749;
	Fri, 28 Oct 2016 18:55:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id C223EB68;
	Fri, 28 Oct 2016 18:18:58 +0300 (MSK)
Received: (nullmailer pid 6077 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 28 Oct 2016 18:18:47 +0300
Message-Id: <25174055f428254427e7541139037eb9a34fc109.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 16/23] migration: Remove unneeded NULL check
 from migrate_fd_error()
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
X-List-Received-Date: Fri, 28 Oct 2016 15:55:51 -0000

From: Peter Maydell <peter.maydell@linaro.org>

All the callers of migrate_fd_error() pass a non-NULL
error parameter, and if any did pass NULL then we would
segfault in error_copy(), so remove the unnecessary
NULL check earlier in the function.
(Spotted by Coverity.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


