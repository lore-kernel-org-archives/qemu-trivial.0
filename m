Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Szrqr-0004IE-Tw
	for mharc-qemu-trivial@gnu.org; Fri, 10 Aug 2012 12:14:17 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45365)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Szrqo-00045c-6K
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 12:14:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Szrql-0002OE-St
	for qemu-trivial@nongnu.org; Fri, 10 Aug 2012 12:14:14 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:57884)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Szrqi-0002N6-Lh; Fri, 10 Aug 2012 12:14:08 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Szrqf-0006Wz-Vr; Fri, 10 Aug 2012 17:14:05 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 10 Aug 2012 17:14:05 +0100
Message-Id: <1344615245-25080-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] cputlb.c: Fix out of date comment
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
X-List-Received-Date: Fri, 10 Aug 2012 16:14:16 -0000

The comment about the return address from get_page_addr_code() was
well out of date as phys_ram_base has not existed for some time.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 cputlb.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/cputlb.c b/cputlb.c
index 0d1e252..d3e7b25 100644
--- a/cputlb.c
+++ b/cputlb.c
@@ -312,7 +312,9 @@ void tlb_set_page(CPUArchState *env, target_ulong vaddr,
 
 /* NOTE: this function can trigger an exception */
 /* NOTE2: the returned address is not exactly the physical address: it
-   is the offset relative to phys_ram_base */
+ * is actually a ram_addr_t (in system mode; the user mode emulation
+ * version of this function returns a guest virtual address).
+ */
 tb_page_addr_t get_page_addr_code(CPUArchState *env1, target_ulong addr)
 {
     int mmu_idx, page_index, pd;
-- 
1.7.9.5


