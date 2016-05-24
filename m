Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b5Eez-0002Hj-VV
	for mharc-qemu-trivial@gnu.org; Tue, 24 May 2016 11:54:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5Eex-0002G6-Pa
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 11:54:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5Eew-0003kB-Mn
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 11:54:19 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57218)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5Eew-0003jG-Gq
	for qemu-trivial@nongnu.org; Tue, 24 May 2016 11:54:18 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5ECG-0002xs-OW; Tue, 24 May 2016 16:24:40 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-trivial@nongnu.org
Date: Tue, 24 May 2016 16:24:36 +0100
Message-Id: <1464103479-26913-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1464103479-26913-1-git-send-email-peter.maydell@linaro.org>
References: <1464103479-26913-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH 1/4] clean-includes: Add glib.h to list of
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
X-List-Received-Date: Tue, 24 May 2016 15:54:20 -0000

osdep.h pulls in glib.h via glib-compat.h, so add it to the list of
includes that we remove. (This then means we must avoid running
clean-includes on glib-compat.h or it will delete the glib.h include.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 scripts/clean-includes | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/clean-includes b/scripts/clean-includes
index 72b47f1..23d70a0 100755
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
1.9.1


