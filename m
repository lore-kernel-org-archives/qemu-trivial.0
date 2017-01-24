Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVykc-0004to-6G
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 05:54:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58845)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVyka-0004rW-Az
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 05:54:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVykZ-0006UZ-Kp
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 05:54:56 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36527)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVykU-0006SR-72; Tue, 24 Jan 2017 05:54:50 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9D0AF4211B;
	Tue, 24 Jan 2017 13:54:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 45AC658A;
	Tue, 24 Jan 2017 12:39:44 +0300 (MSK)
Received: (nullmailer pid 12645 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:22 +0300
Message-Id: <d4628acb08ae6852c23605736d61649df6ef20d2.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 18/31] lm32: milkymist-tmu2: fix another
 integer overflow
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
X-List-Received-Date: Tue, 24 Jan 2017 10:54:57 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Don't truncate the multiplication and do a 64 bit one instead
because the result is stored in a 64 bit variable.

This fixes a similar coverity warning to commit 237a8650d640,
in a similar way, and is the other half of the fix for
coverity CID 1167561.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Michael Walle <michael@walle.cc>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/milkymist-tmu2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/milkymist-tmu2.c b/hw/display/milkymist-tmu2.c
index 5c666f9..920374b 100644
--- a/hw/display/milkymist-tmu2.c
+++ b/hw/display/milkymist-tmu2.c
@@ -257,7 +257,7 @@ static void tmu2_start(MilkymistTMU2State *s)
     glColor4f(m, m, m, (float)(s->regs[R_ALPHA] + 1) / 64.0f);
 
     /* Read the QEMU dest. framebuffer into the OpenGL framebuffer */
-    fb_len = 2 * s->regs[R_DSTHRES] * s->regs[R_DSTVRES];
+    fb_len = 2ULL * s->regs[R_DSTHRES] * s->regs[R_DSTVRES];
     fb = cpu_physical_memory_map(s->regs[R_DSTFBUF], &fb_len, 0);
     if (fb == NULL) {
         glDeleteTextures(1, &texture);
-- 
2.1.4


