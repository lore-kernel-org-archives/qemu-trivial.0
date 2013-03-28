Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ULAuY-0001p1-R8
	for mharc-qemu-trivial@gnu.org; Thu, 28 Mar 2013 07:22:26 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39438)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1ULAuT-0001lH-7z
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 07:22:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1ULAuP-0000AF-TO
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 07:22:21 -0400
Received: from e8.ny.us.ibm.com ([32.97.182.138]:53282)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1ULAuP-00009r-PY
	for qemu-trivial@nongnu.org; Thu, 28 Mar 2013 07:22:17 -0400
Received: from /spool/local
	by e8.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Thu, 28 Mar 2013 07:22:15 -0400
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
	by e8.ny.us.ibm.com (192.168.1.108) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 28 Mar 2013 07:22:13 -0400
Received: from d01relay05.pok.ibm.com (d01relay05.pok.ibm.com [9.56.227.237])
	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 0935FC9001E;
	Thu, 28 Mar 2013 07:22:13 -0400 (EDT)
Received: from d01av05.pok.ibm.com (d01av05.pok.ibm.com [9.56.224.195])
	by d01relay05.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r2SBMD1T338648; Thu, 28 Mar 2013 07:22:13 -0400
Received: from d01av05.pok.ibm.com (loopback [127.0.0.1])
	by d01av05.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	r2SBMC8X008648; Thu, 28 Mar 2013 07:22:12 -0400
Received: from [9.2.141.150] (k-d941e-10.watson.ibm.com [9.2.141.150])
	by d01av05.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r2SBMCrc008645; Thu, 28 Mar 2013 07:22:12 -0400
Message-ID: <515427E4.70402@linux.vnet.ibm.com>
Date: Thu, 28 Mar 2013 07:22:12 -0400
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13032811-9360-0000-0000-000011827433
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.182.138
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH v2] Fix some memory leaks in
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
X-List-Received-Date: Thu, 28 Mar 2013 11:22:26 -0000

This patch fixes some of the memory leaks in test-visitor-serialization 
but not all of them.

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>

---
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


