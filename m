Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ymj4E-0003rv-3k
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 09:27:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ymj48-0003hW-Cu
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 09:27:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ymj47-0006rw-D7
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 09:27:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53747)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ymj3z-0006nO-Uq; Mon, 27 Apr 2015 09:27:08 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0A3DA41FBB;
	Mon, 27 Apr 2015 16:27:06 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E40EF8FC;
	Mon, 27 Apr 2015 16:27:05 +0300 (MSK)
Received: (nullmailer pid 20163 invoked by uid 1000);
	Mon, 27 Apr 2015 13:27:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 27 Apr 2015 16:27:00 +0300
Message-Id: <1430141220-20123-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PATCH v2] libcacard: stop including qemu-common.h
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
X-List-Received-Date: Mon, 27 Apr 2015 13:27:21 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

This is a small step towards making libcacard standalone.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
v2: update vscclient.c too, use unistd.h on !WIN32 and getopt.h on *nix

 libcacard/cac.c            | 5 ++++-
 libcacard/card_7816.c      | 4 +++-
 libcacard/event.c          | 2 +-
 libcacard/vcard.c          | 4 +++-
 libcacard/vcard_emul_nss.c | 2 +-
 libcacard/vreader.c        | 4 +++-
 libcacard/vscclient.c      | 8 +++++++-
 7 files changed, 22 insertions(+), 7 deletions(-)

diff --git a/libcacard/cac.c b/libcacard/cac.c
index f38fdce..bc84534 100644
--- a/libcacard/cac.c
+++ b/libcacard/cac.c
@@ -5,7 +5,10 @@
  * See the COPYING.LIB file in the top-level directory.
  */
 
-#include "qemu-common.h"
+#include "glib-compat.h"
+
+#include <string.h>
+#include <stdbool.h>
 
 #include "cac.h"
 #include "vcard.h"
diff --git a/libcacard/card_7816.c b/libcacard/card_7816.c
index 814fa16..22fd334 100644
--- a/libcacard/card_7816.c
+++ b/libcacard/card_7816.c
@@ -5,7 +5,9 @@
  * See the COPYING.LIB file in the top-level directory.
  */
 
-#include "qemu-common.h"
+#include "glib-compat.h"
+
+#include <string.h>
 
 #include "vcard.h"
 #include "vcard_emul.h"
diff --git a/libcacard/event.c b/libcacard/event.c
index 4c551e4..63f4057 100644
--- a/libcacard/event.c
+++ b/libcacard/event.c
@@ -5,7 +5,7 @@
  * See the COPYING.LIB file in the top-level directory.
  */
 
-#include "qemu-common.h"
+#include "glib-compat.h"
 
 #include "vcard.h"
 #include "vreader.h"
diff --git a/libcacard/vcard.c b/libcacard/vcard.c
index d140a8e..1a87208 100644
--- a/libcacard/vcard.c
+++ b/libcacard/vcard.c
@@ -5,7 +5,9 @@
  * See the COPYING.LIB file in the top-level directory.
  */
 
-#include "qemu-common.h"
+#include "glib-compat.h"
+
+#include <string.h>
 
 #include "vcard.h"
 #include "vcard_emul.h"
diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
index 950edee..6955f69 100644
--- a/libcacard/vcard_emul_nss.c
+++ b/libcacard/vcard_emul_nss.c
@@ -25,7 +25,7 @@
 #include <prthread.h>
 #include <secerr.h>
 
-#include "qemu-common.h"
+#include "glib-compat.h"
 
 #include "vcard.h"
 #include "card_7816t.h"
diff --git a/libcacard/vreader.c b/libcacard/vreader.c
index 0315dd8..9725f46 100644
--- a/libcacard/vreader.c
+++ b/libcacard/vreader.c
@@ -10,7 +10,9 @@
 #endif
 #define G_LOG_DOMAIN "libcacard"
 
-#include "qemu-common.h"
+#include "glib-compat.h"
+
+#include <string.h>
 
 #include "vcard.h"
 #include "vcard_emul.h"
diff --git a/libcacard/vscclient.c b/libcacard/vscclient.c
index fa6041d..0652684 100644
--- a/libcacard/vscclient.c
+++ b/libcacard/vscclient.c
@@ -10,14 +10,20 @@
  * See the COPYING.LIB file in the top-level directory.
  */
 
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
 #ifndef _WIN32
 #include <sys/socket.h>
 #include <netinet/in.h>
 #include <netdb.h>
+#include <unistd.h>
 #define closesocket(x) close(x)
+#else
+#include <getopt.h>
 #endif
 
-#include "qemu-common.h"
+#include "glib-compat.h"
 
 #include "vscard_common.h"
 
-- 
2.1.4


