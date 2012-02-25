Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1Gxl-0002Cb-Cs
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2012 07:42:57 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53597)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1Gsd-0001fk-Rf
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 07:37:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1GsX-0002h0-4s
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 07:37:38 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:33574)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1S1GsL-0002ez-Iu; Sat, 25 Feb 2012 07:37:21 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	D0EFF728009D; Sat, 25 Feb 2012 13:37:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id Whd5zTsBTeQs; Sat, 25 Feb 2012 13:37:19 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 60D1C728009B; Sat, 25 Feb 2012 13:37:19 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Sat, 25 Feb 2012 13:37:12 +0100
Message-Id: <1330173433-32043-2-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <1330173433-32043-1-git-send-email-sw@weilnetz.de>
References: <1330173433-32043-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>
Subject: [Qemu-trivial] [PATCH 1/2] ppc: Add missing 'static' to spin_rw_ops
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
X-List-Received-Date: Sat, 25 Feb 2012 12:42:55 -0000

spin_rw_ops is only used in hw/ppce500_spin.c.

Cc: Alexander Graf <agraf@suse.de>
Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/ppce500_spin.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/hw/ppce500_spin.c b/hw/ppce500_spin.c
index 6b8a189..6ed676b 100644
--- a/hw/ppce500_spin.c
+++ b/hw/ppce500_spin.c
@@ -182,7 +182,7 @@ static uint64_t spin_read(void *opaque, target_phys_addr_t addr, unsigned len)
     }
 }
 
-const MemoryRegionOps spin_rw_ops = {
+static const MemoryRegionOps spin_rw_ops = {
     .read = spin_read,
     .write = spin_write,
     .endianness = DEVICE_BIG_ENDIAN,
-- 
1.7.9


