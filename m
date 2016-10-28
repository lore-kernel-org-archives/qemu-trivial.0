Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c08vz-0004H0-Il
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:19:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c08vw-0004Dx-TR
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:19:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c08vw-0004b3-3C
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:19:04 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55165)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c08vr-0004U1-Kl; Fri, 28 Oct 2016 11:18:59 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 86D434372E;
	Fri, 28 Oct 2016 18:18:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 59EBAB49;
	Fri, 28 Oct 2016 18:18:56 +0300 (MSK)
Received: (nullmailer pid 6058 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Walle <michael@walle.cc>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 28 Oct 2016 18:18:38 +0300
Message-Id: <237a8650d640adfb00b65358891fed0e84edfd09.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 07/23] lm32: milkymist-tmu2: fix integer
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
X-List-Received-Date: Fri, 28 Oct 2016 15:19:05 -0000

From: Michael Walle <michael@walle.cc>

Don't truncate the multiplication and do a 64 bit one instead because
because the result is stored in a 64 bit variable.

Spotted by coverity, CID 1167561.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/milkymist-tmu2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/milkymist-tmu2.c b/hw/display/milkymist-tmu2.c
index 9c00184..5c666f9 100644
--- a/hw/display/milkymist-tmu2.c
+++ b/hw/display/milkymist-tmu2.c
@@ -213,7 +213,7 @@ static void tmu2_start(MilkymistTMU2State *s)
     /* Read the QEMU source framebuffer into an OpenGL texture */
     glGenTextures(1, &texture);
     glBindTexture(GL_TEXTURE_2D, texture);
-    fb_len = 2*s->regs[R_TEXHRES]*s->regs[R_TEXVRES];
+    fb_len = 2ULL * s->regs[R_TEXHRES] * s->regs[R_TEXVRES];
     fb = cpu_physical_memory_map(s->regs[R_TEXFBUF], &fb_len, 0);
     if (fb == NULL) {
         glDeleteTextures(1, &texture);
-- 
2.1.4


