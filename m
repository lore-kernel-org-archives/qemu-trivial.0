Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UpEck-0007un-Q7
	for mharc-qemu-trivial@gnu.org; Wed, 19 Jun 2013 05:24:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1UpEci-0007rS-Jj
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 05:24:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1UpEcd-00078Y-Bg
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 05:24:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:21858)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>)
	id 1UpEcW-00075a-5a; Wed, 19 Jun 2013 05:24:04 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5J9Ncfb021269
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 19 Jun 2013 05:23:38 -0400
Received: from amosk.info.com ([10.66.6.179])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5J9NYhp025830; Wed, 19 Jun 2013 05:23:36 -0400
From: Amos Kong <akong@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 19 Jun 2013 17:23:27 +0800
Message-Id: <1371633808-4362-1-git-send-email-akong@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, lilei@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH] qapi: lack of two commas in dict
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
X-List-Received-Date: Wed, 19 Jun 2013 09:24:17 -0000

Signed-off-by: Amos Kong <akong@redhat.com>
---
 qapi-schema.json | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi-schema.json b/qapi-schema.json
index 128cc58..38acd25 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -388,7 +388,7 @@
 #
 # Since: 1.4
 ##
-{ 'enum': 'DataFormat'
+{ 'enum': 'DataFormat',
   'data': [ 'utf8', 'base64' ] }
 
 ##
@@ -1589,7 +1589,7 @@
 #
 # Since: 1.1
 ##
-{ 'enum': 'NewImageMode'
+{ 'enum': 'NewImageMode',
   'data': [ 'existing', 'absolute-paths' ] }
 
 ##
-- 
1.8.1.4


