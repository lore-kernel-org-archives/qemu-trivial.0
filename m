Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aiIuY-00033e-0T
	for mharc-qemu-trivial@gnu.org; Tue, 22 Mar 2016 05:47:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1aiIuR-0002sK-Nm
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 05:47:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>) id 1aiIuQ-000444-O8
	for qemu-trivial@nongnu.org; Tue, 22 Mar 2016 05:47:31 -0400
Received: from [59.151.112.132] (port=62605 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weijg.fnst@cn.fujitsu.com>)
	id 1aiIuM-0003vu-A9; Tue, 22 Mar 2016 05:47:26 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="4842796"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Mar 2016 17:47:00 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 6CE02408D261;
	Tue, 22 Mar 2016 17:46:55 +0800 (CST)
Received: from localhost.localdomain (10.167.226.50) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Tue, 22 Mar 2016 17:46:55 +0800
From: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 22 Mar 2016 17:45:54 +0800
Message-ID: <1458639954-9980-1-git-send-email-weijg.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.50]
X-yoursite-MailScanner-ID: 6CE02408D261.AC94B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: weijg.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, mjt@tls.msk.ru,
	avi@redhat.com, Wei Jiangang <weijg.fnst@cn.fujitsu.com>
Subject: [Qemu-trivial] [Qemu-devel][PATCH] docs: fix typo in memory.txt
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
X-List-Received-Date: Tue, 22 Mar 2016 09:47:36 -0000

The scale line should align with A line's end,
and correct the range of vga-window example 0xa0000-0xbffff.

Signed-off-by: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
---
 docs/memory.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/memory.txt b/docs/memory.txt
index 97134e1..5a7163c 100644
--- a/docs/memory.txt
+++ b/docs/memory.txt
@@ -185,8 +185,8 @@ an MMIO region mapped at 0x0, size 0x6000, priority 1. B currently has two
 of its own subregions: D of size 0x1000 at offset 0 and E of size 0x1000 at
 offset 0x2000. As a diagram:
 
-        0      1000   2000   3000   4000   5000   6000   7000    8000
-        |------|------|------|------|------|------|------|-------|
+        0      1000   2000   3000   4000   5000   6000   7000   8000
+        |------|------|------|------|------|------|------|------|
   A:    [                                                       ]
   C:    [CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC]
   B:                  [                          ]
@@ -247,7 +247,7 @@ system_memory: container@0-2^48-1
  |
  +---- himem: alias@0x100000000-0x11fffffff ---> #ram (0xe0000000-0xffffffff)
  |
- +---- vga-window: alias@0xa0000-0xbfffff ---> #pci (0xa0000-0xbffff)
+ +---- vga-window: alias@0xa0000-0xbffff ---> #pci (0xa0000-0xbffff)
  |      (prio 1)
  |
  +---- pci-hole: alias@0xe0000000-0xffffffff ---> #pci (0xe0000000-0xffffffff)
-- 
1.9.3




