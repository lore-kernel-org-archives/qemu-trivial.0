Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnRgu-00043r-2o
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 06:57:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRgo-0003uG-Rc
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:57:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRgn-0006NG-8f
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:57:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41437)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnRgi-0006DE-8J; Fri, 14 Jun 2013 06:57:00 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4EB2D4165A;
	Fri, 14 Jun 2013 14:56:59 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 24EC1527; Fri, 14 Jun 2013 14:50:48 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 14 Jun 2013 14:50:39 +0400
Message-Id: <1371207042-17980-24-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 23/26] main-loop: do not include slirp/slirp.h,
	use libslirp.h instead
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
X-List-Received-Date: Fri, 14 Jun 2013 10:57:08 -0000

The header slirp/slirp.h is an internal header for slirp, and
main-loop.c does not use internals from there.  Instead, it uses
public functions (slirp_update_timeout(), slirp_pollfds_fill()
etc) which are declared in slirp/libslirp.h.

Including slirp/slirp.h is somewhat dangerous since it redefines
errno on WIN32, so any file including it may misbehave wrt errno.

Unfortunately libslirp isn't self-contained, it needs declaration
of struct in_addr, which is provided by qemu/sockets.h.  Maybe
instead of #including qemu/sockets.h before libslirp.h, it is
better to make the latter self-contained.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 main-loop.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/main-loop.c b/main-loop.c
index cf36645..a44fff6 100644
--- a/main-loop.c
+++ b/main-loop.c
@@ -24,7 +24,8 @@
 
 #include "qemu-common.h"
 #include "qemu/timer.h"
-#include "slirp/slirp.h"
+#include "qemu/sockets.h"	// struct in_addr needed for libslirp.h
+#include "slirp/libslirp.h"
 #include "qemu/main-loop.h"
 #include "block/aio.h"
 
-- 
1.7.10.4


