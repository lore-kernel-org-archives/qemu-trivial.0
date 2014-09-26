Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXXKa-00026J-9g
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 11:21:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XXXKT-0001to-59
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 11:21:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1XXXKO-0007SG-D3
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 11:21:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58078)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1XXXKB-0007O8-BV; Fri, 26 Sep 2014 11:20:47 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8QFKd8o021848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 26 Sep 2014 11:20:40 -0400
Received: from red.redhat.com (ovpn-113-28.phx2.redhat.com [10.3.113.28])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8QFKbGe028824; Fri, 26 Sep 2014 11:20:38 -0400
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 26 Sep 2014 09:20:33 -0600
Message-Id: <1411744833-20699-4-git-send-email-eblake@redhat.com>
In-Reply-To: <1411744833-20699-1-git-send-email-eblake@redhat.com>
References: <1411744833-20699-1-git-send-email-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Luiz Capitulino <lcapitulino@redhat.com>,
	Fam Zheng <famz@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, wenchaoqemu@gmail.com
Subject: [Qemu-trivial] [PATCH v5 3/3] qapi: Update docs given recent event,
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
X-List-Received-Date: Fri, 26 Sep 2014 15:21:10 -0000

Commit 21cd70d added event support but didn't document what the
generated code looks like.  Commit 05dfb26 removed some unwanted
spaces in the generated code, but didn't reflect those changes
into the documentation.  Finally, the docs start with a big
disclaimer about QMP not using QAPI yet, which feels rather stale.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
 docs/qapi-code-gen.txt | 100 +++++++++++++++++++++++++++++++++++++++----------
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
1.9.3


