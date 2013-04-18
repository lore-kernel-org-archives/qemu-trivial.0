Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1USmqi-0002Dv-W6
	for mharc-qemu-trivial@gnu.org; Thu, 18 Apr 2013 07:17:57 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1USmqe-00027Y-LI
	for qemu-trivial@nongnu.org; Thu, 18 Apr 2013 07:17:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1USmqY-0004pU-Rt
	for qemu-trivial@nongnu.org; Thu, 18 Apr 2013 07:17:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37798)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1USmqR-0004o8-UC; Thu, 18 Apr 2013 07:17:40 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id ADAFCA167A;
	Thu, 18 Apr 2013 15:17:38 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id EA9213D8; Thu, 18 Apr 2013 15:17:36 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Gerd Hoffmann <kraxel@redhat.com>
Date: Thu, 18 Apr 2013 15:17:33 +0400
Message-Id: <1366283853-31785-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] allow usage of older libusb which didn't
	define LIBUSB_LOG_LEVEL_WARNING
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
X-List-Received-Date: Thu, 18 Apr 2013 11:17:54 -0000

Older libusb does not have any LIBUSB_LOG_LEVEL_* definitions.
Since we expose these values as integers anyway, just use the
right define if the constant isn't defined.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/usb/host-libusb.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index 29f35b3..78c315f 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -1251,6 +1251,9 @@ static Property usb_host_dev_properties[] = {
     DEFINE_PROP_UINT32("isobufs",  USBHostDevice, iso_urb_count,    4),
     DEFINE_PROP_UINT32("isobsize", USBHostDevice, iso_urb_frames,   32),
     DEFINE_PROP_INT32("bootindex", USBHostDevice, bootindex,        -1),
+#ifndef LIBUSB_LOG_LEVEL_WARNING /* older libusb didn't define these */
+#define LIBUSB_LOG_LEVEL_WARNING 2
+#endif
     DEFINE_PROP_UINT32("loglevel",  USBHostDevice, loglevel,
                        LIBUSB_LOG_LEVEL_WARNING),
     DEFINE_PROP_BIT("pipeline",    USBHostDevice, options,
-- 
1.7.10.4


