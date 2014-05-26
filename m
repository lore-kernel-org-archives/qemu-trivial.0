Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wopmo-00057n-Ic
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 03:57:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wopmg-0004st-9B
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:57:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wopmb-0001ar-PQ
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 03:57:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50253)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WopmQ-0001WE-Pl; Mon, 26 May 2014 03:57:11 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B830942FB1;
	Mon, 26 May 2014 11:57:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 28F196BB;
	Mon, 26 May 2014 11:20:16 +0400 (MSK)
Received: (nullmailer pid 23038 invoked by uid 1000);
	Mon, 26 May 2014 07:20:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 11:20:10 +0400
Message-Id: <1401088811-22923-23-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1401088811-22923-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 22/23] net: cadence_gem: Fix top comment
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
X-List-Received-Date: Mon, 26 May 2014 07:57:32 -0000

From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

To indicate Cadence GEM not Xilinx.

Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/cadence_gem.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index 47e7038..a26861e 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -1,5 +1,5 @@
 /*
- * QEMU Xilinx GEM emulation
+ * QEMU Cadence GEM emulation
  *
  * Copyright (c) 2011 Xilinx, Inc.
  *
-- 
1.7.10.4


