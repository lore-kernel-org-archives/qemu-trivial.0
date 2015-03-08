Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YUfj7-0005Fm-C0
	for mharc-qemu-trivial@gnu.org; Sun, 08 Mar 2015 14:14:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47991)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YUfj5-0005Cc-2p
	for qemu-trivial@nongnu.org; Sun, 08 Mar 2015 14:14:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YUfj4-0003iB-Dp
	for qemu-trivial@nongnu.org; Sun, 08 Mar 2015 14:14:55 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:36653)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YUfj2-0003gW-4Y; Sun, 08 Mar 2015 14:14:52 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 330AE17F9E9; Sun,  8 Mar 2015 19:14:48 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sun,  8 Mar 2015 19:14:47 +0100
Message-Id: <1425838487-28274-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developer <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH 1/7] backends: Fix warning from Sparse
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
X-List-Received-Date: Sun, 08 Mar 2015 18:14:56 -0000

Sparse report:

backends/tpm.c:39:5: warning: returning void-valued expression

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 backends/tpm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/backends/tpm.c b/backends/tpm.c
index 01860c4..4efe367 100644
--- a/backends/tpm.c
+++ b/backends/tpm.c
@@ -36,7 +36,7 @@ void tpm_backend_destroy(TPMBackend *s)
 {
     TPMBackendClass *k = TPM_BACKEND_GET_CLASS(s);
 
-    return k->ops->destroy(s);
+    k->ops->destroy(s);
 }
 
 int tpm_backend_init(TPMBackend *s, TPMState *state,
-- 
2.1.4


