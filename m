Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RaJEk-0003AL-92
	for mharc-qemu-trivial@gnu.org; Mon, 12 Dec 2011 22:41:02 -0500
Received: from eggs.gnu.org ([140.186.70.92]:37195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yamahata@valinux.co.jp>) id 1RaJEg-0002y4-UP
	for qemu-trivial@nongnu.org; Mon, 12 Dec 2011 22:40:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yamahata@valinux.co.jp>) id 1RaJEg-00066i-1p
	for qemu-trivial@nongnu.org; Mon, 12 Dec 2011 22:40:58 -0500
Received: from mail.valinux.co.jp ([210.128.90.3]:50012)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yamahata@valinux.co.jp>)
	id 1RaJEd-00061D-IV; Mon, 12 Dec 2011 22:40:55 -0500
Received: from ps.local.valinux.co.jp (vagw.valinux.co.jp [210.128.90.14])
	by mail.valinux.co.jp (Postfix) with SMTP id 4D52628241;
	Tue, 13 Dec 2011 12:40:51 +0900 (JST)
Received: (nullmailer pid 6408 invoked by uid 1000);
	Tue, 13 Dec 2011 03:40:51 -0000
From: Isaku Yamahata <yamahata@valinux.co.jp>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Tue, 13 Dec 2011 12:40:51 +0900
Message-Id: <7649482739064866ddfb50275b1fcfa43547b782.1323747574.git.yamahata@valinux.co.jp>
X-Mailer: git-send-email 1.7.1.1
X-Virus-Scanned: clamav-milter 0.95.2 at va-mail.local.valinux.co.jp
X-Virus-Status: Clean
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 210.128.90.3
Cc: yamahata@valinux.co.jp, Luiz Capitulino <lcapitulino@redhat.com>
Subject: [Qemu-trivial] [PATCH] migration.h: remove incoming_expected
	declarations
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
X-List-Received-Date: Tue, 13 Dec 2011 03:41:00 -0000

The variable is deleted by 1bcef683bf840a928d633755031ac572d5fdb851
So remove its declaration.

Cc: Luiz Capitulino <lcapitulino@redhat.com>
Signed-off-by: Isaku Yamahata <yamahata@valinux.co.jp>
---
 migration.h |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/migration.h b/migration.h
index 999d60f..372b066 100644
--- a/migration.h
+++ b/migration.h
@@ -81,8 +81,6 @@ uint64_t ram_bytes_total(void);
 int ram_save_live(Monitor *mon, QEMUFile *f, int stage, void *opaque);
 int ram_load(QEMUFile *f, void *opaque, int version_id);
 
-extern int incoming_expected;
-
 /**
  * @migrate_add_blocker - prevent migration from proceeding
  *
-- 
1.7.1.1


