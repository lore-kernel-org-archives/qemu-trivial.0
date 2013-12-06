Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vp19D-0003Wh-Sc
	for mharc-qemu-trivial@gnu.org; Fri, 06 Dec 2013 14:33:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp195-0002nB-Dn
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:33:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vp190-0002sz-Cw
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:33:03 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:42641)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vp18q-0002qT-EI; Fri, 06 Dec 2013 14:32:48 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5917B40DD4;
	Fri,  6 Dec 2013 23:32:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 184355FF;
	Fri,  6 Dec 2013 23:15:45 +0400 (MSK)
Received: (nullmailer pid 19236 invoked by uid 1000);
	Fri, 06 Dec 2013 19:15:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Fri,  6 Dec 2013 23:15:40 +0400
Message-Id: <1386357341-19147-14-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1386357341-19147-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1386357341-19147-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 13/14] hw/ppc/mac.h: remove unused
	BIOS_FILENAME definition
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
X-List-Received-Date: Fri, 06 Dec 2013 19:33:08 -0000

This definition has been moved to prep.c.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/ppc/mac.h |    1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/ppc/mac.h b/hw/ppc/mac.h
index 1e578dd..c1faf9c 100644
--- a/hw/ppc/mac.h
+++ b/hw/ppc/mac.h
@@ -34,7 +34,6 @@
 #define MAX_CPUS 1
 
 #define BIOS_SIZE     (1024 * 1024)
-#define BIOS_FILENAME "ppc_rom.bin"
 #define NVRAM_SIZE        0x2000
 #define PROM_FILENAME    "openbios-ppc"
 #define PROM_ADDR         0xfff00000
-- 
1.7.10.4


