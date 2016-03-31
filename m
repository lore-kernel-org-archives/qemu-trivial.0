Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1alcKq-0004We-Ly
	for mharc-qemu-trivial@gnu.org; Thu, 31 Mar 2016 09:08:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1alcKo-0004TK-6p
	for qemu-trivial@nongnu.org; Thu, 31 Mar 2016 09:08:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1alcKj-0007mF-7U
	for qemu-trivial@nongnu.org; Thu, 31 Mar 2016 09:08:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49074)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1alcKe-0007kh-G3; Thu, 31 Mar 2016 09:08:16 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 3DB6B46202;
	Thu, 31 Mar 2016 13:08:16 +0000 (UTC)
Received: from t530wlan.home.berrange.com.com (vpn1-5-208.ams2.redhat.com
	[10.36.5.208])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2VD8Ehh019739; Thu, 31 Mar 2016 09:08:15 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 31 Mar 2016 14:08:10 +0100
Message-Id: <1459429690-6144-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PATCH v1] net: fix missing include of qapi/error.h
	in netmap.c
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
X-List-Received-Date: Thu, 31 Mar 2016 13:08:27 -0000

The netmap.c file fails to build on FreeBSD with

net/netmap.c:95:9: warning: implicit declaration of function 'error_setg_errno' is invalid in C99 [-Wimplicit-function-declaration]
     error_setg_errno(errp, errno, "Failed to nm_open() %s",
     ^
net/netmap.c:432:9: warning: implicit declaration of function 'error_propagate' is invalid in C99 [-Wimplicit-function-declaration]
     error_propagate(errp, err);
     ^

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 net/netmap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/netmap.c b/net/netmap.c
index d9c21b2..6cc0db5 100644
--- a/net/netmap.c
+++ b/net/netmap.c
@@ -36,6 +36,7 @@
 #include "clients.h"
 #include "sysemu/sysemu.h"
 #include "qemu/error-report.h"
+#include "qapi/error.h"
 #include "qemu/iov.h"
 #include "qemu/cutils.h"
 
-- 
2.5.5


