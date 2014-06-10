Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WuOuH-0007Uv-HK
	for mharc-qemu-trivial@gnu.org; Tue, 10 Jun 2014 12:28:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36507)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOuA-0007HV-C6
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:28:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WuOu6-0007bN-1X
	for qemu-trivial@nongnu.org; Tue, 10 Jun 2014 12:28:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49143)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WuOtt-0007XN-O5; Tue, 10 Jun 2014 12:27:53 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2942D412C7;
	Tue, 10 Jun 2014 20:27:53 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 0FFEF6D7;
	Tue, 10 Jun 2014 20:08:51 +0400 (MSK)
Received: (nullmailer pid 13315 invoked by uid 1000);
	Tue, 10 Jun 2014 16:08:47 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Jun 2014 20:08:30 +0400
Message-Id: <1402416523-13212-13-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1402416523-13212-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 12/25] hw/isa/pc87312: Remove unused function
	is_parallel_epp()
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
X-List-Received-Date: Tue, 10 Jun 2014 16:28:14 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The function is_parallel_epp() is unused; remove it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/isa/pc87312.c |    5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/isa/pc87312.c b/hw/isa/pc87312.c
index b352b49..9327c53 100644
--- a/hw/isa/pc87312.c
+++ b/hw/isa/pc87312.c
@@ -86,11 +86,6 @@ static inline uint32_t get_parallel_irq(PC87312State *s)
     }
 }
 
-static inline bool is_parallel_epp(PC87312State *s)
-{
-    return s->regs[REG_PTR] & PTR_EPP_MODE;
-}
-
 
 /* UARTs */
 
-- 
1.7.10.4


