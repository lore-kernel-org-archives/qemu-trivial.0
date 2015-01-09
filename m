Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y9WMP-0005Qk-3f
	for mharc-qemu-trivial@gnu.org; Fri, 09 Jan 2015 05:00:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Y9WMM-0005MA-Lz
	for qemu-trivial@nongnu.org; Fri, 09 Jan 2015 05:00:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Y9WMI-0002gR-Nb
	for qemu-trivial@nongnu.org; Fri, 09 Jan 2015 05:00:02 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42885)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1Y9WMD-0002fl-Du; Fri, 09 Jan 2015 04:59:53 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t099xqrv027068
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 9 Jan 2015 04:59:52 -0500
Received: from donizetti.redhat.com (ovpn-112-82.ams2.redhat.com
	[10.36.112.82])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t099xoum029809; Fri, 9 Jan 2015 04:59:51 -0500
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  9 Jan 2015 10:59:49 +0100
Message-Id: <1420797589-17049-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] blizzard: do not depend on VGA internals
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
X-List-Received-Date: Fri, 09 Jan 2015 10:00:03 -0000

There is nothing that is used by this ARM-specific device.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/display/blizzard.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/display/blizzard.c b/hw/display/blizzard.c
index 92b1fac..5019bbb 100644
--- a/hw/display/blizzard.c
+++ b/hw/display/blizzard.c
@@ -21,7 +21,6 @@
 #include "qemu-common.h"
 #include "ui/console.h"
 #include "hw/devices.h"
-#include "vga_int.h"
 #include "ui/pixel_ops.h"
 
 typedef void (*blizzard_fn_t)(uint8_t *, const uint8_t *, unsigned int);
-- 
2.1.0


