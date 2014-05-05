Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhNLl-0005Gh-Qd
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 14:10:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNLd-0005Bp-K9
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:10:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNLZ-0003k5-Bj
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:10:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47577)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhNLJ-0003hE-Uh; Mon, 05 May 2014 14:10:22 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0636340708;
	Mon,  5 May 2014 22:10:21 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id D1CAE661;
	Mon,  5 May 2014 22:02:06 +0400 (MSK)
Received: (nullmailer pid 24227 invoked by uid 1000);
	Mon, 05 May 2014 18:02:06 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon,  5 May 2014 22:01:48 +0400
Message-Id: <1399312923-24129-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 07/22] hw/mips: Add missing 'static' and
	'const' attributes
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
X-List-Received-Date: Mon, 05 May 2014 18:10:46 -0000

From: Stefan Weil <sw@weilnetz.de>

This fixes a warning from the static code analysis (smatch).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Acked-by: Aurelien Jarno <aurelien@aurel32.net>
---
 hw/mips/mips_fulong2e.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index e1551aa..30d9f19 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -211,7 +211,7 @@ static void main_cpu_reset(void *opaque)
     }
 }
 
-uint8_t eeprom_spd[0x80] = {
+static const uint8_t eeprom_spd[0x80] = {
     0x80,0x08,0x07,0x0d,0x09,0x02,0x40,0x00,0x04,0x70,
     0x70,0x00,0x82,0x10,0x00,0x01,0x0e,0x04,0x0c,0x01,
     0x02,0x20,0x80,0x75,0x70,0x00,0x00,0x50,0x3c,0x50,
-- 
1.7.10.4


