Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XMNP9-0000N9-Uy
	for mharc-qemu-trivial@gnu.org; Tue, 26 Aug 2014 16:31:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37813)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1XMNP0-000068-4t
	for qemu-trivial@nongnu.org; Tue, 26 Aug 2014 16:31:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1XMNOu-00036J-1H
	for qemu-trivial@nongnu.org; Tue, 26 Aug 2014 16:31:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:5370)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>)
	id 1XMNOc-00030c-Be; Tue, 26 Aug 2014 16:31:14 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s7QKVCBk001162
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 26 Aug 2014 16:31:13 -0400
Received: from choo.home.annexia.org (vpn-226-39.phx2.redhat.com [10.3.226.39])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s7QKVB1V028502; Tue, 26 Aug 2014 16:31:12 -0400
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 26 Aug 2014 21:31:08 +0100
Message-Id: <1409085068-18440-1-git-send-email-rjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] curl: The macro that you have to uncomment
	to get debugging is DEBUG_CURL.
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
X-List-Received-Date: Tue, 26 Aug 2014 20:31:45 -0000

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
---
 block/curl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/curl.c b/block/curl.c
index 2698ae3..46f1082 100644
--- a/block/curl.c
+++ b/block/curl.c
@@ -26,7 +26,7 @@
 #include "qapi/qmp/qbool.h"
 #include <curl/curl.h>
 
-// #define DEBUG
+// #define DEBUG_CURL
 // #define DEBUG_VERBOSE
 
 #ifdef DEBUG_CURL
-- 
2.0.4


