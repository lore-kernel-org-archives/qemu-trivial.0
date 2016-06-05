Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9TJZ-0003ng-No
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 04:21:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9TJU-0003i6-8b
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:21:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9TJS-0004XO-Aj
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:21:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40314)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9TJK-0004Vj-0a; Sun, 05 Jun 2016 04:21:30 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 00E9040914;
	Sun,  5 Jun 2016 11:21:26 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 3FBB1B42;
	Sun,  5 Jun 2016 10:43:41 +0300 (MSK)
Received: (nullmailer pid 1178 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-trivial@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:20 +0300
Message-Id: <6abb9bb67653f32a93be5f9d408e3d35bfedaeb3.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 43/52] xen: Use DIV_ROUND_UP
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
X-List-Received-Date: Sun, 05 Jun 2016 08:21:45 -0000

From: Laurent Vivier <lvivier@redhat.com>

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/display/xenfb.c | 4 ++--
 xen-hvm.c          | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/display/xenfb.c b/hw/display/xenfb.c
index 9866dfd..570b097 100644
--- a/hw/display/xenfb.c
+++ b/hw/display/xenfb.c
@@ -472,9 +472,9 @@ static int xenfb_map_fb(struct XenFB *xenfb)
         xenfb->pixels = NULL;
     }
 
-    xenfb->fbpages = (xenfb->fb_len + (XC_PAGE_SIZE - 1)) / XC_PAGE_SIZE;
+    xenfb->fbpages = DIV_ROUND_UP(xenfb->fb_len, XC_PAGE_SIZE);
     n_fbdirs = xenfb->fbpages * mode / 8;
-    n_fbdirs = (n_fbdirs + (XC_PAGE_SIZE - 1)) / XC_PAGE_SIZE;
+    n_fbdirs = DIV_ROUND_UP(n_fbdirs, XC_PAGE_SIZE);
 
     pgmfns = g_malloc0(sizeof(xen_pfn_t) * n_fbdirs);
     fbmfns = g_malloc0(sizeof(xen_pfn_t) * xenfb->fbpages);
diff --git a/xen-hvm.c b/xen-hvm.c
index 01ee25d..a0da8d7 100644
--- a/xen-hvm.c
+++ b/xen-hvm.c
@@ -567,7 +567,7 @@ static void xen_sync_dirty_bitmap(XenIOState *state,
 {
     hwaddr npages = size >> TARGET_PAGE_BITS;
     const int width = sizeof(unsigned long) * 8;
-    unsigned long bitmap[(npages + width - 1) / width];
+    unsigned long bitmap[DIV_ROUND_UP(npages, width)];
     int rc, i, j;
     const XenPhysmap *physmap = NULL;
 
-- 
2.1.4


