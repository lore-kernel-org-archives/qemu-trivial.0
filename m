Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SsKba-0006rW-LE
	for mharc-qemu-trivial@gnu.org; Fri, 20 Jul 2012 17:19:22 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SsKO6-0003ia-Sn
	for qemu-trivial@nongnu.org; Fri, 20 Jul 2012 17:05:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1SsKNv-0002Y9-2v
	for qemu-trivial@nongnu.org; Fri, 20 Jul 2012 17:05:26 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:38764)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1SsKNZ-0002Ie-Dt; Fri, 20 Jul 2012 17:04:53 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	1EE5672800A0; Fri, 20 Jul 2012 23:04:51 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id HfgLQvY2l104; Fri, 20 Jul 2012 23:04:50 +0200 (CEST)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 530A372800C8; Fri, 20 Jul 2012 23:04:50 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri, 20 Jul 2012 23:04:49 +0200
Message-Id: <1342818289-31860-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] qdev: Fix Open Firmware comment
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
X-List-Received-Date: Fri, 20 Jul 2012 21:19:21 -0000

Commit 0d936928ef87ca1bb7b41b5b89c400c699a7691c removed code,
but left the related comment at a location where it no longer
belongs to.

The patch moves the comment to the correct callback and improves the text.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 hw/qdev.h |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/hw/qdev.h b/hw/qdev.h
index 247dd1e..a2cbd9d 100644
--- a/hw/qdev.h
+++ b/hw/qdev.h
@@ -78,12 +78,6 @@ struct DeviceState {
     int alias_required_for_version;
 };
 
-/*
- * This callback is used to create Open Firmware device path in accordance with
- * OF spec http://forthworks.com/standards/of1275.pdf. Indicidual bus bindings
- * can be found here http://playground.sun.com/1275/bindings/.
- */
-
 #define TYPE_BUS "bus"
 #define BUS(obj) OBJECT_CHECK(BusState, (obj), TYPE_BUS)
 #define BUS_CLASS(klass) OBJECT_CLASS_CHECK(BusClass, (klass), TYPE_BUS)
@@ -95,6 +89,11 @@ struct BusClass {
     /* FIXME first arg should be BusState */
     void (*print_dev)(Monitor *mon, DeviceState *dev, int indent);
     char *(*get_dev_path)(DeviceState *dev);
+    /*
+     * This callback is used to create Open Firmware device path in accordance
+     * with OF spec http://forthworks.com/standards/of1275.pdf. Individual bus
+     * bindings can be found at http://playground.sun.com/1275/bindings/.
+     */
     char *(*get_fw_dev_path)(DeviceState *dev);
     int (*reset)(BusState *bus);
 };
-- 
1.7.10


