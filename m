Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9SqX-0001NL-VY
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 03:51:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60265)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9SqS-0001Gs-ON
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:51:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9SqQ-0005YU-MH
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 03:51:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:42012)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9SqJ-0005Ww-Jl; Sun, 05 Jun 2016 03:51:31 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 53057408D7;
	Sun,  5 Jun 2016 10:51:26 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id DE912B40;
	Sun,  5 Jun 2016 10:43:40 +0300 (MSK)
Received: (nullmailer pid 1130 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:42:57 +0300
Message-Id: <1682a0efa4a8164f212c1be4d40b1d8829214263.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 20/52] qdev: Clean up around properties
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
X-List-Received-Date: Sun, 05 Jun 2016 07:51:45 -0000

From: Cao jin <caoj.fnst@cn.fujitsu.com>

include:
1. remove unnecessary declaration of static function
2. fix inconsistency between comment and function name, and typo OOM->QOM
2. update comments of functions, use uniform format(GTK-Doc style)

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/core/qdev.c               | 30 +++++++++++++++++++-----------
 include/hw/qdev-properties.h | 10 ++++++++--
 2 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 853162b..0a05a52 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -58,9 +58,6 @@ const char *qdev_fw_name(DeviceState *dev)
     return object_get_typename(OBJECT(dev));
 }
 
-static void qdev_property_add_legacy(DeviceState *dev, Property *prop,
-                                     Error **errp);
-
 static void bus_remove_child(BusState *bus, DeviceState *child)
 {
     BusChild *kid;
@@ -733,13 +730,20 @@ static void qdev_get_legacy_property(Object *obj, Visitor *v,
 }
 
 /**
- * @qdev_add_legacy_property - adds a legacy property
+ * qdev_property_add_legacy:
+ * @dev: Device to add the property to.
+ * @prop: The qdev property definition.
+ * @errp: location to store error information.
+ *
+ * Add a legacy QOM property to @dev for qdev property @prop.
+ * On error, store error in @errp.
  *
- * Do not use this is new code!  Properties added through this interface will
- * be given names and types in the "legacy" namespace.
+ * Legacy properties are string versions of QOM properties.  The format of
+ * the string depends on the property type.  Legacy properties are only
+ * needed for "info qtree".
  *
- * Legacy properties are string versions of other OOM properties.  The format
- * of the string depends on the property type.
+ * Do not use this is new code!  QOM Properties added through this interface
+ * will be given names in the "legacy" namespace.
  */
 static void qdev_property_add_legacy(DeviceState *dev, Property *prop,
                                      Error **errp)
@@ -762,10 +766,14 @@ static void qdev_property_add_legacy(DeviceState *dev, Property *prop,
 }
 
 /**
- * @qdev_property_add_static - add a @Property to a device.
+ * qdev_property_add_static:
+ * @dev: Device to add the property to.
+ * @prop: The qdev property definition.
+ * @errp: location to store error information.
  *
- * Static properties access data in a struct.  The actual type of the
- * property and the field depends on the property type.
+ * Add a static QOM property to @dev for qdev property @prop.
+ * On error, store error in @errp.  Static properties access data in a struct.
+ * The type of the QOM property is derived from prop->info.
  */
 void qdev_property_add_static(DeviceState *dev, Property *prop,
                               Error **errp)
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 0586cac..034b75a 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -197,8 +197,14 @@ void error_set_from_qdev_prop_error(Error **errp, int ret, DeviceState *dev,
                                     Property *prop, const char *value);
 
 /**
- * @qdev_property_add_static - add a @Property to a device referencing a
- * field in a struct.
+ * qdev_property_add_static:
+ * @dev: Device to add the property to.
+ * @prop: The qdev property definition.
+ * @errp: location to store error information.
+ *
+ * Add a static QOM property to @dev for qdev property @prop.
+ * On error, store error in @errp.  Static properties access data in a struct.
+ * The type of the QOM property is derived from prop->info.
  */
 void qdev_property_add_static(DeviceState *dev, Property *prop, Error **errp);
 
-- 
2.1.4


