Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X4EEL-0007OR-BB
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jul 2014 15:05:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1X4EEJ-0007MU-UN
	for qemu-trivial@nongnu.org; Mon, 07 Jul 2014 15:05:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1X4EEJ-00049F-5k
	for qemu-trivial@nongnu.org; Mon, 07 Jul 2014 15:05:35 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:47159)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1X4EEH-000490-6B; Mon, 07 Jul 2014 15:05:33 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id E108417FA16; Mon,  7 Jul 2014 21:05:30 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Mon,  7 Jul 2014 21:05:30 +0200
Message-Id: <1404759930-29595-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH] hw/usb: Add missing 'static' attribute
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
X-List-Received-Date: Mon, 07 Jul 2014 19:05:36 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/usb/hcd-ohci.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index cace945..13afdf5 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -2021,7 +2021,7 @@ static const VMStateDescription vmstate_ohci_eof_timer = {
     },
 };
 
-const VMStateDescription vmstate_ohci_state = {
+static const VMStateDescription vmstate_ohci_state = {
     .name = "ohci-core",
     .version_id = 1,
     .minimum_version_id = 1,
-- 
1.7.10.4


