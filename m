Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V06ry-0005QG-LQ
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jul 2013 05:20:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V06ru-0005OU-1D
	for qemu-trivial@nongnu.org; Fri, 19 Jul 2013 05:20:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V06rs-0005nS-9c
	for qemu-trivial@nongnu.org; Fri, 19 Jul 2013 05:20:53 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55704)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V06rl-0005kU-7G; Fri, 19 Jul 2013 05:20:45 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 76F9A41D87;
	Fri, 19 Jul 2013 13:11:18 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id E13061D8; Fri, 19 Jul 2013 13:11:16 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 19 Jul 2013 13:11:12 +0400
Message-Id: <1374225073-12959-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1374225073-12959-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1374225073-12959-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL trivial 4/5] block/m25p80: Update Micron
	entries
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
X-List-Received-Date: Fri, 19 Jul 2013 09:20:56 -0000

From: Ed Maste <emaste@freebsd.org>

- Split 32Mb and 256Mb parts into a11 and a13 variants.
- Add the 4K sector flag to the 128Mb parts.  (These entries were taken from
  the Linux kernel list, which is missing the flag.)
- Fill out the table of sizes with entries for 64Mb parts.

Prodded by Peter Crosthwaite.

Signed-off-by: Ed Maste <emaste@freebsd.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/block/m25p80.c |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index a927a6b..8c3b7f0 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -123,10 +123,14 @@ static const FlashPartInfo known_devices[] = {
     { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
 
     /* Micron */
-    { INFO("n25q032a",    0x20bb16,      0,  64 << 10,  64, ER_4K) },
-    { INFO("n25q128a11",  0x20bb18,      0,  64 << 10, 256, 0) },
-    { INFO("n25q128a13",  0x20ba18,      0,  64 << 10, 256, 0) },
-    { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K) },
+    { INFO("n25q032a11",  0x20bb16,      0,  64 << 10,  64, ER_4K) },
+    { INFO("n25q032a13",  0x20ba16,      0,  64 << 10,  64, ER_4K) },
+    { INFO("n25q064a11",  0x20bb17,      0,  64 << 10, 128, ER_4K) },
+    { INFO("n25q064a13",  0x20ba17,      0,  64 << 10, 128, ER_4K) },
+    { INFO("n25q128a11",  0x20bb18,      0,  64 << 10, 256, ER_4K) },
+    { INFO("n25q128a13",  0x20ba18,      0,  64 << 10, 256, ER_4K) },
+    { INFO("n25q256a11",  0x20bb19,      0,  64 << 10, 512, ER_4K) },
+    { INFO("n25q256a13",  0x20ba19,      0,  64 << 10, 512, ER_4K) },
 
     /* Spansion -- single (large) sector size only, at least
      * for the chips listed here (without boot sectors).
-- 
1.7.10.4


