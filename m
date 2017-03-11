Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cmgzG-0001m5-QX
	for mharc-qemu-trivial@gnu.org; Sat, 11 Mar 2017 08:23:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1cmgzE-0001kG-OZ
	for qemu-trivial@nongnu.org; Sat, 11 Mar 2017 08:23:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1cmgzD-0002KN-Ja
	for qemu-trivial@nongnu.org; Sat, 11 Mar 2017 08:23:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53968)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1cmgzA-0002Er-LY; Sat, 11 Mar 2017 08:23:04 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD11985542;
	Sat, 11 Mar 2017 13:23:04 +0000 (UTC)
Received: from localhost (ovpn-116-13.phx2.redhat.com [10.3.116.13])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v2BDN254028074; Sat, 11 Mar 2017 08:23:03 -0500
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, anderson@redhat.com, mdroth@linux.vnet.ibm.com,
	armbru@redhat.com, lersek@redhat.com,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org
Date: Sat, 11 Mar 2017 17:22:36 +0400
Message-Id: <20170311132256.22951-2-marcandre.lureau@redhat.com>
In-Reply-To: <20170311132256.22951-1-marcandre.lureau@redhat.com>
References: <20170311132256.22951-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Sat, 11 Mar 2017 13:23:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 01/21] qapi: add info comment for generated
 types
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
X-List-Received-Date: Sat, 11 Mar 2017 13:23:10 -0000

This may help to find where the origin of the type was declared in the
json (when greping isn't easy enough).

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Cc: qemu-trivial@nongnu.org
---
 scripts/qapi.py       | 11 +++++++++--
 scripts/qapi-event.py |  4 +++-
 scripts/qapi-types.py | 17 +++++++++--------
 3 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/scripts/qapi.py b/scripts/qapi.py
index 53a44779d0..9504ebd8c7 100644
--- a/scripts/qapi.py
+++ b/scripts/qapi.py
@@ -1874,15 +1874,22 @@ const char *const %(c_name)s_lookup[] =3D {
     return ret
=20
=20
-def gen_enum(name, values, prefix=3DNone):
+def gen_info_comment(info):
+    if info:
+        return "/* %s:%d */" % (info['file'], info['line'])
+    else:
+        return ""
+
+def gen_enum(info, name, values, prefix=3DNone):
     # append automatically generated _MAX value
     enum_values =3D values + ['_MAX']
=20
     ret =3D mcgen('''
=20
+%(info)s
 typedef enum %(c_name)s {
 ''',
-                c_name=3Dc_name(name))
+                c_name=3Dc_name(name), info=3Dgen_info_comment(info))
=20
     i =3D 0
     for value in enum_values:
diff --git a/scripts/qapi-event.py b/scripts/qapi-event.py
index f4eb7f85b1..ca90d6a5df 100644
--- a/scripts/qapi-event.py
+++ b/scripts/qapi-event.py
@@ -152,6 +152,7 @@ class QAPISchemaGenEventVisitor(QAPISchemaVisitor):
         self.decl =3D None
         self.defn =3D None
         self._event_names =3D None
+        self.info =3D None
=20
     def visit_begin(self, schema):
         self.decl =3D ''
@@ -159,7 +160,7 @@ class QAPISchemaGenEventVisitor(QAPISchemaVisitor):
         self._event_names =3D []
=20
     def visit_end(self):
-        self.decl +=3D gen_enum(event_enum_name, self._event_names)
+        self.decl +=3D gen_enum(self.info, event_enum_name, self._event_=
names)
         self.defn +=3D gen_enum_lookup(event_enum_name, self._event_name=
s)
         self._event_names =3D None
=20
@@ -167,6 +168,7 @@ class QAPISchemaGenEventVisitor(QAPISchemaVisitor):
         self.decl +=3D gen_event_send_decl(name, arg_type, boxed)
         self.defn +=3D gen_event_send(name, arg_type, boxed)
         self._event_names.append(name)
+        self.info =3D info
=20
=20
 (input_file, output_dir, do_c, do_h, prefix, dummy) =3D parse_command_li=
ne()
diff --git a/scripts/qapi-types.py b/scripts/qapi-types.py
index dabc42e047..896749bf61 100644
--- a/scripts/qapi-types.py
+++ b/scripts/qapi-types.py
@@ -19,12 +19,13 @@ from qapi import *
 objects_seen =3D set()
=20
=20
-def gen_fwd_object_or_array(name):
+def gen_fwd_object_or_array(info, name):
     return mcgen('''
=20
+%(info)s
 typedef struct %(c_name)s %(c_name)s;
 ''',
-                 c_name=3Dc_name(name))
+                 c_name=3Dc_name(name), info=3Dgen_info_comment(info))
=20
=20
 def gen_array(name, element_type):
@@ -199,22 +200,22 @@ class QAPISchemaGenTypeVisitor(QAPISchemaVisitor):
         # Special case for our lone builtin enum type
         # TODO use something cleaner than existence of info
         if not info:
-            self._btin +=3D gen_enum(name, values, prefix)
+            self._btin +=3D gen_enum(info, name, values, prefix)
             if do_builtins:
                 self.defn +=3D gen_enum_lookup(name, values, prefix)
         else:
-            self._fwdecl +=3D gen_enum(name, values, prefix)
+            self._fwdecl +=3D gen_enum(info, name, values, prefix)
             self.defn +=3D gen_enum_lookup(name, values, prefix)
=20
     def visit_array_type(self, name, info, element_type):
         if isinstance(element_type, QAPISchemaBuiltinType):
-            self._btin +=3D gen_fwd_object_or_array(name)
+            self._btin +=3D gen_fwd_object_or_array(info, name)
             self._btin +=3D gen_array(name, element_type)
             self._btin +=3D gen_type_cleanup_decl(name)
             if do_builtins:
                 self.defn +=3D gen_type_cleanup(name)
         else:
-            self._fwdecl +=3D gen_fwd_object_or_array(name)
+            self._fwdecl +=3D gen_fwd_object_or_array(info, name)
             self.decl +=3D gen_array(name, element_type)
             self._gen_type_cleanup(name)
=20
@@ -222,7 +223,7 @@ class QAPISchemaGenTypeVisitor(QAPISchemaVisitor):
         # Nothing to do for the special empty builtin
         if name =3D=3D 'q_empty':
             return
-        self._fwdecl +=3D gen_fwd_object_or_array(name)
+        self._fwdecl +=3D gen_fwd_object_or_array(info, name)
         self.decl +=3D gen_object(name, base, members, variants)
         if base and not base.is_implicit():
             self.decl +=3D gen_upcast(name, base)
@@ -233,7 +234,7 @@ class QAPISchemaGenTypeVisitor(QAPISchemaVisitor):
             self._gen_type_cleanup(name)
=20
     def visit_alternate_type(self, name, info, variants):
-        self._fwdecl +=3D gen_fwd_object_or_array(name)
+        self._fwdecl +=3D gen_fwd_object_or_array(info, name)
         self.decl +=3D gen_object(name, None, [variants.tag_member], var=
iants)
         self._gen_type_cleanup(name)
=20
--=20
2.12.0.191.gc5d8de91d


