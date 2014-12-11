Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz8I8-0007of-1C
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 13:16:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8Hz-0007Z0-04
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:16:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8Hu-0002uW-2L
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:16:34 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:59428)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xz8Hi-0002jN-8X; Thu, 11 Dec 2014 13:16:18 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5215041D42;
	Thu, 11 Dec 2014 21:16:16 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 298C78BE;
	Thu, 11 Dec 2014 21:16:16 +0300 (MSK)
Received: (nullmailer pid 22966 invoked by uid 1000);
	Thu, 11 Dec 2014 18:16:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Dec 2014 21:15:54 +0300
Message-Id: <7251711472a8b406640a62f25f860628d3056bb1.1418321644.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
References: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	lijun <junmuzi@gmail.com>
Subject: [Qemu-trivial] [PULL 06/20] usb: delete redundant brackets in
	usb_host_handle_control()
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
X-List-Received-Date: Thu, 11 Dec 2014 18:16:40 -0000

From: lijun <junmuzi@gmail.com>

When see usb codes, find there are redundant brackets !((udev->port->speedmask
& USB_SPEED_MASK_SUPER)) here. So delete it.

Signed-off-by: Jun Li <junmuzi@gmail.com>
Reviewed-by: Fam Zheng <famz@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/usb/host-libusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index a5f9dab..cff4f7c 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -1237,7 +1237,7 @@ static void usb_host_handle_control(USBDevice *udev, USBPacket *p,
     /* Fix up USB-3 ep0 maxpacket size to allow superspeed connected devices
      * to work redirected to a not superspeed capable hcd */
     if (udev->speed == USB_SPEED_SUPER &&
-        !((udev->port->speedmask & USB_SPEED_MASK_SUPER)) &&
+        !(udev->port->speedmask & USB_SPEED_MASK_SUPER) &&
         request == 0x8006 && value == 0x100 && index == 0) {
         r->usb3ep0quirk = true;
     }
-- 
2.1.3


