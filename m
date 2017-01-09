Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cQd4Y-0001rW-Qh
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jan 2017 11:45:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cQd4W-0001pX-16
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2017 11:45:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cQd4V-0006FP-D8
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2017 11:45:24 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48099)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cQd4L-0006AY-Ks; Mon, 09 Jan 2017 11:45:13 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cQd4I-0001tn-F2; Mon, 09 Jan 2017 16:45:10 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Mon,  9 Jan 2017 16:45:09 +0000
Message-Id: <1483980309-30821-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH] hw/display/framebuffer.c: Avoid overflow for
 framebuffers > 4GB
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
X-List-Received-Date: Mon, 09 Jan 2017 16:45:25 -0000

Coverity points out that calculating src_len by multiplying
src_width by rows could overflow. This can only happen in
the implausible case of a framebuffer larger than 4GB, but
we may as well fix it, placating Coverity. (CID1005515)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/display/framebuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/framebuffer.c b/hw/display/framebuffer.c
index df51358..25aa46c 100644
--- a/hw/display/framebuffer.c
+++ b/hw/display/framebuffer.c
@@ -78,7 +78,7 @@ void framebuffer_update_display(
 
     i = *first_row;
     *first_row = -1;
-    src_len = src_width * rows;
+    src_len = (hwaddr)src_width * rows;
 
     mem = mem_section->mr;
     if (!mem) {
-- 
2.7.4


