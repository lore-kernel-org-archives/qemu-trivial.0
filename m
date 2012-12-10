Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ThxMA-0000HS-JW
	for mharc-qemu-trivial@gnu.org; Mon, 10 Dec 2012 02:00:50 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>) id 1ThxM7-0000H4-Gk
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 02:00:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>) id 1ThxM3-0005Pi-Ds
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 02:00:47 -0500
Received: from furnace.wzff.de ([2a01:4f8:150:63e2::9]:22415)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>)
	id 1ThxM3-0005PQ-54; Mon, 10 Dec 2012 02:00:43 -0500
Received: from xdsl-188-155-204-150.adslplus.ch ([188.155.204.150]
	helo=localhost.localdomain)
	by furnace.wzff.de with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80.1 (FreeBSD)) (envelope-from <maillist-qemu@barfooze.de>)
	id 1ThxLz-000KiM-02; Mon, 10 Dec 2012 08:00:40 +0100
From: John Spencer <maillist-qemu@barfooze.de>
To: qemu-trivial@nongnu.org
Date: Mon, 10 Dec 2012 07:59:44 +0100
Message-Id: <1355122786-29243-2-git-send-email-maillist-qemu@barfooze.de>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1355122786-29243-1-git-send-email-maillist-qemu@barfooze.de>
References: <1355122786-29243-1-git-send-email-maillist-qemu@barfooze.de>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:150:63e2::9
Cc: qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH 2/4] fix build error on ARM due to wrong
	glibc check
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
X-List-Received-Date: Mon, 10 Dec 2012 07:00:49 -0000

the test for glibc < 2 "succeeds" wrongly for any non-glibc C library,
and breaks the build on musl libc.
we must first test if __GLIBC__ is defined at all, before using it
unconditionally.

Signed-off-by: John Spencer <maillist-qemu@barfooze.de>

---
 user-exec.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/user-exec.c b/user-exec.c
index ef9b172..cccc145 100644
--- a/user-exec.c
+++ b/user-exec.c
@@ -442,7 +442,7 @@ int cpu_signal_handler(int host_signum, void *pinfo,
     unsigned long pc;
     int is_write;
 
-#if (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
+#if defined(__GLIBC__) && (__GLIBC__ < 2 || (__GLIBC__ == 2 && __GLIBC_MINOR__ <= 3))
     pc = uc->uc_mcontext.gregs[R15];
 #else
     pc = uc->uc_mcontext.arm_pc;
-- 
1.7.3.4


