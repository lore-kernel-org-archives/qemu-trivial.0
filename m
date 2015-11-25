Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a1hEA-00043H-Q9
	for mharc-qemu-trivial@gnu.org; Wed, 25 Nov 2015 16:03:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33889)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1a1hE9-000423-0h
	for qemu-trivial@nongnu.org; Wed, 25 Nov 2015 16:03:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1a1hE8-0003Ii-4J
	for qemu-trivial@nongnu.org; Wed, 25 Nov 2015 16:03:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:40936)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1a1hE3-0003Gi-Sq; Wed, 25 Nov 2015 16:03:39 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 5F76D68E0D;
	Wed, 25 Nov 2015 21:03:39 +0000 (UTC)
Received: from scv.usersys.redhat.com (vpn-60-227.rdu2.redhat.com
	[10.10.60.227])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAPL3cwJ026952; Wed, 25 Nov 2015 16:03:38 -0500
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 25 Nov 2015 16:03:37 -0500
Message-Id: <1448485417-8196-1-git-send-email-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, jcody@redhat.com, John Snow <jsnow@redhat.com>
Subject: [Qemu-trivial] [PATCH v2] util/id: fully allocate names table
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
X-List-Received-Date: Wed, 25 Nov 2015 21:03:45 -0000

Trivial: this array should be allocated to have ID_MAX entries always.
Otherwise if someone were to forget to expand this table, the assertion
in the id generator won't actually trigger; it will read junk data.

v2: Fix the range assertion, too. Compare against the known actual size
    of the table instead of what it "should" be.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 util/id.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/id.c b/util/id.c
index bcc64d8..7883fbe 100644
--- a/util/id.c
+++ b/util/id.c
@@ -29,7 +29,7 @@ bool id_wellformed(const char *id)
 
 #define ID_SPECIAL_CHAR '#'
 
-static const char *const id_subsys_str[] = {
+static const char *const id_subsys_str[ID_MAX] = {
     [ID_QDEV]  = "qdev",
     [ID_BLOCK] = "block",
 };
@@ -53,7 +53,7 @@ char *id_generate(IdSubSystems id)
     static uint64_t id_counters[ID_MAX];
     uint32_t rnd;
 
-    assert(id < ID_MAX);
+    assert(id < ARRAY_SIZE(id_subsys_str));
     assert(id_subsys_str[id]);
 
     rnd = g_random_int_range(0, 100);
-- 
2.4.3


