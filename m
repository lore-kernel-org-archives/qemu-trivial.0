Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gVIcN-00005H-AL
	for mharc-qemu-trivial@gnu.org; Fri, 07 Dec 2018 11:04:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43948)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Fabrice.DESCLAUX@CEA.FR>) id 1gVHNB-0001oE-Qa
	for qemu-trivial@nongnu.org; Fri, 07 Dec 2018 09:44:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Fabrice.DESCLAUX@CEA.FR>) id 1gVHN8-0005ve-JO
	for qemu-trivial@nongnu.org; Fri, 07 Dec 2018 09:44:57 -0500
Received: from sainfoin-smtp-out.extra.cea.fr ([132.167.192.228]:50102)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <Fabrice.DESCLAUX@CEA.FR>)
	id 1gVHN8-0005RK-8a
	for qemu-trivial@nongnu.org; Fri, 07 Dec 2018 09:44:54 -0500
Received: from pisaure.intra.cea.fr (pisaure.intra.cea.fr [132.166.88.21])
	by sainfoin-sys.extra.cea.fr (8.14.7/8.14.7/CEAnet-Internet-out-4.0)
	with ESMTP id wB7EiksR041801
	for <qemu-trivial@nongnu.org>; Fri, 7 Dec 2018 15:44:46 +0100
Received: from pisaure.intra.cea.fr (localhost [127.0.0.1])
	by localhost (Postfix) with SMTP id 06D002023F2
	for <qemu-trivial@nongnu.org>; Fri,  7 Dec 2018 15:44:46 +0100 (CET)
Received: from muguet2-smtp-out.intra.cea.fr (muguet2-smtp-out.intra.cea.fr
	[132.166.192.13])
	by pisaure.intra.cea.fr (Postfix) with ESMTP id F0840201E31
	for <qemu-trivial@nongnu.org>; Fri,  7 Dec 2018 15:44:45 +0100 (CET)
Received: from zia.cdc.esteban.ctsi (out.dam.intra.cea.fr [132.165.76.10])
	by muguet2-sys.intra.cea.fr (8.14.7/8.14.7/CEAnet-Internet-out-4.0)
	with SMTP id wB7EijAV017614
	for <qemu-trivial@nongnu.org>; Fri, 7 Dec 2018 15:44:45 +0100
Received: (qmail 16455 invoked from network); 7 Dec 2018 14:44:45 -0000
To: <qemu-trivial@nongnu.org>
CC: MOUGEY Camille <camille.mougey@cea.fr>, Michael Tokarev <mjt@tls.msk.ru>, 
	Laurent Vivier <laurent@vivier.eu>
Message-ID: <03506cf0-a204-f619-8ee4-4990a5e69af5@cea.fr>
Date: Fri, 7 Dec 2018 15:44:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
From: <fabrice.desclaux@cea.fr>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 132.167.192.228
X-Mailman-Approved-At: Fri, 07 Dec 2018 11:04:41 -0500
Subject: [Qemu-trivial] [PATCH] Fixes i386 xchgq test
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
X-List-Received-Date: Fri, 07 Dec 2018 14:44:58 -0000

As "xchg" reads and writes both operands, the "+m" is required to avoid 
undefined behavior on -O2 compilation.


Signed-off-by: Fabrice Desclaux <fabrice.desclaux@cea.fr>
---
  tests/tcg/i386/test-i386.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/i386/test-i386.c b/tests/tcg/i386/test-i386.c
index a29b41e764..18d5609665 100644
--- a/tests/tcg/i386/test-i386.c
+++ b/tests/tcg/i386/test-i386.c
@@ -1137,7 +1137,7 @@ void test_xchg(void)
      TEST_XCHG(xchgb, "b", "+q");

  #if defined(__x86_64__)
-    TEST_XCHG(xchgq, "", "=m");
+    TEST_XCHG(xchgq, "", "+m");
  #endif
      TEST_XCHG(xchgl, "k", "+m");
      TEST_XCHG(xchgw, "w", "+m");
-- 
2.19.2

