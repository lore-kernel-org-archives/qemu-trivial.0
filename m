Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsnSl-0002UX-SL
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 04:58:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnSh-0002PI-Uw
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:58:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnSg-0007rd-5S
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:58:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51964)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsnSZ-0007gE-SV; Sat, 08 Oct 2016 04:58:24 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BD2AF40ED4;
	Sat,  8 Oct 2016 11:58:14 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 0C621B2A;
	Sat,  8 Oct 2016 11:58:14 +0300 (MSK)
Received: (nullmailer pid 19247 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:57:59 +0300
Message-Id: <5995db887161ec74a7b43f4969de8a0c06e70cc0.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 13/26] MAINTAINERS: Add some more MIPS related
 files
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
X-List-Received-Date: Sat, 08 Oct 2016 08:58:33 -0000

From: Thomas Huth <thuth@redhat.com>

The MIPS section is missing some related header files, and files
in the hw/misc/, hw/intc/ and hw/timer/ folders.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4a72b77..2d77759 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -150,6 +150,13 @@ M: Yongbok Kim <yongbok.kim@imgtec.com>
 S: Maintained
 F: target-mips/
 F: hw/mips/
+F: hw/misc/mips_*
+F: hw/intc/mips_gic.c
+F: hw/timer/mips_gictimer.c
+F: include/hw/mips/
+F: include/hw/misc/mips_*
+F: include/hw/intc/mips_gic.h
+F: include/hw/timer/mips_gictimer.h
 F: tests/tcg/mips/
 F: disas/mips.c
 
-- 
2.1.4


