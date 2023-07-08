Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qI0GI-0006TI-2I
	for mharc-qemu-trivial@gnu.org; Sat, 08 Jul 2023 01:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qI0G7-0006IA-R3; Sat, 08 Jul 2023 01:13:29 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qI0G5-0001mO-TG; Sat, 08 Jul 2023 01:13:27 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 97E2D12688;
 Sat,  8 Jul 2023 08:13:09 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id C8A80139D6;
 Sat,  8 Jul 2023 08:13:05 +0300 (MSK)
Received: (nullmailer pid 3230003 invoked by uid 1000);
 Sat, 08 Jul 2023 05:13:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laszlo Ersek <lersek@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Peter Xu <peterx@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 09/10] migration: unexport migrate_fd_error()
Date: Sat,  8 Jul 2023 08:12:49 +0300
Message-Id: <aaf26bd382b84c6d34390d092ff24bc8fa575f78.1688793073.git.mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1688793073.git.mjt@tls.msk.ru>
References: <cover.1688793073.git.mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 08 Jul 2023 05:13:31 -0000

From: Laszlo Ersek <lersek@redhat.com>

The only migrate_fd_error() call sites are in "migration/migration.c",
which is also where we define migrate_fd_error(). Make the function
static, and remove its declaration from "migration/migration.h".

Cc: Juan Quintela <quintela@redhat.com> (maintainer:Migration)
Cc: Leonardo Bras <leobras@redhat.com> (reviewer:Migration)
Cc: Peter Xu <peterx@redhat.com> (reviewer:Migration)
Cc: qemu-trivial@nongnu.org
Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=2018404
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 migration/migration.c | 2 +-
 migration/migration.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index a60a5acee5..91bba630a8 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1220,7 +1220,7 @@ static void migrate_error_free(MigrationState *s)
     }
 }
 
-void migrate_fd_error(MigrationState *s, const Error *error)
+static void migrate_fd_error(MigrationState *s, const Error *error)
 {
     trace_migrate_fd_error(error_get_pretty(error));
     assert(s->to_dst_file == NULL);
diff --git a/migration/migration.h b/migration/migration.h
index a80b22b703..b7c8b67542 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -466,7 +466,6 @@ bool  migration_has_all_channels(void);
 uint64_t migrate_max_downtime(void);
 
 void migrate_set_error(MigrationState *s, const Error *error);
-void migrate_fd_error(MigrationState *s, const Error *error);
 
 void migrate_fd_connect(MigrationState *s, Error *error_in);
 
-- 
2.39.2


