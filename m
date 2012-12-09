Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ThoTf-00026T-1J
	for mharc-qemu-trivial@gnu.org; Sun, 09 Dec 2012 16:31:59 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41823)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1ThoTb-0001uy-HL
	for qemu-trivial@nongnu.org; Sun, 09 Dec 2012 16:31:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1ThoTY-0004UQ-GT
	for qemu-trivial@nongnu.org; Sun, 09 Dec 2012 16:31:55 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:41528)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1ThoTT-0004M3-2U; Sun, 09 Dec 2012 16:31:47 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	1F617728001C; Sun,  9 Dec 2012 22:31:45 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 8wbzzmd+clp1; Sun,  9 Dec 2012 22:31:44 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 6E50A7280048; Sun,  9 Dec 2012 22:31:44 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sun,  9 Dec 2012 22:31:30 +0100
Message-Id: <1355088690-4933-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Kevin Wolf <kwolf@redhat.com>, Hans de Goede <hdegoede@redhat.com>,
	qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] Fix spelling (transfered -> transferred,
	supressing -> suppressing)
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
X-List-Received-Date: Sun, 09 Dec 2012 21:31:58 -0000

These spellings were found and fixed by codespell.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/usb.h                      |    6 +++---
 tests/qemu-iotests/iotests.py |    2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/usb.h b/hw/usb.h
index 7d6de69..f05eb17 100644
--- a/hw/usb.h
+++ b/hw/usb.h
@@ -282,7 +282,7 @@ typedef struct USBDeviceClass {
      * Called from handle_packet().
      *
      * Status gets stored in p->status, and if p->status == USB_RET_SUCCESS
-     * then the number of bytes transfered is stored in p->actual_length
+     * then the number of bytes transferred is stored in p->actual_length
      */
     void (*handle_control)(USBDevice *dev, USBPacket *p, int request, int value,
                            int index, int length, uint8_t *data);
@@ -292,7 +292,7 @@ typedef struct USBDeviceClass {
      * Called from handle_packet().
      *
      * Status gets stored in p->status, and if p->status == USB_RET_SUCCESS
-     * then the number of bytes transfered is stored in p->actual_length
+     * then the number of bytes transferred is stored in p->actual_length
      */
     void (*handle_data)(USBDevice *dev, USBPacket *p);
 
@@ -358,7 +358,7 @@ struct USBPacket {
     bool short_not_ok;
     bool int_req;
     int status; /* USB_RET_* status code */
-    int actual_length; /* Number of bytes actually transfered */
+    int actual_length; /* Number of bytes actually transferred */
     /* Internal use by the USB layer.  */
     USBPacketState state;
     USBCombinedPacket *combined;
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index b2eaf20..0be5c7e 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -43,7 +43,7 @@ def qemu_img(*args):
     return subprocess.call(qemu_img_args + list(args), stdin=devnull, stdout=devnull)
 
 def qemu_img_verbose(*args):
-    '''Run qemu-img without supressing its output and return the exit code'''
+    '''Run qemu-img without suppressing its output and return the exit code'''
     return subprocess.call(qemu_img_args + list(args))
 
 def qemu_io(*args):
-- 
1.7.10.4


