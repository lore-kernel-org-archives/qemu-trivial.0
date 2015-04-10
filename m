Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ygg9q-0000XZ-S3
	for mharc-qemu-trivial@gnu.org; Fri, 10 Apr 2015 17:08:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Ygg9p-0000W0-FV
	for qemu-trivial@nongnu.org; Fri, 10 Apr 2015 17:08:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Ygg9k-0008FA-MQ
	for qemu-trivial@nongnu.org; Fri, 10 Apr 2015 17:08:09 -0400
Received: from resqmta-po-10v.sys.comcast.net ([96.114.154.169]:49491)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Ygg9k-0008Ex-Gd
	for qemu-trivial@nongnu.org; Fri, 10 Apr 2015 17:08:04 -0400
Received: from resomta-po-18v.sys.comcast.net ([96.114.154.242])
	by resqmta-po-10v.sys.comcast.net with comcast
	id EM7f1q00A5E3ZMc01M83T9; Fri, 10 Apr 2015 21:08:03 +0000
Received: from red.redhat.com ([24.10.254.122])
	by resomta-po-18v.sys.comcast.net with comcast
	id EM801q0022fD5rL01M82g2; Fri, 10 Apr 2015 21:08:03 +0000
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 10 Apr 2015 15:07:59 -0600
Message-Id: <1428700079-19713-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 2.1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 96.114.154.169
Cc: qemu-trivial@nongnu.org, armbru@redhat.com, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH v2] qapi: Drop dead genlist parameter
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
X-List-Received-Date: Fri, 10 Apr 2015 21:08:10 -0000

Defaulting a parameter to True, then having all callers omit or
pass an explicit True for that parameter, is pointless. Looks
like it has been dead since introduction in commit 06d64c6, more
than 4 years ago.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

v2: tweak commit message, don't depend on pending series

 scripts/qapi-visit.py | 38 +++++++++++++++++---------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/scripts/qapi-visit.py b/scripts/qapi-visit.py
index 8f845a2..1be4d67 100644
--- a/scripts/qapi-visit.py
+++ b/scripts/qapi-visit.py
@@ -2,7 +2,7 @@
 # QAPI visitor generator
 #
 # Copyright IBM, Corp. 2011
-# Copyright (C) 2014 Red Hat, Inc.
+# Copyright (C) 2014-2015 Red Hat, Inc.
 #
 # Authors:
 #  Anthony Liguori <aliguori@us.ibm.com>
@@ -401,34 +401,31 @@ out:

     return ret

-def generate_declaration(name, members, genlist=True, builtin_type=False):
+def generate_declaration(name, members, builtin_type=False):
     ret = ""
     if not builtin_type:
         ret += mcgen('''

 void visit_type_%(name)s(Visitor *m, %(name)s **obj, const char *name, Error **errp);
 ''',
-                    name=name)
-
-    if genlist:
-        ret += mcgen('''
-void visit_type_%(name)sList(Visitor *m, %(name)sList **obj, const char *name, Error **errp);
-''',
-                 name=name)
-
-    return ret
-
-def generate_enum_declaration(name, members, genlist=True):
-    ret = ""
-    if genlist:
-        ret += mcgen('''
-void visit_type_%(name)sList(Visitor *m, %(name)sList **obj, const char *name, Error **errp);
-''',
                      name=name)

+    ret += mcgen('''
+void visit_type_%(name)sList(Visitor *m, %(name)sList **obj, const char *name, Error **errp);
+''',
+                 name=name)
+
+    return ret
+
+def generate_enum_declaration(name, members):
+    ret = mcgen('''
+void visit_type_%(name)sList(Visitor *m, %(name)sList **obj, const char *name, Error **errp);
+''',
+                name=name)
+
     return ret

-def generate_decl_enum(name, members, genlist=True):
+def generate_decl_enum(name, members):
     return mcgen('''

 void visit_type_%(name)s(Visitor *m, %(name)s *obj, const char *name, Error **errp);
@@ -542,8 +539,7 @@ exprs = parse_schema(input_file)
 # for built-in types in our header files and simply guard them
 fdecl.write(guardstart("QAPI_VISIT_BUILTIN_VISITOR_DECL"))
 for typename in builtin_types:
-    fdecl.write(generate_declaration(typename, None, genlist=True,
-                                     builtin_type=True))
+    fdecl.write(generate_declaration(typename, None, builtin_type=True))
 fdecl.write(guardend("QAPI_VISIT_BUILTIN_VISITOR_DECL"))

 # ...this doesn't work for cases where we link in multiple objects that
-- 
2.1.0


