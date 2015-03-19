Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YYWyf-0003LE-5z
	for mharc-qemu-trivial@gnu.org; Thu, 19 Mar 2015 05:42:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWya-0003BR-QQ
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:42:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YYWyW-0001pw-6g
	for qemu-trivial@nongnu.org; Thu, 19 Mar 2015 05:42:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49837)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YYWyL-0001kn-UK; Thu, 19 Mar 2015 05:42:38 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AB09841E50;
	Thu, 19 Mar 2015 12:42:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id CE090928;
	Thu, 19 Mar 2015 12:05:45 +0300 (MSK)
Received: (nullmailer pid 325 invoked by uid 1000);
	Thu, 19 Mar 2015 09:05:44 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 19 Mar 2015 12:05:20 +0300
Message-Id: <9c80d953b2fd839d36795c7a55a4c525ec6e0cc8.1426755483.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
References: <cover.1426755483.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 02/24] backends: Fix warning from Sparse
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
X-List-Received-Date: Thu, 19 Mar 2015 09:42:54 -0000

From: Stefan Weil <sw@weilnetz.de>

Sparse report:

backends/tpm.c:39:5: warning: returning void-valued expression

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


