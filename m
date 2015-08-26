Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUYi5-00031e-MM
	for mharc-qemu-trivial@gnu.org; Wed, 26 Aug 2015 07:17:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53253)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZUYhy-0002qT-VK
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 07:17:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZUYhy-00085P-0k
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 07:17:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35908)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1ZUYhv-00083w-7I; Wed, 26 Aug 2015 07:17:31 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id BFF118E37F;
	Wed, 26 Aug 2015 11:17:30 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-4-60.ams2.redhat.com
	[10.36.4.60])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7QBHODt028642; Wed, 26 Aug 2015 07:17:29 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 26 Aug 2015 12:17:15 +0100
Message-Id: <1440587838-25595-5-git-send-email-berrange@redhat.com>
In-Reply-To: <1440587838-25595-1-git-send-email-berrange@redhat.com>
References: <1440587838-25595-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PATCH 4/7] maint: remove unused include for dirent.h
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
X-List-Received-Date: Wed, 26 Aug 2015 11:17:36 -0000

A number of files were including dirent.h but not using any
of the functions it provides

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
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
2.4.3


