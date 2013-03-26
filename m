Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UKbhz-0006d6-ER
	for mharc-qemu-trivial@gnu.org; Tue, 26 Mar 2013 17:47:07 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1UKbhv-0006cI-EQ
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2013 17:47:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1UKbht-00055g-PU
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2013 17:47:03 -0400
Received: from e9.ny.us.ibm.com ([32.97.182.139]:40829)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1UKbht-000557-Li
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2013 17:47:01 -0400
Received: from /spool/local
	by e9.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Tue, 26 Mar 2013 17:46:58 -0400
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
	by e9.ny.us.ibm.com (192.168.1.109) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 26 Mar 2013 17:46:56 -0400
Received: from d01relay03.pok.ibm.com (d01relay03.pok.ibm.com [9.56.227.235])
	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 14CF238C8042;
	Tue, 26 Mar 2013 17:46:56 -0400 (EDT)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
	by d01relay03.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r2QLktfk265868; Tue, 26 Mar 2013 17:46:55 -0400
Received: from d01av05.pok.ibm.com (loopback [127.0.0.1])
	by d01av05.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r2QLktlY031676; Tue, 26 Mar 2013 17:46:55 -0400
Received: from [9.2.141.150] (k-d941e-10.watson.ibm.com [9.2.141.150])
	by d01av05.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r2QLktp5031673; Tue, 26 Mar 2013 17:46:55 -0400
Message-ID: <5152174F.6080908@linux.vnet.ibm.com>
Date: Tue, 26 Mar 2013 17:46:55 -0400
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: qemu-trivial@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13032621-7182-0000-0000-000005F5A5B2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.182.139
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] Fix some memory leaks in
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
X-List-Received-Date: Tue, 26 Mar 2013 21:47:05 -0000

This patch fixes some of the memory leaks in test-visitor-serialization 
but not all of them.

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>

---
  tests/test-visitor-serialization.c |   17 ++++++++++++++---
  1 file changed, 14 insertions(+), 3 deletions(-)

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
          /* we serialize with %f for our reference visitors, so rather 
than fuzzy
           * floating math to test "equality", just compare the 
formatted values
@@ -275,6 +276,7 @@ static void test_primitives(gconstpointe

      ops->cleanup(serialize_data);
      g_free(args);
+    g_free(pt_copy);
  }

  static void test_struct(gconstpointer opaque)
@@ -637,6 +639,7 @@ PrimitiveType pt_values[] = {
  /* visitor-specific op implementations */

  typedef struct QmpSerializeData {
+    QObject *obj;
      QmpOutputVisitor *qov;
      QmpInputVisitor *qiv;
  } QmpSerializeData;
@@ -656,10 +659,10 @@ static void qmp_deserialize(void **nativ
  {
      QmpSerializeData *d = datap;
      QString *output_json = 
qobject_to_json(qmp_output_get_qobject(d->qov));
-    QObject *obj = qobject_from_json(qstring_get_str(output_json));

+    d->obj = qobject_from_json(qstring_get_str(output_json));
      QDECREF(output_json);
-    d->qiv = qmp_input_visitor_new(obj);
+    d->qiv = qmp_input_visitor_new(d->obj);
      visit(qmp_input_get_visitor(d->qiv), native_out, errp);
  }

@@ -668,9 +671,13 @@ static void qmp_cleanup(void *datap)
      QmpSerializeData *d = datap;
      qmp_output_visitor_cleanup(d->qov);
      qmp_input_visitor_cleanup(d->qiv);
+    qobject_decref(d->obj);
+
+    g_free(d);
  }

  typedef struct StringSerializeData {
+    char *string;
      StringOutputVisitor *sov;
      StringInputVisitor *siv;
  } StringSerializeData;
@@ -690,15 +697,19 @@ static void string_deserialize(void **na
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


