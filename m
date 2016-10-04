Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1brVvZ-0003z3-Vn
	for mharc-qemu-trivial@gnu.org; Tue, 04 Oct 2016 16:03:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1brVvY-0003yg-Gj
	for qemu-trivial@nongnu.org; Tue, 04 Oct 2016 16:03:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1brVvV-0003og-I0
	for qemu-trivial@nongnu.org; Tue, 04 Oct 2016 16:03:00 -0400
Received: from [72.143.111.78] (port=18454 helo=freebsd.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1brVvV-0003mS-Bb
	for qemu-trivial@nongnu.org; Tue, 04 Oct 2016 16:02:57 -0400
Received: from emaste (uid 1001) (envelope-from emaste@freebsd.org) id 9cef4
	by freebsd.org (DragonFly Mail Agent v0.10);
	Tue, 04 Oct 2016 16:02:54 -0400
From: Ed Maste <emaste@freebsd.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Ed Maste <emaste@freebsd.org>
Date: Tue,  4 Oct 2016 16:02:49 -0400
Message-Id: <1475611369-74971-1-git-send-email-emaste@freebsd.org>
X-Mailer: git-send-email 2.8.1
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 72.143.111.78
Subject: [Qemu-trivial] [PATCH] bsd-user: fix FreeBSD build after d148d90e
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
X-List-Received-Date: Tue, 04 Oct 2016 20:03:01 -0000

Signed-off-by: Ed Maste <emaste@freebsd.org>
---
 bsd-user/main.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index d803d3e..d8367bd 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -695,6 +695,16 @@ static void usage(void)
 
 THREAD CPUState *thread_cpu;
 
+bool qemu_cpu_is_self(CPUState *cpu)
+{
+    return thread_cpu == cpu;
+}
+
+void qemu_cpu_kick(CPUState *cpu)
+{
+    cpu_exit(cpu);
+}
+
 /* Assumes contents are already zeroed.  */
 void init_task_state(TaskState *ts)
 {
-- 
2.8.1


