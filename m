Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnRax-00053r-IM
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 06:51:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRaq-0004sp-SQ
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:51:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnRao-0004Iy-CN
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:50:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60756)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnRaj-0004G7-Ma; Fri, 14 Jun 2013 06:50:49 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 0220F41660;
	Fri, 14 Jun 2013 14:50:49 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id F381B50A; Fri, 14 Jun 2013 14:50:46 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Fri, 14 Jun 2013 14:50:17 +0400
Message-Id: <1371207042-17980-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371207042-17980-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 01/26] qemu-char: remove a few needless
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
X-List-Received-Date: Fri, 14 Jun 2013 10:51:01 -0000

This removes <syslog.h> since we don't use
syslogging, and removes second, solaris-specific,
include of <net/if.h> (which is included in
a common part of the file)

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-char.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index 0b6ae95..596bf9e 100644
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


