Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaMiO-0000w3-R3
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 07:42:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMiH-0000ir-Sc
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:41:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaMiG-0004uB-LO
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:41:53 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34749)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaMiD-0004t4-Tl; Fri, 11 Sep 2015 07:41:50 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 110414143F;
	Fri, 11 Sep 2015 14:41:46 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 40FA2A69;
	Fri, 11 Sep 2015 14:03:53 +0300 (MSK)
Received: (nullmailer pid 22766 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:31 +0300
Message-Id: <d7646f241c8efc17b4b86cc7a304472792f0cc74.1441969369.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
References: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PULL 07/26] maint: remove unused include for
	dirent.h
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
X-List-Received-Date: Fri, 11 Sep 2015 11:41:58 -0000

From: "Daniel P. Berrange" <berrange@redhat.com>

A number of files were including dirent.h but not using any
of the functions it provides

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 fsdev/virtio-9p-marshal.c | 1 -
 hw/tpm/tpm_passthrough.c  | 2 --
 hw/usb/redirect.c         | 1 -
 hw/vfio/pci.c             | 1 -
 qemu-char.c               | 1 -
 5 files changed, 6 deletions(-)

diff --git a/fsdev/virtio-9p-marshal.c b/fsdev/virtio-9p-marshal.c
index 20f308b..7748d32 100644
--- a/fsdev/virtio-9p-marshal.c
+++ b/fsdev/virtio-9p-marshal.c
@@ -14,7 +14,6 @@
 #include <glib.h>
 #include <glib/gprintf.h>
 #include <sys/types.h>
-#include <dirent.h>
 #include <sys/time.h>
 #include <utime.h>
 #include <sys/uio.h>
diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
index 79a8f98..be160c1 100644
--- a/hw/tpm/tpm_passthrough.c
+++ b/hw/tpm/tpm_passthrough.c
@@ -22,8 +22,6 @@
  * License along with this library; if not, see <http://www.gnu.org/licenses/>
  */
 
-#include <dirent.h>
-
 #include "qemu-common.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index 25df25f..34cf60d 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -33,7 +33,6 @@
 #include "qemu/iov.h"
 #include "sysemu/char.h"
 
-#include <dirent.h>
 #include <sys/ioctl.h>
 #include <signal.h>
 #include <usbredirparser.h>
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 4023d8e..5d02099 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -18,7 +18,6 @@
  *  Copyright (C) 2008, IBM, Muli Ben-Yehuda (muli@il.ibm.com)
  */
 
-#include <dirent.h>
 #include <linux/vfio.h>
 #include <sys/ioctl.h>
 #include <sys/mman.h>
diff --git a/qemu-char.c b/qemu-char.c
index d956f8d..fa65159 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -51,7 +51,6 @@
 #include <netinet/in.h>
 #include <net/if.h>
 #include <arpa/inet.h>
-#include <dirent.h>
 #include <netdb.h>
 #include <sys/select.h>
 #ifdef CONFIG_BSD
-- 
2.1.4


