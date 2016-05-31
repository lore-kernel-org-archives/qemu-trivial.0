Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7mf0-0005FW-7q
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 12:36:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7mev-0005B4-Sy
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:36:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7met-0003Ie-T3
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:36:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39279)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1b7mer-0003I2-I4; Tue, 31 May 2016 12:36:45 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D9483B72C;
	Tue, 31 May 2016 16:36:45 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VGa8QL011053; Tue, 31 May 2016 12:36:41 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Date: Tue, 31 May 2016 18:35:56 +0200
Message-Id: <1464712565-14857-8-git-send-email-lvivier@redhat.com>
In-Reply-To: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 31 May 2016 16:36:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 07/16] xen: Use DIV_ROUND_UP
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
X-List-Received-Date: Tue, 31 May 2016 16:36:50 -0000

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
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
2.5.5


