Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aj2Fx-0000yR-9s
	for mharc-qemu-trivial@gnu.org; Thu, 24 Mar 2016 06:12:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aj2Fu-0000uo-TA
	for qemu-trivial@nongnu.org; Thu, 24 Mar 2016 06:12:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aj2Fr-00010K-1g
	for qemu-trivial@nongnu.org; Thu, 24 Mar 2016 06:12:42 -0400
Received: from [59.151.112.132] (port=49310 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aj2Fm-0000uX-As; Thu, 24 Mar 2016 06:12:34 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="4927322"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Mar 2016 18:12:14 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id D14D3408D264;
	Thu, 24 Mar 2016 18:12:13 +0800 (CST)
Received: from G08FNSTD140223.g08.fujitsu.local (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 24 Mar 2016 18:12:13 +0800
From: Cao jin <caoj.fnst@cn.fujitsu.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 24 Mar 2016 18:14:21 +0800
Message-ID: <1458814461-5387-1-git-send-email-caoj.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: D14D3408D264.AAAC0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, eblake@redhat.com,
	armbru@redhat.com, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH] qdev property: cleanup
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
X-List-Received-Date: Thu, 24 Mar 2016 10:12:44 -0000

include:
1. remove unnecessary declaration of static function
2. fix inconsistency between comment and function name, and typo OOM->QOM
2. update comment of function

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
A question about legacy property: I don`t see legacy property is really
used in the code, so, why still add legacy property to object?

since it has no maintainer, so the cc list is by intuition...

 hw/core/qdev.c               | 14 ++++++--------
 include/hw/qdev-properties.h |  4 ++--
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index db41aa1..743b71b 100644
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
@@ -908,12 +905,12 @@ static void qdev_get_legacy_property(Object *obj, Visitor *v,
 }
 
 /**
- * @qdev_add_legacy_property - adds a legacy property
+ * @qdev_property_add_legacy - adds a legacy property
  *
  * Do not use this is new code!  Properties added through this interface will
  * be given names and types in the "legacy" namespace.
  *
- * Legacy properties are string versions of other OOM properties.  The format
+ * Legacy properties are string versions of other QOM properties.  The format
  * of the string depends on the property type.
  */
 static void qdev_property_add_legacy(DeviceState *dev, Property *prop,
@@ -937,10 +934,11 @@ static void qdev_property_add_legacy(DeviceState *dev, Property *prop,
 }
 
 /**
- * @qdev_property_add_static - add a @Property to a device.
+ * @qdev_property_add_static
+ * add a QOM property to @dev via its qdev Property @prop
  *
- * Static properties access data in a struct.  The actual type of the
- * property and the field depends on the property type.
+ * Static properties access data in a struct. The actual type of ObjectProperty
+ * and the struct field depends on the @qtype type.
  */
 void qdev_property_add_static(DeviceState *dev, Property *prop,
                               Error **errp)
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 0586cac..8c4481b 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -197,8 +197,8 @@ void error_set_from_qdev_prop_error(Error **errp, int ret, DeviceState *dev,
                                     Property *prop, const char *value);
 
 /**
- * @qdev_property_add_static - add a @Property to a device referencing a
- * field in a struct.
+ * @qdev_property_add_static - add a ObjectProperty to @dev via its qdev
+ * property @prop, referencing a field in the struct.
  */
 void qdev_property_add_static(DeviceState *dev, Property *prop, Error **errp);
 
-- 
2.1.0




