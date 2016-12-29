Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cMaqQ-0000QE-CI
	for mharc-qemu-trivial@gnu.org; Thu, 29 Dec 2016 08:34:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fanc.fnst@cn.fujitsu.com>) id 1cMYRu-0008FB-Dd
	for qemu-trivial@nongnu.org; Thu, 29 Dec 2016 06:00:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fanc.fnst@cn.fujitsu.com>) id 1cMYRr-0002gD-ET
	for qemu-trivial@nongnu.org; Thu, 29 Dec 2016 06:00:42 -0500
Received: from [59.151.112.132] (port=3862 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fanc.fnst@cn.fujitsu.com>) id 1cMYRq-0002g2-V2
	for qemu-trivial@nongnu.org; Thu, 29 Dec 2016 06:00:39 -0500
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="14352788"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Dec 2016 19:00:37 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 7ED57477AE64;
	Thu, 29 Dec 2016 19:00:37 +0800 (CST)
Received: from localhost (10.167.226.75) by G08CNEXCHPEKD03.g08.fujitsu.local
	(10.167.33.89) with Microsoft SMTP Server id 14.3.319.2;
	Thu, 29 Dec 2016 19:00:36 +0800
From: Chao Fan <fanc.fnst@cn.fujitsu.com>
To: <qemu-trivial@nongnu.org>, <pbonzini@redhat.com>
CC: <caoj.fnst@cn.fujitsu.com>, <douly.fnst@cn.fujitsu.com>, Chao Fan
	<fanc.fnst@cn.fujitsu.com>
Date: Thu, 29 Dec 2016 19:00:26 +0800
Message-ID: <20161229110026.14816-1-fanc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Content-Type: text/plain
X-yoursite-MailScanner-ID: 7ED57477AE64.AB2DC
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: fanc.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
X-Mailman-Approved-At: Thu, 29 Dec 2016 08:34:09 -0500
Subject: [Qemu-trivial] [PATCH] bitmap: a typo of the example in comment
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Dec 2016 11:00:43 -0000

*   DirtyMemoryBlocks *blocks =
*       atomic_rcu_read(&ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION]);

blocks is a pointer, so here should be "->" instead of "."

Signed-off-by: Chao Fan <fanc.fnst@cn.fujitsu.com>
---
 include/exec/ram_addr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index 54d7108..a60a693 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -59,7 +59,7 @@ static inline void *ramblock_ptr(RAMBlock *block, ram_addr_t offset)
  *       atomic_rcu_read(&ram_list.dirty_memory[DIRTY_MEMORY_MIGRATION]);
  *
  *   ram_addr_t idx = (addr >> TARGET_PAGE_BITS) / DIRTY_MEMORY_BLOCK_SIZE;
- *   unsigned long *block = blocks.blocks[idx];
+ *   unsigned long *block = blocks->blocks[idx];
  *   ...access block bitmap...
  *
  *   rcu_read_unlock();
-- 
2.9.3




