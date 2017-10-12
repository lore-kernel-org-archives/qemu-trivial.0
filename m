Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e2dMz-0006p5-CM
	for mharc-qemu-trivial@gnu.org; Thu, 12 Oct 2017 09:17:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1e2dMx-0006n4-5v
	for qemu-trivial@nongnu.org; Thu, 12 Oct 2017 09:17:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1e2dMw-0008Iq-9p
	for qemu-trivial@nongnu.org; Thu, 12 Oct 2017 09:17:47 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37860)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1e2dMu-0008H6-AV; Thu, 12 Oct 2017 09:17:44 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1e2dMr-0000My-RL; Thu, 12 Oct 2017 14:17:41 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org,
	Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 12 Oct 2017 14:17:47 +0100
Message-Id: <1507814267-21400-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH] include/hw/or-irq.h: Drop unused in_irqs
 field
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 12 Oct 2017 13:17:48 -0000

The struct OrIRQState has an unused member field in_irqs.
This is a legacy of earlier versions of the patch; the
code that used it was dropped from the final version of
the code that went into master, but we forgot to delete
the no-longer-used struct field. Do so now.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/or-irq.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/or-irq.h b/include/hw/or-irq.h
index d400a81..fd900fc 100644
--- a/include/hw/or-irq.h
+++ b/include/hw/or-irq.h
@@ -38,7 +38,6 @@ struct OrIRQState {
     DeviceState parent_obj;
 
     qemu_irq out_irq;
-    qemu_irq *in_irqs;
     bool levels[MAX_OR_LINES];
     uint16_t num_lines;
 };
-- 
2.7.4


