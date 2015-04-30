Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynj1v-0002Mm-I6
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 03:37:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynj1r-0002DQ-Dk
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 03:37:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynj1q-0006Bu-J2
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 03:37:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34624)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ynj1n-0006AB-04; Thu, 30 Apr 2015 03:36:59 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B7E0B42BAE;
	Thu, 30 Apr 2015 10:36:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2D40496C;
	Thu, 30 Apr 2015 08:09:01 +0300 (MSK)
Received: (nullmailer pid 4339 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:36 +0300
Message-Id: <ef5cc084a2c2858798b70a7e9b4a88eb71d3b85f.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 23/42] libcacard: do not use full paths for
	include files in the same dir
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
X-List-Received-Date: Thu, 30 Apr 2015 07:37:04 -0000

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
---
 libcacard/vcard_emul_nss.c | 2 +-
 libcacard/vcardt.c         | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
index 6955f69..d9761ee 100644
--- a/libcacard/vcard_emul_nss.c
+++ b/libcacard/vcard_emul_nss.c
@@ -33,7 +33,7 @@
 #include "vreader.h"
 #include "vevent.h"
 
-#include "libcacard/vcardt_internal.h"
+#include "vcardt_internal.h"
 
 
 typedef enum {
diff --git a/libcacard/vcardt.c b/libcacard/vcardt.c
index 9ce4648..c67de2f 100644
--- a/libcacard/vcardt.c
+++ b/libcacard/vcardt.c
@@ -2,9 +2,9 @@
 #include <string.h>
 #include <glib.h>
 
-#include "libcacard/vcardt.h"
+#include "vcardt.h"
 
-#include "libcacard/vcardt_internal.h"
+#include "vcardt_internal.h"
 
 /* create an ATR with appropriate historical bytes */
 #define ATR_TS_DIRECT_CONVENTION 0x3b
-- 
2.1.4


