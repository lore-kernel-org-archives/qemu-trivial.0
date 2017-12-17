Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQgk6-0004u3-Vz
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 16:45:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQgk1-0004o0-Rm
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 16:45:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQgk1-0006Gi-1C
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 16:45:01 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35495)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eQgjw-0006EO-LE; Sun, 17 Dec 2017 16:44:56 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 595C641176;
	Mon, 18 Dec 2017 00:44:55 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id BDB8ED41;
	Mon, 18 Dec 2017 00:25:48 +0300 (MSK)
Received: (nullmailer pid 30953 invoked by uid 1000);
	Sun, 17 Dec 2017 21:28:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org
Date: Mon, 18 Dec 2017 00:27:39 +0300
Message-Id: <b14c362cd02d482a74960431fbfe8f74b72e7cb8.1513545944.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 34/61] i386/hax: remove duplicated includes
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
X-List-Received-Date: Sun, 17 Dec 2017 21:45:02 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

applied using ./scripts/clean-includes

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/sysemu/hax.h      | 1 -
 target/i386/hax-darwin.c  | 6 +-----
 target/i386/hax-darwin.h  | 3 ---
 target/i386/hax-windows.h | 2 --
 4 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/include/sysemu/hax.h b/include/sysemu/hax.h
index 232a68ab1b..f252399623 100644
--- a/include/sysemu/hax.h
+++ b/include/sysemu/hax.h
@@ -22,7 +22,6 @@
 #ifndef QEMU_HAX_H
 #define QEMU_HAX_H
=20
-#include "config-host.h"
 #include "qemu-common.h"
=20
 int hax_sync_vcpus(void);
diff --git a/target/i386/hax-darwin.c b/target/i386/hax-darwin.c
index 1c5bbd0a2d..ee9417454c 100644
--- a/target/i386/hax-darwin.c
+++ b/target/i386/hax-darwin.c
@@ -11,13 +11,9 @@
  */
=20
 /* HAX module interface - darwin version */
-#include <sys/types.h>
-#include <sys/stat.h>
-#include <fcntl.h>
-#include <errno.h>
+#include "qemu/osdep.h"
 #include <sys/ioctl.h>
=20
-#include "qemu/osdep.h"
 #include "target/i386/hax-i386.h"
=20
 hax_fd hax_mod_open(void)
diff --git a/target/i386/hax-darwin.h b/target/i386/hax-darwin.h
index 0c0968b77d..fb8e25a096 100644
--- a/target/i386/hax-darwin.h
+++ b/target/i386/hax-darwin.h
@@ -15,10 +15,7 @@
 #ifndef TARGET_I386_HAX_DARWIN_H
 #define TARGET_I386_HAX_DARWIN_H
=20
-#include <sys/types.h>
 #include <sys/ioctl.h>
-#include <sys/mman.h>
-#include <stdarg.h>
=20
 #define HAX_INVALID_FD  (-1)
 static inline int hax_invalid_fd(hax_fd fd)
diff --git a/target/i386/hax-windows.h b/target/i386/hax-windows.h
index 1d8f68de91..f7c3e99246 100644
--- a/target/i386/hax-windows.h
+++ b/target/i386/hax-windows.h
@@ -24,8 +24,6 @@
 #include <memory.h>
 #include <malloc.h>
 #include <winioctl.h>
-#include <string.h>
-#include <stdio.h>
 #include <windef.h>
=20
 #define HAX_INVALID_FD INVALID_HANDLE_VALUE
--=20
2.11.0


