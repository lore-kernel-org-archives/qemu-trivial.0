Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TzCme-0004EJ-Fs
	for mharc-qemu-trivial@gnu.org; Sat, 26 Jan 2013 15:55:28 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@xilinx.com>) id 1TzCmc-0004CD-4A
	for qemu-trivial@nongnu.org; Sat, 26 Jan 2013 15:55:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@xilinx.com>) id 1TzCmb-0000w2-6q
	for qemu-trivial@nongnu.org; Sat, 26 Jan 2013 15:55:26 -0500
Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]:17501
	helo=va3outboundpool.messaging.microsoft.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@xilinx.com>)
	id 1TzCmb-0000v9-34; Sat, 26 Jan 2013 15:55:25 -0500
Received: from mail116-va3-R.bigfish.com (10.7.14.239) by
	VA3EHSOBE006.bigfish.com (10.7.40.26) with Microsoft SMTP Server id
	14.1.225.23; Sat, 26 Jan 2013 20:55:24 +0000
Received: from mail116-va3 (localhost [127.0.0.1])	by
	mail116-va3-R.bigfish.com (Postfix) with ESMTP id 7519C8022A;
	Sat, 26 Jan 2013 20:55:23 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 1
X-BigFish: VPS1(zzzz1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2fh95h668h839hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h906i1155h)
Received-SPF: pass (mail116-va3: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=peter.crosthwaite@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail116-va3 (localhost.localdomain [127.0.0.1]) by mail116-va3
	(MessageSwitch) id 1359233683358020_2786;
	Sat, 26 Jan 2013 20:54:43 +0000 (UTC)
Received: from VA3EHSMHS027.bigfish.com (unknown [10.7.14.243])	by
	mail116-va3.bigfish.com (Postfix) with ESMTP id 482CA140110;
	Sat, 26 Jan 2013 20:54:43 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by VA3EHSMHS027.bigfish.com
	(10.7.99.37) with Microsoft SMTP Server id 14.1.225.23; Sat, 26 Jan 2013
	20:54:43 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]
	helo=xsj-smtp1.xilinx.com)	by xsj-gw1 with esmtp (Exim
	4.63)	(envelope-from
	<peter.crosthwaite@xilinx.com>)	id 1TzClu-0004vl-Oh; Sat, 26 Jan 2013
	12:54:42 -0800
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 26 Jan 2013 12:54:36 -0800
X-Mailer: git-send-email 1.7.12.1.396.g16eed7c
In-Reply-To: <cover.1359233188.git.peter.crosthwaite@xilinx.com>
References: <cover.1359233188.git.peter.crosthwaite@xilinx.com>
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Content-Type: text/plain
Message-ID: <79b3ee1c-5db5-47e7-a458-39e5c0698e3f@VA3EHSMHS027.ehs.local>
X-OriginatorOrg: xilinx.com
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 216.32.180.11
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Subject: [Qemu-trivial] [PATCH 4/4] qemu/log.h: Fix missing includes
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
X-List-Received-Date: Sat, 26 Jan 2013 20:55:27 -0000

qemu/log.h needs a few bits and pieces from qemu-common to compile.
Fixes the case where qemu/log.h is the first files included.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
---
 include/qemu/log.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index 58f69cb..0a1266d 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -2,6 +2,7 @@
 #define QEMU_LOG_H
 
 #include <stdarg.h>
+#include "qemu-common.h"
 #ifdef NEED_CPU_H
 #include "disas/disas.h"
 #endif
-- 
1.7.12.1.396.g16eed7c



