Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzTRi-000879-Gz
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 12:19:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTRa-0007ql-RT
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:19:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTRV-0001Yb-2X
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:19:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46501)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WzTRG-0001Nx-IL; Tue, 24 Jun 2014 12:19:18 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0B24D44086;
	Tue, 24 Jun 2014 20:19:17 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B2F796B2;
	Tue, 24 Jun 2014 20:09:22 +0400 (MSK)
Received: (nullmailer pid 15619 invoked by uid 1000);
	Tue, 24 Jun 2014 16:09:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 24 Jun 2014 20:09:11 +0400
Message-Id: <1403626160-15546-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 05/14] vscclient: Add required headers to fix
	build on FreeBSD
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
X-List-Received-Date: Tue, 24 Jun 2014 16:19:44 -0000

From: Ed Maste <emaste@freebsd.org>

Signed-off-by: Ed Maste <emaste@freebsd.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 libcacard/vscclient.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/libcacard/vscclient.c b/libcacard/vscclient.c
index ab9b2b8..80111df 100644
--- a/libcacard/vscclient.c
+++ b/libcacard/vscclient.c
@@ -11,6 +11,8 @@
  */
 
 #ifndef _WIN32
+#include <sys/socket.h>
+#include <netinet/in.h>
 #include <netdb.h>
 #define closesocket(x) close(x)
 #endif
-- 
1.7.10.4


