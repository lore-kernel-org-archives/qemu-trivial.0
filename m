Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VSkxw-0006w0-5Q
	for mharc-qemu-trivial@gnu.org; Sun, 06 Oct 2013 05:49:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSkxp-0006h7-In
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:49:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VSkxk-0006T8-MW
	for qemu-trivial@nongnu.org; Sun, 06 Oct 2013 05:49:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:33103)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VSkxa-0006PV-6W; Sun, 06 Oct 2013 05:49:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 59C8D40D02;
	Sun,  6 Oct 2013 13:49:09 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2C9D1511;
	Sun,  6 Oct 2013 13:33:03 +0400 (MSK)
Received: (nullmailer pid 25806 invoked by uid 1000);
	Sun, 06 Oct 2013 09:33:02 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sun,  6 Oct 2013 13:32:49 +0400
Message-Id: <1381051979-25742-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1381051979-25742-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 04/14] exec: cleanup DEBUG_SUBPAGE
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
X-List-Received-Date: Sun, 06 Oct 2013 09:49:30 -0000

From: Amos Kong <akong@redhat.com>

Touched some error after enabling DEBUG_SUBPAGE.

Signed-off-by: Amos Kong <akong@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 exec.c |   18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/exec.c b/exec.c
index 26681ce..51c2369 100644
--- a/exec.c
+++ b/exec.c
@@ -1573,7 +1573,7 @@ static uint64_t subpage_read(void *opaque, hwaddr addr,
     uint8_t buf[4];
 
 #if defined(DEBUG_SUBPAGE)
-    printf("%s: subpage %p len %d addr " TARGET_FMT_plx "\n", __func__,
+    printf("%s: subpage %p len %u addr " TARGET_FMT_plx "\n", __func__,
            subpage, len, addr);
 #endif
     address_space_read(subpage->as, addr + subpage->base, buf, len);
@@ -1596,7 +1596,7 @@ static void subpage_write(void *opaque, hwaddr addr,
     uint8_t buf[4];
 
 #if defined(DEBUG_SUBPAGE)
-    printf("%s: subpage %p len %d addr " TARGET_FMT_plx
+    printf("%s: subpage %p len %u addr " TARGET_FMT_plx
            " value %"PRIx64"\n",
            __func__, subpage, len, addr, value);
 #endif
@@ -1617,16 +1617,16 @@ static void subpage_write(void *opaque, hwaddr addr,
 }
 
 static bool subpage_accepts(void *opaque, hwaddr addr,
-                            unsigned size, bool is_write)
+                            unsigned len, bool is_write)
 {
     subpage_t *subpage = opaque;
 #if defined(DEBUG_SUBPAGE)
-    printf("%s: subpage %p %c len %d addr " TARGET_FMT_plx "\n",
+    printf("%s: subpage %p %c len %u addr " TARGET_FMT_plx "\n",
            __func__, subpage, is_write ? 'w' : 'r', len, addr);
 #endif
 
     return address_space_access_valid(subpage->as, addr + subpage->base,
-                                      size, is_write);
+                                      len, is_write);
 }
 
 static const MemoryRegionOps subpage_ops = {
@@ -1646,8 +1646,8 @@ static int subpage_register (subpage_t *mmio, uint32_t start, uint32_t end,
     idx = SUBPAGE_IDX(start);
     eidx = SUBPAGE_IDX(end);
 #if defined(DEBUG_SUBPAGE)
-    printf("%s: %p start %08x end %08x idx %08x eidx %08x mem %ld\n", __func__,
-           mmio, start, end, idx, eidx, memory);
+    printf("%s: %p start %08x end %08x idx %08x eidx %08x section %d\n",
+           __func__, mmio, start, end, idx, eidx, section);
 #endif
     for (; idx <= eidx; idx++) {
         mmio->sub_section[idx] = section;
@@ -1668,8 +1668,8 @@ static subpage_t *subpage_init(AddressSpace *as, hwaddr base)
                           "subpage", TARGET_PAGE_SIZE);
     mmio->iomem.subpage = true;
 #if defined(DEBUG_SUBPAGE)
-    printf("%s: %p base " TARGET_FMT_plx " len %08x %d\n", __func__,
-           mmio, base, TARGET_PAGE_SIZE, subpage_memory);
+    printf("%s: %p base " TARGET_FMT_plx " len %08x\n", __func__,
+           mmio, base, TARGET_PAGE_SIZE);
 #endif
     subpage_register(mmio, 0, TARGET_PAGE_SIZE-1, PHYS_SECTION_UNASSIGNED);
 
-- 
1.7.10.4


