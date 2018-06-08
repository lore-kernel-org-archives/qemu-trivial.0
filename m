Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fRKtj-0007Ho-Kd
	for mharc-qemu-trivial@gnu.org; Fri, 08 Jun 2018 13:09:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fRKth-0007EZ-2q
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 13:09:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fRKtf-0008TQ-Cc
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 13:09:56 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:40798 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1fRKtX-0008O7-SW; Fri, 08 Jun 2018 13:09:47 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7FF35859AE;
	Fri,  8 Jun 2018 17:09:47 +0000 (UTC)
Received: from t460.redhat.com (unknown [10.33.36.81])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 35B582144B4F;
	Fri,  8 Jun 2018 17:09:45 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Date: Fri,  8 Jun 2018 18:09:29 +0100
Message-Id: <20180608170933.9137-5-berrange@redhat.com>
In-Reply-To: <20180608170933.9137-1-berrange@redhat.com>
References: <20180608170933.9137-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 08 Jun 2018 17:09:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 08 Jun 2018 17:09:47 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH 4/8] authz: add QAuthZSimple object type for
 trivial auth checks
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
X-List-Received-Date: Fri, 08 Jun 2018 17:09:58 -0000

In many cases a single VM will just need to whilelist a single identity
as the allowed user of network services. This is especially the case for
TLS live migration (optionally with NBD storage) where we just need to
whitelist the x509 certificate distinguished name of the source QEMU
host.

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 authz/Makefile.objs    |   1 +
 authz/simple.c         | 122 +++++++++++++++++++++++++++++++++++++++++
 authz/trace-events     |   3 +
 include/authz/simple.h |  81 +++++++++++++++++++++++++++
 4 files changed, 207 insertions(+)
 create mode 100644 authz/simple.c
 create mode 100644 include/authz/simple.h

diff --git a/authz/Makefile.objs b/authz/Makefile.objs
index 12597c9528..2a75d53840 100644
--- a/authz/Makefile.objs
+++ b/authz/Makefile.objs
@@ -1 +1,2 @@
 authz-obj-y += base.o
+authz-obj-y += simple.o
diff --git a/authz/simple.c b/authz/simple.c
new file mode 100644
index 0000000000..1ed1605b14
--- /dev/null
+++ b/authz/simple.c
@@ -0,0 +1,122 @@
+/*
+ * QEMU simple authorization driver
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
+#include "authz/simple.h"
+#include "authz/trace.h"
+#include "qom/object_interfaces.h"
+
+static bool qauthz_simple_is_allowed(QAuthZ *authz,
+                                     const char *identity,
+                                     Error **errp)
+{
+    QAuthZSimple *sauthz = QAUTHZ_SIMPLE(authz);
+
+    trace_qauthz_simple_is_allowed(authz, sauthz->identity, identity);
+    return g_str_equal(identity, sauthz->identity);
+}
+
+static void
+qauthz_simple_prop_set_identity(Object *obj,
+                                const char *value,
+                                Error **errp G_GNUC_UNUSED)
+{
+    QAuthZSimple *authz = QAUTHZ_SIMPLE(obj);
+
+    authz->identity = g_strdup(value);
+}
+
+
+static char *
+qauthz_simple_prop_get_identity(Object *obj,
+                                Error **errp G_GNUC_UNUSED)
+{
+    QAuthZSimple *authz = QAUTHZ_SIMPLE(obj);
+
+    return g_strdup(authz->identity);
+}
+
+
+static void
+qauthz_simple_complete(UserCreatable *uc, Error **errp)
+{
+}
+
+
+static void
+qauthz_simple_finalize(Object *obj)
+{
+    QAuthZSimple *sauthz = QAUTHZ_SIMPLE(obj);
+
+    g_free(sauthz->identity);
+}
+
+
+static void
+qauthz_simple_class_init(ObjectClass *oc, void *data)
+{
+    UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
+    QAuthZClass *authz = QAUTHZ_CLASS(oc);
+
+    ucc->complete = qauthz_simple_complete;
+    authz->is_allowed = qauthz_simple_is_allowed;
+
+    object_class_property_add_str(oc, "identity",
+                                  qauthz_simple_prop_get_identity,
+                                  qauthz_simple_prop_set_identity,
+                                  NULL);
+}
+
+
+QAuthZSimple *qauthz_simple_new(const char *id,
+                                const char *identity,
+                                Error **errp)
+{
+    return QAUTHZ_SIMPLE(
+        object_new_with_props(TYPE_QAUTHZ_SIMPLE,
+                              object_get_objects_root(),
+                              id, errp,
+                              "identity", identity,
+                              NULL));
+}
+
+
+static const TypeInfo qauthz_simple_info = {
+    .parent = TYPE_QAUTHZ,
+    .name = TYPE_QAUTHZ_SIMPLE,
+    .instance_size = sizeof(QAuthZSimple),
+    .instance_finalize = qauthz_simple_finalize,
+    .class_size = sizeof(QAuthZSimpleClass),
+    .class_init = qauthz_simple_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+
+static void
+qauthz_simple_register_types(void)
+{
+    type_register_static(&qauthz_simple_info);
+}
+
+
+type_init(qauthz_simple_register_types);
diff --git a/authz/trace-events b/authz/trace-events
index 481c90f511..1ef796c1e1 100644
--- a/authz/trace-events
+++ b/authz/trace-events
@@ -2,3 +2,6 @@
 
 # authz/base.c
 qauthz_is_allowed(void *authz, const char *identity, bool allowed) "AuthZ %p check identity=%s allowed=%d"
+
+# auth/simple.c
+qauthz_simple_is_allowed(void *authz, const char *wantidentity, const char *gotidentity) "AuthZ simple %p check want identity=%s got identity=%s"
diff --git a/include/authz/simple.h b/include/authz/simple.h
new file mode 100644
index 0000000000..e669f4afec
--- /dev/null
+++ b/include/authz/simple.h
@@ -0,0 +1,81 @@
+/*
+ * QEMU simple authorization driver
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
+#ifndef QAUTHZ_SIMPLE_H__
+#define QAUTHZ_SIMPLE_H__
+
+#include "authz/base.h"
+#include "qapi/qapi-types-authz.h"
+
+#define TYPE_QAUTHZ_SIMPLE "authz-simple"
+
+#define QAUTHZ_SIMPLE_CLASS(klass)                        \
+    OBJECT_CLASS_CHECK(QAuthZSimpleClass, (klass),        \
+                       TYPE_QAUTHZ_SIMPLE)
+#define QAUTHZ_SIMPLE_GET_CLASS(obj)              \
+    OBJECT_GET_CLASS(QAuthZSimpleClass, (obj),    \
+                      TYPE_QAUTHZ_SIMPLE)
+#define QAUTHZ_SIMPLE(obj) \
+    INTERFACE_CHECK(QAuthZSimple, (obj),          \
+                    TYPE_QAUTHZ_SIMPLE)
+
+typedef struct QAuthZSimple QAuthZSimple;
+typedef struct QAuthZSimpleClass QAuthZSimpleClass;
+
+
+/**
+ * QAuthZSimple:
+ *
+ * This authorization driver provides a simple mechanism
+ * for granting access based on an exact matched username.
+ *
+ * To create an instance of this class via QMP:
+ *
+ *  {
+ *    "execute": "object-add",
+ *    "arguments": {
+ *      "qom-type": "authz-simple",
+ *      "id": "authz0",
+ *      "parameters": {
+ *        "identity": "fred"
+ *      }
+ *    }
+ *  }
+ *
+ */
+struct QAuthZSimple {
+    QAuthZ parent_obj;
+
+    char *identity;
+};
+
+
+struct QAuthZSimpleClass {
+    QAuthZClass parent_class;
+};
+
+
+QAuthZSimple *qauthz_simple_new(const char *id,
+                                const char *identity,
+                                Error **errp);
+
+
+#endif /* QAUTHZ_SIMPLE_H__ */
+
-- 
2.17.0


