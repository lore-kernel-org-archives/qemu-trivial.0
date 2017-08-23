Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dkgeB-0002cq-Ns
	for mharc-qemu-trivial@gnu.org; Wed, 23 Aug 2017 21:09:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lyan@suse.com>) id 1dkXHi-0000pu-Uh
	for qemu-trivial@nongnu.org; Wed, 23 Aug 2017 11:09:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lyan@suse.com>) id 1dkXHi-000386-3t
	for qemu-trivial@nongnu.org; Wed, 23 Aug 2017 11:09:34 -0400
Received: from smtp.nue.novell.com ([195.135.221.5]:58820)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lyan@suse.com>)
	id 1dkXHb-00032b-Ip; Wed, 23 Aug 2017 11:09:27 -0400
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
	by smtp.nue.novell.com with ESMTP (TLS encrypted);
	Wed, 23 Aug 2017 17:09:24 +0200
Received: from linux-gp66.suse.de (nwb-a10-snat.microfocus.com [10.120.13.202])
	by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
	Wed, 23 Aug 2017 16:09:10 +0100
From: Liang Yan <lyan@suse.com>
To: sstabellini@kernel.org,
	anthony.perard@citrix.com
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	xen-devel@lists.xenproject.org
Date: Wed, 23 Aug 2017 11:09:03 -0400
Message-Id: <20170823150903.19982-1-lyan@suse.com>
X-Mailer: git-send-email 2.14.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 195.135.221.5
X-Mailman-Approved-At: Wed, 23 Aug 2017 21:09:22 -0400
Subject: [Qemu-trivial] [PATCH] hw/display/xenfb.c: Add trace_xenfb_key_event
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
X-List-Received-Date: Wed, 23 Aug 2017 15:09:36 -0000

It may be better to add a trace event to monitor the last moment of
a key event from QEMU to guest VM

Signed-off-by: Liang Yan <lyan@suse.com>
---
 hw/display/trace-events | 1 +
 hw/display/xenfb.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/hw/display/trace-events b/hw/display/trace-events
index ed8cca0755..da498c1def 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -6,6 +6,7 @@ jazz_led_write(uint64_t addr, uint8_t new) "write addr=0x%"PRIx64": 0x%x"
 
 # hw/display/xenfb.c
 xenfb_mouse_event(void *opaque, int dx, int dy, int dz, int button_state, int abs_pointer_wanted) "%p x %d y %d z %d bs 0x%x abs %d"
+xenfb_key_event(void *opaque, int scancode, int button_state) "%p scancode %d bs 0x%x"
 xenfb_input_connected(void *xendev, int abs_pointer_wanted) "%p abs %d"
 
 # hw/display/g364fb.c
diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index df8b78f6f4..afc43f33a2 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -290,6 +290,8 @@ static void xenfb_key_event(void *opaque, int scancode)
 	scancode |= 0x80;
 	xenfb->extended = 0;
     }
+
+    trace_xenfb_key_event(opaque, scancode2linux[scancode], down);
     xenfb_send_key(xenfb, down, scancode2linux[scancode]);
 }
 
-- 
2.14.1


