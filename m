Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b7mfz-0006NW-1T
	for mharc-qemu-trivial@gnu.org; Tue, 31 May 2016 12:37:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37827)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7mfs-0006Cd-80
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:37:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1b7mfr-0003j8-5R
	for qemu-trivial@nongnu.org; Tue, 31 May 2016 12:37:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42866)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1b7mfo-0003g9-Ty; Tue, 31 May 2016 12:37:45 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81BF161A02;
	Tue, 31 May 2016 16:37:44 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-32.ams2.redhat.com [10.36.112.32])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4VGa8QU011053; Tue, 31 May 2016 12:37:41 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 31 May 2016 18:36:05 +0200
Message-Id: <1464712565-14857-17-git-send-email-lvivier@redhat.com>
In-Reply-To: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
References: <1464712565-14857-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 31 May 2016 16:37:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 16/16] hbitmap: Use DIV_ROUND_UP
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
X-List-Received-Date: Tue, 31 May 2016 16:37:53 -0000

Replace (((n) + (d) - 1) /(d)) by DIV_ROUND_UP(n,d).

This patch is the result of coccinelle script
scripts/coccinelle/round.cocci

CC: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 tests/test-hbitmap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/test-hbitmap.c b/tests/test-hbitmap.c
index abe1427..097fe8e 100644
--- a/tests/test-hbitmap.c
+++ b/tests/test-hbitmap.c
@@ -80,7 +80,7 @@ static void hbitmap_test_init(TestHBitmapData *data,
     size_t n;
     data->hb = hbitmap_alloc(size, granularity);
 
-    n = (size + BITS_PER_LONG - 1) / BITS_PER_LONG;
+    n = DIV_ROUND_UP(size, BITS_PER_LONG);
     if (n == 0) {
         n = 1;
     }
@@ -94,7 +94,7 @@ static void hbitmap_test_init(TestHBitmapData *data,
 
 static inline size_t hbitmap_test_array_size(size_t bits)
 {
-    size_t n = (bits + BITS_PER_LONG - 1) / BITS_PER_LONG;
+    size_t n = DIV_ROUND_UP(bits, BITS_PER_LONG);
     return n ? n : 1;
 }
 
@@ -186,7 +186,7 @@ static void hbitmap_test_reset_all(TestHBitmapData *data)
 
     hbitmap_reset_all(data->hb);
 
-    n = (data->size + BITS_PER_LONG - 1) / BITS_PER_LONG;
+    n = DIV_ROUND_UP(data->size, BITS_PER_LONG);
     if (n == 0) {
         n = 1;
     }
-- 
2.5.5


