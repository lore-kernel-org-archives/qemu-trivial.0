Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YCCT1-00033X-3A
	for mharc-qemu-trivial@gnu.org; Fri, 16 Jan 2015 14:21:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dkoch@verizon.com>) id 1YCCSy-0002zg-Nx
	for qemu-trivial@nongnu.org; Fri, 16 Jan 2015 14:21:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dkoch@verizon.com>) id 1YCCSx-0000lj-QL
	for qemu-trivial@nongnu.org; Fri, 16 Jan 2015 14:21:56 -0500
Received: from fldsmtpe04.verizon.com ([140.108.26.143]:41285)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dkoch@verizon.com>)
	id 1YCCSm-0000gg-RH; Fri, 16 Jan 2015 14:21:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=verizon.com; i=dkoch@verizon.com; q=dns/txt; s=corp;
	t=1421436104; x=1452972104;
	h=from:to:cc:subject:date:message-id:in-reply-to: references;
	bh=A54H2QO8dDLqMjj+8AJOxAGKzIAkTUuZtSlhrCj8QzY=;
	b=nwJA+8/nj3TM4s/5N9QsJXLAmHVBqzpoyQczL4B66WebXi/m+NA0PIeL
	bsdtkw/FNIKvqyu7Hzaalk0/BbzKzqAL1BqFqAHntZ2i7vW/Lw5ZsLR13
	j1NgbvrQnlMnN4CmgN9Z5BxuXqnxENAanPP4gVRBAUJmwOdrUJNwICrvM c=;
X-IronPort-Anti-Spam-Filtered: false
Received: from unknown (HELO fldsmtpi02.verizon.com) ([166.68.71.144])
	by fldsmtpe04.verizon.com with ESMTP; 16 Jan 2015 19:21:43 +0000
X-VzAPP: 1
X-IronPort-AV: E=Sophos;i="5.09,412,1418083200"; d="scan'208";a="915457492"
Received: from unknown (HELO yoyo.cloudswitch.com) ([208.52.205.215])
	by fldsmtpi02.verizon.com with ESMTP; 16 Jan 2015 19:21:42 +0000
From: Don Koch <dkoch@verizon.com>
To: qemu-devel@nongnu.org
Date: Fri, 16 Jan 2015 14:21:36 -0500
Message-Id: <1421436099-2487-2-git-send-email-dkoch@verizon.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1421436099-2487-1-git-send-email-dkoch@verizon.com>
References: <1421436099-2487-1-git-send-email-dkoch@verizon.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 140.108.26.143
Cc: qemu-trivial@nongnu.org, Don Koch <dkoch@verizon.com>
Subject: [Qemu-trivial] [PATCH 1/4] Add tracing to xenfb.
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
X-List-Received-Date: Fri, 16 Jan 2015 19:21:58 -0000

Signed-off-by: Don Koch <dkoch@verizon.com>
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
index 8acbcce..0f26f06 100644
--- a/trace-events
+++ b/trace-events
@@ -202,6 +202,10 @@ hd_geometry_guess(void *blk, uint32_t cyls, uint32_t heads, uint32_t secs, int t
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
1.8.3.1


