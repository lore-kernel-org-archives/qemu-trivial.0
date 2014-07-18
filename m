Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X88r2-0007s9-KX
	for mharc-qemu-trivial@gnu.org; Fri, 18 Jul 2014 10:09:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36986)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X88qw-0007fb-9T
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 10:09:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1X88qr-0001mQ-7X
	for qemu-trivial@nongnu.org; Fri, 18 Jul 2014 10:09:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48098)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1X88qb-0001d4-29; Fri, 18 Jul 2014 10:09:17 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C0D734386B;
	Fri, 18 Jul 2014 18:09:14 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B32CD666;
	Fri, 18 Jul 2014 18:09:14 +0400 (MSK)
Received: (nullmailer pid 629 invoked by uid 1000);
	Fri, 18 Jul 2014 14:09:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 18 Jul 2014 18:09:10 +0400
Message-Id: <1405692553-564-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1405692553-564-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1405692553-564-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 5/8] hw/usb: Add missing 'static' attribute
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
X-List-Received-Date: Fri, 18 Jul 2014 14:09:43 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


