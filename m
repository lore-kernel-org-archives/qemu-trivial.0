Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXQTO-0000ki-Lo
	for mharc-qemu-trivial@gnu.org; Tue, 08 Apr 2014 03:29:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51960)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXQTI-0000a5-Qx
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:29:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WXQTD-00019D-62
	for qemu-trivial@nongnu.org; Tue, 08 Apr 2014 03:29:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:32774)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WXQT3-00014G-Fr; Tue, 08 Apr 2014 03:29:13 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 32CC140E28;
	Tue,  8 Apr 2014 11:29:12 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id C29B36B1;
	Tue,  8 Apr 2014 11:04:13 +0400 (MSK)
Received: (nullmailer pid 10589 invoked by uid 1000);
	Tue, 08 Apr 2014 07:04:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  8 Apr 2014 11:04:11 +0400
Message-Id: <1396940651-10513-12-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1396940651-10513-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 11/11] Fix grammar in comment
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
X-List-Received-Date: Tue, 08 Apr 2014 07:29:33 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i2c/smbus_eeprom.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i2c/smbus_eeprom.c b/hw/i2c/smbus_eeprom.c
index 86f35c1..72c09cb 100644
--- a/hw/i2c/smbus_eeprom.c
+++ b/hw/i2c/smbus_eeprom.c
@@ -71,7 +71,7 @@ static void eeprom_write_data(SMBusDevice *dev, uint8_t cmd, uint8_t *buf, int l
     printf("eeprom_write_byte: addr=0x%02x cmd=0x%02x val=0x%02x\n",
            dev->i2c.address, cmd, buf[0]);
 #endif
-    /* An page write operation is not a valid SMBus command.
+    /* A page write operation is not a valid SMBus command.
        It is a block write without a length byte.  Fortunately we
        get the full block anyway.  */
     /* TODO: Should this set the current location?  */
-- 
1.7.10.4


