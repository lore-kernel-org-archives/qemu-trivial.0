Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZUYiB-00039t-63
	for mharc-qemu-trivial@gnu.org; Wed, 26 Aug 2015 07:17:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53333)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZUYi5-00031l-U0
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 07:17:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZUYhz-00086t-OI
	for qemu-trivial@nongnu.org; Wed, 26 Aug 2015 07:17:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38228)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1ZUYhx-00084n-Fy; Wed, 26 Aug 2015 07:17:33 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id 112308C1CB;
	Wed, 26 Aug 2015 11:17:33 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-4-60.ams2.redhat.com
	[10.36.4.60])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7QBHODv028642; Wed, 26 Aug 2015 07:17:32 -0400
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 26 Aug 2015 12:17:17 +0100
Message-Id: <1440587838-25595-7-git-send-email-berrange@redhat.com>
In-Reply-To: <1440587838-25595-1-git-send-email-berrange@redhat.com>
References: <1440587838-25595-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, "Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PATCH 6/7] maint: remove unused include for
	strings.h
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
X-List-Received-Date: Wed, 26 Aug 2015 11:17:45 -0000

A number of files were including strings.h but not using any
of the functions it provides

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 disas/microblaze.c  | 1 -
 hw/pci/shpc.c       | 1 -
 page_cache.c        | 1 -
 tests/test-xbzrle.c | 1 -
 4 files changed, 4 deletions(-)

diff --git a/disas/microblaze.c b/disas/microblaze.c
index c14ab89..92cd4b1 100644
--- a/disas/microblaze.c
+++ b/disas/microblaze.c
@@ -582,7 +582,6 @@ static const char pvr_register_prefix[] = "rpvr";
 #endif /* MICROBLAZE_OPC */
 
 #include "disas/bfd.h"
-#include <strings.h>
 
 #define get_field_rd(instr) get_field(instr, RD_MASK, RD_LOW)
 #define get_field_r1(instr) get_field(instr, RA_MASK, RA_LOW)
diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index bfb4d31..d34fdf3 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -1,5 +1,4 @@
 #include "qemu-common.h"
-#include <strings.h>
 #include <stdint.h>
 #include "qemu/range.h"
 #include "qemu/error-report.h"
diff --git a/page_cache.c b/page_cache.c
index cf8878d..a9eb076 100644
--- a/page_cache.c
+++ b/page_cache.c
@@ -15,7 +15,6 @@
 #include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
-#include <strings.h>
 #include <string.h>
 #include <sys/time.h>
 #include <sys/types.h>
diff --git a/tests/test-xbzrle.c b/tests/test-xbzrle.c
index b5ee8bb..1cd8cb7 100644
--- a/tests/test-xbzrle.c
+++ b/tests/test-xbzrle.c
@@ -13,7 +13,6 @@
 #include <stdint.h>
 #include <stdio.h>
 #include <stdlib.h>
-#include <strings.h>
 #include <string.h>
 #include <sys/time.h>
 #include "qemu-common.h"
-- 
2.4.3


