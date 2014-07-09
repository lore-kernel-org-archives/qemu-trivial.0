Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X51na-0007bX-7a
	for mharc-qemu-trivial@gnu.org; Wed, 09 Jul 2014 20:01:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1X4seX-0005nG-RZ
	for qemu-trivial@nongnu.org; Wed, 09 Jul 2014 10:15:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1X4seQ-00024D-Cd
	for qemu-trivial@nongnu.org; Wed, 09 Jul 2014 10:15:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:25582)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>)
	id 1X4seB-0001k5-4V; Wed, 09 Jul 2014 10:14:59 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s69EEt2J023012
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 9 Jul 2014 10:14:56 -0400
Received: from noname.redhat.com (ovpn-116-91.ams2.redhat.com [10.36.116.91])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id s69EErJl006833; Wed, 9 Jul 2014 10:14:54 -0400
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  9 Jul 2014 16:14:48 +0200
Message-Id: <1404915288-604-1-git-send-email-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: kwolf@redhat.com, hutao@cn.fujitsu.com, qemu-trivial@nongnu.org,
	mst@redhat.com
Subject: [Qemu-trivial] [PATCH for-2.1] test-string-output-visitor: Fix
	unterminated string
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
X-List-Received-Date: Thu, 10 Jul 2014 00:01:16 -0000

Don't forget to add a terminating '\0' or the test case will be randomly
failing. The broken code was added in commit b4900c0e.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/test-string-output-visitor.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/test-string-output-visitor.c b/tests/test-string-output-visitor.c
index e89e43c..f2c427f 100644
--- a/tests/test-string-output-visitor.c
+++ b/tests/test-string-output-visitor.c
@@ -201,11 +201,11 @@ static void test_visitor_out_enum(TestOutputVisitorData *data,
         visit_type_EnumOne(data->ov, &i, "unused", &err);
         g_assert(!err);
 
-        len = strlen(EnumOne_lookup[i]) + 2;
+        len = strlen(EnumOne_lookup[i]) + 3;
         str_human = g_malloc0(len);
         str_human[0] = '"';
         strncpy(str_human + 1, EnumOne_lookup[i], strlen(EnumOne_lookup[i]));
-        str_human[len - 1] = '"';
+        str_human[len - 2] = '"';
 
         str = string_output_get_string(data->sov);
         g_assert(str != NULL);
-- 
1.8.3.1


