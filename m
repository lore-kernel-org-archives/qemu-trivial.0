Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buS7i-0002eZ-96
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2016 18:35:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56888)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1buS7g-0002cL-0P
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 18:35:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1buS7d-0002cD-UQ
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 18:35:38 -0400
Received: from ssl.serverraum.org ([213.133.101.245]:53226)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1buS7d-0002c3-IG
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 18:35:37 -0400
Received: from apollo.fritz.box (ip5f585ef2.dynamic.kabel-deutschland.de
	[95.88.94.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 50BD822278;
	Thu, 13 Oct 2016 00:35:34 +0200 (CEST)
Authentication-Results: ssl.serverraum.org; dmarc=none header.from=walle.cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
	s=mail2016061301; t=1476311734;
	bh=suyhwkQm5lfLbwyfMuk/v2NbwDyjOP9g1ihsbB3tTDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A9SwLiA/WCvmhJ/Jb8SSw/w0KMvDFjqMAJoprQYeDM4bkT1/GCmy8ICItjG0NqqDQ
	HgA76khAyXt5jETVrpkZSUPGmqBkbEkVE+O/9d0ueaT7Mx4s5AT08Q+tz3Kkb/w4Wr
	0BTIGR8sRiXpegs/LetBeQCnCU3VjQFza8bX/UNg=
From: Michael Walle <michael@walle.cc>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Walle <michael@walle.cc>
Date: Thu, 13 Oct 2016 00:35:07 +0200
Message-Id: <1476311708-14792-3-git-send-email-michael@walle.cc>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1476311708-14792-1-git-send-email-michael@walle.cc>
References: <1476311708-14792-1-git-send-email-michael@walle.cc>
X-Virus-Scanned: clamav-milter 0.99.2 at web
X-Virus-Status: Clean
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 213.133.101.245
Subject: [Qemu-trivial] [PATCH 3/4] lm32: milkymist-tmu2: fix integer
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
X-List-Received-Date: Wed, 12 Oct 2016 22:35:41 -0000

Don't truncate the multiplication and do a 64 bit one instead because
because the result is stored in a 64 bit variable.

Spotted by coverity, CID 1167561.

Signed-off-by: Michael Walle <michael@walle.cc>
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


