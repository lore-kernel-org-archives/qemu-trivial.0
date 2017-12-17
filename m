Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eQgd2-0007Lm-V2
	for mharc-qemu-trivial@gnu.org; Sun, 17 Dec 2017 16:37:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42096)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQgcy-0007Gq-Tk
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 16:37:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1eQgcx-00017v-Od
	for qemu-trivial@nongnu.org; Sun, 17 Dec 2017 16:37:44 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:32917)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1eQgct-00014I-9p; Sun, 17 Dec 2017 16:37:39 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id B4D3941172;
	Mon, 18 Dec 2017 00:28:08 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 99BC0CB5;
	Mon, 18 Dec 2017 00:25:45 +0300 (MSK)
Received: (nullmailer pid 30897 invoked by uid 1000);
	Sun, 17 Dec 2017 21:28:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael McConville <mmcco@mykolab.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 18 Dec 2017 00:27:12 +0300
Message-Id: <c0fafb440946c2f9cc93c9c6070108297ab994e1.1513545944.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
References: <cover.1513545944.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 07/61] mmap(2) returns MAP_FAILED, not NULL,
 on failure
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
X-List-Received-Date: Sun, 17 Dec 2017 21:37:45 -0000

From: Michael McConville <mmcco@mykolab.com>

Signed-off-by: Michael McConville <mmcco@mykolab.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/xen/xen-mapcache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
index baab93b614..efa35dc6e0 100644
--- a/hw/i386/xen/xen-mapcache.c
+++ b/hw/i386/xen/xen-mapcache.c
@@ -199,7 +199,7 @@ static void xen_remap_bucket(MapCacheEntry *entry,
          */
         vaddr_base = mmap(vaddr, size, PROT_READ | PROT_WRITE,
                           MAP_ANON | MAP_SHARED, -1, 0);
-        if (vaddr_base == NULL) {
+        if (vaddr_base == MAP_FAILED) {
             perror("mmap");
             exit(-1);
         }
-- 
2.11.0


