Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4C5B-0000vb-Vs
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 16:33:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4C59-0000rH-BA
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:33:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1e4C58-00021B-IT
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 16:33:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53975)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1e4C53-0001vy-Ql; Mon, 16 Oct 2017 16:33:45 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3BCAD40D2D;
	Mon, 16 Oct 2017 23:33:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 5A0E2B32;
	Mon, 16 Oct 2017 23:33:43 +0300 (MSK)
Received: (nullmailer pid 12327 invoked by uid 1000);
	Mon, 16 Oct 2017 20:33:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 16 Oct 2017 23:33:36 +0300
Message-Id: <69fa4f9568b18b9b1726a3e51a0bc48478798ad4.1508185933.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
References: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
References: <cover.1508185933.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 09/14] include/hw/or-irq.h: Drop unused
 in_irqs field
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
X-List-Received-Date: Mon, 16 Oct 2017 20:33:52 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The struct OrIRQState has an unused member field in_irqs.
This is a legacy of earlier versions of the patch; the
code that used it was dropped from the final version of
the code that went into master, but we forgot to delete
the no-longer-used struct field. Do so now.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/hw/or-irq.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/hw/or-irq.h b/include/hw/or-irq.h
index d400a8120b..fd900fcf19 100644
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
2.11.0


