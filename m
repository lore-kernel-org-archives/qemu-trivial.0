Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsnkd-0006eS-MR
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 05:17:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnkb-0006ab-8p
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:17:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnkZ-0000oR-7U
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 05:17:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50179)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsnkU-0000hT-JR; Sat, 08 Oct 2016 05:16:54 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DA77840ED6;
	Sat,  8 Oct 2016 12:16:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 3C650B2E;
	Sat,  8 Oct 2016 11:58:15 +0300 (MSK)
Received: (nullmailer pid 19235 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <huth@tuxfamily.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:57:53 +0300
Message-Id: <c10a1c787b4894048b688d8111b1f5e135015e04.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 07/26] MAINTAINERS: Add some SPARC machine
 related files
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
X-List-Received-Date: Sat, 08 Oct 2016 09:17:02 -0000

From: Thomas Huth <huth@tuxfamily.org>

And while we're at it, remove Blue Swirl from the list
of maintainers. Blue has apparently been inactive for
quite a while now, so I assume he's unfortunately
not available as maintainer anymore.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 94f14ea..3ac5fbc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -673,22 +673,27 @@ F: hw/sh4/shix.c
 SPARC Machines
 --------------
 Sun4m
-M: Blue Swirl <blauwirbel@gmail.com>
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
 S: Maintained
 F: hw/sparc/sun4m.c
+F: hw/dma/sparc32_dma.c
+F: hw/dma/sun4m_iommu.c
+F: include/hw/sparc/sparc32_dma.h
+F: include/hw/sparc/sun4m.h
+F: pc-bios/openbios-sparc32
 
 Sun4u
-M: Blue Swirl <blauwirbel@gmail.com>
 M: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
 S: Maintained
 F: hw/sparc64/sun4u.c
+F: pc-bios/openbios-sparc64
 
 Leon3
 M: Fabien Chouteau <chouteau@adacore.com>
 S: Maintained
 F: hw/sparc/leon3.c
 F: hw/*/grlib*
+F: include/hw/sparc/grlib.h
 
 S390 Machines
 -------------
-- 
2.1.4


