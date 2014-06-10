Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuOkb-0002Mj-4L
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:18:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOkT-00028c-Sa
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:18:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOkO-0003hg-W7
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:18:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41732)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuOkF-0003g5-9s; Tue, 10 Jun 2014 12:17:55 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BDCED412C4;
	Tue, 10 Jun 2014 20:17:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BE4F76C4;
	Tue, 10 Jun 2014 20:08:48 +0400 (MSK)
Received: (nullmailer pid 13311 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:28 +0400
Message-Id: <1402416523-13212-11-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 10/25] hw/dma/xilinx_axidma: Remove unused
	stream_halted() function
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
X-List-Received-Date: Tue, 10 Jun 2014 16:18:15 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The stream_halted() function is never used; remove it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/dma/xilinx_axidma.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/dma/xilinx_axidma.c b/hw/dma/xilinx_axidma.c
index cc90eb5..ee60d3f 100644
--- a/hw/dma/xilinx_axidma.c
+++ b/hw/dma/xilinx_axidma.c
@@ -157,11 +157,6 @@ static inline int stream_running(struct Stream *s)
     return s->regs[R_DMACR] & DMACR_RUNSTOP;
 }
 
-static inline int stream_halted(struct Stream *s)
-{
-    return s->regs[R_DMASR] & DMASR_HALTED;
-}
-
 static inline int stream_idle(struct Stream *s)
 {
     return !!(s->regs[R_DMASR] & DMASR_IDLE);
-- 
1.7.10.4


