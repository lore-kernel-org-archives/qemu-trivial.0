Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hFwXs-0000cB-RW
	for mharc-qemu-trivial@gnu.org; Mon, 15 Apr 2019 04:00:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hFwXq-0000aH-Ha
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2019 04:00:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hFwXp-0001QA-Dk
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2019 04:00:50 -0400
Received: from mga09.intel.com ([134.134.136.24]:40824)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1hFwXp-0001NR-1Y; Mon, 15 Apr 2019 04:00:49 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Apr 2019 01:00:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,352,1549958400"; d="scan'208";a="140739282"
Received: from xulike-server.sh.intel.com ([10.239.48.134])
	by fmsmga008.fm.intel.com with ESMTP; 15 Apr 2019 01:00:46 -0700
From: Like Xu <like.xu@linux.intel.com>
To: qemu-trivial@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, like.xu@intel.com
Date: Mon, 15 Apr 2019 15:59:45 +0800
Message-Id: <1555315185-16414-3-git-send-email-like.xu@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1555315185-16414-1-git-send-email-like.xu@linux.intel.com>
References: <1555315185-16414-1-git-send-email-like.xu@linux.intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: [Qemu-trivial] [Qemu-devel] [PATCH v3 2/2] core/qdev: refactor
 qdev_get_machine() with type assertion
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
X-List-Received-Date: Mon, 15 Apr 2019 08:00:51 -0000

To avoid the misuse of qdev_get_machine() if machine hasn't been created yet,
this patch uses qdev_get_machine_uncheck() for obj-common (share with user-only
mode) and adds type assertion to qdev_get_machine() in system-emulation mode.

Suggested-by: Igor Mammedov <imammedo@redhat.com>
Signed-off-by: Like Xu <like.xu@linux.intel.com>
---
 hw/core/qdev.c         | 16 +++++++++++++---
 include/hw/qdev-core.h |  1 +
 qom/cpu.c              |  5 +++--
 3 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index f9b6efe..8232216 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -223,7 +223,7 @@ HotplugHandler *qdev_get_machine_hotplug_handler(DeviceState *dev)
 {
     MachineState *machine;
     MachineClass *mc;
-    Object *m_obj = qdev_get_machine();
+    Object *m_obj = qdev_get_machine_uncheck();
 
     if (object_dynamic_cast(m_obj, TYPE_MACHINE)) {
         machine = MACHINE(m_obj);
@@ -815,7 +815,7 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
         if (!obj->parent) {
             gchar *name = g_strdup_printf("device[%d]", unattached_count++);
 
-            object_property_add_child(container_get(qdev_get_machine(),
+            object_property_add_child(container_get(qdev_get_machine_uncheck(),
                                                     "/unattached"),
                                       name, obj, &error_abort);
             unattached_parent = true;
@@ -1095,7 +1095,7 @@ void device_reset(DeviceState *dev)
     }
 }
 
-Object *qdev_get_machine(void)
+Object *qdev_get_machine_uncheck(void)
 {
     static Object *dev;
 
@@ -1106,6 +1106,16 @@ Object *qdev_get_machine(void)
     return dev;
 }
 
+Object *qdev_get_machine(void)
+{
+    static Object *dev;
+
+    dev = qdev_get_machine_uncheck();
+    assert(object_dynamic_cast(dev, TYPE_MACHINE) != NULL);
+
+    return dev;
+}
+
 static const TypeInfo device_type_info = {
     .name = TYPE_DEVICE,
     .parent = TYPE_OBJECT,
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 33ed3b8..e7c6a5a 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -429,6 +429,7 @@ const struct VMStateDescription *qdev_get_vmsd(DeviceState *dev);
 
 const char *qdev_fw_name(DeviceState *dev);
 
+Object *qdev_get_machine_uncheck(void);
 Object *qdev_get_machine(void);
 
 /* FIXME: make this a link<> */
diff --git a/qom/cpu.c b/qom/cpu.c
index a8d2958..bb877d5 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -325,9 +325,10 @@ static void cpu_common_parse_features(const char *typename, char *features,
 static void cpu_common_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cpu = CPU(dev);
-    Object *machine = qdev_get_machine();
+    Object *machine = qdev_get_machine_uncheck();
 
-    /* qdev_get_machine() can return something that's not TYPE_MACHINE
+    /*
+     * qdev_get_machine_uncheck() can return something that's not TYPE_MACHINE
      * if this is one of the user-only emulators; in that case there's
      * no need to check the ignore_memory_transaction_failures board flag.
      */
-- 
1.8.3.1


