Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tvrld-0005ZL-KH
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jan 2013 10:52:37 -0500
Received: from eggs.gnu.org ([208.118.235.92]:34806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TvrlU-0005HV-Iy
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2013 10:52:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1TvrlS-00060B-46
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2013 10:52:28 -0500
Received: from
	1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.d.1.0.0.b.8.0.1.0.0.2.ip6.arpa
	([2001:8b0:1d0::1]:60021 helo=mnementh.archaic.org.uk)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1TvrlM-0005xs-1Q; Thu, 17 Jan 2013 10:52:20 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1TvrlA-0000dT-9f; Thu, 17 Jan 2013 15:52:08 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 17 Jan 2013 15:52:08 +0000
Message-Id: <1358437928-2420-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	patches@linaro.org
Subject: [Qemu-trivial] [PATCH] qemu-pixman.h: Avoid mutual inclusion loop
	with console.h
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
X-List-Received-Date: Thu, 17 Jan 2013 15:52:34 -0000

Remove an unnecessary mutual inclusion loop between qemu-pixman.h and
console.h, since the former was only including the latter for
'PixelFormat*', which can be provided by typedefs.h.  This requires a
minor adjustment to qemu-pixman.c, which was relying on the implicit
inclusion of console.h for the actual struct PixelFormat definition,
and on implicitly dragging in a header defining NULL.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I noticed this because I had an out of tree file which included
ui/console.h before qemu-common.h and it didn't compile. But mutual
include loops are a bad idea anyway IMHO.

 include/ui/qemu-pixman.h |    2 +-
 ui/qemu-pixman.c         |    3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/ui/qemu-pixman.h b/include/ui/qemu-pixman.h
index 016fd87..b032f52 100644
--- a/include/ui/qemu-pixman.h
+++ b/include/ui/qemu-pixman.h
@@ -15,7 +15,7 @@
 #pragma GCC diagnostic error "-Wredundant-decls"
 #endif
 
-#include "console.h"
+#include "qemu/typedefs.h"
 
 /*
  * pixman image formats are defined to be native endian,
diff --git a/ui/qemu-pixman.c b/ui/qemu-pixman.c
index 609335a..6dcbe90 100644
--- a/ui/qemu-pixman.c
+++ b/ui/qemu-pixman.c
@@ -3,7 +3,8 @@
  * See the COPYING file in the top-level directory.
  */
 
-#include "ui/qemu-pixman.h"
+#include "qemu-common.h"
+#include "ui/console.h"
 
 int qemu_pixman_get_type(int rshift, int gshift, int bshift)
 {
-- 
1.7.9.5


