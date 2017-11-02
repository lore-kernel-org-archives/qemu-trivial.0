Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eAJ94-00081V-4w
	for mharc-qemu-trivial@gnu.org; Thu, 02 Nov 2017 13:19:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lyan@suse.com>) id 1eAJ91-00080H-W3
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 13:19:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lyan@suse.com>) id 1eAJ91-0006qt-2d
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 13:19:07 -0400
Received: from smtp.nue.novell.com ([195.135.221.5]:56657)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lyan@suse.com>)
	id 1eAJ8v-0006gu-ET; Thu, 02 Nov 2017 13:19:01 -0400
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
	by smtp.nue.novell.com with ESMTP (TLS encrypted);
	Thu, 02 Nov 2017 18:18:58 +0100
Received: from linux-cj2a.gns.novell.com (nwb-a10-snat.microfocus.com
	[10.120.13.202])
	by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
	Thu, 02 Nov 2017 17:18:52 +0000
From: Liang Yan <lyan@suse.com>
To: sstabellini@kernel.org, anthony.perard@citrix.com,
	xen-devel@lists.xenproject.org, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Thu,  2 Nov 2017 13:18:46 -0400
Message-Id: <20171102171846.21445-1-lyan@suse.com>
X-Mailer: git-send-email 2.14.2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 195.135.221.5
Subject: [Qemu-trivial] [PATCH v2] hw/display/xenfb: Simulate auto-repeat
 key events
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
X-List-Received-Date: Thu, 02 Nov 2017 17:19:08 -0000

New tigervnc changes the way to send long pressed key,
from "down up down up ..." to "down down ... up", it only
affects xen pv console mode. I send a patch to latest
kernel side, but it may have a fix in qemu backend for
back compatible becase guest VMs may use very old kernel.
This patch inserts an up event after each regular key down
event to simulate an auto-repeat key event for xen keyboard
frontend driver.

Signed-off-by: Liang Yan <lyan@suse.com>
---
v2:
- exclude extended key
- change log comment

 hw/display/xenfb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index 8e2547ac05..1bc5b41ab7 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -292,6 +292,11 @@ static void xenfb_key_event(void *opaque, int scancode)
     }
     trace_xenfb_key_event(opaque, scancode2linux[scancode], down);
     xenfb_send_key(xenfb, down, scancode2linux[scancode]);
+
+    /* insert an up event for regular down key event */
+    if (down && !xenfb->extended) {
+        xenfb_send_key(xenfb, 0, scancode2linux[scancode]);
+    }
 }
 
 /*
-- 
2.14.2


