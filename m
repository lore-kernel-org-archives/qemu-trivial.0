Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vwfqv-0000PS-Pa
	for mharc-qemu-trivial@gnu.org; Fri, 27 Dec 2013 17:25:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35423)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vwfqo-00008t-Mk
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:25:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vwfqk-0000Nx-Jm
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:25:50 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41516)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VwfqW-0000LG-Ke; Fri, 27 Dec 2013 17:25:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7A2904389C;
	Sat, 28 Dec 2013 02:25:32 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 973DE613;
	Sat, 28 Dec 2013 02:07:36 +0400 (MSK)
Received: (nullmailer pid 10356 invoked by uid 1000);
	Fri, 27 Dec 2013 22:07:35 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sat, 28 Dec 2013 02:07:27 +0400
Message-Id: <1388182050-10270-15-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 14/17] pxa27x: Reduce size of keyboard matrix
	mapping
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
X-List-Received-Date: Fri, 27 Dec 2013 22:25:55 -0000

From: Stefan Weil <sw@weilnetz.de>

The row and column values use only a very limited range (-1 ... 7),
so a byte value is sufficient.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/hw/arm/pxa.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index a4e1a66..6db1ff3 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -102,8 +102,8 @@ void pxa2xx_pcmcia_set_irq_cb(void *opaque, qemu_irq irq, qemu_irq cd_irq);
 
 /* pxa2xx_keypad.c */
 struct  keymap {
-    int column;
-    int row;
+    int8_t column;
+    int8_t row;
 };
 typedef struct PXA2xxKeyPadState PXA2xxKeyPadState;
 PXA2xxKeyPadState *pxa27x_keypad_init(MemoryRegion *sysmem,
-- 
1.7.10.4


