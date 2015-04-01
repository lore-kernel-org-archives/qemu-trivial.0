Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YdNct-00006Z-Tb
	for mharc-qemu-trivial@gnu.org; Wed, 01 Apr 2015 14:44:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1YdNcr-0008Ur-Ru
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 14:44:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1YdNcl-0001Hv-GJ
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 14:44:29 -0400
Received: from [98.143.106.101] (port=40844 helo=freebsd.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1YdNcl-0001Hr-Al
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 14:44:23 -0400
Received: from emaste (uid 1001) (envelope-from emaste@freebsd.org) id 9dc86
	by freebsd.org (DragonFly Mail Agent 1);
	Wed, 01 Apr 2015 14:00:45 -0400
From: Ed Maste <emaste@freebsd.org>
To: qemu-devel@nongnu.org
Date: Wed,  1 Apr 2015 14:00:44 -0400
Message-Id: <1427911244-22565-1-git-send-email-emaste@freebsd.org>
X-Mailer: git-send-email 2.2.2
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 98.143.106.101
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] qtest: Add assertion that required
	environment variable is set
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
X-List-Received-Date: Wed, 01 Apr 2015 18:44:30 -0000

Signed-off-by: Ed Maste <emaste@freebsd.org>
---
 tests/libqtest.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/libqtest.c b/tests/libqtest.c
index 12d65bd..54550a8 100644
--- a/tests/libqtest.c
+++ b/tests/libqtest.c
@@ -453,6 +453,7 @@ void qtest_qmp_discard_response(QTestState *s, const char *fmt, ...)
 const char *qtest_get_arch(void)
 {
     const char *qemu = getenv("QTEST_QEMU_BINARY");
+    g_assert(qemu != NULL);
     const char *end = strrchr(qemu, '/');
 
     return end + strlen("/qemu-system-");
-- 
2.2.2


