Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QokFV-0000Jf-Qd
	for mharc-qemu-trivial@gnu.org; Wed, 03 Aug 2011 18:49:13 -0400
Received: from eggs.gnu.org ([140.186.70.92]:56683)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QokFT-000098-2v
	for qemu-trivial@nongnu.org; Wed, 03 Aug 2011 18:49:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1QokFR-00047G-FS
	for qemu-trivial@nongnu.org; Wed, 03 Aug 2011 18:49:11 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:50074)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QokFP-00046Z-4m; Wed, 03 Aug 2011 18:49:07 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1QokFM-0002QJ-5t; Wed, 03 Aug 2011 23:49:04 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  3 Aug 2011 23:49:04 +0100
Message-Id: <1312411744-9292-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] hw/qdev: Don't crash if qdev_create(NULL,
	...) fails
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
X-List-Received-Date: Wed, 03 Aug 2011 22:49:12 -0000

If an attempt to create a qdev device on the default sysbus (by passing
NULL as the bus to qdev_create) fails, print a useful error message
rather than crashing trying to dereference a NULL pointer.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/qdev.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/hw/qdev.c b/hw/qdev.c
index b4ea8e1..3fec62a 100644
--- a/hw/qdev.c
+++ b/hw/qdev.c
@@ -110,7 +110,12 @@ DeviceState *qdev_create(BusState *bus, const char *name)
 
     dev = qdev_try_create(bus, name);
     if (!dev) {
-        hw_error("Unknown device '%s' for bus '%s'\n", name, bus->info->name);
+        if (bus) {
+            hw_error("Unknown device '%s' for bus '%s'\n", name,
+                     bus->info->name);
+        } else {
+            hw_error("Unknown device '%s' for default sysbus\n", name);
+        }
     }
 
     return dev;
-- 
1.7.4.1


