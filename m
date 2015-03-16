Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXYtw-0006U0-UU
	for mharc-qemu-trivial@gnu.org; Mon, 16 Mar 2015 13:34:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YXYtu-0006R9-FF
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 13:34:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YXYtt-0004ro-IN
	for qemu-trivial@nongnu.org; Mon, 16 Mar 2015 13:34:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37823)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YXYto-0004qQ-8i; Mon, 16 Mar 2015 13:33:56 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2GHXtoR013259
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 16 Mar 2015 13:33:55 -0400
Received: from blackfin.pond.sub.org (ovpn-116-43.ams2.redhat.com
	[10.36.116.43])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2GHXrr2023325
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 16 Mar 2015 13:33:54 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C41E6303F19F; Mon, 16 Mar 2015 18:33:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 16 Mar 2015 18:33:52 +0100
Message-Id: <1426527232-15044-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, ehabkost@redhat.com, afaerber@suse.de
Subject: [Qemu-trivial] [PATCH] qdev: Make -device FOO,
	help help again when FOO is not pluggable
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
X-List-Received-Date: Mon, 16 Mar 2015 17:34:03 -0000

Doesn't work since commit 31bed55 changed qdev_device_help() to reject
abstract devices and devices that have
cannot_instantiate_with_device_add_yet set.

The former makes sense: abstract devices are purely internal, and the
implementation of the help feature can't cope with them.

The latter makes less sense: the implementation works fine, and even
though you can't -device such a device, the help may still be useful
elsewhere, for instance with -global.

Revert the latter by moving the cannot_instantiate_with_device_add_yet
check back to the other caller of qdev_get_device_class(),
qdev_device_add().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qdev-monitor.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/qdev-monitor.c b/qdev-monitor.c
index 5d30ac5..b0b8cf1 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -180,10 +180,14 @@ static const char *find_typename_by_alias(const char *alias)
     return NULL;
 }
 
+
+/**
+ * Return DeviceClass for concrete device type @driver.
+ * On error, store an error through @errp if non-null, and return %NULL.
+ */
 static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
 {
     ObjectClass *oc;
-    DeviceClass *dc;
 
     oc = object_class_by_name(*driver);
     if (!oc) {
@@ -206,15 +210,7 @@ static DeviceClass *qdev_get_device_class(const char **driver, Error **errp)
         return NULL;
     }
 
-    dc = DEVICE_CLASS(oc);
-    if (dc->cannot_instantiate_with_device_add_yet ||
-        (qdev_hotplug && !dc->hotpluggable)) {
-        error_set(errp, QERR_INVALID_PARAMETER_VALUE, "driver",
-                  "pluggable device type");
-        return NULL;
-    }
-
-    return dc;
+    return DEVICE_CLASS(oc);
 }
 
 
@@ -512,6 +508,12 @@ DeviceState *qdev_device_add(QemuOpts *opts)
         error_free(err);
         return NULL;
     }
+    if (dc->cannot_instantiate_with_device_add_yet ||
+        (qdev_hotplug && !dc->hotpluggable)) {
+        qerror_report(QERR_INVALID_PARAMETER_VALUE, "driver",
+                      "pluggable device type");
+        return NULL;
+    }
 
     /* find bus */
     path = qemu_opt_get(opts, "bus");
-- 
1.9.3


