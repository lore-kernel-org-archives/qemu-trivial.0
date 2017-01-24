Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVxoa-0001mI-Gm
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 04:55:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxoW-0001ho-Ao
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:54:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVxoV-0005ka-Kx
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 04:54:56 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:53181)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVxoQ-0005iU-84; Tue, 24 Jan 2017 04:54:50 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0028F42105;
	Tue, 24 Jan 2017 12:54:47 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id A7AAD570;
	Tue, 24 Jan 2017 12:39:43 +0300 (MSK)
Received: (nullmailer pid 12659 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:29 +0300
Message-Id: <05a23aeae1dc56b7f26c1a348fd6d31790f6baa6.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 25/31] hw/display/framebuffer.c: Avoid
 overflow for framebuffers > 4GB
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
X-List-Received-Date: Tue, 24 Jan 2017 09:54:57 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Coverity points out that calculating src_len by multiplying
src_width by rows could overflow. This can only happen in
the implausible case of a framebuffer larger than 4GB, but
we may as well fix it, placating Coverity. (CID1005515)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


