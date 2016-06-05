Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9W7k-0001Sx-Ld
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 07:21:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35234)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9W7i-0001P7-GZ
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 07:21:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9W7h-0003lX-JL
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 07:21:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36367)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9W7e-0003kV-VX; Sun, 05 Jun 2016 07:21:39 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BF19C40923;
	Sun,  5 Jun 2016 14:21:29 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 2594FB00;
	Sun,  5 Jun 2016 10:43:38 +0300 (MSK)
Received: (nullmailer pid 1147 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:05 +0300
Message-Id: <8a9b270bfda0beb0489257ca2bd8d8977f64e411.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 28/52] clean-includes: Add glib.h to list of
 unneeded includes
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Jun 2016 11:21:43 -0000

From: Peter Maydell <peter.maydell@linaro.org>

osdep.h pulls in glib.h via glib-compat.h, so add it to the list of
includes that we remove. (This then means we must avoid running
clean-includes on glib-compat.h or it will delete the glib.h include.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Blake <eblake@redhat.com>
Tested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 scripts/clean-includes | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/clean-includes b/scripts/clean-includes
index adffedd..37b73b5 100755
--- a/scripts/clean-includes
+++ b/scripts/clean-includes
@@ -104,6 +104,7 @@ for f in "$@"; do
       ;;
     *include/qemu/osdep.h | \
     *include/qemu/compiler.h | \
+    *include/glib-compat.h | \
     *include/standard-headers/ )
       # Removing include lines from osdep.h itself would be counterproductive.
       echo "SKIPPING $f (special case header)"
@@ -143,7 +144,7 @@ for f in "$@"; do
            <setjmp.h> <stdarg.h> <stddef.h> <stdbool.h> <stdint.h> <sys/types.h>
            <stdlib.h> <stdio.h> <string.h> <strings.h> <inttypes.h>
            <limits.h> <unistd.h> <time.h> <ctype.h> <errno.h> <fcntl.h>
-           <sys/stat.h> <sys/time.h> <assert.h> <signal.h>
+           <sys/stat.h> <sys/time.h> <assert.h> <signal.h> <glib.h>
            "sysemu/os-posix.h, sysemu/os-win32.h "glib-compat.h"
            "qemu/typedefs.h"
             ))' "$f"
-- 
2.1.4


