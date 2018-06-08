Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fRKto-0007Oq-Of
	for mharc-qemu-trivial@gnu.org; Fri, 08 Jun 2018 13:10:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fRKtk-0007IM-0c
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 13:10:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1fRKth-0008VX-KV
	for qemu-trivial@nongnu.org; Fri, 08 Jun 2018 13:09:59 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58936 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1fRKtc-0008RL-Rt; Fri, 08 Jun 2018 13:09:52 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 804BB40122A1;
	Fri,  8 Jun 2018 17:09:52 +0000 (UTC)
Received: from t460.redhat.com (unknown [10.33.36.81])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3BA7D205D523;
	Fri,  8 Jun 2018 17:09:49 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Eric Blake <eblake@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Date: Fri,  8 Jun 2018 18:09:31 +0100
Message-Id: <20180608170933.9137-7-berrange@redhat.com>
In-Reply-To: <20180608170933.9137-1-berrange@redhat.com>
References: <20180608170933.9137-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Fri, 08 Jun 2018 17:09:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Fri, 08 Jun 2018 17:09:52 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH 6/8] authz: add QAuthZListFile object type
 for a file access control list
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
X-List-Received-Date: Fri, 08 Jun 2018 17:10:03 -0000

Add a QAuthZListFile object type that implements the QAuthZ interface. Th=
is
built-in implementation is a proxy around the QAtuhZList object type,
initializing it from an external file, and optionally, automatically
reloading it whenever it changes.

To create an instance of this object via the QMP monitor, the syntax
used would be:

      {
        "execute": "object-add",
        "arguments": {
          "qom-type": "authz-list",
          "id": "auth0",
          "parameters": {
            "filename": "/etc/qemu/vnc.acl",
	    "refresh": "yes"
          }
        }
      }

If "refresh" is "yes", inotify is used to monitor the file,
automatically reloading changes. If an error occurs during reloading,
all authorizations will fail until the file is next successfully
loaded.

The /etc/qemu/vnc.acl file would contain a JSON representation of a
QAuthZList object

    {
      "rules": [
         { "match": "fred", "policy": "allow", "format": "exact" },
         { "match": "bob", "policy": "allow", "format": "exact" },
         { "match": "danb", "policy": "deny", "format": "glob" },
         { "match": "dan*", "policy": "allow", "format": "exact" },
      ],
      "policy": "deny"
    }

This sets up an authorization rule that allows 'fred', 'bob' and anyone
whose name starts with 'dan', except for 'danb'. Everyone unmatched is
denied.

The object can be loaded on the comand line using

   -object authz-list-file,id=3Dauthz0,filename=3D/etc/qemu/vnc.acl,refre=
sh=3Dyes

Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 authz/Makefile.objs      |   1 +
 authz/listfile.c         | 252 +++++++++++++++++++++++++++++++++++++++
 authz/trace-events       |   4 +
 include/authz/listfile.h | 104 ++++++++++++++++
 qom/object.c             |  12 +-
 qom/object_interfaces.c  |  16 ++-
 6 files changed, 379 insertions(+), 10 deletions(-)
 create mode 100644 authz/listfile.c
 create mode 100644 include/authz/listfile.h

diff --git a/authz/Makefile.objs b/authz/Makefile.objs
index 921fa624d7..8351bf181d 100644
--- a/authz/Makefile.objs
+++ b/authz/Makefile.objs
@@ -1,3 +1,4 @@
 authz-obj-y +=3D base.o
 authz-obj-y +=3D simple.o
 authz-obj-y +=3D list.o
+authz-obj-y +=3D listfile.o
diff --git a/authz/listfile.c b/authz/listfile.c
new file mode 100644
index 0000000000..c04050fd0a
--- /dev/null
+++ b/authz/listfile.c
@@ -0,0 +1,252 @@
+/*
+ * QEMU access control list file authorization driver
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
+ * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "authz/listfile.h"
+#include "authz/trace.h"
+#include "qemu/error-report.h"
+#include "qemu/main-loop.h"
+#include "qemu/sockets.h"
+#include "qom/object_interfaces.h"
+#include "qapi/qapi-visit-authz.h"
+#include "qapi/qmp/qjson.h"
+#include "qapi/qmp/qobject.h"
+#include "qapi/qmp/qerror.h"
+#include "qapi/qobject-input-visitor.h"
+
+
+static bool
+qauthz_list_file_is_allowed(QAuthZ *authz,
+                            const char *identity,
+                            Error **errp)
+{
+    QAuthZListFile *fauthz =3D QAUTHZ_LIST_FILE(authz);
+    if (fauthz->list) {
+        return qauthz_is_allowed(fauthz->list, identity, errp);
+    }
+
+    return false;
+}
+
+
+static QAuthZ *
+qauthz_list_file_load(QAuthZListFile *fauthz, Error **errp)
+{
+    GError *err =3D NULL;
+    gchar *content =3D NULL;
+    gsize len;
+    QObject *obj =3D NULL;
+    QDict *pdict;
+    Visitor *v =3D NULL;
+    QAuthZ *ret =3D NULL;
+
+    trace_qauthz_list_file_load(fauthz, fauthz->filename);
+    if (!g_file_get_contents(fauthz->filename, &content, &len, &err)) {
+        error_setg(errp, "Unable to read '%s': %s",
+                   fauthz->filename, err->message);
+        goto cleanup;
+    }
+
+    obj =3D qobject_from_json(content, errp);
+    if (!obj) {
+        goto cleanup;
+    }
+
+    pdict =3D qobject_to(QDict, obj);
+    if (!pdict) {
+        error_setg(errp, QERR_INVALID_PARAMETER_TYPE, "obj", "dict");
+        goto cleanup;
+    }
+
+    v =3D qobject_input_visitor_new(obj);
+
+    ret =3D (QAuthZ *)user_creatable_add_type(TYPE_QAUTHZ_LIST,
+                                            NULL, pdict, v, errp);
+
+ cleanup:
+    visit_free(v);
+    qobject_unref(obj);
+    if (err) {
+        g_error_free(err);
+    }
+    g_free(content);
+    return ret;
+}
+
+
+static void
+qauthz_list_file_inotify(int wd G_GNUC_UNUSED,
+                         uint32_t mask,
+                         const char *name G_GNUC_UNUSED,
+                         void *opaque)
+{
+    QAuthZListFile *fauthz =3D opaque;
+    Error *err =3D NULL;
+
+    if (!(mask & IN_CLOSE_WRITE)) {
+        return;
+    }
+
+    object_unref(OBJECT(fauthz->list));
+    fauthz->list =3D qauthz_list_file_load(fauthz, &err);
+    trace_qauthz_list_file_refresh(fauthz,
+                                   fauthz->filename, fauthz->list ? 1 : =
0);
+    if (!fauthz->list) {
+        error_report_err(err);
+    }
+}
+
+static void
+qauthz_list_file_complete(UserCreatable *uc, Error **errp)
+{
+    QAuthZListFile *fauthz =3D QAUTHZ_LIST_FILE(uc);
+
+    fauthz->list =3D qauthz_list_file_load(fauthz, errp);
+
+    if (fauthz->refresh) {
+        fauthz->inotify =3D qemu_inotify_new(qauthz_list_file_inotify,
+                                           fauthz,
+                                           NULL,
+                                           errp);
+        if (!fauthz->inotify) {
+            return;
+        }
+
+#ifdef CONFIG_INOTIFY1
+        if (qemu_inotify_add_watch(fauthz->inotify,
+                                   fauthz->filename,
+                                   IN_CLOSE_WRITE,
+                                   errp) < 0) {
+            return;
+        }
+#endif
+    }
+}
+
+
+static void
+qauthz_list_file_prop_set_filename(Object *obj,
+                                   const char *value,
+                                   Error **errp G_GNUC_UNUSED)
+{
+    QAuthZListFile *authz =3D QAUTHZ_LIST_FILE(obj);
+
+    authz->filename =3D g_strdup(value);
+}
+
+
+static char *
+qauthz_list_file_prop_get_filename(Object *obj,
+                                   Error **errp G_GNUC_UNUSED)
+{
+    QAuthZListFile *authz =3D QAUTHZ_LIST_FILE(obj);
+
+    return g_strdup(authz->filename);
+}
+
+
+static void
+qauthz_list_file_prop_set_refresh(Object *obj,
+                                  bool value,
+                                  Error **errp G_GNUC_UNUSED)
+{
+    QAuthZListFile *authz =3D QAUTHZ_LIST_FILE(obj);
+
+    authz->refresh =3D value;
+}
+
+
+static bool
+qauthz_list_file_prop_get_refresh(Object *obj,
+                                  Error **errp G_GNUC_UNUSED)
+{
+    QAuthZListFile *authz =3D QAUTHZ_LIST_FILE(obj);
+
+    return authz->refresh;
+}
+
+
+static void
+qauthz_list_file_finalize(Object *obj)
+{
+    QAuthZListFile *authz =3D QAUTHZ_LIST_FILE(obj);
+
+    qemu_inotify_free(authz->inotify);
+    object_unref(OBJECT(authz->list));
+    g_free(authz->filename);
+}
+
+
+static void
+qauthz_list_file_class_init(ObjectClass *oc, void *data)
+{
+    UserCreatableClass *ucc =3D USER_CREATABLE_CLASS(oc);
+    QAuthZClass *authz =3D QAUTHZ_CLASS(oc);
+
+    ucc->complete =3D qauthz_list_file_complete;
+
+    object_class_property_add_str(oc, "filename",
+                                  qauthz_list_file_prop_get_filename,
+                                  qauthz_list_file_prop_set_filename,
+                                  NULL);
+    object_class_property_add_bool(oc, "refresh",
+                                   qauthz_list_file_prop_get_refresh,
+                                   qauthz_list_file_prop_set_refresh,
+                                   NULL);
+
+    authz->is_allowed =3D qauthz_list_file_is_allowed;
+}
+
+
+QAuthZListFile *qauthz_list_file_new(const char *id,
+                                     const char *filename,
+                                     Error **errp)
+{
+    return QAUTHZ_LIST_FILE(
+        object_new_with_props(TYPE_QAUTHZ_LIST_FILE,
+                              object_get_objects_root(),
+                              id, errp,
+                              "filename", filename,
+                              NULL));
+}
+
+
+static const TypeInfo qauthz_list_file_info =3D {
+    .parent =3D TYPE_QAUTHZ_LIST,
+    .name =3D TYPE_QAUTHZ_LIST_FILE,
+    .instance_size =3D sizeof(QAuthZListFile),
+    .instance_finalize =3D qauthz_list_file_finalize,
+    .class_size =3D sizeof(QAuthZListFileClass),
+    .class_init =3D qauthz_list_file_class_init,
+    .interfaces =3D (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+
+static void
+qauthz_list_file_register_types(void)
+{
+    type_register_static(&qauthz_list_file_info);
+}
+
+
+type_init(qauthz_list_file_register_types);
diff --git a/authz/trace-events b/authz/trace-events
index a896d876e8..fb65349a90 100644
--- a/authz/trace-events
+++ b/authz/trace-events
@@ -9,3 +9,7 @@ qauthz_simple_is_allowed(void *authz, const char *wantide=
ntity, const char *goti
 # auth/list.c
 qauthz_list_check_rule(void *authz, const char *identity, const char *ru=
le, int format, int policy) "AuthZ list %p check rule=3D%s identity=3D%s =
format=3D%d policy=3D%d"
 qauthz_list_default_policy(void *authz, const char *identity, int policy=
) "AuthZ list %p default identity=3D%s policy=3D%d"
+
+# auth/listfile.c
+qauthz_list_file_load(void *authz, const char *filename) "AuthZ file %p =
load filename=3D%s"
+qauthz_list_file_refresh(void *authz, const char *filename, int success)=
 "AuthZ file %p load filename=3D%s success=3D%d"
diff --git a/include/authz/listfile.h b/include/authz/listfile.h
new file mode 100644
index 0000000000..7b01bcfbd7
--- /dev/null
+++ b/include/authz/listfile.h
@@ -0,0 +1,104 @@
+/*
+ * QEMU list file authorization driver
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
+ * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
+ *
+ */
+
+#ifndef QAUTHZ_LIST_FILE_H__
+#define QAUTHZ_LIST_FILE_H__
+
+#include "authz/list.h"
+#include "qapi/qapi-types-authz.h"
+#include "qemu/inotify.h"
+
+#define TYPE_QAUTHZ_LIST_FILE "authz-list-file"
+
+#define QAUTHZ_LIST_FILE_CLASS(klass)                        \
+    OBJECT_CLASS_CHECK(QAuthZListFileClass, (klass),        \
+                       TYPE_QAUTHZ_LIST_FILE)
+#define QAUTHZ_LIST_FILE_GET_CLASS(obj)              \
+    OBJECT_GET_CLASS(QAuthZListFileClass, (obj),    \
+                      TYPE_QAUTHZ_LIST_FILE)
+#define QAUTHZ_LIST_FILE(obj) \
+    INTERFACE_CHECK(QAuthZListFile, (obj),          \
+                    TYPE_QAUTHZ_LIST_FILE)
+
+typedef struct QAuthZListFile QAuthZListFile;
+typedef struct QAuthZListFileClass QAuthZListFileClass;
+
+
+/**
+ * QAuthZListFile:
+ *
+ * This authorization driver provides a file mechanism
+ * for granting access by matching user names against a
+ * file of globs. Each match rule has an associated policy
+ * and a catch all policy applies if no rule matches
+ *
+ * To create an instance of this class via QMP:
+ *
+ *  {
+ *    "execute": "object-add",
+ *    "arguments": {
+ *      "qom-type": "authz-list-file",
+ *      "id": "authz0",
+ *      "parameters": {
+ *        "filename": "/etc/qemu/myvm-vnc.acl",
+ *        "refresh": "yes"
+ *      }
+ *    }
+ *  }
+ *
+ * If 'refresh' is 'yes', inotify is used to monitor for changes
+ * to the file and auto-reload the rules.
+ *
+ * The myvm-vnc.acl file should contain the parameters for
+ * the QAuthZList object in JSON format:
+ *
+ *      {
+ *        "rules": [
+ *           { "match": "fred", "policy": "allow", "format": "exact" },
+ *           { "match": "bob", "policy": "allow", "format": "exact" },
+ *           { "match": "danb", "policy": "deny", "format": "exact" },
+ *           { "match": "dan*", "policy": "allow", "format": "glob" }
+ *        ],
+ *        "policy": "deny"
+ *      }
+ *
+ */
+struct QAuthZListFile {
+    QAuthZ parent_obj;
+
+    QAuthZ *list;
+    char *filename;
+    bool refresh;
+    QInotify *inotify;
+};
+
+
+struct QAuthZListFileClass {
+    QAuthZClass parent_class;
+};
+
+
+QAuthZListFile *qauthz_list_file_new(const char *id,
+                                     const char *filename,
+                                     Error **errp);
+
+
+#endif /* QAUTHZ_LIST_FILE_H__ */
+
diff --git a/qom/object.c b/qom/object.c
index cb7a8cd589..6ffe7d0362 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -546,15 +546,19 @@ Object *object_new_with_propv(const char *typename,
         goto error;
     }
=20
-    object_property_add_child(parent, id, obj, &local_err);
-    if (local_err) {
-        goto error;
+    if (id !=3D NULL) {
+        object_property_add_child(parent, id, obj, &local_err);
+        if (local_err) {
+            goto error;
+        }
     }
=20
     if (object_dynamic_cast(obj, TYPE_USER_CREATABLE)) {
         user_creatable_complete(obj, &local_err);
         if (local_err) {
-            object_unparent(obj);
+            if (id !=3D NULL) {
+                object_unparent(obj);
+            }
             goto error;
         }
     }
diff --git a/qom/object_interfaces.c b/qom/object_interfaces.c
index 72b97a8bed..e0f12c0a9b 100644
--- a/qom/object_interfaces.c
+++ b/qom/object_interfaces.c
@@ -83,16 +83,20 @@ Object *user_creatable_add_type(const char *type, con=
st char *id,
         goto out;
     }
=20
-    object_property_add_child(object_get_objects_root(),
-                              id, obj, &local_err);
-    if (local_err) {
-        goto out;
+    if (id !=3D NULL) {
+        object_property_add_child(object_get_objects_root(),
+                                  id, obj, &local_err);
+        if (local_err) {
+            goto out;
+        }
     }
=20
     user_creatable_complete(obj, &local_err);
     if (local_err) {
-        object_property_del(object_get_objects_root(),
-                            id, &error_abort);
+        if (id !=3D NULL) {
+            object_property_del(object_get_objects_root(),
+                                id, &error_abort);
+        }
         goto out;
     }
 out:
--=20
2.17.0


