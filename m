Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XGfC9-0003MK-Iu
	for mharc-qemu-trivial@gnu.org; Sun, 10 Aug 2014 22:18:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XGfC1-000384-CB
	for qemu-trivial@nongnu.org; Sun, 10 Aug 2014 22:18:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1XGfBv-0006vA-0R
	for qemu-trivial@nongnu.org; Sun, 10 Aug 2014 22:18:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:65086)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1XGfBi-0006mj-80; Sun, 10 Aug 2014 22:18:18 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7B2IFpx010900
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sun, 10 Aug 2014 22:18:16 -0400
Received: from T430.nay.redhat.com (dhcp-14-155.nay.redhat.com [10.66.14.155])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id s7B2ICvY028008; Sun, 10 Aug 2014 22:18:13 -0400
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 11 Aug 2014 10:18:31 +0800
Message-Id: <1407723511-13265-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH] memory: Update obsolete comment about
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
X-List-Received-Date: Mon, 11 Aug 2014 02:18:43 -0000

We are not 64 bit any more since

08dafab4 memory: use 128-bit integers for sizes and intermediates

but the comment is forgotten to be updated.

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 memory.c | 3 +--
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
2.0.3


