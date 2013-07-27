Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V2z0Z-00022P-E3
	for mharc-qemu-trivial@gnu.org; Sat, 27 Jul 2013 03:33:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40303)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2z0T-0001pa-LJ
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:33:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V2z0S-0005fL-8J
	for qemu-trivial@nongnu.org; Sat, 27 Jul 2013 03:33:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44632)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V2z0M-0005ds-PF; Sat, 27 Jul 2013 03:33:30 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id BA94242FC1;
	Sat, 27 Jul 2013 11:33:29 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 40D4B202883; Sat, 27 Jul 2013 11:33:28 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: anthony@codemonkey.ws
Date: Sat, 27 Jul 2013 11:33:22 +0400
Message-Id: <1374910406-15273-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Petar Jovanovic <petar.jovanovic@imgtec.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL trivial 07/11] linux-user: correct argument
	number for sys_mremap and sys_splice
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
X-List-Received-Date: Sat, 27 Jul 2013 07:33:39 -0000

From: Petar Jovanovic <petar.jovanovic@imgtec.com>

sys_mremap missed 5th argument (new_address), which caused examples that
remap to a specific address to fail.
sys_splice missed 5th and 6th argument which caused different examples to
fail.
This change has an effect on MIPS target only.

Signed-off-by: Petar Jovanovic <petar.jovanovic@imgtec.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/main.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 5309117..03859bc 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -1920,7 +1920,7 @@ static const uint8_t mips_syscall_args[] = {
 	MIPS_SYS(sys_sched_get_priority_min, 1)
 	MIPS_SYS(sys_sched_rr_get_interval, 2)	/* 4165 */
 	MIPS_SYS(sys_nanosleep,	2)
-	MIPS_SYS(sys_mremap	, 4)
+	MIPS_SYS(sys_mremap	, 5)
 	MIPS_SYS(sys_accept	, 3)
 	MIPS_SYS(sys_bind	, 3)
 	MIPS_SYS(sys_connect	, 3)	/* 4170 */
@@ -2057,7 +2057,7 @@ static const uint8_t mips_syscall_args[] = {
 	MIPS_SYS(sys_pselect6, 6)
 	MIPS_SYS(sys_ppoll, 5)
 	MIPS_SYS(sys_unshare, 1)
-	MIPS_SYS(sys_splice, 4)
+	MIPS_SYS(sys_splice, 6)
 	MIPS_SYS(sys_sync_file_range, 7) /* 4305 */
 	MIPS_SYS(sys_tee, 4)
 	MIPS_SYS(sys_vmsplice, 4)
-- 
1.7.10.4


