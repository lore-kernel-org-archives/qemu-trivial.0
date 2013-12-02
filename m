Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VnZSi-0002zo-Ef
	for mharc-qemu-trivial@gnu.org; Mon, 02 Dec 2013 14:47:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VnZSb-0002pu-Eh
	for qemu-trivial@nongnu.org; Mon, 02 Dec 2013 14:47:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VnZSW-0003Q9-Hv
	for qemu-trivial@nongnu.org; Mon, 02 Dec 2013 14:47:13 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44039)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VnZSK-0003Ny-La; Mon, 02 Dec 2013 14:46:56 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4AB144063A;
	Mon,  2 Dec 2013 23:46:55 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 30C075FA;
	Mon,  2 Dec 2013 23:46:55 +0400 (MSK)
Received: (nullmailer pid 14149 invoked by uid 1000);
	Mon, 02 Dec 2013 19:46:55 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-trivial@nongnu.org
Date: Mon,  2 Dec 2013 23:46:54 +0400
Message-Id: <1386013614-14114-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>
Subject: [Qemu-trivial] [PATCH trivial] hw/ppc/mac.h: remove unused
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
X-List-Received-Date: Mon, 02 Dec 2013 19:47:18 -0000

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


