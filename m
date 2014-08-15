Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XIJEC-00014Y-Ey
	for mharc-qemu-trivial@gnu.org; Fri, 15 Aug 2014 11:15:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57828)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJE6-0000zv-5p
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:15:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XIJE0-0005cP-VS
	for qemu-trivial@nongnu.org; Fri, 15 Aug 2014 11:15:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43668)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XIJDm-0005Z8-KH; Fri, 15 Aug 2014 11:15:14 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8771143079;
	Fri, 15 Aug 2014 19:15:13 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 612226E0;
	Fri, 15 Aug 2014 19:15:13 +0400 (MSK)
Received: (nullmailer pid 17906 invoked by uid 1000);
	Fri, 15 Aug 2014 15:15:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 15 Aug 2014 19:14:53 +0400
Message-Id: <1408115711-17836-3-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1408115711-17836-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Fam Zheng <famz@redhat.com>
Subject: [Qemu-trivial] [PULL 02/20] memory: Update obsolete comment about
	AddrRange field type
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
X-List-Received-Date: Fri, 15 Aug 2014 15:15:39 -0000

From: Fam Zheng <famz@redhat.com>

We are not 64 bit any more since

08dafab4 memory: use 128-bit integers for sizes and intermediates

but the comment is forgotten to be updated.

Signed-off-by: Fam Zheng <famz@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 memory.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/memory.c b/memory.c
index 64d7176..dbe6675 100644
--- a/memory.c
+++ b/memory.c
@@ -56,8 +56,7 @@ static void memory_init(void)
 typedef struct AddrRange AddrRange;
 
 /*
- * Note using signed integers limits us to physical addresses at most
- * 63 bits wide.  They are needed for negative offsetting in aliases
+ * Note that signed integers are needed for negative offsetting in aliases
  * (large MemoryRegion::alias_offset).
  */
 struct AddrRange {
-- 
1.7.10.4


