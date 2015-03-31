Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yd1E5-0006kg-Ie
	for mharc-qemu-trivial@gnu.org; Tue, 31 Mar 2015 14:49:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56985)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1Yd1E4-0006ir-4V
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 14:49:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1Yd1Dx-0005ox-HR
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 14:49:24 -0400
Received: from e33.co.us.ibm.com ([32.97.110.151]:60976)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1Yd1Dx-0005oW-92
	for qemu-trivial@nongnu.org; Tue, 31 Mar 2015 14:49:17 -0400
Received: from /spool/local
	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Tue, 31 Mar 2015 12:49:16 -0600
Received: from d03dlp03.boulder.ibm.com (9.17.202.179)
	by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 31 Mar 2015 12:49:14 -0600
Received: from b03cxnp08026.gho.boulder.ibm.com
	(b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id 4D85A19D8041;
	Tue, 31 Mar 2015 12:40:20 -0600 (MDT)
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t2VInI2h44237024; Tue, 31 Mar 2015 11:49:18 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP
	id t2VInDLB008751; Tue, 31 Mar 2015 12:49:13 -0600
Received: from k-d941e-10.watson.ibm.com (dhcp-9-2-140-32.watson.ibm.com
	[9.2.140.32])
	by d03av04.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	t2VInCSk008636; Tue, 31 Mar 2015 12:49:13 -0600
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Tue, 31 Mar 2015 14:49:10 -0400
Message-Id: <1427827750-610946-2-git-send-email-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1427827750-610946-1-git-send-email-stefanb@linux.vnet.ibm.com>
References: <1427827750-610946-1-git-send-email-stefanb@linux.vnet.ibm.com>
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15033118-0009-0000-0000-000009CDB838
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 32.97.110.151
Cc: qemu-devel@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 2/2] tpm: Modify DPRINTF to enable -Wformat
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
X-List-Received-Date: Tue, 31 Mar 2015 18:49:25 -0000

Modify DPRINTF to always enable -Wformat checking.

Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
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
1.9.3


