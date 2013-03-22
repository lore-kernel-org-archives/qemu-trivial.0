Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UIy3b-00087U-5q
	for mharc-qemu-trivial@gnu.org; Fri, 22 Mar 2013 05:14:39 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54033)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UIy3Y-00083u-N0
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 05:14:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1UIy3X-0004j0-BQ
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 05:14:36 -0400
Received: from [222.73.24.84] (port=48930 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1UIy3T-0004hx-Va; Fri, 22 Mar 2013 05:14:32 -0400
X-IronPort-AV: E=Sophos;i="4.84,891,1355068800"; 
   d="scan'208";a="6924442"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 22 Mar 2013 17:11:57 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r2M9EQXs027228;
	Fri, 22 Mar 2013 17:14:26 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.233.147])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013032217125704-1080326 ;
	Fri, 22 Mar 2013 17:12:57 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 22 Mar 2013 17:12:31 +0800
Message-Id: <1363943551-31150-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/03/22 17:12:57,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/03/22 17:12:57,
	Serialize complete at 2013/03/22 17:12:57
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: liguang <lig.fnst@cn.fujitsu.com>
Subject: [Qemu-trivial] [PATCH] hw/i386/pc: fix possible segment fault for
	port92_write
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
X-List-Received-Date: Fri, 22 Mar 2013 09:14:38 -0000

e.g.
$qemu-system-x86_64 -device port92
will report segment fault,
for port92_write try a un-allocated
assignment for a20_out.
so check before this assignment.

Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
---
 hw/i386/pc.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index ed7d9ba..a0e8ee0 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -440,7 +440,8 @@ static void port92_write(void *opaque, hwaddr addr, uint64_t val,
 
     DPRINTF("port92: write 0x%02x\n", val);
     s->outport = val;
-    qemu_set_irq(*s->a20_out, (val >> 1) & 1);
+    if (s->a20_out)
+        qemu_set_irq(*s->a20_out, (val >> 1) & 1);
     if (val & 1) {
         qemu_system_reset_request();
     }
-- 
1.7.2.5


