Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VSkxv-0006v4-Pp
	for mharc-qemu-trivial@gnu.org; Sun, 06 Oct 2013 05:49:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49728)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSkxp-0006fi-39
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:49:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSkxk-0006T2-6r
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:49:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47356)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VSkxa-0006PT-6Q; Sun, 06 Oct 2013 05:49:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3EA5A40D01;
	Sun,  6 Oct 2013 13:49:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id C946251E;
	Sun,  6 Oct 2013 13:33:03 +0400 (MSK)
Received: (nullmailer pid 25818 invoked by uid 1000);
	Sun, 06 Oct 2013 09:33:02 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sun,  6 Oct 2013 13:32:54 +0400
Message-Id: <1381051979-25742-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: =?UTF-8?q?J=C3=A1n=20Vesel=C3=BD?= <jano.vesely@gmail.com>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 09/14] pci-ohci: Add missing 'break' in
	ohci_service_td
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
X-List-Received-Date: Sun, 06 Oct 2013 09:49:30 -0000

From: J=C3=A1n Vesel=C3=BD <jano.vesely@gmail.com>

Device communication errors need to be reported to driver.
Add a debug message while at it.

Signed-off-by: Jan Vesely <jano.vesely@gmail.com>
Acked-by: Gerd Hoffmann <kraxel@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/usb/hcd-ohci.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
index 35f0878..0396e33 100644
--- a/hw/usb/hcd-ohci.c
+++ b/hw/usb/hcd-ohci.c
@@ -1143,7 +1143,9 @@ static int ohci_service_td(OHCIState *ohci, struct =
ohci_ed *ed)
             switch (ret) {
             case USB_RET_IOERROR:
             case USB_RET_NODEV:
+                DPRINTF("usb-ohci: got DEV ERROR\n");
                 OHCI_SET_BM(td.flags, TD_CC, OHCI_CC_DEVICENOTRESPONDING=
);
+                break;
             case USB_RET_NAK:
                 DPRINTF("usb-ohci: got NAK\n");
                 return 1;
--=20
1.7.10.4


