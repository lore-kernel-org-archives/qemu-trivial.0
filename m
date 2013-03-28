Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ULEc6-0002Lm-Bz
	for mharc-qemu-trivial@gnu.org; Thu, 28 Mar 2013 11:19:38 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1ULEc1-0002HK-SR
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 11:19:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1ULEc0-0007BT-61
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 11:19:33 -0400
Received: from e39.co.us.ibm.com ([32.97.110.160]:35970)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1ULEbz-0007AL-OE
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 11:19:31 -0400
Received: from /spool/local
	by e39.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Thu, 28 Mar 2013 09:19:30 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
	by e39.co.us.ibm.com (192.168.1.139) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 28 Mar 2013 09:19:27 -0600
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 65B2019D806C;
	Thu, 28 Mar 2013 09:19:21 -0600 (MDT)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r2SFJ8fx126410; Thu, 28 Mar 2013 09:19:21 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id r2SFJ72k019647; Thu, 28 Mar 2013 09:19:07 -0600
Received: from [9.2.141.150] (k-d941e-10.watson.ibm.com [9.2.141.150])
	by d03av01.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r2SFIikc016627; Thu, 28 Mar 2013 09:18:45 -0600
Message-ID: <1364483920.28637.3.camel@d941e-10>
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org, stefanha@gmail.com
Date: Thu, 28 Mar 2013 11:18:40 -0400
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3 (3.2.3-3.fc16) 
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13032815-3620-0000-0000-000001CF0B66
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.110.160
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH v3] Fix some memory leaks in
	test-visitor-serialization
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
X-List-Received-Date: Thu, 28 Mar 2013 15:19:36 -0000

This patch fixes some of the memory leaks in test-visitor-serialization but not all of them.

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>

---
 v2->v3: repost

 v1->v2: call qobject_decref(obj) earlier

---
 tests/test-visitor-serialization.c |   12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

Index: qemu-git.pt/tests/test-visitor-serialization.c
===================================================================
--- qemu-git.pt.orig/tests/test-visitor-serialization.c
+++ qemu-git.pt/tests/test-visitor-serialization.c
@@ -258,6 +258,7 @@ static void test_primitives(gconstpointe
     g_assert(pt_copy != NULL);
     if (pt->type == PTYPE_STRING) {
         g_assert_cmpstr(pt->value.string, ==, pt_copy->value.string);
+        g_free((char *)pt_copy->value.string);
     } else if (pt->type == PTYPE_NUMBER) {
         /* we serialize with %f for our reference visitors, so rather than fuzzy
          * floating math to test "equality", just compare the formatted values
@@ -275,6 +276,7 @@ static void test_primitives(gconstpointe
 
     ops->cleanup(serialize_data);
     g_free(args);
+    g_free(pt_copy);
 }
 
 static void test_struct(gconstpointer opaque)
@@ -660,6 +662,7 @@ static void qmp_deserialize(void **nativ
 
     QDECREF(output_json);
     d->qiv = qmp_input_visitor_new(obj);
+    qobject_decref(obj);
     visit(qmp_input_get_visitor(d->qiv), native_out, errp);
 }
 
@@ -668,9 +671,12 @@ static void qmp_cleanup(void *datap)
     QmpSerializeData *d = datap;
     qmp_output_visitor_cleanup(d->qov);
     qmp_input_visitor_cleanup(d->qiv);
+
+    g_free(d);
 }
 
 typedef struct StringSerializeData {
+    char *string;
     StringOutputVisitor *sov;
     StringInputVisitor *siv;
 } StringSerializeData;
@@ -690,15 +696,19 @@ static void string_deserialize(void **na
 {
     StringSerializeData *d = datap;
 
-    d->siv = string_input_visitor_new(string_output_get_string(d->sov));
+    d->string = string_output_get_string(d->sov);
+    d->siv = string_input_visitor_new(d->string);
     visit(string_input_get_visitor(d->siv), native_out, errp);
 }
 
 static void string_cleanup(void *datap)
 {
     StringSerializeData *d = datap;
+
     string_output_visitor_cleanup(d->sov);
     string_input_visitor_cleanup(d->siv);
+    g_free(d->string);
+    g_free(d);
 }
 
 /* visitor registration, test harness */


