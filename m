Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkEji-0003FX-E7
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 13:12:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45097)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEjc-00033i-1x
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:12:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEjV-00044D-Pd
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:12:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50464)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZkEjQ-0003vC-3j; Thu, 08 Oct 2015 13:11:52 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 80AF840A62;
	Thu,  8 Oct 2015 20:11:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 82713A97;
	Thu,  8 Oct 2015 19:52:32 +0300 (MSK)
Received: (nullmailer pid 12003 invoked by uid 1000);
	Thu, 08 Oct 2015 16:52:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 19:52:22 +0300
Message-Id: <bf5f78efed26054c2ce71e6f4c30ece13bf06e87.1444323071.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
References: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Shraddha Barke <shraddha.6596@gmail.com>
Subject: [Qemu-trivial] [PULL 13/19] hw: timer: Remove unnecessary variable
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
X-List-Received-Date: Thu, 08 Oct 2015 17:12:06 -0000

From: Shraddha Barke <shraddha.6596@gmail.com>

Compress lines and remove the variable.

Signed-off-by: Shraddha Barke <shraddha.6596@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/timer/m48t59.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/timer/m48t59.c b/hw/timer/m48t59.c
index 8ab683d..b3df8f9 100644
--- a/hw/timer/m48t59.c
+++ b/hw/timer/m48t59.c
@@ -590,10 +590,8 @@ static void nvram_writel (void *opaque, hwaddr addr, uint32_t value)
 static uint32_t nvram_readb (void *opaque, hwaddr addr)
 {
     M48t59State *NVRAM = opaque;
-    uint32_t retval;
 
-    retval = m48t59_read(NVRAM, addr);
-    return retval;
+    return m48t59_read(NVRAM, addr);
 }
 
 static uint32_t nvram_readw (void *opaque, hwaddr addr)
-- 
2.1.4


