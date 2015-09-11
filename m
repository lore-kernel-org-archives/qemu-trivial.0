Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaM7g-0004iU-43
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 07:04:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57722)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaM7c-0004cD-7H
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:04:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaM7b-0006s6-7g
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 07:04:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37661)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaM7W-0006pW-SD; Fri, 11 Sep 2015 07:03:55 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 6ED1A4143C;
	Fri, 11 Sep 2015 14:03:52 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 46C6BA52;
	Fri, 11 Sep 2015 14:03:52 +0300 (MSK)
Received: (nullmailer pid 22770 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:33 +0300
Message-Id: <4595a48a10e576638795950b61957f83d2ed09b4.1441969369.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
References: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PULL 09/26] maint: remove unused include for
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
X-List-Received-Date: Fri, 11 Sep 2015 11:04:01 -0000

From: "Daniel P. Berrange" <berrange@redhat.com>

A number of files were including strings.h but not using any
of the functions it provides

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


