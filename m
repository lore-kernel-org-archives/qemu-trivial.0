Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yngii-0000Kw-PF
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 01:09:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yngid-00007n-8y
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:09:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Yngic-0003mB-GZ
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 01:09:03 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51680)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YngiY-0003kV-5T; Thu, 30 Apr 2015 01:08:58 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9A62F42B8A;
	Thu, 30 Apr 2015 08:08:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7CD0794E;
	Thu, 30 Apr 2015 08:08:57 +0300 (MSK)
Received: (nullmailer pid 4296 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:15 +0300
Message-Id: <1bcf0256e07d089fffe10e7161edc9fd7bdbdb82.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PULL 02/42] tpm: Modify DPRINTF to enable -Wformat
	checking
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
X-List-Received-Date: Thu, 30 Apr 2015 05:09:04 -0000

From: Stefan Berger <stefanb@linux.vnet.ibm.com>

Modify DPRINTF to always enable -Wformat checking.

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/tpm/tpm_passthrough.c | 16 +++++++---------
 hw/tpm/tpm_tis.c         | 14 ++++++--------
 2 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/hw/tpm/tpm_passthrough.c b/hw/tpm/tpm_passthrough.c
index 2a45071..73ca906 100644
--- a/hw/tpm/tpm_passthrough.c
+++ b/hw/tpm/tpm_passthrough.c
@@ -34,15 +34,13 @@
 #include "sysemu/tpm_backend_int.h"
 #include "tpm_tis.h"
 
-/* #define DEBUG_TPM */
-
-#ifdef DEBUG_TPM
-#define DPRINTF(fmt, ...) \
-    do { fprintf(stderr, fmt, ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...) \
-    do { } while (0)
-#endif
+#define DEBUG_TPM 0
+
+#define DPRINTF(fmt, ...) do { \
+    if (DEBUG_TPM) { \
+        fprintf(stderr, fmt, ## __VA_ARGS__); \
+    } \
+} while (0);
 
 #define TYPE_TPM_PASSTHROUGH "tpm-passthrough"
 #define TPM_PASSTHROUGH(obj) \
diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
index cb9c7c8..4b6d601 100644
--- a/hw/tpm/tpm_tis.c
+++ b/hw/tpm/tpm_tis.c
@@ -30,15 +30,13 @@
 #include "qemu-common.h"
 #include "qemu/main-loop.h"
 
-/*#define DEBUG_TIS */
+#define DEBUG_TIS 0
 
-#ifdef DEBUG_TIS
-#define DPRINTF(fmt, ...) \
-    do { fprintf(stderr, fmt, ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...) \
-    do { } while (0)
-#endif
+#define DPRINTF(fmt, ...) do { \
+    if (DEBUG_TIS) { \
+        printf(fmt, ## __VA_ARGS__); \
+    } \
+} while (0);
 
 /* whether the STS interrupt is supported */
 #define RAISE_STS_IRQ
-- 
2.1.4


