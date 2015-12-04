Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a4kRF-0006j1-6S
	for mharc-qemu-trivial@gnu.org; Fri, 04 Dec 2015 02:05:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a4kR9-0006WV-Q4
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 02:05:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a4kR8-0004BC-Uj
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 02:05:47 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:58314)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1a4kR2-00048l-SP; Fri, 04 Dec 2015 02:05:41 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0B64C4068B;
	Fri,  4 Dec 2015 10:05:38 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 83F28AAF;
	Fri,  4 Dec 2015 09:57:43 +0300 (MSK)
Received: (nullmailer pid 7961 invoked by uid 1000);
	Fri, 04 Dec 2015 06:57:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  4 Dec 2015 09:57:35 +0300
Message-Id: <0e1d02452bf2c3486406dd48524a5b1de3c0eba8.1449211229.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1449211229.git.mjt@msgid.tls.msk.ru>
References: <cover.1449211229.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PULL 4/9] crypto: avoid two coverity false positive
	error reports
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
X-List-Received-Date: Fri, 04 Dec 2015 07:05:49 -0000

From: "Daniel P. Berrange" <berrange@redhat.com>

In qcrypto_tls_creds_get_path() coverity complains that
we are checking '*creds' for NULL, despite having
dereferenced it previously. This is harmless bug due
to fact that the trace call was too early. Moving it
after the cleanup gets the desired semantics.

In qcrypto_tls_creds_check_cert_key_purpose() coverity
complains that we're passing a pointer to a previously
free'd buffer into gnutls_x509_crt_get_key_purpose_oid()
This is harmless because we're passing a size == 0, so
gnutls won't access the buffer, but rather just report
what size it needs to be. We can avoid it though by
explicitly setting the buffer to NULL after free'ing
it.

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 crypto/tlscreds.c     | 4 ++--
 crypto/tlscredsx509.c | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/crypto/tlscreds.c b/crypto/tlscreds.c
index 5ec982c..e7d9c1c 100644
--- a/crypto/tlscreds.c
+++ b/crypto/tlscreds.c
@@ -123,10 +123,10 @@ qcrypto_tls_creds_get_path(QCryptoTLSCreds *creds,
         goto cleanup;
     }
 
-    trace_qcrypto_tls_creds_get_path(creds, filename,
-                                     *cred ? *cred : "<none>");
     ret = 0;
  cleanup:
+    trace_qcrypto_tls_creds_get_path(creds, filename,
+                                     *cred ? *cred : "<none>");
     return ret;
 }
 
diff --git a/crypto/tlscredsx509.c b/crypto/tlscredsx509.c
index d080deb..26f18cb 100644
--- a/crypto/tlscredsx509.c
+++ b/crypto/tlscredsx509.c
@@ -255,6 +255,7 @@ qcrypto_tls_creds_check_cert_key_purpose(QCryptoTLSCredsX509 *creds,
         }
 
         g_free(buffer);
+        buffer = NULL;
     }
 
     if (isServer) {
-- 
2.1.4


