Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V1fxp-0005Kt-B4
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jul 2013 13:01:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <petar.jovanovic@rt-rk.com>) id 1V1fxg-0005AX-2M
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 13:01:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <petar.jovanovic@rt-rk.com>) id 1V1fxL-0004dY-0D
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 13:01:19 -0400
Received: from mail.rt-rk.ftn.uns.ac.rs ([147.91.177.140]:43911
	helo=mail.rt-rk.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <petar.jovanovic@rt-rk.com>) id 1V1fxK-0004d0-O5
	for qemu-trivial@nongnu.org; Tue, 23 Jul 2013 13:00:58 -0400
Received: from mail.rt-rk.com (mail.localdomain [127.0.0.1])
	by mail.rt-rk.com (Postfix) with SMTP id 9B5EF25B4F0
	for <qemu-trivial@nongnu.org>; Tue, 23 Jul 2013 19:00:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at rt-rk.com
From: Petar Jovanovic <petar.jovanovic@rt-rk.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jul 2013 19:00:10 +0200
Message-Id: <1374598810-78021-1-git-send-email-petar.jovanovic@rt-rk.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 147.91.177.140
Cc: qemu-trivial@nongnu.org, riku.voipio@linaro.org, petar.jovanovic@imgtec.com
Subject: [Qemu-trivial] [PATCH] linux-user: correct argument number for
	sys_mremap and sys_splice
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
X-List-Received-Date: Tue, 23 Jul 2013 17:01:27 -0000

From: Petar Jovanovic <petar.jovanovic@imgtec.com>

sys_mremap missed 5th argument (new_address), which caused examples that
remap to a specific address to fail.
sys_splice missed 5th and 6th argument which caused different examples to
fail.
This change has an effect on MIPS target only.

Signed-off-by: Petar Jovanovic <petar.jovanovic@imgtec.com>
---
 linux-user/main.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/main.c b/linux-user/main.c
index 99c3b3f..1c20229 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -1957,7 +1957,7 @@ static const uint8_t mips_syscall_args[] = {
 	MIPS_SYS(sys_sched_get_priority_min, 1)
 	MIPS_SYS(sys_sched_rr_get_interval, 2)	/* 4165 */
 	MIPS_SYS(sys_nanosleep,	2)
-	MIPS_SYS(sys_mremap	, 4)
+	MIPS_SYS(sys_mremap	, 5)
 	MIPS_SYS(sys_accept	, 3)
 	MIPS_SYS(sys_bind	, 3)
 	MIPS_SYS(sys_connect	, 3)	/* 4170 */
@@ -2094,7 +2094,7 @@ static const uint8_t mips_syscall_args[] = {
 	MIPS_SYS(sys_pselect6, 6)
 	MIPS_SYS(sys_ppoll, 5)
 	MIPS_SYS(sys_unshare, 1)
-	MIPS_SYS(sys_splice, 4)
+	MIPS_SYS(sys_splice, 6)
 	MIPS_SYS(sys_sync_file_range, 7) /* 4305 */
 	MIPS_SYS(sys_tee, 4)
 	MIPS_SYS(sys_vmsplice, 4)
-- 
1.7.9.5


