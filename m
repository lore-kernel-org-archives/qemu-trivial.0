Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WtJnp-0000RA-Ri
	for mharc-qemu-trivial@gnu.org; Sat, 07 Jun 2014 12:49:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WtJnn-0000Nu-1m
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 12:49:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WtJnl-0000bW-S9
	for qemu-trivial@nongnu.org; Sat, 07 Jun 2014 12:49:06 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:48526)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WtJng-0000SO-2N; Sat, 07 Jun 2014 12:49:00 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WtJnf-0003YB-3U; Sat, 07 Jun 2014 17:48:59 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat,  7 Jun 2014 17:48:59 +0100
Message-Id: <1402159739-13622-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] hw/dma/xilinx_axidma: Remove unused
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
X-List-Received-Date: Sat, 07 Jun 2014 16:49:07 -0000

The stream_halted() function is never used; remove it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/dma/xilinx_axidma.c | 5 -----
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
1.8.5.4


