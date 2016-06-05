Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9T0Q-000225-Ge
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 04:01:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33544)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9T0L-0001uJ-Iw
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:01:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9T0J-000870-Q8
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:01:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54817)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9T02-00081d-Jk; Sun, 05 Jun 2016 04:01:34 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5E3E640913;
	Sun,  5 Jun 2016 11:01:26 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id F0C21AF5;
	Sun,  5 Jun 2016 10:43:35 +0300 (MSK)
Received: (nullmailer pid 1197 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:29 +0300
Message-Id: <275757ac23428a641983200805bedee8f7b96793.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 52/52] hbitmap: Use DIV_ROUND_UP
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
X-List-Received-Date: Sun, 05 Jun 2016 08:01:56 -0000

From: Laurent Vivier <lvivier@redhat.com>

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/test-hbitmap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/test-hbitmap.c b/tests/test-hbitmap.c
index 71d0098..c0e9895 100644
--- a/tests/test-hbitmap.c
+++ b/tests/test-hbitmap.c
@@ -79,7 +79,7 @@ static void hbitmap_test_init(TestHBitmapData *data,
     size_t n;
     data->hb = hbitmap_alloc(size, granularity);
 
-    n = (size + BITS_PER_LONG - 1) / BITS_PER_LONG;
+    n = DIV_ROUND_UP(size, BITS_PER_LONG);
     if (n == 0) {
         n = 1;
     }
@@ -93,7 +93,7 @@ static void hbitmap_test_init(TestHBitmapData *data,
 
 static inline size_t hbitmap_test_array_size(size_t bits)
 {
-    size_t n = (bits + BITS_PER_LONG - 1) / BITS_PER_LONG;
+    size_t n = DIV_ROUND_UP(bits, BITS_PER_LONG);
     return n ? n : 1;
 }
 
@@ -185,7 +185,7 @@ static void hbitmap_test_reset_all(TestHBitmapData *data)
 
     hbitmap_reset_all(data->hb);
 
-    n = (data->size + BITS_PER_LONG - 1) / BITS_PER_LONG;
+    n = DIV_ROUND_UP(data->size, BITS_PER_LONG);
     if (n == 0) {
         n = 1;
     }
-- 
2.1.4


