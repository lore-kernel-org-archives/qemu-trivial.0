Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL5bP-0005nD-Uk
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 02:51:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39073)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL5bN-0005i4-5J
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:51:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL5bL-00047M-HT
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:51:21 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL5b6-00041P-VQ; Tue, 10 Feb 2015 02:51:05 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A2F3941830;
	Tue, 10 Feb 2015 10:51:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 436EA933;
	Tue, 10 Feb 2015 09:34:44 +0300 (MSK)
Received: (nullmailer pid 9338 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:33:52 +0300
Message-Id: <91043dadc47cfb939e34eb9e02ee595b16100808.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Don Koch <dkoch@verizon.com>
Subject: [Qemu-trivial] [PULL 03/46] Add tracing to xenfb.
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
X-List-Received-Date: Tue, 10 Feb 2015 07:51:22 -0000

From: Don Koch <dkoch@verizon.com>

Signed-off-by: Don Koch <dkoch@verizon.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/xenfb.c | 5 +++++
 trace-events       | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index 8a61e95..5e324ef 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -45,6 +45,8 @@
 #include <xen/io/kbdif.h>
 #include <xen/io/protocols.h>
 
+#include "trace.h"
+
 #ifndef BTN_LEFT
 #define BTN_LEFT 0x110 /* from <linux/input.h> */
 #endif
@@ -324,6 +326,8 @@ static void xenfb_mouse_event(void *opaque,
     int dh = surface_height(surface);
     int i;
 
+    trace_xenfb_mouse_event(opaque, dx, dy, dz, button_state,
+                            xenfb->abs_pointer_wanted);
     if (xenfb->abs_pointer_wanted)
 	xenfb_send_position(xenfb,
 			    dx * (dw - 1) / 0x7fff,
@@ -380,6 +384,7 @@ static void input_connected(struct XenDevice *xendev)
     if (in->qmouse) {
         qemu_remove_mouse_event_handler(in->qmouse);
     }
+    trace_xenfb_input_connected(xendev, in->abs_pointer_wanted);
     in->qmouse = qemu_add_mouse_event_handler(xenfb_mouse_event, in,
 					      in->abs_pointer_wanted,
 					      "Xen PVFB Mouse");
diff --git a/trace-events b/trace-events
index 57f357f..ce1bf60 100644
--- a/trace-events
+++ b/trace-events
@@ -203,6 +203,10 @@ hd_geometry_guess(void *blk, uint32_t cyls, uint32_t heads, uint32_t secs, int t
 jazz_led_read(uint64_t addr, uint8_t val) "read addr=0x%"PRIx64": 0x%x"
 jazz_led_write(uint64_t addr, uint8_t new) "write addr=0x%"PRIx64": 0x%x"
 
+# hw/display/xenfb.c
+xenfb_mouse_event(void *opaque, int dx, int dy, int dz, int button_state, int abs_pointer_wanted) "%p x %d y %d z %d bs %#x abs %d"
+xenfb_input_connected(void *xendev, int abs_pointer_wanted) "%p abs %d"
+
 # hw/net/lance.c
 lance_mem_readw(uint64_t addr, uint32_t ret) "addr=%"PRIx64"val=0x%04x"
 lance_mem_writew(uint64_t addr, uint32_t val) "addr=%"PRIx64"val=0x%04x"
-- 
2.1.4


