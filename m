Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WXDZz-000746-9d
	for mharc-qemu-trivial@gnu.org; Mon, 07 Apr 2014 13:43:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WXDZt-0006qN-4O
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 13:43:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WXDZo-0004xc-3k
	for qemu-trivial@nongnu.org; Mon, 07 Apr 2014 13:43:25 -0400
Received: from v220110690675601.yourvserver.net ([37.221.199.173]:55128)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1WXDZd-0004vX-Q8; Mon, 07 Apr 2014 13:43:09 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	318FC1182EB3; Mon,  7 Apr 2014 19:43:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id VOVKSIl1_NA9; Mon,  7 Apr 2014 19:43:02 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 3F6A81182EB4; Mon,  7 Apr 2014 19:43:02 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Mon,  7 Apr 2014 19:42:59 +0200
Message-Id: <1396892580-3216-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 37.221.199.173
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] Fix grammar in comment
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
X-List-Received-Date: Mon, 07 Apr 2014 17:43:30 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
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


