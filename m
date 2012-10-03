Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TJL7Z-0005oN-4G
	for mharc-qemu-trivial@gnu.org; Wed, 03 Oct 2012 05:20:01 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TJL7S-0005WS-BW
	for qemu-trivial@nongnu.org; Wed, 03 Oct 2012 05:19:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TJL7R-0003SB-8u
	for qemu-trivial@nongnu.org; Wed, 03 Oct 2012 05:19:54 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:41202)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TJL7H-0003RG-HE; Wed, 03 Oct 2012 05:19:43 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	3FFA67280027; Wed,  3 Oct 2012 11:19:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id mJQq2fAy4ZrH; Wed,  3 Oct 2012 11:19:40 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 2D3E87280032; Wed,  3 Oct 2012 11:19:40 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Wed,  3 Oct 2012 11:19:39 +0200
Message-Id: <1349255979-5404-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-devel@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] hw: Add missing 'static' attribute for
	QEMUMachine
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
X-List-Received-Date: Wed, 03 Oct 2012 09:19:59 -0000

It was missing for leon3 and mips_fulong2e.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/leon3.c              |    2 +-
 hw/mips/mips_fulong2e.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/leon3.c b/hw/leon3.c
index 878d3aa..7a9729d 100644
--- a/hw/leon3.c
+++ b/hw/leon3.c
@@ -210,7 +210,7 @@ static void leon3_generic_hw_init(ram_addr_t  ram_size,
     }
 }
 
-QEMUMachine leon3_generic_machine = {
+static QEMUMachine leon3_generic_machine = {
     .name     = "leon3_generic",
     .desc     = "Leon-3 generic",
     .init     = leon3_generic_hw_init,
diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index 38e4b86..d4a8672 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -392,7 +392,7 @@ static void mips_fulong2e_init(ram_addr_t ram_size, const char *boot_device,
     network_init();
 }
 
-QEMUMachine mips_fulong2e_machine = {
+static QEMUMachine mips_fulong2e_machine = {
     .name = "fulong2e",
     .desc = "Fulong 2e mini pc",
     .init = mips_fulong2e_init,
-- 
1.7.10


