Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W6Qt8-000137-JX
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jan 2014 15:28:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1W6Qt0-0000tE-TS
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 15:28:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1W6Qsu-0003Uo-LW
	for qemu-trivial@nongnu.org; Thu, 23 Jan 2014 15:28:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33420)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1W6Qsi-0003RR-7m; Thu, 23 Jan 2014 15:28:08 -0500
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0NKS41Y019073
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 23 Jan 2014 15:28:06 -0500
Received: from localhost (ovpn-112-51.ams2.redhat.com [10.36.112.51])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s0NKS05v032727; Thu, 23 Jan 2014 15:28:02 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 23 Jan 2014 14:27:59 -0600
Message-Id: <1390508879-13729-1-git-send-email-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH] osdep: drop unused #include "trace.h"
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
X-List-Received-Date: Thu, 23 Jan 2014 20:28:33 -0000

osdep.c does not use trace_*() so we can just drop the include.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/osdep.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/util/osdep.c b/util/osdep.c
index 62072b4..bd4f530 100644
--- a/util/osdep.c
+++ b/util/osdep.c
@@ -46,7 +46,6 @@ extern int madvise(caddr_t, size_t, int);
 #endif
 
 #include "qemu-common.h"
-#include "trace.h"
 #include "qemu/sockets.h"
 #include "monitor/monitor.h"
 
-- 
1.8.4.2


