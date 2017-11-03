Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eAaYz-0004zB-Ex
	for mharc-qemu-trivial@gnu.org; Fri, 03 Nov 2017 07:55:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eAaYw-0004xL-HA
	for qemu-trivial@nongnu.org; Fri, 03 Nov 2017 07:55:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eAaYv-0002Es-P6
	for qemu-trivial@nongnu.org; Fri, 03 Nov 2017 07:55:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57204)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eAaYp-0002BH-QQ; Fri, 03 Nov 2017 07:54:55 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B490356CE;
	Fri,  3 Nov 2017 11:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8B490356CE
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from thh440s.redhat.com (ovpn-116-22.ams2.redhat.com [10.36.116.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 670255D757;
	Fri,  3 Nov 2017 11:54:53 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: "Daniel P. Berrange" <berrange@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Fri,  3 Nov 2017 12:54:52 +0100
Message-Id: <1509710092-31645-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 03 Nov 2017 11:54:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2] tests: Run the luks tests in
 test-crypto-block only if encryption is available
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Nov 2017 11:55:03 -0000

The test-crypto-block currently fails if encryption has not been
compiled into QEMU:

TEST: tests/test-crypto-block... (pid=22231)
  /crypto/block/qcow:                                                  OK
  /crypto/block/luks/default:
  Unexpected error in qcrypto_pbkdf2() at qemu/crypto/pbkdf-stub.c:41:
FAIL
GTester: last random seed: R02Sbbb5b6f299c6727f41bb50ba4aa6ef5c
(pid=22237)
  /crypto/block/luks/aes-256-cbc-plain64:
  Unexpected error in qcrypto_pbkdf2() at qemu/crypto/pbkdf-stub.c:41:
FAIL
GTester: last random seed: R02S3e27992a5ab4cc95e141c4ed3c7f0d2e
(pid=22239)
  /crypto/block/luks/aes-256-cbc-essiv:
  Unexpected error in qcrypto_pbkdf2() at qemu/crypto/pbkdf-stub.c:41:
FAIL
GTester: last random seed: R02S51b52bb02a66c42d8b331fd305384f53
(pid=22241)
FAIL: tests/test-crypto-block

So run the luks test only if the required encryption support is available.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Added the check to TEST_LUKS in the .c file instead of disabling
     test-crypto-block completely in the Makefile.include.

 tests/test-crypto-block.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/test-crypto-block.c b/tests/test-crypto-block.c
index bd7fe59..fd29a04 100644
--- a/tests/test-crypto-block.c
+++ b/tests/test-crypto-block.c
@@ -28,7 +28,8 @@
 #include <sys/resource.h>
 #endif
 
-#if (defined(_WIN32) || defined RUSAGE_THREAD)
+#if (defined(_WIN32) || defined RUSAGE_THREAD) && \
+    (defined(CONFIG_NETTLE_KDF) || defined(CONFIG_GCRYPT_KDF))
 #define TEST_LUKS
 #else
 #undef TEST_LUKS
-- 
1.8.3.1


