Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzDJx-0007Gf-Fq
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jun 2014 19:06:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50533)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WzDJt-00079t-Pl
	for qemu-trivial@nongnu.org; Mon, 23 Jun 2014 19:06:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WzDJt-0001Wo-1w
	for qemu-trivial@nongnu.org; Mon, 23 Jun 2014 19:06:37 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:48701)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WzDJr-0001V6-F7; Mon, 23 Jun 2014 19:06:35 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WzDJq-00048c-FB; Tue, 24 Jun 2014 00:06:34 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 24 Jun 2014 00:06:34 +0100
Message-Id: <1403564794-15881-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Alexander Graf <agraf@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH] target-s390x: Remove unused ld_code6()
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
X-List-Received-Date: Mon, 23 Jun 2014 23:06:38 -0000

The ld_code6() function is unused; remove it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
We could use this for loads of 6-byte insns, but that would
imply a pointless reload of the first 2 bytes, which is
presumably why this function isn't actually used.
---
 target-s390x/translate.c | 5 -----
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
2.0.0


