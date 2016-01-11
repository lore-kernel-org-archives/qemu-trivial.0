Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIYbK-0004Dc-44
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 04:17:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIYbF-000448-EG
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 04:17:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIYbE-0000Ib-Fn
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 04:17:17 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35524)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIYb8-0000GI-No; Mon, 11 Jan 2016 04:17:10 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5BF1440403;
	Mon, 11 Jan 2016 12:17:08 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id E38E7A9A;
	Mon, 11 Jan 2016 11:42:00 +0300 (MSK)
Received: (nullmailer pid 28769 invoked by uid 1000);
	Mon, 11 Jan 2016 08:41:59 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 11:41:41 +0300
Message-Id: <477cea9e6db35152ace6ffa250080b0e01160b93.1452501577.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
References: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 02/19] linux-user: enable sigaltstack for all
	architectures
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
X-List-Received-Date: Mon, 11 Jan 2016 09:17:19 -0000

There is no reason to limit sigaltstack syscall to just a few
architectures and pretend it is not implemented for others.

If some architecture is not ready for this, that architecture
should be fixed instead.

This fixes LP#1516408.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 linux-user/syscall.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 6c64ba6..3ceb3e2 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8292,14 +8292,8 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
         break;
     }
     case TARGET_NR_sigaltstack:
-#if defined(TARGET_I386) || defined(TARGET_ARM) || defined(TARGET_MIPS) || \
-    defined(TARGET_SPARC) || defined(TARGET_PPC) || defined(TARGET_ALPHA) || \
-    defined(TARGET_M68K) || defined(TARGET_S390X) || defined(TARGET_OPENRISC)
         ret = do_sigaltstack(arg1, arg2, get_sp_from_cpustate((CPUArchState *)cpu_env));
         break;
-#else
-        goto unimplemented;
-#endif
 
 #ifdef CONFIG_SENDFILE
     case TARGET_NR_sendfile:
-- 
2.1.4


