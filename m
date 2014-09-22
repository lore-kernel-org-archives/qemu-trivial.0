Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XVyqT-0003aD-CN
	for mharc-qemu-trivial@gnu.org; Mon, 22 Sep 2014 04:19:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVyqJ-0003HN-9d
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 04:19:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVyqA-0000aS-8e
	for qemu-trivial@nongnu.org; Mon, 22 Sep 2014 04:19:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59884)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XVypy-0000U7-KR; Mon, 22 Sep 2014 04:19:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5C69945D0D;
	Mon, 22 Sep 2014 12:19:04 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 5A439704;
	Mon, 22 Sep 2014 12:11:19 +0400 (MSK)
Received: (nullmailer pid 17002 invoked by uid 1000);
	Mon, 22 Sep 2014 08:11:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 22 Sep 2014 12:11:16 +0400
Message-Id: <1411373477-16938-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1411373477-16938-1-git-send-email-mjt@tls.msk.ru>
References: <1411373477-16938-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 8/9] pc: Add missing 'static' attribute
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
X-List-Received-Date: Mon, 22 Sep 2014 08:19:37 -0000

From: Stefan Weil <sw@weilnetz.de>

This fixes a warning from smatch (static code analysis).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/pc.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 2c2e9dc..82a7daa 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -75,7 +75,7 @@
 /* Leave a chunk of memory at the top of RAM for the BIOS ACPI tables
  * (128K) and other BIOS datastructures (less than 4K reported to be used at
  * the moment, 32K should be enough for a while).  */
-unsigned acpi_data_size = 0x20000 + 0x8000;
+static unsigned acpi_data_size = 0x20000 + 0x8000;
 void pc_set_legacy_acpi_data_size(void)
 {
     acpi_data_size = 0x10000;
-- 
1.7.10.4


