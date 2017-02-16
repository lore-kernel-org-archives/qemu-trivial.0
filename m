Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cePpa-0003vF-Fr
	for mharc-qemu-trivial@gnu.org; Thu, 16 Feb 2017 12:26:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cePpX-0003qv-Uv
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2017 12:26:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1cePpX-0004Zv-3k
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2017 12:26:55 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:48542)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1cePpV-0004Y9-2B; Thu, 16 Feb 2017 12:26:53 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1cePpR-00039v-Co; Thu, 16 Feb 2017 17:26:49 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org, Michael Walle <michael@walle.cc>,
	qemu-trivial@nongnu.org
Date: Thu, 16 Feb 2017 17:26:48 +0000
Message-Id: <1487266008-13492-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH] lm32: milkymist-tmu2: fix a third integer
 overflow
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
X-List-Received-Date: Thu, 16 Feb 2017 17:26:57 -0000

Don't truncate the multiplication and do a 64 bit one instead
because the result is stored in a 64 bit variable.

This fixes a similar coverity warning to commits 237a8650d640 and
4382fa655498, in a similar way, and is the final third of the fix for
coverity CID 1167561 (hopefully!).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Third time lucky -- I checked and this is the last of these
multiply lines.

 hw/display/milkymist-tmu2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/milkymist-tmu2.c b/hw/display/milkymist-tmu2.c
index 7528665..59120dd 100644
--- a/hw/display/milkymist-tmu2.c
+++ b/hw/display/milkymist-tmu2.c
@@ -293,7 +293,7 @@ static void tmu2_start(MilkymistTMU2State *s)
     cpu_physical_memory_unmap(mesh, mesh_len, 0, mesh_len);
 
     /* Write back the OpenGL framebuffer to the QEMU framebuffer */
-    fb_len = 2 * s->regs[R_DSTHRES] * s->regs[R_DSTVRES];
+    fb_len = 2ULL * s->regs[R_DSTHRES] * s->regs[R_DSTVRES];
     fb = cpu_physical_memory_map(s->regs[R_DSTFBUF], &fb_len, 1);
     if (fb == NULL) {
         glDeleteTextures(1, &texture);
-- 
2.7.4


