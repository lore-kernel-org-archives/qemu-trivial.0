Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1egVnA-0005f3-5b
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jan 2018 08:17:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1egVn7-0005bt-UW
	for qemu-trivial@nongnu.org; Tue, 30 Jan 2018 08:17:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1egVn1-0001sb-Ui
	for qemu-trivial@nongnu.org; Tue, 30 Jan 2018 08:17:36 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:27342)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1egVmn-0001lN-OC; Tue, 30 Jan 2018 08:17:17 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 7A2D47456D8;
	Tue, 30 Jan 2018 14:17:16 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 5899D7456D5; Tue, 30 Jan 2018 14:17:16 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Tue, 30 Jan 2018 14:10:10 +0100
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: David Gibson <david@gibson.dropbear.id.au>
Message-Id: <20180130131716.5899D7456D5@zero.eik.bme.hu>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: [Qemu-trivial] [PATCH] sii3112: Change angle brackets to quotes in
 #include lines
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
X-List-Received-Date: Tue, 30 Jan 2018 13:17:39 -0000

This matches what other files do for qemu includes

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 hw/ide/sii3112.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
index 17aa930..e3896c6 100644
--- a/hw/ide/sii3112.c
+++ b/hw/ide/sii3112.c
@@ -12,8 +12,8 @@
  * http://wiki.osdev.org/User:Quok/Silicon_Image_Datasheets
  */
 
-#include <qemu/osdep.h>
-#include <hw/ide/pci.h>
+#include "qemu/osdep.h"
+#include "hw/ide/pci.h"
 #include "trace.h"
 
 #define TYPE_SII3112_PCI "sii3112"
-- 
2.7.6


