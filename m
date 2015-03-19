Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYWyW-000306-18
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 05:42:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWyT-0002tu-Qf
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:42:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWyT-0001oc-0b
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:42:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41271)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYWyL-0001ko-Tz; Thu, 19 Mar 2015 05:42:38 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 84FC241E3E;
	Thu, 19 Mar 2015 12:42:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 95BE7922;
	Thu, 19 Mar 2015 12:05:45 +0300 (MSK)
Received: (nullmailer pid 332 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:23 +0300
Message-Id: <30d76f13be4eac5499b5ce017f47d5f26ef743af.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, Andrzej Zaborowski <balrogg@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [Qemu-trivial] [PULL 05/24] arm/nseries: Fix warnings from Sparse
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
X-List-Received-Date: Thu, 19 Mar 2015 09:42:46 -0000

From: Stefan Weil <sw@weilnetz.de>

Sparse report:

arm/nseries.c:1406:5: warning: returning void-valued expression
arm/nseries.c:1411:5: warning: returning void-valued expression

Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/arm/nseries.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 4d7be5e..2a5406d 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -1403,12 +1403,12 @@ static struct arm_boot_info n810_binfo = {
 
 static void n800_init(MachineState *machine)
 {
-    return n8x0_init(machine, &n800_binfo, 800);
+    n8x0_init(machine, &n800_binfo, 800);
 }
 
 static void n810_init(MachineState *machine)
 {
-    return n8x0_init(machine, &n810_binfo, 810);
+    n8x0_init(machine, &n810_binfo, 810);
 }
 
 static QEMUMachine n800_machine = {
-- 
2.1.4


