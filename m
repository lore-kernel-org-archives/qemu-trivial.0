Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UXAcs-0001pA-8c
	for mharc-qemu-trivial@gnu.org; Tue, 30 Apr 2013 09:29:46 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1UXAco-0001o1-At
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2013 09:29:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1UXAcm-00074Z-1s
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2013 09:29:42 -0400
Received: from [216.171.111.232] (port=11708 helo=freebsd.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1UXAcl-00074G-R1
	for qemu-trivial@nongnu.org; Tue, 30 Apr 2013 09:29:39 -0400
Received: from emaste (uid 1001) (envelope-from emaste@freebsd.org) id 9cc4e
	by freebsd.org (DragonFly Mail Agent 1);
	Tue, 30 Apr 2013 09:29:39 -0400
From: Ed Maste <emaste@freebsd.org>
To: qemu-devel@nongnu.org
Date: Tue, 30 Apr 2013 09:29:32 -0400
Message-Id: <1367328572-40615-1-git-send-email-emaste@freebsd.org>
X-Mailer: git-send-email 1.7.11.5
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.171.111.232
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH v2] bsd-user: OS-agnostic 64-bit SYSCTL types
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
X-List-Received-Date: Tue, 30 Apr 2013 13:29:44 -0000

Use existence of type as #ifdef condition rather than FreeBSD-specific
version check, as suggested by Patrick Welche.

Also handle the signed (CTLTYPE_S64) case identically to the unsigned
(CTLTYPE_U64) case, per later patches in the FreeBSD ports tree
(emulators/qemu-devel/files/patch-z-arm-bsd-user-001).

Signed-off-by: Ed Maste <emaste@freebsd.org>
---
v2: Delete stray : at end of #ifdef conditional 

 bsd-user/syscall.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 69e3466..a4d1583 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -211,10 +211,11 @@ static int sysctl_oldcvt(void *holdp, size_t holdlen, uint32_t kind)
         *(uint64_t *)holdp = tswap64(*(unsigned long *)holdp);
         break;
 #endif
-#if !defined(__FreeBSD_version) || __FreeBSD_version < 900031
-    case CTLTYPE_QUAD:
-#else
+#ifdef CTLTYPE_U64
+    case CTLTYPE_S64:
     case CTLTYPE_U64:
+#else
+    case CTLTYPE_QUAD:
 #endif
         *(uint64_t *)holdp = tswap64(*(uint64_t *)holdp);
         break;
-- 
1.7.11.5


