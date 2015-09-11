Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaNL7-0006rT-6w
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 08:22:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaNL1-0006ft-8u
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 08:21:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaNKx-0000SH-71
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 08:21:55 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46896)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaNKs-0000MN-D0; Fri, 11 Sep 2015 08:21:46 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 478F34143E;
	Fri, 11 Sep 2015 15:21:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id E5ADDA65;
	Fri, 11 Sep 2015 14:03:52 +0300 (MSK)
Received: (nullmailer pid 22768 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:32 +0300
Message-Id: <1618d2ae7f1728ea26fa38cb661253f134d389ed.1441969369.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
References: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PULL 08/26] maint: remove unused include for
	signal.h
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
X-List-Received-Date: Fri, 11 Sep 2015 12:21:59 -0000

From: "Daniel P. Berrange" <berrange@redhat.com>

A number of files were including signal.h but not using any
of the functions it provides

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 bsd-user/signal.c       | 1 -
 hw/block/xen_disk.c     | 1 -
 hw/net/xen_nic.c        | 1 -
 hw/usb/redirect.c       | 1 -
 os-win32.c              | 1 -
 target-i386/translate.c | 1 -
 target-mips/helper.c    | 1 -
 target-sh4/helper.c     | 1 -
 target-tricore/helper.c | 1 -
 tests/tcg/testthread.c  | 1 -
 10 files changed, 10 deletions(-)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 445f69e..e4ee2d0 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -21,7 +21,6 @@
 #include <string.h>
 #include <stdarg.h>
 #include <unistd.h>
-#include <signal.h>
 #include <errno.h>
 
 #include "qemu.h"
diff --git a/hw/block/xen_disk.c b/hw/block/xen_disk.c
index 267d8a8..36d7398 100644
--- a/hw/block/xen_disk.c
+++ b/hw/block/xen_disk.c
@@ -24,7 +24,6 @@
 #include <stdarg.h>
 #include <string.h>
 #include <unistd.h>
-#include <signal.h>
 #include <inttypes.h>
 #include <time.h>
 #include <fcntl.h>
diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index d7cbfc1..0da16b4 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -24,7 +24,6 @@
 #include <stdarg.h>
 #include <string.h>
 #include <unistd.h>
-#include <signal.h>
 #include <inttypes.h>
 #include <fcntl.h>
 #include <errno.h>
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 34cf60d..38086cd 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -34,7 +34,6 @@
 #include "sysemu/char.h"
 
 #include <sys/ioctl.h>
-#include <signal.h>
 #include <usbredirparser.h>
 #include <usbredirfilter.h>
 
diff --git a/os-win32.c b/os-win32.c
index c0daf8e..cc09196 100644
--- a/os-win32.c
+++ b/os-win32.c
@@ -26,7 +26,6 @@
 #include <mmsystem.h>
 #include <unistd.h>
 #include <fcntl.h>
-#include <signal.h>
 #include <time.h>
 #include <errno.h>
 #include <sys/time.h>
diff --git a/target-i386/translate.c b/target-i386/translate.c
index 82e2245..b1a5ad9 100644
--- a/target-i386/translate.c
+++ b/target-i386/translate.c
@@ -21,7 +21,6 @@
 #include <stdio.h>
 #include <string.h>
 #include <inttypes.h>
-#include <signal.h>
 
 #include "qemu/host-utils.h"
 #include "cpu.h"
diff --git a/target-mips/helper.c b/target-mips/helper.c
index f44edbb..37bba67 100644
--- a/target-mips/helper.c
+++ b/target-mips/helper.c
@@ -21,7 +21,6 @@
 #include <stdio.h>
 #include <string.h>
 #include <inttypes.h>
-#include <signal.h>
 
 #include "cpu.h"
 #include "sysemu/kvm.h"
diff --git a/target-sh4/helper.c b/target-sh4/helper.c
index a533f08..dc101cb 100644
--- a/target-sh4/helper.c
+++ b/target-sh4/helper.c
@@ -21,7 +21,6 @@
 #include <stdio.h>
 #include <string.h>
 #include <inttypes.h>
-#include <signal.h>
 
 #include "cpu.h"
 
diff --git a/target-tricore/helper.c b/target-tricore/helper.c
index f52504c..1808b28 100644
--- a/target-tricore/helper.c
+++ b/target-tricore/helper.c
@@ -20,7 +20,6 @@
 #include <stdio.h>
 #include <string.h>
 #include <inttypes.h>
-#include <signal.h>
 
 #include "cpu.h"
 
diff --git a/tests/tcg/testthread.c b/tests/tcg/testthread.c
index 2679af1..810ba5d 100644
--- a/tests/tcg/testthread.c
+++ b/tests/tcg/testthread.c
@@ -2,7 +2,6 @@
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
-#include <signal.h>
 #include <unistd.h>
 #include <inttypes.h>
 #include <pthread.h>
-- 
2.1.4


