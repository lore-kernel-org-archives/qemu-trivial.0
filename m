Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UkFTE-0005uP-19
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jun 2013 11:17:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UkFT7-0005kR-9K
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 11:17:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UkFT2-0002hG-6e
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 11:17:45 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35317)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UkFSs-0002ed-El; Wed, 05 Jun 2013 11:17:30 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 1177A40A45;
	Wed,  5 Jun 2013 19:17:28 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id DAE814F3; Wed,  5 Jun 2013 19:17:26 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2013 19:17:26 +0400
Message-Id: <1370445446-5860-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH trivial] qemu-char: remove a few needless
	#includes
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
X-List-Received-Date: Wed, 05 Jun 2013 15:17:50 -0000

This removes <syslog.h> since we don't use
syslogging, and removes second, solaris-specific,
include of <net/if.h> (which is included in
a common part of the file)

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-char.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index d04b429..f1df400 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -76,8 +76,6 @@
 #include <netinet/ip_icmp.h> // must come after ip.h
 #include <netinet/udp.h>
 #include <netinet/tcp.h>
-#include <net/if.h>
-#include <syslog.h>
 #endif
 #endif
 #endif
-- 
1.7.10.4


