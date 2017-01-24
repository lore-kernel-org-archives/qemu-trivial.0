Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVxet-0002Bx-45
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 04:44:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxeo-00025s-KX
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:44:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxen-0002eN-QE
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:44:54 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43729)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVxei-0002cM-By; Tue, 24 Jan 2017 04:44:48 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 115A842102;
	Tue, 24 Jan 2017 12:44:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id D7CA8572;
	Tue, 24 Jan 2017 12:39:43 +0300 (MSK)
Received: (nullmailer pid 12643 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:21 +0300
Message-Id: <7d628e2c05e0fd2da04f618ba41068a7c11b2a7d.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 17/31] hw/i386/kvmvapic: Remove dead code in
 patch_hypercalls()
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
X-List-Received-Date: Tue, 24 Jan 2017 09:44:55 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The patch_hypercalls() function sets up a 'patches'
variable and checks it at the end of the function, but
never modifies it in the middle. Remove this dead code,
which seems to have been present since the function was
added in commit e5ad936b0fd7 in 2012.

(Spotted by Coverity: CID 1005581.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/kvmvapic.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/hw/i386/kvmvapic.c b/hw/i386/kvmvapic.c
index 2f767b6..702e281 100644
--- a/hw/i386/kvmvapic.c
+++ b/hw/i386/kvmvapic.c
@@ -535,7 +535,6 @@ static int patch_hypercalls(VAPICROMState *s)
     uint8_t alternates[2];
     const uint8_t *pattern;
     const uint8_t *patch;
-    int patches = 0;
     off_t pos;
     uint8_t *rom;
 
@@ -566,11 +565,6 @@ static int patch_hypercalls(VAPICROMState *s)
     }
 
     g_free(rom);
-
-    if (patches != 0 && patches != 2) {
-        return -1;
-    }
-
     return 0;
 }
 
-- 
2.1.4


