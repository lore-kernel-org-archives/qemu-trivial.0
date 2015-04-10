Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ygg1t-0003O4-GU
	for mharc-qemu-trivial@gnu.org; Fri, 10 Apr 2015 16:59:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Ygg1r-0003LN-06
	for qemu-trivial@nongnu.org; Fri, 10 Apr 2015 16:59:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Ygg1k-0005e8-KG
	for qemu-trivial@nongnu.org; Fri, 10 Apr 2015 16:59:54 -0400
Received: from resqmta-po-03v.sys.comcast.net ([96.114.154.162]:60541)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1Ygg1k-0005dn-FO
	for qemu-trivial@nongnu.org; Fri, 10 Apr 2015 16:59:48 -0400
Received: from resomta-po-17v.sys.comcast.net ([96.114.154.241])
	by resqmta-po-03v.sys.comcast.net with comcast
	id ELza1q0055Clt1L01Lznjv; Fri, 10 Apr 2015 20:59:47 +0000
Received: from red.redhat.com ([24.10.254.122])
	by resomta-po-17v.sys.comcast.net with comcast
	id ELzj1q00Q2fD5rL01LzmS1; Fri, 10 Apr 2015 20:59:47 +0000
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 10 Apr 2015 14:59:43 -0600
Message-Id: <1428699583-15237-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 2.1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1428699587;
	bh=7VueGXfZz+SDA3NplsqFpssfVCIlvVylDukrvWJlAj0=;
	h=Received:Received:From:To:Subject:Date:Message-Id;
	b=IXzAVki0+HMnS35dealpccASbsqVMwbayT32OSsgrYM+AkwWJM2Ee7PU2123YjOPh
	EJ3mQoslnRFKz+jX3AP7tKxMUaNwyY3OlCQbw5KUXaZdLTTtVeRYXzMd9xY/5xERKv
	o6ujbLyyvdoEp5XaOHkKxuaPI/Oy9tzqOPfrr3nD4etpr5vw25UwuEQefAC4u7UQo8
	4M9U3hBSBwIoh7HljUArVK7C0hx9EMXRhNDtLwrGTOZc6NnEM5h7YnVTLFDlq+Kvzz
	3lg46QJndatoxGDWog4aUUI7KMNLUz/OPGOxM+kH5yj45zwWrsu+nSCbFHbD+0hLDl
	Pp8UIA2B9L1xw==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 96.114.154.162
Cc: qemu-trivial@nongnu.org, armbru@redhat.com, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH] qapi: Drop dead genlist parameter
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
X-List-Received-Date: Fri, 10 Apr 2015 20:59:56 -0000

Defaulting a parameter to True, then having all callers omit
or pass an explicit True for that parameter, is pointless.
Looks like it has been dead since introduction in commit 06d64c6.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 scripts/qapi-visit.py | 36 ++++++++++++++++--------------------
 1 file changed, 16 insertions(+), 20 deletions(-)

diff --git a/scripts/qapi-visit.py b/scripts/qapi-visit.py
index f5d4355..6156162 100644
--- a/scripts/qapi-visit.py
+++ b/scripts/qapi-visit.py
@@ -369,34 +369,31 @@ out:

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
@@ -510,8 +507,7 @@ exprs = parse_schema(input_file)
 # for built-in types in our header files and simply guard them
 fdecl.write(guardstart("QAPI_VISIT_BUILTIN_VISITOR_DECL"))
 for typename in builtin_types.keys():
-    fdecl.write(generate_declaration(typename, None, genlist=True,
-                                     builtin_type=True))
+    fdecl.write(generate_declaration(typename, None, builtin_type=True))
 fdecl.write(guardend("QAPI_VISIT_BUILTIN_VISITOR_DECL"))

 # ...this doesn't work for cases where we link in multiple objects that
-- 
2.1.0


