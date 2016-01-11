Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIY8M-0001OS-1J
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 03:47:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIY8D-00014X-AP
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:47:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aIY8C-0002Ae-Ct
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 03:47:17 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44601)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aIY86-00027P-Gt; Mon, 11 Jan 2016 03:47:10 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5317D403E7;
	Mon, 11 Jan 2016 11:47:08 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id DE8CBAE5;
	Mon, 11 Jan 2016 11:42:01 +0300 (MSK)
Received: (nullmailer pid 28796 invoked by uid 1000);
	Mon, 11 Jan 2016 08:42:00 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2016 11:41:54 +0300
Message-Id: <529490e5d664a20d5c4223070dd7c03a0e02b6bd.1452501578.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
References: <cover.1452501577.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 15/19] osdep.h: Include glib-compat.h in
	osdep.h rather than qemu-common.h
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
X-List-Received-Date: Mon, 11 Jan 2016 08:47:18 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Our use of glib is now pervasive across QEMU. Move the include of glib-compat.h
from qemu-common.h to osdep.h so that it is more widely accessible and doesn't
get forgotten by accident. (Failure to include it will result in build failure
on old versions of glib which is likely to be unnoticed by most developers.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


