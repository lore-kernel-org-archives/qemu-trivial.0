Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WeeNI-0005cc-S4
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 01:45:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52920)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WeeNC-0005No-A6
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:45:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WeeN8-0002Tc-4G
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:45:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52171)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WeeMt-0002Qm-RX; Mon, 28 Apr 2014 01:44:49 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D4D9C43044;
	Mon, 28 Apr 2014 09:44:40 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E4DF8671;
	Mon, 28 Apr 2014 09:08:27 +0400 (MSK)
Received: (nullmailer pid 19149 invoked by uid 1000);
	Mon, 28 Apr 2014 05:08:25 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 28 Apr 2014 09:07:56 +0400
Message-Id: <1398661684-19059-11-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 10/18] xilinx: Fix typo in comment (Marvel ->
	Marvell)
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
X-List-Received-Date: Mon, 28 Apr 2014 05:45:07 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/net/xilinx_axienet.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/xilinx_axienet.c b/hw/net/xilinx_axienet.c
index 839d97c..6dc665f 100644
--- a/hw/net/xilinx_axienet.c
+++ b/hw/net/xilinx_axienet.c
@@ -98,7 +98,7 @@ static unsigned int tdk_read(struct PHY *phy, unsigned int req)
             r |= 1;
             break;
         case 17:
-            /* Marvel PHY on many xilinx boards.  */
+            /* Marvell PHY on many xilinx boards.  */
             r = 0x8000; /* 1000Mb  */
             break;
         case 18:
-- 
1.7.10.4


