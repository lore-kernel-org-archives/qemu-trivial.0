Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZugNQ-0006zo-TM
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 07:44:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugNM-0006t6-QG
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:44:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugNL-00009R-QJ
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:44:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:43486)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZugNC-00005Y-Og; Fri, 06 Nov 2015 07:44:06 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0E1D040DD2;
	Fri,  6 Nov 2015 15:44:04 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id E9775AB8;
	Fri,  6 Nov 2015 15:44:03 +0300 (MSK)
Received: (nullmailer pid 31690 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:43:46 +0300
Message-Id: <112317867d573bb053d431f098060cf996d9b2e8.1446813769.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 09/24] tests/i44fx-test: No need for zeroing
	memory before memset
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
X-List-Received-Date: Fri, 06 Nov 2015 12:44:18 -0000

From: Thomas Huth <thuth@redhat.com>

Change a g_malloc0 into g_malloc since the following
memset fills the whole buffer anyway.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Laszlo Ersek <lersek@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/i440fx-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i440fx-test.c b/tests/i440fx-test.c
index d0bc8de..7fa1709 100644
--- a/tests/i440fx-test.c
+++ b/tests/i440fx-test.c
@@ -191,7 +191,7 @@ static void write_area(uint32_t start, uint32_t end, uint8_t value)
     uint32_t size = end - start + 1;
     uint8_t *data;
 
-    data = g_malloc0(size);
+    data = g_malloc(size);
     memset(data, value, size);
     memwrite(start, data, size);
 
-- 
2.1.4


