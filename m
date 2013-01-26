Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TzCm1-00035K-1t
	for mharc-qemu-trivial@gnu.org; Sat, 26 Jan 2013 15:54:49 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@xilinx.com>) id 1TzCly-00034y-Pm
	for qemu-trivial@nongnu.org; Sat, 26 Jan 2013 15:54:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@xilinx.com>) id 1TzClx-0000Gu-Sd
	for qemu-trivial@nongnu.org; Sat, 26 Jan 2013 15:54:46 -0500
Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]:31162
	helo=co9outboundpool.messaging.microsoft.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@xilinx.com>)
	id 1TzClx-0000Fk-Mc; Sat, 26 Jan 2013 15:54:45 -0500
Received: from mail31-co9-R.bigfish.com (10.236.132.231) by
	CO9EHSOBE008.bigfish.com (10.236.130.71) with Microsoft SMTP Server id
	14.1.225.23; Sat, 26 Jan 2013 20:54:43 +0000
Received: from mail31-co9 (localhost [127.0.0.1])	by mail31-co9-R.bigfish.com
	(Postfix) with ESMTP id D1D982004C;
	Sat, 26 Jan 2013 20:54:43 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 1
X-BigFish: VPS1(zzzz1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2fh95h668h839hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h906i1155h)
Received-SPF: pass (mail31-co9: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=peter.crosthwaite@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail31-co9 (localhost.localdomain [127.0.0.1]) by mail31-co9
	(MessageSwitch) id 1359233682201822_13217;
	Sat, 26 Jan 2013 20:54:42 +0000 (UTC)
Received: from CO9EHSMHS016.bigfish.com (unknown [10.236.132.234])	by
	mail31-co9.bigfish.com (Postfix) with ESMTP id 2485C4E0103;
	Sat, 26 Jan 2013 20:54:42 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by CO9EHSMHS016.bigfish.com
	(10.236.130.26) with Microsoft SMTP Server id 14.1.225.23;
	Sat, 26 Jan 2013 20:54:41 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]
	helo=xsj-smtp1.xilinx.com)	by xsj-gw1 with esmtp (Exim
	4.63)	(envelope-from
	<peter.crosthwaite@xilinx.com>)	id 1TzClt-0004vZ-KJ; Sat, 26 Jan 2013
	12:54:41 -0800
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 26 Jan 2013 12:54:35 -0800
X-Mailer: git-send-email 1.7.12.1.396.g16eed7c
In-Reply-To: <cover.1359233188.git.peter.crosthwaite@xilinx.com>
References: <cover.1359233188.git.peter.crosthwaite@xilinx.com>
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <5f12d2a8-2cd8-4e94-9a3d-a4f716d0fe40@CO9EHSMHS016.ehs.local>
X-OriginatorOrg: xilinx.com
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 207.46.163.25
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH 3/4] xilinx_axidma: Fix debug mode compile
	messages
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
X-List-Received-Date: Sat, 26 Jan 2013 20:54:47 -0000

Missing cast one one of the conditionally compiled printfs.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---
 hw/xilinx_axidma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/xilinx_axidma.c b/hw/xilinx_axidma.c
index d0ee566..cc51584 100644
--- a/hw/xilinx_axidma.c
+++ b/hw/xilinx_axidma.c
@@ -444,7 +444,7 @@ static void axidma_write(void *opaque, hwaddr addr,
             break;
         default:
             D(qemu_log("%s: ch=%d addr=" TARGET_FMT_plx " v=%x\n",
-                  __func__, sid, addr * 4, value));
+                  __func__, sid, addr * 4, (unsigned)value));
             s->regs[addr] = value;
             break;
     }
-- 
1.7.12.1.396.g16eed7c



