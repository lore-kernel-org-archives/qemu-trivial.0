Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V5GEc-0001Hx-5M
	for mharc-qemu-trivial@gnu.org; Fri, 02 Aug 2013 10:21:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V5GEV-00014L-EA
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 10:21:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1V5GEQ-0007JE-FI
	for qemu-trivial@nongnu.org; Fri, 02 Aug 2013 10:21:31 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45134)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1V5GEE-0007G7-IW; Fri, 02 Aug 2013 10:21:14 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 02FE140426;
	Fri,  2 Aug 2013 18:21:14 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E8B1A4A2;
	Fri,  2 Aug 2013 18:21:13 +0400 (MSK)
Received: (nullmailer pid 7228 invoked by uid 1000);
	Fri, 02 Aug 2013 14:21:13 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri,  2 Aug 2013 18:20:47 +0400
Message-Id: <1375453248-7178-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1375453248-7178-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1375453248-7178-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [Qemu-trivial] [PULL 3/4] memory.c: drop kvm.h dependency
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
X-List-Received-Date: Fri, 02 Aug 2013 14:21:36 -0000

From: "Michael S. Tsirkin" <mst@redhat.com>

memory.c does not use any kvm specific interfaces,
don't include kvm.h

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 memory.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/memory.c b/memory.c
index ac6f3c6..886f838 100644
--- a/memory.c
+++ b/memory.c
@@ -18,7 +18,6 @@
 #include "exec/ioport.h"
 #include "qemu/bitops.h"
 #include "qom/object.h"
-#include "sysemu/kvm.h"
 #include "trace.h"
 #include <assert.h>
 
-- 
1.7.10.4


