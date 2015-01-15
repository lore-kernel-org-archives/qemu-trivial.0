Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YBfxR-00063b-Jr
	for mharc-qemu-trivial@gnu.org; Thu, 15 Jan 2015 03:39:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33688)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBfxN-0005xY-3a
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:39:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBfxM-0002JW-BZ
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:39:09 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35866)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YBfx8-0002EL-Uj; Thu, 15 Jan 2015 03:38:55 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 09D9A40DB4;
	Thu, 15 Jan 2015 11:38:54 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id C4A948CB;
	Thu, 15 Jan 2015 11:30:53 +0300 (MSK)
Received: (nullmailer pid 31341 invoked by uid 1000);
	Thu, 15 Jan 2015 08:30:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 15 Jan 2015 11:30:39 +0300
Message-Id: <9feb8adeaa850d15b930c30f22c1ed2f2f695172.1421310394.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
References: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-stable@nongnu.org
Subject: [Qemu-trivial] [PULL 01/12] vt82c686: avoid out-of-bounds read
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
X-List-Received-Date: Thu, 15 Jan 2015 08:39:10 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

superio_ioport_readb can read the 256th element of the array.
Coverity reports an out-of-bounds write in superio_ioport_writeb,
but it does not show the corresponding out-of-bounds read
because it cannot prove that it can happen.  Fix the root
cause of the problem (zhanghailang's patch instead fixes
the logic in superio_ioport_writeb).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-stable@nongnu.org
---
 hw/isa/vt82c686.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index 223b947..2f53bf8 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -36,7 +36,7 @@
 
 typedef struct SuperIOConfig
 {
-    uint8_t config[0xff];
+    uint8_t config[0x100];
     uint8_t index;
     uint8_t data;
 } SuperIOConfig;
-- 
2.1.4


