Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XV8HY-0005K0-8m
	for mharc-qemu-trivial@gnu.org; Fri, 19 Sep 2014 20:12:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1XV8HQ-0005Jq-N3
	for qemu-trivial@nongnu.org; Fri, 19 Sep 2014 20:12:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1XV8HK-0003ob-H3
	for qemu-trivial@nongnu.org; Fri, 19 Sep 2014 20:12:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54668)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>)
	id 1XV8HK-0003ke-9T; Fri, 19 Sep 2014 20:11:54 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8K0Bj6H022839
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 19 Sep 2014 20:11:45 -0400
Received: from air.redhat.com (vpn1-112-152.nay.redhat.com [10.66.112.152])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8K0Bf2Z024290; Fri, 19 Sep 2014 20:11:43 -0400
From: Amos Kong <akong@redhat.com>
To: qemu-trivial@nongnu.org
Date: Sat, 20 Sep 2014 08:11:41 +0800
Message-Id: <1411171901-13792-1-git-send-email-akong@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: jen@redhat.com, afaerber@suse.de, aliguori@amazon.com,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] qom: suppress conscan warning of returning
	null point
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
X-List-Received-Date: Sat, 20 Sep 2014 00:12:07 -0000

Conscan complains about g_malloc0() and malloc() return null.

  Error: NULL_RETURNS (CWE-476):
  qemu-kvm/qom/object.c:239: returned_null: Function "g_malloc0(gsize)" returns null.
  qemu-kvm/qom/object.c:239: var_assigned: Assigning: "ti->class" = null return value from "g_malloc0(gsize)".
  qemu-kvm/qom/object.c:249: dereference: Dereferencing a null pointer "ti->class".

But if the passed size parameter is >= 1, then we can always get an
effective pointer, the warning disappears.

Signed-off-by: Amos Kong <akong@redhat.com>
---
 qom/object.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/qom/object.c b/qom/object.c
index da0919a..0fbf2df 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -252,6 +252,7 @@ static void type_initialize(TypeImpl *ti)
     ti->class_size = type_class_get_size(ti);
     ti->instance_size = type_object_get_size(ti);
 
+    g_assert(ti->class_size != 0);
     ti->class = g_malloc0(ti->class_size);
 
     parent = type_get_parent(ti);
@@ -424,6 +425,7 @@ Object *object_new_with_type(Type type)
     g_assert(type != NULL);
     type_initialize(type);
 
+    g_assert(type->instance_size != 0);
     obj = g_malloc(type->instance_size);
     object_initialize_with_type(obj, type->instance_size, type);
     obj->free = g_free;
-- 
1.9.3


