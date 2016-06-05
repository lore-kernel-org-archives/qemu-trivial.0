Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9TwE-000479-DS
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 05:01:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9TwC-00044z-FL
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 05:01:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9TwA-0004na-Jp
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 05:01:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46448)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9Tw4-0004lC-Sq; Sun, 05 Jun 2016 05:01:33 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EF88D40916;
	Sun,  5 Jun 2016 12:01:26 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 9088DB3C;
	Sun,  5 Jun 2016 10:43:40 +0300 (MSK)
Received: (nullmailer pid 1195 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:28 +0300
Message-Id: <f5c04ba4ff077696fef4bb63a0c79410d428de7f.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 51/52] qemu-timer: Use DIV_ROUND_UP
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
X-List-Received-Date: Sun, 05 Jun 2016 09:01:41 -0000

From: Laurent Vivier <lvivier@redhat.com>

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-timer.c b/qemu-timer.c
index 4441fe6..eb22e92 100644
--- a/qemu-timer.c
+++ b/qemu-timer.c
@@ -292,7 +292,7 @@ int qemu_timeout_ns_to_ms(int64_t ns)
     /* Always round up, because it's better to wait too long than to wait too
      * little and effectively busy-wait
      */
-    ms = (ns + SCALE_MS - 1) / SCALE_MS;
+    ms = DIV_ROUND_UP(ns, SCALE_MS);
 
     /* To avoid overflow problems, limit this to 2^31, i.e. approx 25 days */
     if (ms > (int64_t) INT32_MAX) {
-- 
2.1.4


