Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fRKth-0007FB-D7
	for mharc-qemu-trivial@gnu.org; Fri, 08 Jun 2018 13:09:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fRKtd-0007Cd-6c
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 13:09:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fRKta-0008Ph-6h
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 13:09:53 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58924 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1fRKtV-0008MG-AV; Fri, 08 Jun 2018 13:09:45 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E0F2C40122A9;
	Fri,  8 Jun 2018 17:09:44 +0000 (UTC)
Received: from t460.redhat.com (unknown [10.33.36.81])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E2E64215672D;
	Fri,  8 Jun 2018 17:09:42 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Date: Fri,  8 Jun 2018 18:09:28 +0100
Message-Id: <20180608170933.9137-4-berrange@redhat.com>
In-Reply-To: <20180608170933.9137-1-berrange@redhat.com>
References: <20180608170933.9137-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 08 Jun 2018 17:09:44 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 08 Jun 2018 17:09:44 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH 3/8] authz: add QAuthZ object as an
 authorization base class
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
X-List-Received-Date: Fri, 08 Jun 2018 17:09:55 -0000

From: "Daniel P. Berrange" <berrange@redhat.com>

The current qemu_acl module provides a simple access control list
facility inside QEMU, which is used via a set of monitor commands
acl_show, acl_policy, acl_add, acl_remove & acl_reset.

Note there is no ability to create ACLs - the network services (eg VNC
server) were expected to create ACLs that they want to check.

There is also no way to define ACLs on the command line, nor potentially
integrate with external authorization systems like polkit, pam, ldap
lookup, etc.

The QAuthZ object defines a minimal abstract QOM class that can be
subclassed for creating different authorization providers.

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 MAINTAINERS          |   7 +++
 Makefile             |  10 ++--
 Makefile.objs        |   6 +++
 Makefile.target      |   2 +
 authz/Makefile.objs  |   1 +
 authz/base.c         |  82 +++++++++++++++++++++++++++++++
 authz/trace-events   |   4 ++
 include/authz/base.h | 112 +++++++++++++++++++++++++++++++++++++++++++
 8 files changed, 220 insertions(+), 4 deletions(-)
 create mode 100644 authz/Makefile.objs
 create mode 100644 authz/base.c
 create mode 100644 authz/trace-events
 create mode 100644 include/authz/base.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3610479af7..54a80eddc5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1757,6 +1757,13 @@ F: io/
 F: include/io/
 F: tests/test-io-*
 
+User authorization
+M: Daniel P. Berrange <berrange@redhat.com>
+S: Maintained
+F: authz/
+F: include/authz/
+F: tests/test-authz-*
+
 Sockets
 M: Daniel P. Berrange <berrange@redhat.com>
 M: Gerd Hoffmann <kraxel@redhat.com>
diff --git a/Makefile b/Makefile
index 023b3437ec..7d535c54f0 100644
--- a/Makefile
+++ b/Makefile
@@ -412,6 +412,7 @@ endif
 
 dummy := $(call unnest-vars,, \
                 stub-obj-y \
+                authz-obj-y \
                 chardev-obj-y \
                 util-obj-y \
                 qga-obj-y \
@@ -473,6 +474,7 @@ qemu-options.def: $(SRC_PATH)/qemu-options.hx $(SRC_PATH)/scripts/hxtool
 SUBDIR_RULES=$(patsubst %,subdir-%, $(TARGET_LIST))
 SOFTMMU_SUBDIR_RULES=$(filter %-softmmu,$(SUBDIR_RULES))
 
+$(SOFTMMU_SUBDIR_RULES): $(authz-obj-y)
 $(SOFTMMU_SUBDIR_RULES): $(block-obj-y)
 $(SOFTMMU_SUBDIR_RULES): $(crypto-obj-y)
 $(SOFTMMU_SUBDIR_RULES): $(io-obj-y)
@@ -535,9 +537,9 @@ COMMON_LDADDS = libqemuutil.a
 
 qemu-img.o: qemu-img-cmds.h
 
-qemu-img$(EXESUF): qemu-img.o $(block-obj-y) $(crypto-obj-y) $(io-obj-y) $(qom-obj-y) $(COMMON_LDADDS)
-qemu-nbd$(EXESUF): qemu-nbd.o $(block-obj-y) $(crypto-obj-y) $(io-obj-y) $(qom-obj-y) $(COMMON_LDADDS)
-qemu-io$(EXESUF): qemu-io.o $(block-obj-y) $(crypto-obj-y) $(io-obj-y) $(qom-obj-y) $(COMMON_LDADDS)
+qemu-img$(EXESUF): qemu-img.o $(authz-obj-y) $(block-obj-y) $(crypto-obj-y) $(io-obj-y) $(qom-obj-y) $(COMMON_LDADDS)
+qemu-nbd$(EXESUF): qemu-nbd.o $(authz-obj-y) $(block-obj-y) $(crypto-obj-y) $(io-obj-y) $(qom-obj-y) $(COMMON_LDADDS)
+qemu-io$(EXESUF): qemu-io.o $(authz-obj-y) $(block-obj-y) $(crypto-obj-y) $(io-obj-y) $(qom-obj-y) $(COMMON_LDADDS)
 
 qemu-bridge-helper$(EXESUF): qemu-bridge-helper.o $(COMMON_LDADDS)
 
@@ -546,7 +548,7 @@ qemu-keymap$(EXESUF): qemu-keymap.o ui/input-keymap.o $(COMMON_LDADDS)
 fsdev/virtfs-proxy-helper$(EXESUF): fsdev/virtfs-proxy-helper.o fsdev/9p-marshal.o fsdev/9p-iov-marshal.o $(COMMON_LDADDS)
 fsdev/virtfs-proxy-helper$(EXESUF): LIBS += -lcap
 
-scsi/qemu-pr-helper$(EXESUF): scsi/qemu-pr-helper.o scsi/utils.o $(crypto-obj-y) $(io-obj-y) $(qom-obj-y) $(COMMON_LDADDS)
+scsi/qemu-pr-helper$(EXESUF): scsi/qemu-pr-helper.o scsi/utils.o $(authz-obj-y) $(crypto-obj-y) $(io-obj-y) $(qom-obj-y) $(COMMON_LDADDS)
 ifdef CONFIG_MPATH
 scsi/qemu-pr-helper$(EXESUF): LIBS += -ludev -lmultipath -lmpathpersist
 endif
diff --git a/Makefile.objs b/Makefile.objs
index 2c8cb72407..90334b38ec 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -62,6 +62,11 @@ util-obj-y += qapi/qapi-introspect.o
 
 chardev-obj-y = chardev/
 
+#######################################################################
+# authz-obj-y is code used by both qemu system emulation and qemu-img
+
+authz-obj-y = authz/
+
 #######################################################################
 # block-obj-y is code used by both qemu system emulation and qemu-img
 
@@ -199,6 +204,7 @@ trace-events-subdirs =
 trace-events-subdirs += accel/kvm
 trace-events-subdirs += accel/tcg
 trace-events-subdirs += audio
+trace-events-subdirs += authz
 trace-events-subdirs += block
 trace-events-subdirs += chardev
 trace-events-subdirs += crypto
diff --git a/Makefile.target b/Makefile.target
index dad2cf8778..0499ef4014 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -166,6 +166,7 @@ include $(SRC_PATH)/Makefile.objs
 dummy := $(call unnest-vars,,target-obj-y)
 target-obj-y-save := $(target-obj-y)
 dummy := $(call unnest-vars,.., \
+               authz-obj-y \
                block-obj-y \
                block-obj-m \
                chardev-obj-y \
@@ -179,6 +180,7 @@ target-obj-y := $(target-obj-y-save)
 all-obj-y += $(common-obj-y)
 all-obj-y += $(target-obj-y)
 all-obj-y += $(qom-obj-y)
+all-obj-$(CONFIG_SOFTMMU) += $(authz-obj-y)
 all-obj-$(CONFIG_SOFTMMU) += $(block-obj-y) $(chardev-obj-y)
 all-obj-$(CONFIG_USER_ONLY) += $(crypto-aes-obj-y)
 all-obj-$(CONFIG_SOFTMMU) += $(crypto-obj-y)
diff --git a/authz/Makefile.objs b/authz/Makefile.objs
new file mode 100644
index 0000000000..12597c9528
--- /dev/null
+++ b/authz/Makefile.objs
@@ -0,0 +1 @@
+authz-obj-y += base.o
diff --git a/authz/base.c b/authz/base.c
new file mode 100644
index 0000000000..5b15811384
--- /dev/null
+++ b/authz/base.c
@@ -0,0 +1,82 @@
+/*
+ * QEMU authorization framework base class
+ *
+ * Copyright (c) 2018 Red Hat, Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "authz/base.h"
+#include "authz/trace.h"
+
+bool qauthz_is_allowed(QAuthZ *authz,
+                       const char *identity,
+                       Error **errp)
+{
+    QAuthZClass *cls = QAUTHZ_GET_CLASS(authz);
+    bool allowed;
+
+    allowed = cls->is_allowed(authz, identity, errp);
+    trace_qauthz_is_allowed(authz, identity, allowed);
+
+    return allowed;
+}
+
+
+bool qauthz_is_allowed_by_id(const char *authzid,
+                             const char *identity,
+                             Error **errp)
+{
+    QAuthZ *authz;
+    Object *obj;
+    Object *container;
+
+    container = object_get_objects_root();
+    obj = object_resolve_path_component(container,
+                                        authzid);
+    if (!obj) {
+        error_setg(errp, "Cannot find QAuthZ object ID %s",
+                   authzid);
+        return 0;
+    }
+
+    if (!object_dynamic_cast(obj, TYPE_QAUTHZ)) {
+        error_setg(errp, "Object '%s' is not a QAuthZ subclass",
+                   authzid);
+        return 0;
+    }
+
+    authz = QAUTHZ(obj);
+
+    return qauthz_is_allowed(authz, identity, errp);
+}
+
+
+static const TypeInfo authz_info = {
+    .parent = TYPE_OBJECT,
+    .name = TYPE_QAUTHZ,
+    .instance_size = sizeof(QAuthZ),
+    .class_size = sizeof(QAuthZClass),
+    .abstract = true,
+};
+
+static void qauthz_register_types(void)
+{
+    type_register_static(&authz_info);
+}
+
+type_init(qauthz_register_types)
+
diff --git a/authz/trace-events b/authz/trace-events
new file mode 100644
index 0000000000..481c90f511
--- /dev/null
+++ b/authz/trace-events
@@ -0,0 +1,4 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
+# authz/base.c
+qauthz_is_allowed(void *authz, const char *identity, bool allowed) "AuthZ %p check identity=%s allowed=%d"
diff --git a/include/authz/base.h b/include/authz/base.h
new file mode 100644
index 0000000000..77dcd54c4c
--- /dev/null
+++ b/include/authz/base.h
@@ -0,0 +1,112 @@
+/*
+ * QEMU authorization framework base class
+ *
+ * Copyright (c) 2018 Red Hat, Inc.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#ifndef QAUTHZ_BASE_H__
+#define QAUTHZ_BASE_H__
+
+#include "qemu-common.h"
+#include "qapi/error.h"
+#include "qom/object.h"
+
+
+#define TYPE_QAUTHZ "authz"
+
+#define QAUTHZ_CLASS(klass) \
+     OBJECT_CLASS_CHECK(QAuthZClass, (klass), \
+                        TYPE_QAUTHZ)
+#define QAUTHZ_GET_CLASS(obj) \
+     OBJECT_GET_CLASS(QAuthZClass, (obj), \
+                      TYPE_QAUTHZ)
+#define QAUTHZ(obj) \
+     INTERFACE_CHECK(QAuthZ, (obj), \
+                     TYPE_QAUTHZ)
+
+typedef struct QAuthZ QAuthZ;
+typedef struct QAuthZClass QAuthZClass;
+
+/**
+ * QAuthZ:
+ *
+ * The QAuthZ class defines an API contract to be used
+ * for providing an authorization driver for services
+ * with user identities.
+ */
+
+struct QAuthZ {
+    Object parent_obj;
+};
+
+
+struct QAuthZClass {
+    ObjectClass parent_class;
+
+    bool (*is_allowed)(QAuthZ *authz,
+                       const char *identity,
+                       Error **errp);
+};
+
+
+/**
+ * qauthz_is_allowed:
+ * @authz: the authorization object
+ * @identity: the user identity to authorize
+ * @errp: pointer to a NULL initialized error object
+ *
+ * Check if a user @identity is authorized. If an error
+ * occurs this method will return false to indicate
+ * denial, as well as setting @errp to contain the details.
+ * Callers are recommended to treat the denial and error
+ * scenarios identically. Specifically the error info in
+ * @errp should never be fed back to the user being
+ * authorized, it is merely for benefit of administrator
+ * debugging.
+ *
+ * Returns: true if @identity is authorized, false if denied or if
+ * an error occurred.
+ */
+bool qauthz_is_allowed(QAuthZ *authz,
+                       const char *identity,
+                       Error **errp);
+
+
+/**
+ * qauthz_is_allowed_by_id:
+ * @authzid: ID of the authorization object
+ * @identity: the user identity to authorize
+ * @errp: pointer to a NULL initialized error object
+ *
+ * Check if a user @identity is authorized. If an error
+ * occurs this method will return false to indicate
+ * denial, as well as setting @errp to contain the details.
+ * Callers are recommended to treat the denial and error
+ * scenarios identically. Specifically the error info in
+ * @errp should never be fed back to the user being
+ * authorized, it is merely for benefit of administrator
+ * debugging.
+ *
+ * Returns: true if @identity is authorized, false if denied or if
+ * an error occurred.
+ */
+bool qauthz_is_allowed_by_id(const char *authzid,
+                             const char *identity,
+                             Error **errp);
+
+#endif /* QAUTHZ_BASE_H__ */
+
-- 
2.17.0


