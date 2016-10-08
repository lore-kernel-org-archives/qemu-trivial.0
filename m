Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsnav-0008FL-Jh
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 05:07:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnas-0008Aa-EK
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:06:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnaq-00041z-FM
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:06:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56947)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsnam-0003xr-TT; Sat, 08 Oct 2016 05:06:53 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6307040ED9;
	Sat,  8 Oct 2016 12:06:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id BEFF8B26;
	Sat,  8 Oct 2016 11:58:15 +0300 (MSK)
Received: (nullmailer pid 19239 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:57:55 +0300
Message-Id: <c9b900903b10467f06ca1df10548bc43272d8529.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 09/26] MAINTAINERS: Add header files to CRIS
 section
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
X-List-Received-Date: Sat, 08 Oct 2016 09:06:59 -0000

From: Thomas Huth <thuth@redhat.com>

etraxfs_dma.h and etraxfs.h in include/hw/cris/ obviously belong
to the CRIS section in MAINTAINERS.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9e4ca02..a5751a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -116,6 +116,7 @@ M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
 S: Maintained
 F: target-cris/
 F: hw/cris/
+F: include/hw/cris/
 F: tests/tcg/cris/
 F: disas/cris.c
 
-- 
2.1.4


