Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TzD0f-0007bM-Fq
	for mharc-qemu-trivial@gnu.org; Sat, 26 Jan 2013 16:09:57 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@xilinx.com>) id 1TzD0d-0007aT-6R
	for qemu-trivial@nongnu.org; Sat, 26 Jan 2013 16:09:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@xilinx.com>) id 1TzD0b-0005DB-Je
	for qemu-trivial@nongnu.org; Sat, 26 Jan 2013 16:09:55 -0500
Received: from co9ehsobe001.messaging.microsoft.com ([207.46.163.24]:33263
	helo=co9outboundpool.messaging.microsoft.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@xilinx.com>)
	id 1TzD0b-0005Cn-B8; Sat, 26 Jan 2013 16:09:53 -0500
Received: from mail63-co9-R.bigfish.com (10.236.132.242) by
	CO9EHSOBE031.bigfish.com (10.236.130.94) with Microsoft SMTP Server id
	14.1.225.23; Sat, 26 Jan 2013 20:54:48 +0000
Received: from mail63-co9 (localhost [127.0.0.1])	by mail63-co9-R.bigfish.com
	(Postfix) with ESMTP id 27FB3C80284;
	Sat, 26 Jan 2013 20:54:48 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 1
X-BigFish: VPS1(zzzz1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2fh95h668h839hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h906i1155h)
Received-SPF: pass (mail63-co9: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=peter.crosthwaite@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail63-co9 (localhost.localdomain [127.0.0.1]) by mail63-co9
	(MessageSwitch) id 1359233682317268_1346;
	Sat, 26 Jan 2013 20:54:42 +0000 (UTC)
Received: from CO9EHSMHS015.bigfish.com (unknown [10.236.132.241])	by
	mail63-co9.bigfish.com (Postfix) with ESMTP id 49CD1940049;
	Sat, 26 Jan 2013 20:54:42 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by CO9EHSMHS015.bigfish.com
	(10.236.130.25) with Microsoft SMTP Server id 14.1.225.23;
	Sat, 26 Jan 2013 20:54:41 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]
	helo=xsj-smtp1.xilinx.com)	by xsj-gw1 with esmtp (Exim
	4.63)	(envelope-from
	<peter.crosthwaite@xilinx.com>)	id 1TzClt-0004vc-S6; Sat, 26 Jan 2013
	12:54:41 -0800
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 26 Jan 2013 12:54:33 -0800
X-Mailer: git-send-email 1.7.12.1.396.g16eed7c
In-Reply-To: <cover.1359233188.git.peter.crosthwaite@xilinx.com>
References: <cover.1359233188.git.peter.crosthwaite@xilinx.com>
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <1cd4b68e-2a52-42be-a863-8a2960208f3f@CO9EHSMHS015.ehs.local>
X-OriginatorOrg: xilinx.com
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.163.24
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH 1/4] cadence_ttc: Debug mode compile fixes
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
X-List-Received-Date: Sat, 26 Jan 2013 21:09:56 -0000

Some printfs are throwing warnings when debug mode is enabled. Fixed.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---
 hw/cadence_ttc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/cadence_ttc.c b/hw/cadence_ttc.c
index 2a8fadd..67028a3 100644
--- a/hw/cadence_ttc.c
+++ b/hw/cadence_ttc.c
@@ -302,7 +302,7 @@ static uint64_t cadence_ttc_read(void *opaque, hwaddr offset,
 {
     uint32_t ret = cadence_ttc_read_imp(opaque, offset);
 
-    DB_PRINT("addr: %08x data: %08x\n", offset, ret);
+    DB_PRINT("addr: %08x data: %08x\n", (unsigned)offset, (unsigned)ret);
     return ret;
 }
 
@@ -311,7 +311,7 @@ static void cadence_ttc_write(void *opaque, hwaddr offset,
 {
     CadenceTimerState *s = cadence_timer_from_addr(opaque, offset);
 
-    DB_PRINT("addr: %08x data %08x\n", offset, (unsigned)value);
+    DB_PRINT("addr: %08x data %08x\n", (unsigned)offset, (unsigned)value);
 
     cadence_timer_sync(s);
 
-- 
1.7.12.1.396.g16eed7c



