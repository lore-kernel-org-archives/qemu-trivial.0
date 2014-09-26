Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXZZa-0004dm-09
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 13:44:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZZR-0004Pa-M8
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:44:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZZN-00060S-9b
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:44:41 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56548)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XXZZC-0005vj-5j; Fri, 26 Sep 2014 13:44:26 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1AB6F46F6D;
	Fri, 26 Sep 2014 21:44:20 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 66833710;
	Fri, 26 Sep 2014 21:36:19 +0400 (MSK)
Received: (nullmailer pid 29123 invoked by uid 1000);
	Fri, 26 Sep 2014 17:36:18 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 26 Sep 2014 21:36:13 +0400
Message-Id: <1411752976-29051-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1411752976-29051-1-git-send-email-mjt@tls.msk.ru>
References: <1411752976-29051-1-git-send-email-mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Eric Blake <eblake@redhat.com>
Subject: [Qemu-trivial] [PULL 09/12] qapi: Update docs given recent event,
	spacing fixes
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
X-List-Received-Date: Fri, 26 Sep 2014 17:44:46 -0000

From: Eric Blake <eblake@redhat.com>

Commit 21cd70d added event support but didn't document what the
generated code looks like.  Commit 05dfb26 removed some unwanted
spaces in the generated code, but didn't reflect those changes
into the documentation.  Finally, the docs start with a big
disclaimer about QMP not using QAPI yet, which feels rather stale.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/qapi-code-gen.txt |  100 ++++++++++++++++++++++++++++++++++++++----------
 1 file changed, 80 insertions(+), 20 deletions(-)

diff --git a/docs/qapi-code-gen.txt b/docs/qapi-code-gen.txt
index a6197a9..8313ba6 100644
--- a/docs/qapi-code-gen.txt
+++ b/docs/qapi-code-gen.txt
@@ -1,10 +1,5 @@
 = How to use the QAPI code generator =
 
-* Note: as of this writing, QMP does not use QAPI. Eventually QMP
-commands will be converted to use QAPI internally. The following
-information describes QMP/QAPI as it will exist after the
-conversion.
-
 QAPI is a native C API within QEMU which provides management-level
 functionality to internal/external users. For external
 users/processes, this interface is made available by a JSON-based
@@ -19,7 +14,7 @@ marshaling/dispatch code for the guest agent server running in the
 guest.
 
 This document will describe how the schemas, scripts, and resulting
-code is used.
+code are used.
 
 
 == QMP/Guest agent schema ==
@@ -234,6 +229,7 @@ Resulting in this JSON object:
   "data": { "b": "test string" },
   "timestamp": { "seconds": 1267020223, "microseconds": 435656 } }
 
+
 == Code generation ==
 
 Schemas are fed into 3 scripts to generate all the code/files that, paired
@@ -256,6 +252,8 @@ command which takes that type as a parameter and returns the same type:
       'data':    {'arg1': 'UserDefOne'},
       'returns': 'UserDefOne' }
 
+    { 'event': 'MY_EVENT' }
+
 === scripts/qapi-types.py ===
 
 Used to generate the C types defined by a schema. The following files are
@@ -277,7 +275,7 @@ Example:
     $ cat qapi-generated/example-qapi-types.c
 [Uninteresting stuff omitted...]
 
-    void qapi_free_UserDefOneList(UserDefOneList * obj)
+    void qapi_free_UserDefOneList(UserDefOneList *obj)
     {
         QapiDeallocVisitor *md;
         Visitor *v;
@@ -292,7 +290,7 @@ Example:
         qapi_dealloc_visitor_cleanup(md);
     }
 
-    void qapi_free_UserDefOne(UserDefOne * obj)
+    void qapi_free_UserDefOne(UserDefOne *obj)
     {
         QapiDeallocVisitor *md;
         Visitor *v;
@@ -331,11 +329,11 @@ Example:
     struct UserDefOne
     {
         int64_t integer;
-        char * string;
+        char *string;
     };
 
-    void qapi_free_UserDefOneList(UserDefOneList * obj);
-    void qapi_free_UserDefOne(UserDefOne * obj);
+    void qapi_free_UserDefOneList(UserDefOneList *obj);
+    void qapi_free_UserDefOne(UserDefOne *obj);
 
     #endif
 
@@ -364,7 +362,7 @@ Example:
     $ cat qapi-generated/example-qapi-visit.c
 [Uninteresting stuff omitted...]
 
-    static void visit_type_UserDefOne_fields(Visitor *m, UserDefOne ** obj, Error **errp)
+    static void visit_type_UserDefOne_fields(Visitor *m, UserDefOne **obj, Error **errp)
     {
         Error *err = NULL;
         visit_type_int(m, &(*obj)->integer, "integer", &err);
@@ -380,7 +378,7 @@ Example:
         error_propagate(errp, err);
     }
 
-    void visit_type_UserDefOne(Visitor *m, UserDefOne ** obj, const char *name, Error **errp)
+    void visit_type_UserDefOne(Visitor *m, UserDefOne **obj, const char *name, Error **errp)
     {
         Error *err = NULL;
 
@@ -394,7 +392,7 @@ Example:
         error_propagate(errp, err);
     }
 
-    void visit_type_UserDefOneList(Visitor *m, UserDefOneList ** obj, const char *name, Error **errp)
+    void visit_type_UserDefOneList(Visitor *m, UserDefOneList **obj, const char *name, Error **errp)
     {
         Error *err = NULL;
         GenericList *i, **prev;
@@ -427,8 +425,8 @@ Example:
 
 [Visitors for builtin types omitted...]
 
-    void visit_type_UserDefOne(Visitor *m, UserDefOne ** obj, const char *name, Error **errp);
-    void visit_type_UserDefOneList(Visitor *m, UserDefOneList ** obj, const char *name, Error **errp);
+    void visit_type_UserDefOne(Visitor *m, UserDefOne **obj, const char *name, Error **errp);
+    void visit_type_UserDefOneList(Visitor *m, UserDefOneList **obj, const char *name, Error **errp);
 
     #endif
 
@@ -451,10 +449,12 @@ $(prefix)qmp-commands.h: Function prototypes for the QMP commands
 
 Example:
 
+    $ python scripts/qapi-commands.py --output-dir="qapi-generated"
+    --prefix="example-" --input-file=example-schema.json
     $ cat qapi-generated/example-qmp-marshal.c
 [Uninteresting stuff omitted...]
 
-    static void qmp_marshal_output_my_command(UserDefOne * ret_in, QObject **ret_out, Error **errp)
+    static void qmp_marshal_output_my_command(UserDefOne *ret_in, QObject **ret_out, Error **errp)
     {
         Error *local_err = NULL;
         QmpOutputVisitor *mo = qmp_output_visitor_new();
@@ -480,11 +480,11 @@ Example:
     static void qmp_marshal_input_my_command(QDict *args, QObject **ret, Error **errp)
     {
         Error *local_err = NULL;
-        UserDefOne * retval = NULL;
+        UserDefOne *retval = NULL;
         QmpInputVisitor *mi = qmp_input_visitor_new_strict(QOBJECT(args));
         QapiDeallocVisitor *md;
         Visitor *v;
-        UserDefOne * arg1 = NULL;
+        UserDefOne *arg1 = NULL;
 
         v = qmp_input_get_visitor(mi);
         visit_type_UserDefOne(v, &arg1, "arg1", &local_err);
@@ -525,6 +525,66 @@ Example:
     #include "qapi/qmp/qdict.h"
     #include "qapi/error.h"
 
-    UserDefOne * qmp_my_command(UserDefOne * arg1, Error **errp);
+    UserDefOne *qmp_my_command(UserDefOne *arg1, Error **errp);
+
+    #endif
+
+=== scripts/qapi-event.py ===
+
+Used to generate the event-related C code defined by a schema. The
+following files are created:
+
+$(prefix)qapi-event.h - Function prototypes for each event type, plus an
+                        enumeration of all event names
+$(prefix)qapi-event.c - Implementation of functions to send an event
+
+Example:
+
+    $ python scripts/qapi-event.py --output-dir="qapi-generated"
+    --prefix="example-" --input-file=example-schema.json
+    $ cat qapi-generated/example-qapi-event.c
+[Uninteresting stuff omitted...]
+
+    void qapi_event_send_my_event(Error **errp)
+    {
+        QDict *qmp;
+        Error *local_err = NULL;
+        QMPEventFuncEmit emit;
+        emit = qmp_event_get_func_emit();
+        if (!emit) {
+            return;
+        }
+
+        qmp = qmp_event_build_dict("MY_EVENT");
+
+        emit(EXAMPLE_QAPI_EVENT_MY_EVENT, qmp, &local_err);
+
+        error_propagate(errp, local_err);
+        QDECREF(qmp);
+    }
+
+    const char *EXAMPLE_QAPIEvent_lookup[] = {
+        "MY_EVENT",
+        NULL,
+    };
+    $ cat qapi-generated/example-qapi-event.h
+[Uninteresting stuff omitted...]
+
+    #ifndef EXAMPLE_QAPI_EVENT_H
+    #define EXAMPLE_QAPI_EVENT_H
+
+    #include "qapi/error.h"
+    #include "qapi/qmp/qdict.h"
+    #include "example-qapi-types.h"
+
+
+    void qapi_event_send_my_event(Error **errp);
+
+    extern const char *EXAMPLE_QAPIEvent_lookup[];
+    typedef enum EXAMPLE_QAPIEvent
+    {
+        EXAMPLE_QAPI_EVENT_MY_EVENT = 0,
+        EXAMPLE_QAPI_EVENT_MAX = 1,
+    } EXAMPLE_QAPIEvent;
 
     #endif
-- 
1.7.10.4


