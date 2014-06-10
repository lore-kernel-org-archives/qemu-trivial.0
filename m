Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuPDg-0002Tc-7M
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:48:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuPDY-0002Dr-5S
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:48:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuPDT-0007XS-8m
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:48:12 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44556)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuPDG-0007Tr-VW; Tue, 10 Jun 2014 12:47:55 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 709D3412A5;
	Tue, 10 Jun 2014 20:47:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 93292666;
	Tue, 10 Jun 2014 20:08:47 +0400 (MSK)
Received: (nullmailer pid 13304 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:25 +0400
Message-Id: <1402416523-13212-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 07/25] hw/i386/pc.c: Remove unused parallel_io
	and parallel_irq variables
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
X-List-Received-Date: Tue, 10 Jun 2014 16:48:17 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The variables parallel_io and parallel_irq are unused; delete them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/pc.c |    3 ---
 1 file changed, 3 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index e6369d5..32d1632 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -922,9 +922,6 @@ static const int ne2000_io[NE2000_NB_MAX] = { 0x300, 0x320, 0x340, 0x360,
                                               0x280, 0x380 };
 static const int ne2000_irq[NE2000_NB_MAX] = { 9, 10, 11, 3, 4, 5 };
 
-static const int parallel_io[MAX_PARALLEL_PORTS] = { 0x378, 0x278, 0x3bc };
-static const int parallel_irq[MAX_PARALLEL_PORTS] = { 7, 7, 7 };
-
 void pc_init_ne2k_isa(ISABus *bus, NICInfo *nd)
 {
     static int nb_ne2k = 0;
-- 
1.7.10.4


