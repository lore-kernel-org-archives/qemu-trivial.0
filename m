Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsnSm-0002V2-2n
	for mharc-qemu-trivial@gnu.org; Sat, 08 Oct 2016 04:58:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnSh-0002PJ-VV
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:58:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bsnSg-0007rk-6J
	for qemu-trivial@nongnu.org; Sat, 08 Oct 2016 04:58:30 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47833)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bsnSZ-0007gB-SM; Sat, 08 Oct 2016 04:58:24 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 23B7240ED6;
	Sat,  8 Oct 2016 11:58:15 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 55D92B2E;
	Sat,  8 Oct 2016 11:58:14 +0300 (MSK)
Received: (nullmailer pid 19249 invoked by uid 1000);
	Sat, 08 Oct 2016 08:58:14 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <huth@tuxfamily.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sat,  8 Oct 2016 11:58:00 +0300
Message-Id: <81527b94ad14d9f2b33b88ba31b68e2775a5e4fc.1475917008.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
References: <cover.1475917008.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 14/26] MAINTAINERS: Some updates related to
 the SH4 machines
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

From: Thomas Huth <huth@tuxfamily.org>

hw/intc/sh_intc.c and hw/timer/sh_timer.c seem to belong to
the R2D machine, as far as I can see.
And concerning the Shix machine, it does not make much sense
to have a "M:" entry here and the "S:" set to "Orphan". So
I'd like to suggest to use "Odd Fixes" here instead.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2d77759..64f57c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -675,10 +675,12 @@ R2D
 M: Magnus Damm <magnus.damm@gmail.com>
 S: Maintained
 F: hw/sh4/r2d.c
+F: hw/intc/sh_intc.c
+F: hw/timer/sh_timer.c
 
 Shix
 M: Magnus Damm <magnus.damm@gmail.com>
-S: Orphan
+S: Odd Fixes
 F: hw/sh4/shix.c
 
 SPARC Machines
-- 
2.1.4


