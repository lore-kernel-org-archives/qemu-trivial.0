Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QpBcu-0002fe-5F
	for mharc-qemu-trivial@gnu.org; Fri, 05 Aug 2011 00:03:12 -0400
Received: from eggs.gnu.org ([140.186.70.92]:50059)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1QpBcq-0002TN-FD
	for qemu-trivial@nongnu.org; Fri, 05 Aug 2011 00:03:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1QpBcp-00016o-4p
	for qemu-trivial@nongnu.org; Fri, 05 Aug 2011 00:03:08 -0400
Received: from ozlabs.org ([203.10.76.45]:60491)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1QpBcl-00013Z-2t; Fri, 05 Aug 2011 00:03:03 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id CE9EAB6F7A; Fri,  5 Aug 2011 14:02:59 +1000 (EST)
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org
Date: Fri,  5 Aug 2011 14:02:50 +1000
Message-Id: <1312516970-26606-1-git-send-email-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 1.7.5.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 203.10.76.45
Cc: qemu-trivial@nongnu.org, agraf@suse.de
Subject: [Qemu-trivial] [PATCH] Permit -mem-path without sync mmu
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
X-List-Received-Date: Fri, 05 Aug 2011 04:03:09 -0000

At present, an explicit test disallows use of -mem-path when kvm is enabled
but KVM_CAP_SYNC_MMU is not set.  In particular, this prevents the user
from using hugetlbfs to back the guest memory.

I can see no reason for this check, and when I asked about it previously,
the only theory offered was that this was a limitation of the very early
days of kvm which only happened to match the SYNC_MMU flag by accident.

This patch, therefore, removes the check.  This is of particular use to
us on POWER, where we haven't yet implement SYNC_MMU, but where backing
the guest with hugepages is possible, and in fact mandatory (for now).

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 exec.c |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/exec.c b/exec.c
index 476b507..041637c 100644
--- a/exec.c
+++ b/exec.c
@@ -2818,11 +2818,6 @@ static void *file_ram_alloc(RAMBlock *block,
         return NULL;
     }
 
-    if (kvm_enabled() && !kvm_has_sync_mmu()) {
-        fprintf(stderr, "host lacks kvm mmu notifiers, -mem-path unsupported\n");
-        return NULL;
-    }
-
     if (asprintf(&filename, "%s/qemu_back_mem.XXXXXX", path) == -1) {
         return NULL;
     }
-- 
1.7.5.4


