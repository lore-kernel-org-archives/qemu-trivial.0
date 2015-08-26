Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUYi8-000359-9P
	for mharc-qemu-trivial@gnu.org; Wed, 26 Aug 2015 07:17:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53281)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZUYi0-0002rM-2r
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 07:17:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZUYhy-000864-JW
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 07:17:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46629)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1ZUYhw-000847-BY; Wed, 26 Aug 2015 07:17:32 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id E5D388CF5B;
	Wed, 26 Aug 2015 11:17:31 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-4-60.ams2.redhat.com
	[10.36.4.60])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7QBHODu028642; Wed, 26 Aug 2015 07:17:31 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 26 Aug 2015 12:17:16 +0100
Message-Id: <1440587838-25595-6-git-send-email-berrange@redhat.com>
In-Reply-To: <1440587838-25595-1-git-send-email-berrange@redhat.com>
References: <1440587838-25595-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PATCH 5/7] maint: remove unused include for signal.h
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
X-List-Received-Date: Wed, 26 Aug 2015 11:17:37 -0000

A number of files were including signal.h but not using any
of the functions it provides

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
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
2.4.3


