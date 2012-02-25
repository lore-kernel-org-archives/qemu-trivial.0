Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1Gxl-0002CP-B2
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2012 07:42:57 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1Gsd-0001jO-Ic
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 07:37:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1S1GsV-0002gi-Dm
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2012 07:37:36 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:33563)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1S1GsL-0002ew-CW; Sat, 25 Feb 2012 07:37:21 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	D5BA1728009C; Sat, 25 Feb 2012 13:37:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id WnrzWkGJXCmm; Sat, 25 Feb 2012 13:37:19 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 64D68728009A; Sat, 25 Feb 2012 13:37:19 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Sat, 25 Feb 2012 13:37:13 +0100
Message-Id: <1330173433-32043-3-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.9
In-Reply-To: <1330173433-32043-1-git-send-email-sw@weilnetz.de>
References: <1330173433-32043-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH 2/2] sh7750: Remove redundant 'struct' from
	MemoryRegionOps
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

The 'struct' is not needed, and all other MemoryRegionOps don't use it.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/sh7750.c  |    2 +-
 hw/sh_intc.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sh7750.c b/hw/sh7750.c
index 4f4d8e7..e712928 100644
--- a/hw/sh7750.c
+++ b/hw/sh7750.c
@@ -712,7 +712,7 @@ static void sh7750_mmct_write(void *opaque, target_phys_addr_t addr,
     }
 }
 
-static const struct MemoryRegionOps sh7750_mmct_ops = {
+static const MemoryRegionOps sh7750_mmct_ops = {
     .read = sh7750_mmct_read,
     .write = sh7750_mmct_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
diff --git a/hw/sh_intc.c b/hw/sh_intc.c
index b24ec77..7d31ced 100644
--- a/hw/sh_intc.c
+++ b/hw/sh_intc.c
@@ -283,7 +283,7 @@ static void sh_intc_write(void *opaque, target_phys_addr_t offset,
 #endif
 }
 
-static const struct MemoryRegionOps sh_intc_ops = {
+static const MemoryRegionOps sh_intc_ops = {
     .read = sh_intc_read,
     .write = sh_intc_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
-- 
1.7.9


