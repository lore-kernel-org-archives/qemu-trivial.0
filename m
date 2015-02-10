Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL6hI-0002lQ-Dn
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 04:01:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54607)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL6h8-0002TO-Ca
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 04:01:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL6h2-00027t-SW
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 04:01:22 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:39757)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL6gq-0001zw-Mr; Tue, 10 Feb 2015 04:01:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 865B74188F;
	Tue, 10 Feb 2015 12:01:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 4BEFA93F;
	Tue, 10 Feb 2015 09:34:45 +0300 (MSK)
Received: (nullmailer pid 9361 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:03 +0300
Message-Id: <a7fa2e9783ee957635d23ddab151a8be97df5b2a.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 14/46] cpu-exec: drop dead assignment
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
X-List-Received-Date: Tue, 10 Feb 2015 09:01:28 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

All uses of TB inside cpu_exec are dominated by "tb = tb_find_fast(env)",
and there are no uses after the switch statement.  So the assignment
is dead, as reported by Coverity.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 cpu-exec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/cpu-exec.c b/cpu-exec.c
index fa506e6..4ff1b23 100644
--- a/cpu-exec.c
+++ b/cpu-exec.c
@@ -494,7 +494,6 @@ int cpu_exec(CPUArchState *env)
                          * interrupt_request) which we will handle
                          * next time around the loop.
                          */
-                        tb = (TranslationBlock *)(next_tb & ~TB_EXIT_MASK);
                         next_tb = 0;
                         break;
                     case TB_EXIT_ICOUNT_EXPIRED:
-- 
2.1.4


