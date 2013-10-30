Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VbPeV-0002Rr-5F
	for mharc-qemu-trivial@gnu.org; Wed, 30 Oct 2013 02:53:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44687)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1VbPeN-0002RD-MD
	for qemu-trivial@nongnu.org; Wed, 30 Oct 2013 02:53:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1VbPeH-00071J-I9
	for qemu-trivial@nongnu.org; Wed, 30 Oct 2013 02:53:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49120)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>)
	id 1VbPeH-000715-9t; Wed, 30 Oct 2013 02:53:01 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9U6quCV017703
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 30 Oct 2013 02:52:58 -0400
Received: from amosk.info.com ([10.66.7.151])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r9U6qkH8000749; Wed, 30 Oct 2013 02:52:48 -0400
From: Amos Kong <akong@redhat.com>
To: kwolf@redhat.com, qemu-trivial@nongnu.org
Date: Wed, 30 Oct 2013 14:52:45 +0800
Message-Id: <1383115965-22360-1-git-send-email-akong@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: mjt@tls.msk.ru, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH] move BlockdevRef definition before using it
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
X-List-Received-Date: Wed, 30 Oct 2013 06:53:13 -0000

From: Amos Kong <kongjianjun@gmail.com>

@BlockdevRef is used in @BlockdevOptionsGenericFormat and
@BlockdevOptionsGenericCOWFormat.

Signed-off-by: Amos Kong <kongjianjun@gmail.com>
---
 qapi-schema.json | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index 60f3fd1..8af8187 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -4061,6 +4061,23 @@
             '*rw': 'bool' } }
 
 ##
+# @BlockdevRef
+#
+# Reference to a block device.
+#
+# @definition:      defines a new block device inline
+# @reference:       references the ID of an existing block device. An
+#                   empty string means that no block device should be
+#                   referenced.
+#
+# Since: 1.7
+##
+{ 'union': 'BlockdevRef',
+  'discriminator': {},
+  'data': { 'definition': 'BlockdevOptions',
+            'reference': 'str' } }
+
+##
 # @BlockdevOptionsGenericFormat
 #
 # Driver specific block device options for image format that have no option
@@ -4162,23 +4179,6 @@
   } }
 
 ##
-# @BlockdevRef
-#
-# Reference to a block device.
-#
-# @definition:      defines a new block device inline
-# @reference:       references the ID of an existing block device. An
-#                   empty string means that no block device should be
-#                   referenced.
-#
-# Since: 1.7
-##
-{ 'union': 'BlockdevRef',
-  'discriminator': {},
-  'data': { 'definition': 'BlockdevOptions',
-            'reference': 'str' } }
-
-##
 # @blockdev-add:
 #
 # Creates a new block device.
-- 
1.8.3.1


