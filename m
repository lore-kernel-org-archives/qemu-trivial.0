Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNiUG-0000zN-Vd
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2011 05:01:00 -0500
Received: from eggs.gnu.org ([140.186.70.92]:60097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RNiUB-0000kJ-Cd
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 05:00:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RNiU5-0002yC-PN
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 05:00:55 -0500
Received: from oxygen.pond.sub.org ([78.46.104.156]:33740)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1RNiTv-0002vR-Dm; Tue, 08 Nov 2011 05:00:39 -0500
Received: from blackfin.pond.sub.org (p5B32AA7E.dip.t-dialin.net
	[91.50.170.126])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 9EE2A9FFC5;
	Tue,  8 Nov 2011 11:00:38 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 228B46006D; Tue,  8 Nov 2011 11:00:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  8 Nov 2011 11:00:38 +0100
Message-Id: <1320746438-31756-1-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] qdev: Fix crash on -device '?=x'
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
X-List-Received-Date: Tue, 08 Nov 2011 10:00:59 -0000

Spotted by Coverity.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/qdev.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/qdev.c b/hw/qdev.c
index 50976dd..106407f 100644
--- a/hw/qdev.c
+++ b/hw/qdev.c
@@ -186,7 +186,7 @@ int qdev_device_help(QemuOpts *opts)
         return 1;
     }
 
-    if (!qemu_opt_get(opts, "?")) {
+    if (!driver || !qemu_opt_get(opts, "?")) {
         return 0;
     }
 
-- 
1.7.6.4


