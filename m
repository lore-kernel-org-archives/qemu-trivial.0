Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzTRd-0007vQ-3h
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 12:19:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56224)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTRX-0007kR-Fu
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:19:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTRS-0001XV-N1
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:19:35 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41845)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WzTRG-0001Nt-IA; Tue, 24 Jun 2014 12:19:18 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0B1DA44085;
	Tue, 24 Jun 2014 20:19:17 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 3108A6B7;
	Tue, 24 Jun 2014 20:09:23 +0400 (MSK)
Received: (nullmailer pid 15634 invoked by uid 1000);
	Tue, 24 Jun 2014 16:09:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 24 Jun 2014 20:09:18 +0400
Message-Id: <1403626160-15546-13-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 12/14] target-s390x: Remove unused ld_code6()
	function
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
X-List-Received-Date: Tue, 24 Jun 2014 16:19:40 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The ld_code6() function is unused; remove it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 target-s390x/translate.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/target-s390x/translate.c b/target-s390x/translate.c
index 8ca4824..e2a1d05 100644
--- a/target-s390x/translate.c
+++ b/target-s390x/translate.c
@@ -264,11 +264,6 @@ static inline uint64_t ld_code4(CPUS390XState *env, uint64_t pc)
     return (uint64_t)(uint32_t)cpu_ldl_code(env, pc);
 }
 
-static inline uint64_t ld_code6(CPUS390XState *env, uint64_t pc)
-{
-    return (ld_code2(env, pc) << 32) | ld_code4(env, pc + 2);
-}
-
 static int get_mem_index(DisasContext *s)
 {
     switch (s->tb->flags & FLAG_MASK_ASC) {
-- 
1.7.10.4


