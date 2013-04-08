Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UPGoq-0000f9-Sz
	for mharc-qemu-trivial@gnu.org; Mon, 08 Apr 2013 14:29:28 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <petar.jovanovic@rt-rk.com>) id 1UPGoj-0000be-9G
	for qemu-trivial@nongnu.org; Mon, 08 Apr 2013 14:29:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <petar.jovanovic@rt-rk.com>) id 1UPGod-0003cQ-CI
	for qemu-trivial@nongnu.org; Mon, 08 Apr 2013 14:29:21 -0400
Received: from mail.rt-rk.ftn.uns.ac.rs ([147.91.177.140]:33232
	helo=mail.rt-rk.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <petar.jovanovic@rt-rk.com>) id 1UPGod-0003WZ-5R
	for qemu-trivial@nongnu.org; Mon, 08 Apr 2013 14:29:15 -0400
Received: from mail.rt-rk.com (mail.localdomain [127.0.0.1])
	by mail.rt-rk.com (Postfix) with SMTP id D3A0425BC5A
	for <qemu-trivial@nongnu.org>; Mon,  8 Apr 2013 20:29:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
From: Petar Jovanovic <petar.jovanovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon,  8 Apr 2013 20:26:10 +0200
Message-Id: <1365445570-112217-1-git-send-email-petar.jovanovic@rt-rk.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 147.91.177.140
Cc: qemu-trivial@nongnu.org, riku.voipio@linaro.org, petar.jovanovic@imgtec.com,
	Petar Jovanovic <petar.jovanovic@rt-rk.com>
Subject: [Qemu-trivial] [PATCH] linux-user: pass correct host flags to
	eventfd2 call
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
X-List-Received-Date: Mon, 08 Apr 2013 18:29:25 -0000

This change makes conversion of TARGET_O_NONBLOCK and TARGET_O_CLOEXEC flags
to host flags before calling eventfd for TARGET_NR_eventfd2.

Signed-off-by: Petar Jovanovic <petar.jovanovic@imgtec.com>
---
 linux-user/syscall.c |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index ee82a2d..1f07621 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8823,8 +8823,17 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
 #endif
 #if defined(TARGET_NR_eventfd2)
     case TARGET_NR_eventfd2:
-        ret = get_errno(eventfd(arg1, arg2));
+    {
+        int host_flags = arg2 & (~(TARGET_O_NONBLOCK | TARGET_O_CLOEXEC));
+        if (arg2 & TARGET_O_NONBLOCK) {
+            host_flags |= O_NONBLOCK;
+        }
+        if (arg2 & TARGET_O_CLOEXEC) {
+            host_flags |= O_CLOEXEC;
+        }
+        ret = get_errno(eventfd(arg1, host_flags));
         break;
+    }
 #endif
 #endif /* CONFIG_EVENTFD  */
 #if defined(CONFIG_FALLOCATE) && defined(TARGET_NR_fallocate)
-- 
1.7.9.5


