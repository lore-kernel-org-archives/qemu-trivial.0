Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZxIQ4-0000ev-6o
	for mharc-qemu-trivial@gnu.org; Fri, 13 Nov 2015 12:45:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34204)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZxIQ1-0000bc-1v
	for qemu-trivial@nongnu.org; Fri, 13 Nov 2015 12:45:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1ZxIQ0-0006ak-03
	for qemu-trivial@nongnu.org; Fri, 13 Nov 2015 12:45:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54047)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>)
	id 1ZxIPu-0006SA-Mg; Fri, 13 Nov 2015 12:45:42 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 1851191E9F;
	Fri, 13 Nov 2015 17:45:42 +0000 (UTC)
Received: from localhost.localdomain.com (vpn1-7-135.ams2.redhat.com
	[10.36.7.135])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tADHje9Y013593; Fri, 13 Nov 2015 12:45:40 -0500
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 13 Nov 2015 17:45:27 +0000
Message-Id: <1447436727-26484-1-git-send-email-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>
Subject: [Qemu-trivial] [PATCH] crypto: avoid two coverity false positive
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
X-List-Received-Date: Fri, 13 Nov 2015 17:45:50 -0000

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
index dc46bc4..e39c10f 100644
--- a/crypto/tlscredsx509.c
+++ b/crypto/tlscredsx509.c
@@ -255,6 +255,7 @@ qcrypto_tls_creds_check_cert_key_purpose(QCryptoTLSCredsX509 *creds,
         }
 
         g_free(buffer);
+        buffer = NULL;
     }
 
     if (isServer) {
-- 
2.5.0


