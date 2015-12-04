Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a4uFa-0001Z3-Ci
	for mharc-qemu-trivial@gnu.org; Fri, 04 Dec 2015 12:34:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a4uFX-0001UI-Ut
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 12:34:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a4uFU-0001v6-HT
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 12:34:27 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:37507)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1a4uFU-0001um-Aw
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 12:34:24 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1a4uFR-00065l-0b; Fri, 04 Dec 2015 17:34:21 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  4 Dec 2015 17:34:20 +0000
Message-Id: <1449250461-23392-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] osdep.h: Include glib-compat.h in osdep.h
	rather than qemu-common.h
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
X-List-Received-Date: Fri, 04 Dec 2015 17:34:28 -0000

Our use of glib is now pervasive across QEMU. Move the include of glib-compat.h
from qemu-common.h to osdep.h so that it is more widely accessible and doesn't
get forgotten by accident. (Failure to include it will result in build failure
on old versions of glib which is likely to be unnoticed by most developers.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu-common.h | 1 -
 include/qemu/osdep.h  | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/qemu-common.h b/include/qemu-common.h
index 405364f..22b010c 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -22,7 +22,6 @@
 
 #define TFR(expr) do { if ((expr) != -1) break; } while (errno == EINTR)
 
-#include "glib-compat.h"
 #include "qemu/option.h"
 #include "qemu/host-utils.h"
 
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 84e84ac..59a7f8d 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -69,6 +69,8 @@
 #include "sysemu/os-posix.h"
 #endif
 
+#include "glib-compat.h"
+
 #include "qapi/error.h"
 
 #if defined(CONFIG_SOLARIS) && CONFIG_SOLARIS_VERSION < 10
-- 
1.9.1


