Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhNLn-0005IW-7J
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 14:10:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNLg-0005EI-Vv
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:10:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WhNLb-0003kJ-BZ
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 14:10:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37474)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WhNLJ-0003hD-Ul; Mon, 05 May 2014 14:10:22 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 11F5640751;
	Mon,  5 May 2014 22:10:21 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 58E0D6AC;
	Mon,  5 May 2014 22:02:07 +0400 (MSK)
Received: (nullmailer pid 24225 invoked by uid 1000);
	Mon, 05 May 2014 18:02:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon,  5 May 2014 22:01:47 +0400
Message-Id: <1399312923-24129-7-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1399312923-24129-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 06/22] hw/9pfs: Add missing 'static' attributes
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
X-List-Received-Date: Mon, 05 May 2014 18:10:50 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/9pfs/virtio-9p-synth.c |    2 +-
 hw/core/qdev.c            |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/9pfs/virtio-9p-synth.c b/hw/9pfs/virtio-9p-synth.c
index 840e4eb..71262bc 100644
--- a/hw/9pfs/virtio-9p-synth.c
+++ b/hw/9pfs/virtio-9p-synth.c
@@ -21,7 +21,7 @@
 #include <sys/stat.h>
 
 /* Root node for synth file system */
-V9fsSynthNode v9fs_synth_root = {
+static V9fsSynthNode v9fs_synth_root = {
     .name = "/",
     .actual_attr = {
         .mode = 0555 | S_IFDIR,
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 60f9df1..6280850 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -660,8 +660,8 @@ static void qdev_get_legacy_property(Object *obj, Visitor *v, void *opaque,
  * Legacy properties are string versions of other OOM properties.  The format
  * of the string depends on the property type.
  */
-void qdev_property_add_legacy(DeviceState *dev, Property *prop,
-                              Error **errp)
+static void qdev_property_add_legacy(DeviceState *dev, Property *prop,
+                                     Error **errp)
 {
     gchar *name;
 
-- 
1.7.10.4


