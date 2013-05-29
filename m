Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uhgv1-0005pi-FF
	for mharc-qemu-trivial@gnu.org; Wed, 29 May 2013 09:59:59 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39626)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1Uhguu-0005ov-Jm
	for qemu-trivial@nongnu.org; Wed, 29 May 2013 09:59:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1Uhgul-0001XS-Kz
	for qemu-trivial@nongnu.org; Wed, 29 May 2013 09:59:52 -0400
Received: from [216.171.111.232] (port=22260 helo=freebsd.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1Uhgul-0001XG-EF
	for qemu-trivial@nongnu.org; Wed, 29 May 2013 09:59:43 -0400
Received: from emaste (uid 1001) (envelope-from emaste@freebsd.org) id 9cc73
	by freebsd.org (DragonFly Mail Agent 1);
	Wed, 29 May 2013 09:59:42 -0400
From: Ed Maste <emaste@freebsd.org>
To: qemu-devel@nongnu.org
Date: Wed, 29 May 2013 09:58:29 -0400
Message-Id: <1369835909-35664-1-git-send-email-emaste@freebsd.org>
X-Mailer: git-send-email 1.7.11.5
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.171.111.232
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] m25p80: Add Micron n25q032a
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
X-List-Received-Date: Wed, 29 May 2013 13:59:58 -0000

Based on the datasheet at
http://www.micron.com/~/media/Documents/Products/Data%20Sheet/NOR%20Flash/Serial%20NOR/N25Q/n25q_32mb_1_8v_65nm.pdf

Signed-off-by: Ed Maste <emaste@freebsd.org>
---
 hw/block/m25p80.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 759c84d..a927a6b 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -123,6 +123,7 @@ static const FlashPartInfo known_devices[] = {
     { INFO("mx25l25655e", 0xc22619,      0,  64 << 10, 512, 0) },
 
     /* Micron */
+    { INFO("n25q032a",    0x20bb16,      0,  64 << 10,  64, ER_4K) },
     { INFO("n25q128a11",  0x20bb18,      0,  64 << 10, 256, 0) },
     { INFO("n25q128a13",  0x20ba18,      0,  64 << 10, 256, 0) },
     { INFO("n25q256a",    0x20ba19,      0,  64 << 10, 512, ER_4K) },
-- 
1.7.11.5


