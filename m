Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cibpc-0006I7-HQ
	for mharc-qemu-trivial@gnu.org; Tue, 28 Feb 2017 02:04:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47564)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cibpZ-0006Et-Jn
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 02:04:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cibpY-0000Pn-Pi
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 02:04:17 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40398)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cibpU-0000Oa-Gx; Tue, 28 Feb 2017 02:04:12 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id ADF0C43578;
	Tue, 28 Feb 2017 10:04:11 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 2C9003D3;
	Tue, 28 Feb 2017 09:45:01 +0300 (MSK)
Received: (nullmailer pid 19639 invoked by uid 1000);
	Tue, 28 Feb 2017 06:44:59 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 28 Feb 2017 09:44:55 +0300
Message-Id: <3d74ee7dcae57b93a64737b954d76cf96236a367.1488264243.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
References: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
References: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 12/14] lm32: milkymist-tmu2: fix a third
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
X-List-Received-Date: Tue, 28 Feb 2017 07:04:18 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Don't truncate the multiplication and do a 64 bit one instead
because the result is stored in a 64 bit variable.

This fixes a similar coverity warning to commits 237a8650d640 and
4382fa655498, in a similar way, and is the final third of the fix for
coverity CID 1167561 (hopefully!).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Acked-by: Michael Walle <michael@walle.cc>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/milkymist-tmu2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/milkymist-tmu2.c b/hw/display/milkymist-tmu2.c
index 7528665..59120dd 100644
--- a/hw/display/milkymist-tmu2.c
+++ b/hw/display/milkymist-tmu2.c
@@ -293,7 +293,7 @@ static void tmu2_start(MilkymistTMU2State *s)
     cpu_physical_memory_unmap(mesh, mesh_len, 0, mesh_len);
=20
     /* Write back the OpenGL framebuffer to the QEMU framebuffer */
-    fb_len =3D 2 * s->regs[R_DSTHRES] * s->regs[R_DSTVRES];
+    fb_len =3D 2ULL * s->regs[R_DSTHRES] * s->regs[R_DSTVRES];
     fb =3D cpu_physical_memory_map(s->regs[R_DSTFBUF], &fb_len, 1);
     if (fb =3D=3D NULL) {
         glDeleteTextures(1, &texture);
--=20
2.1.4


