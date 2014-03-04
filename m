Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WKiwM-0004cd-Uz
	for mharc-qemu-trivial@gnu.org; Tue, 04 Mar 2014 01:34:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35164)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKiwE-0004Li-JY
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:34:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKiwA-0007k2-Ls
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:34:50 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44309)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WKivv-0007dS-R9; Tue, 04 Mar 2014 01:34:31 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B90DF40851;
	Tue,  4 Mar 2014 10:34:30 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2CB0166C;
	Tue,  4 Mar 2014 10:16:05 +0400 (MSK)
Received: (nullmailer pid 16591 invoked by uid 1000);
	Tue, 04 Mar 2014 06:16:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  4 Mar 2014 10:15:58 +0400
Message-Id: <1393913761-16516-11-git-send-email-mjt@msgid.tls.msk.ru>
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
Subject: [Qemu-trivial] [PULL 10/13] exec: Remove unneeded include files
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
X-List-Received-Date: Tue, 04 Mar 2014 06:34:56 -0000

From: Stefan Weil <sw@weilnetz.de>

This file does not depend on windows.h.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 exec.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/exec.c b/exec.c
index b69fd29..680268a 100644
--- a/exec.c
+++ b/exec.c
@@ -17,9 +17,7 @@
  * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
  */
 #include "config.h"
-#ifdef _WIN32
-#include <windows.h>
-#else
+#ifndef _WIN32
 #include <sys/types.h>
 #include <sys/mman.h>
 #endif
--=20
1.7.10.4


