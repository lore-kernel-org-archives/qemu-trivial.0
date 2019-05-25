Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hUQO5-0002u6-JQ
	for mharc-qemu-trivial@gnu.org; Sat, 25 May 2019 02:42:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hUQO3-0002os-KG
	for qemu-trivial@nongnu.org; Sat, 25 May 2019 02:42:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1hUQBJ-0003B1-6f
	for qemu-trivial@nongnu.org; Sat, 25 May 2019 02:29:25 -0400
Received: from m12-17.163.com ([220.181.12.17]:41503)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>)
	id 1hUQBG-00032I-VG; Sat, 25 May 2019 02:29:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=qpW5ne0augMm/uJBAJ
	7MnqYEgl6mluJDLveJO/8sKcw=; b=PSV6cAHsqOEMOQrzjeNC24hqu553u2Y6kg
	kNLXsFioH50uuA1lLkgb26qfQHa0Q4PNLVQ2OKaNkNKklNH2dK2bA0h96wSkQoL0
	JgknsnvkwhVVuisjp7GMLepwJhC1FuTuN4OZaINMrAb72SZhO+VLZCnbUcVxYzxP
	nMuR7aUZc=
Received: from localhost.localdomain (unknown [122.233.130.146])
	by smtp13 (Coremail) with SMTP id EcCowABnbx+64OhcgoagHw--.19765S2;
	Sat, 25 May 2019 14:29:15 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: quintela@redhat.com,
	dgilbert@redhat.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Li Qiang <liq3ea@163.com>
Date: Fri, 24 May 2019 23:28:32 -0700
Message-Id: <20190525062832.18009-1-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: EcCowABnbx+64OhcgoagHw--.19765S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4R_a9aDUUUU
X-Originating-IP: [122.233.130.146]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbBZg6-bVaD1p8IOAABsX
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.17
Subject: [Qemu-trivial] [PATCH] migration: fix a typo
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
X-List-Received-Date: Sat, 25 May 2019 06:42:36 -0000

'postocpy' should be 'postcopy'.

CC: qemu-trivial@nongnu.org
Signed-off-by: Li Qiang <liq3ea@163.com>
---
 migration/ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 4c60869226..359dc8f1bc 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2236,7 +2236,7 @@ static RAMBlock *unqueue_page(RAMState *rs, ram_addr_t *offset)
 }
 
 /**
- * get_queued_page: unqueue a page from the postocpy requests
+ * get_queued_page: unqueue a page from the postcopy requests
  *
  * Skips pages that are already sent (!dirty)
  *
-- 
2.17.1



