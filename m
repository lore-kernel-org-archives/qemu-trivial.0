Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7mfR-0005aS-0u
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 12:37:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7mfK-0005Vf-HP
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:37:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7mfI-0003Nt-IZ
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:37:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56985)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1b7mfB-0003Mj-Jz; Tue, 31 May 2016 12:37:05 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3890AC049D5B;
	Tue, 31 May 2016 16:37:05 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VGa8QN011053; Tue, 31 May 2016 12:36:51 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Date: Tue, 31 May 2016 18:35:58 +0200
Message-Id: <1464712565-14857-10-git-send-email-lvivier@redhat.com>
In-Reply-To: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 31 May 2016 16:37:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 09/16] SPICE: Use DIV_ROUND_UP
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
X-List-Received-Date: Tue, 31 May 2016 16:37:19 -0000

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 ui/spice-display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/spice-display.c b/ui/spice-display.c
index 0553c5e..34095fb 100644
--- a/ui/spice-display.c
+++ b/ui/spice-display.c
@@ -197,7 +197,7 @@ static void qemu_spice_create_one_update(SimpleSpiceDisplay *ssd,
 static void qemu_spice_create_update(SimpleSpiceDisplay *ssd)
 {
     static const int blksize = 32;
-    int blocks = (surface_width(ssd->ds) + blksize - 1) / blksize;
+    int blocks = DIV_ROUND_UP(surface_width(ssd->ds), blksize);
     int dirty_top[blocks];
     int y, yoff1, yoff2, x, xoff, blk, bw;
     int bpp = surface_bytes_per_pixel(ssd->ds);
-- 
2.5.5


