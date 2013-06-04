Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ujtdx-0002iu-Qp
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2013 11:59:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1Ujtdr-0002hW-P6
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 11:59:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1Ujtdk-0000FR-Qk
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 11:59:23 -0400
Received: from [216.171.111.232] (port=64419 helo=freebsd.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1Ujtdk-0000Eg-JU
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 11:59:16 -0400
Received: from emaste (uid 1001) (envelope-from emaste@freebsd.org) id 9ccb7
	by freebsd.org (DragonFly Mail Agent 1);
	Tue, 04 Jun 2013 11:59:15 -0400
From: Ed Maste <emaste@freebsd.org>
To: qemu-devel@nongnu.org
Date: Tue,  4 Jun 2013 11:59:14 -0400
Message-Id: <1370361554-91658-1-git-send-email-emaste@freebsd.org>
X-Mailer: git-send-email 1.7.11.5
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.171.111.232
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] block/m25p80: Update Micron entries
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
X-List-Received-Date: Tue, 04 Jun 2013 15:59:29 -0000

- Split 32Mb and 256Mb parts into a11 and a13 variants.
- Add the 4K sector flag to the 128Mb parts.  (These entries were taken from
  the Linux kernel list, which is missing the flag.)
- Fill out the table of sizes with entries for 64Mb parts.

Prodded by Peter Crosthwaite.

Signed-off-by: Ed Maste <emaste@freebsd.org>
---
 hw/block/m25p80.c | 12 ++++++++----
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
1.7.11.5


