Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VUcQr-00025R-P0
	for mharc-qemu-trivial@gnu.org; Fri, 11 Oct 2013 09:07:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41008)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <petar.jovanovic@rt-rk.com>) id 1VUcQk-0001wR-4t
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 09:07:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <petar.jovanovic@rt-rk.com>) id 1VUcQe-0001Gj-13
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 09:06:56 -0400
Received: from mail.rt-rk.ftn.uns.ac.rs ([147.91.177.140]:52782
	helo=mail.rt-rk.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <petar.jovanovic@rt-rk.com>) id 1VUcQd-0001F1-RM
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 09:06:51 -0400
Received: from mail.rt-rk.com (mail.localdomain [127.0.0.1])
	by mail.rt-rk.com (Postfix) with SMTP id BD15D25B6E7
	for <qemu-trivial@nongnu.org>; Fri, 11 Oct 2013 15:06:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
From: Petar Jovanovic <petar.jovanovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Fri, 11 Oct 2013 15:03:57 +0200
Message-Id: <1381496638-29127-1-git-send-email-petar.jovanovic@rt-rk.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 147.91.177.140
Cc: qemu-trivial@nongnu.org, riku.voipio@linaro.org, petar.jovanovic@imgtec.com
Subject: [Qemu-trivial] [PATCH] linux-user: pass correct parameter to
	do_shmctl()
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
X-List-Received-Date: Fri, 11 Oct 2013 13:07:03 -0000

From: Petar Jovanovic <petar.jovanovic@imgtec.com>

Fix shmctl issue by passing correct parameter buf to do_shmctl().

Signed-off-by: Petar Jovanovic <petar.jovanovic@imgtec.com>
---
 linux-user/syscall.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 4a14a43..1f6492e 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -3216,7 +3216,7 @@ static abi_long do_ipc(unsigned int call, int first,
 
 	/* IPC_* and SHM_* command values are the same on all linux platforms */
     case IPCOP_shmctl:
-        ret = do_shmctl(first, second, third);
+        ret = do_shmctl(first, second, ptr);
         break;
     default:
 	gemu_log("Unsupported ipc call: %d (version %d)\n", call, version);
-- 
1.7.9.5


