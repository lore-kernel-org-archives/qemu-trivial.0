Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W9zsd-0007bB-MP
	for mharc-qemu-trivial@gnu.org; Sun, 02 Feb 2014 11:26:47 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9zr0-0002pV-D2
	for qemu-trivial@nongnu.org; Sun, 02 Feb 2014 11:26:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W9zk3-0007tX-0L
	for qemu-trivial@nongnu.org; Sun, 02 Feb 2014 11:19:04 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60423)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W9zfC-000707-MK; Sun, 02 Feb 2014 11:12:54 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3F0284022A;
	Sun,  2 Feb 2014 20:12:46 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2ACF6632;
	Sun,  2 Feb 2014 20:12:46 +0400 (MSK)
Received: (nullmailer pid 1651 invoked by uid 1000);
	Sun, 02 Feb 2014 16:12:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sun,  2 Feb 2014 20:12:42 +0400
Message-Id: <1391357563-1592-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1391357563-1592-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1391357563-1592-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 6/7] hw/ppc: Remove unused defines
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
X-List-Received-Date: Sun, 02 Feb 2014 16:26:45 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/ppc/ppc4xx_devs.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index 239aada..9160ee7 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -27,8 +27,6 @@
 #include "qemu/log.h"
 #include "exec/address-spaces.h"
 
-//#define DEBUG_MMIO
-//#define DEBUG_UNASSIGNED
 #define DEBUG_UIC
 
 
-- 
1.7.10.4


