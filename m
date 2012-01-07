Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RjUxz-0002zT-S9
	for mharc-qemu-trivial@gnu.org; Sat, 07 Jan 2012 07:01:43 -0500
Received: from eggs.gnu.org ([140.186.70.92]:42566)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1RjUxv-0002oh-5O
	for qemu-trivial@nongnu.org; Sat, 07 Jan 2012 07:01:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1RjUxu-0002lu-43
	for qemu-trivial@nongnu.org; Sat, 07 Jan 2012 07:01:39 -0500
Received: from e06smtp10.uk.ibm.com ([195.75.94.106]:52118)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1RjUxt-0002lQ-RV
	for qemu-trivial@nongnu.org; Sat, 07 Jan 2012 07:01:38 -0500
Received: from /spool/local
	by e06smtp10.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanha@linux.vnet.ibm.com>;
	Sat, 7 Jan 2012 12:01:33 -0000
Received: from d06nrmr1307.portsmouth.uk.ibm.com ([9.149.38.129])
	by e06smtp10.uk.ibm.com ([192.168.101.140]) with IBM ESMTP SMTP
	Gateway: Authorized Use Only! Violators will be prosecuted; 
	Sat, 7 Jan 2012 12:01:31 -0000
Received: from d06av11.portsmouth.uk.ibm.com (d06av11.portsmouth.uk.ibm.com
	[9.149.37.252])
	by d06nrmr1307.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id q07C1UXV2171102; Sat, 7 Jan 2012 12:01:30 GMT
Received: from d06av11.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av11.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id q07C1UpH009138; Sat, 7 Jan 2012 05:01:30 -0700
Received: from localhost (sig-9-146-166-22.uk.ibm.com [9.146.166.22])
	by d06av11.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id q07C1Tn9009129; Sat, 7 Jan 2012 05:01:30 -0700
From: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
To: <qemu-devel@nongnu.org>
Date: Sat,  7 Jan 2012 11:59:59 +0000
Message-Id: <1325937599-12763-1-git-send-email-stefanha@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.7.3
x-cbid: 12010712-4966-0000-0000-000001140CEC
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 195.75.94.106
Cc: qemu-trivial@nongnu.org, Andrzej Zaborowski <balrog@zabor.org>,
	Dr David Alan Gilbert <davidagilbert@uk.ibm.com>,
	Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH] omap_dss: correct chip[1] index in
	RFBI_READ/RFBI_STATUS
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
X-List-Received-Date: Sat, 07 Jan 2012 12:01:40 -0000

The RFBI_READ/RFBI_STATUS code incorrectly uses chip[0] when it should
be using chip[1].  Andrzej Zaborowski <balrog@zabor.org> confirmed this
bug since I don't know this code well.

Reported-by: Dr David Alan Gilbert <davidagilbert@uk.ibm.com>
Signed-off-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
---
 hw/omap_dss.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/omap_dss.c b/hw/omap_dss.c
index ede640b..86ed6ea 100644
--- a/hw/omap_dss.c
+++ b/hw/omap_dss.c
@@ -793,7 +793,7 @@ static void omap_rfbi_write(void *opaque, target_phys_addr_t addr,
         if ((s->rfbi.control & (1 << 2)) && s->rfbi.chip[0])
             s->rfbi.rxbuf = s->rfbi.chip[0]->read(s->rfbi.chip[0]->opaque, 1);
         else if ((s->rfbi.control & (1 << 3)) && s->rfbi.chip[1])
-            s->rfbi.rxbuf = s->rfbi.chip[0]->read(s->rfbi.chip[0]->opaque, 1);
+            s->rfbi.rxbuf = s->rfbi.chip[1]->read(s->rfbi.chip[1]->opaque, 1);
         if (!-- s->rfbi.pixels)
             omap_rfbi_transfer_stop(s);
         break;
@@ -802,7 +802,7 @@ static void omap_rfbi_write(void *opaque, target_phys_addr_t addr,
         if ((s->rfbi.control & (1 << 2)) && s->rfbi.chip[0])
             s->rfbi.rxbuf = s->rfbi.chip[0]->read(s->rfbi.chip[0]->opaque, 0);
         else if ((s->rfbi.control & (1 << 3)) && s->rfbi.chip[1])
-            s->rfbi.rxbuf = s->rfbi.chip[0]->read(s->rfbi.chip[0]->opaque, 0);
+            s->rfbi.rxbuf = s->rfbi.chip[1]->read(s->rfbi.chip[1]->opaque, 0);
         if (!-- s->rfbi.pixels)
             omap_rfbi_transfer_stop(s);
         break;
-- 
1.7.7.3


