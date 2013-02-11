Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U4nco-0007nj-4T
	for mharc-qemu-trivial@gnu.org; Mon, 11 Feb 2013 02:16:26 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@xilinx.com>) id 1U4nck-0007lk-Sg
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 02:16:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@xilinx.com>) id 1U4ncj-0006MF-RH
	for qemu-trivial@nongnu.org; Mon, 11 Feb 2013 02:16:22 -0500
Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]:46199
	helo=ch1outboundpool.messaging.microsoft.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@xilinx.com>)
	id 1U4ncj-0006M5-NM; Mon, 11 Feb 2013 02:16:21 -0500
Received: from mail246-ch1-R.bigfish.com (10.43.68.253) by
	CH1EHSOBE009.bigfish.com (10.43.70.59) with Microsoft SMTP Server id
	14.1.225.23; Mon, 11 Feb 2013 07:16:20 +0000
Received: from mail246-ch1 (localhost [127.0.0.1])	by
	mail246-ch1-R.bigfish.com (Postfix) with ESMTP id E20B01B801BE;
	Mon, 11 Feb 2013 07:16:19 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 1
X-BigFish: VPS1(zzzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2fh95h668h839hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h1946h19b5h906i1155h)
Received-SPF: pass (mail246-ch1: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=peter.crosthwaite@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail246-ch1 (localhost.localdomain [127.0.0.1]) by mail246-ch1
	(MessageSwitch) id 1360566978601290_24389;
	Mon, 11 Feb 2013 07:16:18 +0000 (UTC)
Received: from CH1EHSMHS010.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.239])	by mail246-ch1.bigfish.com (Postfix) with ESMTP id
	865631A40048;	Mon, 11 Feb 2013 07:16:18 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by CH1EHSMHS010.bigfish.com
	(10.43.70.10) with Microsoft SMTP Server id 14.1.225.23;
	Mon, 11 Feb 2013 07:16:18 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]
	helo=xsj-smtp1.xilinx.com)	by xsj-gw1 with esmtp (Exim
	4.63)	(envelope-from
	<peter.crosthwaite@xilinx.com>)	id 1U4ncf-0001t6-SC; Sun, 10 Feb 2013
	23:16:17 -0800
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 11 Feb 2013 17:16:05 +1000
X-Mailer: git-send-email 1.7.0.4
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <0c6a908b-571a-4573-b175-47f760f22135@CH1EHSMHS010.ehs.local>
X-OriginatorOrg: xilinx.com
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 216.32.181.186
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH] xilinx_axienet.c: Assert no error when
	making link
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
X-List-Received-Date: Mon, 11 Feb 2013 07:16:23 -0000

This gives an awful silent failure when it doesn't work. Assert against link
creation failure.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---
 hw/xilinx_axienet.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/hw/xilinx_axienet.c b/hw/xilinx_axienet.c
index 34e344c..e5d9251 100644
--- a/hw/xilinx_axienet.c
+++ b/hw/xilinx_axienet.c
@@ -869,9 +869,11 @@ static int xilinx_enet_init(SysBusDevice *dev)
 static void xilinx_enet_initfn(Object *obj)
 {
     struct XilinxAXIEnet *s = FROM_SYSBUS(typeof(*s), SYS_BUS_DEVICE(obj));
+    Error *errp = NULL;
 
     object_property_add_link(obj, "axistream-connected", TYPE_STREAM_SLAVE,
-                             (Object **) &s->tx_dev, NULL);
+                             (Object **) &s->tx_dev, &errp);
+    assert_no_error(errp);
 }
 
 static Property xilinx_enet_properties[] = {
-- 
1.7.0.4



