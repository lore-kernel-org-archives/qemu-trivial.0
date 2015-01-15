Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YBfxQ-00060F-95
	for mharc-qemu-trivial@gnu.org; Thu, 15 Jan 2015 03:39:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBfxL-0005ua-Cf
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:39:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBfxH-0002Hl-Jq
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:39:07 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:42181)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YBfx8-0002EK-U9; Thu, 15 Jan 2015 03:38:55 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D3F1D40DB3;
	Thu, 15 Jan 2015 11:38:53 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7D3F38CE;
	Thu, 15 Jan 2015 11:30:54 +0300 (MSK)
Received: (nullmailer pid 31347 invoked by uid 1000);
	Thu, 15 Jan 2015 08:30:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 15 Jan 2015 11:30:42 +0300
Message-Id: <90d6a6730b4dbe7d0ada9900aba8263d61376812.1421310394.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
References: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 04/12] migration/qemu-file.c: Don't shift left
	into sign bit
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
X-List-Received-Date: Thu, 15 Jan 2015 08:39:08 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Add a cast in qemu_get_be32() to avoid shifting left into the sign
bit of a signed integer (which is undefined behaviour in C).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 migration/qemu-file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index d2d4007..a7f2a34 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -503,7 +503,7 @@ unsigned int qemu_get_be16(QEMUFile *f)
 unsigned int qemu_get_be32(QEMUFile *f)
 {
     unsigned int v;
-    v = qemu_get_byte(f) << 24;
+    v = (unsigned int)qemu_get_byte(f) << 24;
     v |= qemu_get_byte(f) << 16;
     v |= qemu_get_byte(f) << 8;
     v |= qemu_get_byte(f);
-- 
2.1.4


