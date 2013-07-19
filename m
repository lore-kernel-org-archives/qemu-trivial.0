Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V06s1-0005U1-Mx
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jul 2013 05:21:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V06rt-0005OT-VR
	for qemu-trivial@nongnu.org; Fri, 19 Jul 2013 05:20:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V06rs-0005nK-9s
	for qemu-trivial@nongnu.org; Fri, 19 Jul 2013 05:20:53 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50324)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V06rl-0005kW-7H; Fri, 19 Jul 2013 05:20:45 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5F3BE41D84;
	Fri, 19 Jul 2013 13:11:17 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id C48971D8; Fri, 19 Jul 2013 13:11:15 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 19 Jul 2013 13:11:09 +0400
Message-Id: <1374225073-12959-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1374225073-12959-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1374225073-12959-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Petar Jovanovic <petar.jovanovic@imgtec.com>
Subject: [Qemu-trivial] [PULL trivial 1/5] linux-user: declare sys_futex to
	have 6 arguments
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
X-List-Received-Date: Fri, 19 Jul 2013 09:21:00 -0000

From: Petar Jovanovic <petar.jovanovic@imgtec.com>

sys_futex has 6 arguments, and all of these need to be copied. Fix incorrect
declaration in the mips_syscall_args array.

This change fixes the cases where the 5th and 6th arguments have non-zero
value and have importance. An example is a Linux implementation of
pthread_cond_wait() function.

Signed-off-by: Petar Jovanovic <petar.jovanovic@imgtec.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
1.7.10.4


