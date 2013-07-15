Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uyju2-0005Fq-40
	for mharc-qemu-trivial@gnu.org; Mon, 15 Jul 2013 10:37:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <petar.jovanovic@rt-rk.com>) id 1UyifZ-0007ib-Pe
	for qemu-trivial@nongnu.org; Mon, 15 Jul 2013 09:18:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <petar.jovanovic@rt-rk.com>) id 1UyifY-0006Rv-7x
	for qemu-trivial@nongnu.org; Mon, 15 Jul 2013 09:18:25 -0400
Received: from mail.rt-rk.ftn.uns.ac.rs ([147.91.177.140]:32961
	helo=mail.rt-rk.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <petar.jovanovic@rt-rk.com>) id 1UyifX-0006OX-Pc
	for qemu-trivial@nongnu.org; Mon, 15 Jul 2013 09:18:24 -0400
Received: from mail.rt-rk.com (mail.localdomain [127.0.0.1])
	by mail.rt-rk.com (Postfix) with SMTP id DE5D725B474
	for <qemu-trivial@nongnu.org>; Mon, 15 Jul 2013 15:18:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
From: Petar Jovanovic <petar.jovanovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Mon, 15 Jul 2013 15:17:40 +0200
Message-Id: <1373894260-57259-1-git-send-email-petar.jovanovic@rt-rk.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 147.91.177.140
X-Mailman-Approved-At: Mon, 15 Jul 2013 10:37:24 -0400
Cc: qemu-trivial@nongnu.org, riku.voipio@linaro.org, petar.jovanovic@imgtec.com
Subject: [Qemu-trivial] [PATCH] linux-user: declare sys_futex to have 6
	arguments
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
X-List-Received-Date: Mon, 15 Jul 2013 13:18:28 -0000

From: Petar Jovanovic <petar.jovanovic@imgtec.com>

sys_futex has 6 arguments, and all of these need to be copied. Fix incorrect
declaration in the mips_syscall_args array.

This change fixes the cases where the 5th and 6th arguments have non-zero
value and have importance. An example is a Linux implementation of
pthread_cond_wait() function.

Signed-off-by: Petar Jovanovic <petar.jovanovic@imgtec.com>
---
 linux-user/main.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 7f15d3d..99c3b3f 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -2028,7 +2028,7 @@ static const uint8_t mips_syscall_args[] = {
 	MIPS_SYS(sys_fremovexattr, 2)	/* 4235 */
 	MIPS_SYS(sys_tkill	, 2)
 	MIPS_SYS(sys_sendfile64	, 5)
-	MIPS_SYS(sys_futex	, 2)
+	MIPS_SYS(sys_futex	, 6)
 	MIPS_SYS(sys_sched_setaffinity, 3)
 	MIPS_SYS(sys_sched_getaffinity, 3)	/* 4240 */
 	MIPS_SYS(sys_io_setup	, 2)
-- 
1.7.9.5


