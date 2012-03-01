Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S32Yf-0007iO-9H
	for mharc-qemu-trivial@gnu.org; Thu, 01 Mar 2012 04:44:21 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44374)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1S32YW-0007LN-MR
	for qemu-trivial@nongnu.org; Thu, 01 Mar 2012 04:44:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1S32YQ-0006t1-Gl
	for qemu-trivial@nongnu.org; Thu, 01 Mar 2012 04:44:12 -0500
Received: from thoth.sbs.de ([192.35.17.2]:19260)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1S32YI-0006n7-EL; Thu, 01 Mar 2012 04:43:58 -0500
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.13.6/8.13.6) with ESMTP id q219hrjb023025;
	Thu, 1 Mar 2012 10:43:53 +0100
Received: from mchn199C.mchp.siemens.de ([139.22.132.11])
	by mail1.siemens.de (8.13.6/8.13.6) with SMTP id q219hqQZ007114;
	Thu, 1 Mar 2012 10:43:52 +0100
Message-ID: <4F4F44D6.2020907@siemens.com>
Date: Thu, 01 Mar 2012 10:43:50 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>, qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.2
Cc: Gerd Hoffmann <kraxel@redhat.com>, Roy Tam <roytam@gmail.com>
Subject: [Qemu-trivial] [PATCH] usb: Fix signature of stub
	usb_host_device_open
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
X-List-Received-Date: Thu, 01 Mar 2012 09:44:19 -0000

This was a breakage of 3741715cf2.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 usb-stub.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/usb-stub.c b/usb-stub.c
index 9c3fcea..b4e10c1 100644
--- a/usb-stub.c
+++ b/usb-stub.c
@@ -41,7 +41,7 @@ void usb_host_info(Monitor *mon)
 }
 
 /* XXX: modify configure to compile the right host driver */
-USBDevice *usb_host_device_open(const char *devname)
+USBDevice *usb_host_device_open(USBBus *bus, const char *devname)
 {
     return NULL;
 }
-- 
1.7.3.4

