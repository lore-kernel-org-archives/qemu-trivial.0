Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WKimc-0001US-Vr
	for mharc-qemu-trivial@gnu.org; Tue, 04 Mar 2014 01:24:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKimS-0001EK-9a
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:24:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKimO-0004Bu-2k
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:24:44 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:45827)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WKimF-00049Y-G9; Tue, 04 Mar 2014 01:24:31 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5385440856;
	Tue,  4 Mar 2014 10:24:30 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 91085662;
	Tue,  4 Mar 2014 10:16:04 +0400 (MSK)
Received: (nullmailer pid 16589 invoked by uid 1000);
	Tue, 04 Mar 2014 06:16:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  4 Mar 2014 10:15:57 +0400
Message-Id: <1393913761-16516-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 09/13] util/iov: Use qemu/sockets.h instead of
	conditional code
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
X-List-Received-Date: Tue, 04 Mar 2014 06:24:50 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/iov.c |    9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/util/iov.c b/util/iov.c
index 03934da..6569b5a 100644
--- a/util/iov.c
+++ b/util/iov.c
@@ -17,14 +17,7 @@
  */
=20
 #include "qemu/iov.h"
-
-#ifdef _WIN32
-# include <windows.h>
-# include <winsock2.h>
-#else
-# include <sys/types.h>
-# include <sys/socket.h>
-#endif
+#include "qemu/sockets.h"
=20
 size_t iov_from_buf(const struct iovec *iov, unsigned int iov_cnt,
                     size_t offset, const void *buf, size_t bytes)
--=20
1.7.10.4


