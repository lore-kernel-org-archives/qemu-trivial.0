Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WgJzE-00018h-E7
	for mharc-qemu-trivial@gnu.org; Fri, 02 May 2014 16:23:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WgJz8-0000yw-Fz
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 16:23:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WgJz3-00060L-8P
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 16:23:06 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:47094)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1WgJz3-00060C-2I
	for qemu-trivial@nongnu.org; Fri, 02 May 2014 16:23:01 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 7348E1800ED; Fri,  2 May 2014 22:22:58 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Fri,  2 May 2014 22:22:57 +0200
Message-Id: <1399062177-2316-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>,
	Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-trivial] [PATCH] hw/9pfs: Add missing 'static' attributes
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
X-List-Received-Date: Fri, 02 May 2014 20:23:11 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
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


