Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZbQfe-00080x-V6
	for mharc-qemu-trivial@gnu.org; Mon, 14 Sep 2015 06:07:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZbQfc-0007y8-UW
	for qemu-trivial@nongnu.org; Mon, 14 Sep 2015 06:07:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZbQfc-0008Oa-5v
	for qemu-trivial@nongnu.org; Mon, 14 Sep 2015 06:07:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40542)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZbQfX-0008M8-04; Mon, 14 Sep 2015 06:07:27 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 7FD068CF76;
	Mon, 14 Sep 2015 10:07:26 +0000 (UTC)
Received: from donizetti.redhat.com (ovpn-112-65.ams2.redhat.com
	[10.36.112.65])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8EA7OCf021726; Mon, 14 Sep 2015 06:07:25 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 14 Sep 2015 12:07:22 +0200
Message-Id: <1442225242-27908-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] pc: check for underflow in load_linux
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
X-List-Received-Date: Mon, 14 Sep 2015 10:07:33 -0000

If (setup_size+1)*512 is small enough, kernel_size -= setup_size can allocate
a huge amount of memory.  Avoid that.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/pc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 56aecce..6a312bd 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -986,6 +986,10 @@ static void load_linux(PCMachineState *pcms,
         setup_size = 4;
     }
     setup_size = (setup_size+1)*512;
+    if (setup_size > kernel_size) {
+        fprintf(stderr, "qemu: invalid kernel header\n");
+        exit(1);
+    }
     kernel_size -= setup_size;
 
     setup  = g_malloc(setup_size);
-- 
2.5.0


