Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iRcL8-0004DU-Qt
	for mharc-qemu-trivial@gnu.org; Mon, 04 Nov 2019 08:24:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50671)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iRcL6-0004CX-PS
 for qemu-trivial@nongnu.org; Mon, 04 Nov 2019 08:24:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iRcL5-00086r-GJ
 for qemu-trivial@nongnu.org; Mon, 04 Nov 2019 08:24:12 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62650)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iRcL5-00083a-8p
 for qemu-trivial@nongnu.org; Mon, 04 Nov 2019 08:24:11 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA4D9cC0094567
 for <qemu-trivial@nongnu.org>; Mon, 4 Nov 2019 08:24:02 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w2m8ca7c5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-trivial@nongnu.org>; Mon, 04 Nov 2019 08:24:01 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-trivial@nongnu.org> from <groug@kaod.org>;
 Mon, 4 Nov 2019 13:23:58 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 4 Nov 2019 13:23:57 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id xA4DNuxb44695844
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Nov 2019 13:23:56 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 576BE4C04A;
 Mon,  4 Nov 2019 13:23:56 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24DDD4C044;
 Mon,  4 Nov 2019 13:23:56 +0000 (GMT)
Received: from bahia.tlslab.ibm.com (unknown [9.101.4.41])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  4 Nov 2019 13:23:56 +0000 (GMT)
Subject: [PATCH] qom: Fix error message in object_class_property_add()
From: Greg Kurz <groug@kaod.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Date: Mon, 04 Nov 2019 14:23:55 +0100
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19110413-0012-0000-0000-000003608B12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110413-0013-0000-0000-0000219BE006
Message-Id: <157287383591.234942.311840593519058490.stgit@bahia.tlslab.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-04_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1034 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1911040130
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 04 Nov 2019 13:24:14 -0000

The error message in object_class_property_add() was copied from
object_property_add() in commit 16bf7f522a2ff. Clarify that it is
about a class, not an object.

While here, have the format string in both functions to fit in a
single line for better grep-ability, despite the checkpatch warning.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 qom/object.c |   10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/qom/object.c b/qom/object.c
index 6fa9c619fac4..d51b57fba11e 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -1106,9 +1106,8 @@ object_property_add(Object *obj, const char *name, const char *type,
     }
 
     if (object_property_find(obj, name, NULL) != NULL) {
-        error_setg(errp, "attempt to add duplicate property '%s'"
-                   " to object (type '%s')", name,
-                   object_get_typename(obj));
+        error_setg(errp, "attempt to add duplicate property '%s' to object (type '%s')",
+                   name, object_get_typename(obj));
         return NULL;
     }
 
@@ -1139,9 +1138,8 @@ object_class_property_add(ObjectClass *klass,
     ObjectProperty *prop;
 
     if (object_class_property_find(klass, name, NULL) != NULL) {
-        error_setg(errp, "attempt to add duplicate property '%s'"
-                   " to object (type '%s')", name,
-                   object_class_get_name(klass));
+        error_setg(errp, "attempt to add duplicate property '%s' to class (type '%s')",
+                   name, object_class_get_name(klass));
         return NULL;
     }
 


