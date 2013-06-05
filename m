Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UkDNx-0004S1-W6
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jun 2013 09:04:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1UkDNs-0004JJ-MD
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 09:04:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>) id 1UkDIh-0001Ot-Hp
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 08:58:56 -0400
Received: from [101.78.175.194] (port=53987 helo=ibis.ibis)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hpoussin@reactos.org>)
	id 1UkDIc-0001K4-IM; Wed, 05 Jun 2013 08:58:46 -0400
Received: from [172.19.126.47] (helo=localhost.localdomain)
	by ibis.ibis with esmtp (Exim 4.70)
	(envelope-from <hpoussin@reactos.org>)
	id 1UkCd0-00061o-Ca; Wed, 05 Jun 2013 20:15:46 +0800
From: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2013 20:16:42 +0800
Message-Id: <1370434603-5394-1-git-send-email-hpoussin@reactos.org>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 101.78.175.194
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [Qemu-trivial] [PATCH] cputlb: fix debug logs
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
X-List-Received-Date: Wed, 05 Jun 2013 13:04:16 -0000

'pd' variable has been removed in 06ef3525e1f271b6a842781a05eace5cf63b95c2.

Signed-off-by: Hervé Poussineau <hpoussin@reactos.org>
---
 cputlb.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/cputlb.c b/cputlb.c
index 86666c8..1230e9e 100644
--- a/cputlb.c
+++ b/cputlb.c
@@ -262,8 +262,8 @@ void tlb_set_page(CPUArchState *env, target_ulong vaddr,
 
 #if defined(DEBUG_TLB)
     printf("tlb_set_page: vaddr=" TARGET_FMT_lx " paddr=0x" TARGET_FMT_plx
-           " prot=%x idx=%d pd=0x%08lx\n",
-           vaddr, paddr, prot, mmu_idx, pd);
+           " prot=%x idx=%d\n",
+           vaddr, paddr, prot, mmu_idx);
 #endif
 
     address = vaddr;
-- 
1.7.10.4


