Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tmt35-0006jM-Ih
	for mharc-qemu-trivial@gnu.org; Sun, 23 Dec 2012 16:25:31 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46164)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1Tmt2y-0006PH-KO
	for qemu-trivial@nongnu.org; Sun, 23 Dec 2012 16:25:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1Tmt2x-0002RV-Mg
	for qemu-trivial@nongnu.org; Sun, 23 Dec 2012 16:25:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:62781)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1Tmt2u-0002Qd-8B; Sun, 23 Dec 2012 16:25:20 -0500
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qBNLPIpC018503
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Sun, 23 Dec 2012 16:25:19 -0500
Received: from garlic.redhat.com (vpn1-4-179.ams2.redhat.com [10.36.4.179])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qBNLPB7C007048; Sun, 23 Dec 2012 16:25:13 -0500
From: Alon Levy <alevy@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Sun, 23 Dec 2012 23:25:09 +0200
Message-Id: <1356297909-4446-1-git-send-email-alevy@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH] usb/redirect.c: unbreak compilation due to
	include/char/char.h
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
X-List-Received-Date: Sun, 23 Dec 2012 21:25:29 -0000

Broken since:

commit 927d4878b0ff319ed87fed9363f314613b0a5ed9
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Mon Dec 17 18:20:05 2012 +0100

    softmmu: move remaining include files to include/ subdirectories

Signed-off-by: Alon Levy <alevy@redhat.com>
---
 hw/usb/redirect.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/usb/redirect.c b/hw/usb/redirect.c
index b65e868..0abe1ff 100644
--- a/hw/usb/redirect.c
+++ b/hw/usb/redirect.c
@@ -30,6 +30,7 @@
 #include "monitor/monitor.h"
 #include "sysemu/sysemu.h"
 #include "qemu/iov.h"
+#include "char/char.h"
 
 #include <dirent.h>
 #include <sys/ioctl.h>
-- 
1.8.0.1


