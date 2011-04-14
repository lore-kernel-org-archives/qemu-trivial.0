Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QAMLI-0004IX-OY
	for mharc-qemu-trivial@gnu.org; Thu, 14 Apr 2011 09:12:16 -0400
Received: from eggs.gnu.org ([140.186.70.92]:38032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QAMLG-0004F5-Op
	for qemu-trivial@nongnu.org; Thu, 14 Apr 2011 09:12:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QAMLF-00064A-Qk
	for qemu-trivial@nongnu.org; Thu, 14 Apr 2011 09:12:14 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:54679)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QAML6-0005zg-79; Thu, 14 Apr 2011 09:12:04 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QAMKy-0005S4-9T; Thu, 14 Apr 2011 14:11:56 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 14 Apr 2011 14:11:56 +0100
Message-Id: <1302786716-20933-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] tests/test-mmap.c: Check mmap() return value
	before using it
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <http://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Apr 2011 13:12:15 -0000

Correct the position of a "stop if MAP_FAILED" check in the mmap()
tests, so that if mmap() does fail we print a failure message
rather than segfaulting inside memcpy().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/test-mmap.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/tests/test-mmap.c b/tests/test-mmap.c
index fcb365f..c578e25 100644
--- a/tests/test-mmap.c
+++ b/tests/test-mmap.c
@@ -164,6 +164,7 @@ void check_aligned_anonymous_unfixed_colliding_mmaps(void)
 		nlen = pagesize * 8;
 		p3 = mmap(NULL, nlen, PROT_READ, 
 			  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
+		fail_unless (p3 != MAP_FAILED);
 
 		/* Check if the mmaped areas collide.  */
 		if (p3 < p2 
@@ -174,7 +175,6 @@ void check_aligned_anonymous_unfixed_colliding_mmaps(void)
 
 		/* Make sure we get pages aligned with the pagesize. The
 		   target expects this.  */
-		fail_unless (p3 != MAP_FAILED);
 		p = (uintptr_t) p3;
 		fail_unless ((p & pagemask) == 0);
 		munmap (p2, pagesize);
-- 
1.7.1


