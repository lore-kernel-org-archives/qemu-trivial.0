Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VSkoF-0006rO-87
	for mharc-qemu-trivial@gnu.org; Sun, 06 Oct 2013 05:39:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSko8-0006cd-Dy
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:39:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSko4-0003OB-GV
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:39:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42229)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VSknv-0003LP-Mb; Sun, 06 Oct 2013 05:39:11 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1D41A40D04;
	Sun,  6 Oct 2013 13:39:10 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 3E13352A;
	Sun,  6 Oct 2013 13:33:04 +0400 (MSK)
Received: (nullmailer pid 25815 invoked by uid 1000);
	Sun, 06 Oct 2013 09:33:02 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sun,  6 Oct 2013 13:32:53 +0400
Message-Id: <1381051979-25742-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, Guenter Roeck <linux@roeck-us.net>
Subject: [Qemu-trivial] [PULL 08/14] sh4: Fix serial line access for Linux
	kernels later than 3.2
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
X-List-Received-Date: Sun, 06 Oct 2013 09:39:28 -0000

From: Guenter Roeck <linux@roeck-us.net>

With Linux kernel version 3.3 or later, qemu fails with the following message:

sh_serial: unsupported read from 0x18
  Aborted

Reported-and-analyzed-by: Rob Landley <rob@landley.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/char/sh_serial.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
index 6223a55..9328dd1 100644
--- a/hw/char/sh_serial.c
+++ b/hw/char/sh_serial.c
@@ -248,11 +248,9 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
                     s->flags &= ~SH_SERIAL_FLAG_RDF;
             }
             break;
-#if 0
         case 0x18:
             ret = s->fcr;
             break;
-#endif
         case 0x1c:
             ret = s->rx_cnt;
             break;
-- 
1.7.10.4


