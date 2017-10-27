Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e8AzT-00055i-Oy
	for mharc-qemu-trivial@gnu.org; Fri, 27 Oct 2017 16:12:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lyan@suse.com>) id 1e8AzR-00054c-N5
	for qemu-trivial@nongnu.org; Fri, 27 Oct 2017 16:12:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lyan@suse.com>) id 1e8AzQ-0001PN-Qf
	for qemu-trivial@nongnu.org; Fri, 27 Oct 2017 16:12:25 -0400
Received: from smtp.nue.novell.com ([195.135.221.5]:33332)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lyan@suse.com>)
	id 1e8AzM-0001GC-JY; Fri, 27 Oct 2017 16:12:20 -0400
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
	by smtp.nue.novell.com with ESMTP (TLS encrypted);
	Fri, 27 Oct 2017 22:12:16 +0200
Received: from linux-cj2a.gns.novell.com (nwb-a10-snat.microfocus.com
	[10.120.13.202])
	by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
	Fri, 27 Oct 2017 21:12:12 +0100
From: Liang Yan <lyan@suse.com>
To: sstabellini@kernel.org, anthony.perard@citrix.com,
	xen-devel@lists.xenproject.org, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Fri, 27 Oct 2017 16:12:07 -0400
Message-Id: <20171027201207.5979-1-lyan@suse.com>
X-Mailer: git-send-email 2.14.2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 195.135.221.5
Subject: [Qemu-trivial] [PATCH] hw/display/xenfb: Simulate auto-repeat key
 events
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
X-List-Received-Date: Fri, 27 Oct 2017 20:12:26 -0000

New tigervnc server changes the way to send long pressed key,
from "down up down up ..." to "down down ... up". So we insert
an up event after each key down event to simulate auto-repeat
key events for xen keyboard frontend driver.

Signed-off-by: Liang Yan <lyan@suse.com>
---
 hw/display/xenfb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index 8e2547ac05..a5f787a3f3 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -292,6 +292,9 @@ static void xenfb_key_event(void *opaque, int scancode)
     }
     trace_xenfb_key_event(opaque, scancode2linux[scancode], down);
     xenfb_send_key(xenfb, down, scancode2linux[scancode]);
+    if (down) { /* simulate auto-repeat key events */
+    xenfb_send_key(xenfb, 0, scancode2linux[scancode]);
+    }
 }
 
 /*
-- 
2.14.2


