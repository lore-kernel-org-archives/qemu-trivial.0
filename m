Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UeMHi-0001pT-0n
	for mharc-qemu-trivial@gnu.org; Mon, 20 May 2013 05:21:38 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lilei@linux.vnet.ibm.com>) id 1UeMHa-0001mY-Cn
	for qemu-trivial@nongnu.org; Mon, 20 May 2013 05:21:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lilei@linux.vnet.ibm.com>) id 1UeMHU-0003Bo-2K
	for qemu-trivial@nongnu.org; Mon, 20 May 2013 05:21:30 -0400
Received: from e23smtp02.au.ibm.com ([202.81.31.144]:56478)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lilei@linux.vnet.ibm.com>) id 1UeMHT-0003Al-EV
	for qemu-trivial@nongnu.org; Mon, 20 May 2013 05:21:23 -0400
Received: from /spool/local
	by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <lilei@linux.vnet.ibm.com>;
	Mon, 20 May 2013 19:12:43 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
	by e23smtp02.au.ibm.com (202.81.31.208) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 20 May 2013 19:12:40 +1000
Received: from d23relay03.au.ibm.com (d23relay03.au.ibm.com [9.190.235.21])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id 1F5B92BB0050;
	Mon, 20 May 2013 19:21:15 +1000 (EST)
Received: from d23av04.au.ibm.com (d23av04.au.ibm.com [9.190.235.139])
	by d23relay03.au.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r4K9L6Jh15138910; Mon, 20 May 2013 19:21:07 +1000
Received: from d23av04.au.ibm.com (loopback [127.0.0.1])
	by d23av04.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r4K9LDKG003215; Mon, 20 May 2013 19:21:13 +1000
Received: from localhost.cn.ibm.com ([9.115.122.245])
	by d23av04.au.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r4K9LBCZ003154; Mon, 20 May 2013 19:21:12 +1000
From: Lei Li <lilei@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Mon, 20 May 2013 17:20:50 +0800
Message-Id: <1369041650-22056-1-git-send-email-lilei@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.7.6
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13052009-5490-0000-0000-0000037F9058
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 202.81.31.144
Cc: qemu-trivial@nongnu.org, Lei Li <lilei@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH] linux-user: Fix typo in comment
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
X-List-Received-Date: Mon, 20 May 2013 09:21:37 -0000

Signed-off-by: Lei Li <lilei@linux.vnet.ibm.com>
---
 linux-user/syscall.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 30e93bc..72c6866 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8236,7 +8236,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
 #ifdef TARGET_NR_madvise
     case TARGET_NR_madvise:
         /* A straight passthrough may not be safe because qemu sometimes
-           turns private flie-backed mappings into anonymous mappings.
+           turns private file-backed mappings into anonymous mappings.
            This will break MADV_DONTNEED.
            This is a hint, so ignoring and returning success is ok.  */
         ret = get_errno(0);
-- 
1.7.7.6


