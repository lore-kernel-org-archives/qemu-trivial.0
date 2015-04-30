Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynk7j-0006x2-VZ
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 04:47:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynk7i-0006sw-83
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 04:47:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ynk7f-0004e8-2A
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 04:47:10 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50701)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ynk7V-0004ZL-Om; Thu, 30 Apr 2015 04:46:57 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A5DBA42BBB;
	Thu, 30 Apr 2015 11:46:56 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 23A2C957;
	Thu, 30 Apr 2015 08:08:59 +0300 (MSK)
Received: (nullmailer pid 4366 invoked by uid 1000);
	Thu, 30 Apr 2015 05:08:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 30 Apr 2015 08:08:49 +0300
Message-Id: <9be4992ce3039d4f3c5d222259aac2c82573a8a5.1430370396.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
References: <cover.1430370396.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, "Emilio G. Cota" <cota@braap.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 36/42] i440fx-test: remove ARRAY_SIZE
	redefinition
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
X-List-Received-Date: Thu, 30 Apr 2015 08:47:11 -0000

From: "Emilio G. Cota" <cota@braap.org>

It's defined in osdep.h and shouldn't be redefined here.

Signed-off-by: Emilio G. Cota <cota@braap.org>
Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/i440fx-test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/i440fx-test.c b/tests/i440fx-test.c
index d0bc8de..33a7ecb 100644
--- a/tests/i440fx-test.c
+++ b/tests/i440fx-test.c
@@ -27,8 +27,6 @@
 
 #define BROKEN 1
 
-#define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
-
 typedef struct TestData
 {
     int num_cpus;
-- 
2.1.4


