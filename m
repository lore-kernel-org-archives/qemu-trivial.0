Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UVQyN-0000ce-42
	for mharc-qemu-trivial@gnu.org; Thu, 25 Apr 2013 14:32:47 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1UVQyL-0000cR-DG
	for qemu-trivial@nongnu.org; Thu, 25 Apr 2013 14:32:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1UVQyK-0005hU-5V
	for qemu-trivial@nongnu.org; Thu, 25 Apr 2013 14:32:45 -0400
Received: from [216.171.111.232] (port=32869 helo=freebsd.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1UVQSN-0003XZ-Cv
	for qemu-trivial@nongnu.org; Thu, 25 Apr 2013 13:59:43 -0400
Received: from emaste (uid 1001) (envelope-from emaste@freebsd.org) id 9dbee
	by freebsd.org (DragonFly Mail Agent 1);
	Thu, 25 Apr 2013 13:59:42 -0400
From: Ed Maste <emaste@freebsd.org>
To: qemu-trivial@nongnu.org
Date: Thu, 25 Apr 2013 13:59:41 -0400
Message-Id: <1366912781-11766-1-git-send-email-emaste@freebsd.org>
X-Mailer: git-send-email 1.7.11.5
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.171.111.232
Subject: [Qemu-trivial] [PATCH] Track change in FreeBSD SYSCTL(9) types
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
X-List-Received-Date: Thu, 25 Apr 2013 18:32:46 -0000

Originally from Garrett Cooper in FreeBSD PR ports/155558
http://www.freebsd.org/cgi/query-pr.cgi?pr=155558

Signed-off-by: Ed Maste <emaste@freebsd.org>
---
 bsd-user/syscall.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 18b43f1..69e3466 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -211,7 +211,11 @@ static int sysctl_oldcvt(void *holdp, size_t holdlen, uint32_t kind)
         *(uint64_t *)holdp = tswap64(*(unsigned long *)holdp);
         break;
 #endif
+#if !defined(__FreeBSD_version) || __FreeBSD_version < 900031
     case CTLTYPE_QUAD:
+#else
+    case CTLTYPE_U64:
+#endif
         *(uint64_t *)holdp = tswap64(*(uint64_t *)holdp);
         break;
     case CTLTYPE_STRING:
-- 
1.7.11.5


