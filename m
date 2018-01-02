Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eWOdY-0003Wq-5X
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jan 2018 10:37:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eWOdW-0003TE-Au
	for qemu-trivial@nongnu.org; Tue, 02 Jan 2018 10:37:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eWOdV-00021c-Cy
	for qemu-trivial@nongnu.org; Tue, 02 Jan 2018 10:37:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:29031)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eWOdR-0001v9-GT; Tue, 02 Jan 2018 10:37:49 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BBFAE70CE;
	Tue,  2 Jan 2018 15:37:47 +0000 (UTC)
Received: from thh440s.str.redhat.com (dhcp-192-189.str.redhat.com
	[10.33.192.189])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1E9025D755;
	Tue,  2 Jan 2018 15:37:45 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	"Daniel P. Berrange" <berrange@redhat.com>
Cc: qemu-trivial@nongnu.org
Date: Tue,  2 Jan 2018 16:37:45 +0100
Message-Id: <1514907465-14530-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 02 Jan 2018 15:37:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] crypto/ivgen-essiv: Fix problem with address
 sanitizer of Clang
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
X-List-Received-Date: Tue, 02 Jan 2018 15:37:55 -0000

When compiling QEMU with clang and -fsanitize=address, I get the
following error:

==9185==ERROR: AddressSanitizer: stack-buffer-overflow on address 0x7ffc7e9adf2f at pc 0x564cba001d88 bp 0x7ffc7e9adeb0 sp 0x7ffc7e9adea8
READ of size 16 at 0x7ffc7e9adf2f thread T0
    #0 0x564cba001d87 in qcrypto_ivgen_essiv_calculate .../crypto/ivgen-essiv.c:83
    #1 0x564cba001367 in qcrypto_ivgen_calculate .../crypto/ivgen.c:72
    #2 0x564cb9fec630 in test_ivgen .../tests/test-crypto-ivgen.c:148
    #3 0x7f98f4224b39 (/lib64/libglib-2.0.so.0+0x6fb39)
    #4 0x7f98f4224d02 (/lib64/libglib-2.0.so.0+0x6fd02)
    #5 0x7f98f4224d02 (/lib64/libglib-2.0.so.0+0x6fd02)
    #6 0x7f98f4224d02 (/lib64/libglib-2.0.so.0+0x6fd02)
    #7 0x7f98f4224f0d (/lib64/libglib-2.0.so.0+0x6ff0d)
    #8 0x7f98f4224f30 (/lib64/libglib-2.0.so.0+0x6ff30)
    #9 0x564cb9fec446 in main .../tests/test-crypto-ivgen.c:173
    #10 0x7f98f294fc04 in __libc_start_main (/lib64/libc.so.6+0x21c04)
    #11 0x564cb9fec1ac in _start (.../tests/test-crypto-ivgen+0xdb1ac)

Address 0x7ffc7e9adf2f is located in stack of thread T0 at offset 47 in frame
    #0 0x564cba00192f in qcrypto_ivgen_essiv_calculate .../crypto/ivgen-essiv.c:76

And indeed, the code is doing a "memcpy(data, (uint8_t *)&sector, ndata)"
here with "sector" being a uint64_t variable and ndata = 16.

Fix it by limiting the size of the memcpy correctly.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 crypto/ivgen-essiv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/ivgen-essiv.c b/crypto/ivgen-essiv.c
index cba20bd..8944609 100644
--- a/crypto/ivgen-essiv.c
+++ b/crypto/ivgen-essiv.c
@@ -79,7 +79,7 @@ static int qcrypto_ivgen_essiv_calculate(QCryptoIVGen *ivgen,
     uint8_t *data = g_new(uint8_t, ndata);
 
     sector = cpu_to_le64(sector);
-    memcpy(data, (uint8_t *)&sector, ndata);
+    memcpy(data, (uint8_t *)&sector, MIN(ndata, sizeof(sector)));
     if (sizeof(sector) < ndata) {
         memset(data + sizeof(sector), 0, ndata - sizeof(sector));
     }
-- 
1.8.3.1


