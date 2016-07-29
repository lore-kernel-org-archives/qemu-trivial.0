Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bT1ls-0006FT-6T
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jul 2016 02:59:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1bT1lq-0006D3-Al
	for qemu-trivial@nongnu.org; Fri, 29 Jul 2016 02:59:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1bT1lo-0005Kv-Fy
	for qemu-trivial@nongnu.org; Fri, 29 Jul 2016 02:59:45 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:35370)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1bT1lh-0005IN-Aq; Fri, 29 Jul 2016 02:59:37 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id CCCC117F787; Fri, 29 Jul 2016 08:59:34 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Gerd Hoffmann <kraxel@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Stefan Weil <sw@weilnetz.de>
Date: Fri, 29 Jul 2016 08:59:29 +0200
Message-Id: <1469775569-7869-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.221.198.45
Subject: [Qemu-trivial] [PATCH for-2.7] wxx: Fix compiler warning for
 host-libusb.c
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jul 2016 06:59:47 -0000

The local variable i is unsed for Windows.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/usb/host-libusb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/usb/host-libusb.c b/hw/usb/host-libusb.c
index c632fd8..e94672c 100644
--- a/hw/usb/host-libusb.c
+++ b/hw/usb/host-libusb.c
@@ -235,7 +235,7 @@ static int usb_host_init(void)
 #ifndef CONFIG_WIN32
     const struct libusb_pollfd **poll;
 #endif
-    int i, rc;
+    int rc;
 
     if (ctx) {
         return 0;
@@ -253,6 +253,7 @@ static int usb_host_init(void)
                                 ctx);
     poll = libusb_get_pollfds(ctx);
     if (poll) {
+        int i;
         for (i = 0; poll[i] != NULL; i++) {
             usb_host_add_fd(poll[i]->fd, poll[i]->events, ctx);
         }
-- 
2.1.4


