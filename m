Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g1x1V-0002LW-0B
	for mharc-qemu-trivial@gnu.org; Mon, 17 Sep 2018 13:09:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1g1x1P-0002Id-3i
	for qemu-trivial@nongnu.org; Mon, 17 Sep 2018 13:09:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1g1x1I-0005FE-C1
	for qemu-trivial@nongnu.org; Mon, 17 Sep 2018 13:09:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51056)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1g1x1A-000523-9T; Mon, 17 Sep 2018 13:09:00 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8D9C388315;
	Mon, 17 Sep 2018 17:08:59 +0000 (UTC)
Received: from thuth.com (ovpn-116-63.ams2.redhat.com [10.36.116.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F98482201;
	Mon, 17 Sep 2018 17:08:57 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <rth@twiddle.net>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-trivial@nongnu.org
Date: Mon, 17 Sep 2018 19:08:54 +0200
Message-Id: <1537204134-15905-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Mon, 17 Sep 2018 17:08:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] accel/tcg: Remove dead code
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
X-List-Received-Date: Mon, 17 Sep 2018 17:09:20 -0000

The global cpu_single_env variable has been removed more than 5 years
ago, so apparently nobody used this dead debug code in that timeframe
anymore. Thus let's remove it completely now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 accel/tcg/translate-all.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 898c3bb..e589c35 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -2011,15 +2011,6 @@ void tb_invalidate_phys_page_fast(struct page_collection *pages,
 {
     PageDesc *p;
 
-#if 0
-    if (1) {
-        qemu_log("modifying code at 0x%x size=%d EIP=%x PC=%08x\n",
-                  cpu_single_env->mem_io_vaddr, len,
-                  cpu_single_env->eip,
-                  cpu_single_env->eip +
-                  (intptr_t)cpu_single_env->segs[R_CS].base);
-    }
-#endif
     assert_memory_lock();
 
     p = page_find(start >> TARGET_PAGE_BITS);
-- 
1.8.3.1


