Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UsdHa-00054x-6w
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2013 14:20:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58413)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsdHT-0004r9-HF
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 14:20:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UsdHQ-0006I7-Ns
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 14:20:23 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59928)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UsdHN-0006GG-M6; Fri, 28 Jun 2013 14:20:17 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1F5EB42B0C;
	Fri, 28 Jun 2013 22:20:17 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 9CD2056B; Fri, 28 Jun 2013 22:17:48 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 28 Jun 2013 22:17:45 +0400
Message-Id: <1372443465-22384-15-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1372443465-22384-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1372443465-22384-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 14/14] doc: we use seabios, not bochs bios
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
X-List-Received-Date: Fri, 28 Jun 2013 18:20:25 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-doc.texi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-doc.texi b/qemu-doc.texi
index 8022890..185dd47 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -214,7 +214,7 @@ PCI UHCI USB controller and a virtual USB hub.
 
 SMP is supported with up to 255 CPUs.
 
-QEMU uses the PC BIOS from the Bochs project and the Plex86/Bochs LGPL
+QEMU uses the PC BIOS from the Seabios project and the Plex86/Bochs LGPL
 VGA BIOS.
 
 QEMU uses YM3812 emulation by Tatsuyuki Satoh.
-- 
1.7.10.4


