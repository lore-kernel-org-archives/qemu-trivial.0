Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mZzDu-00024P-Hi
	for mharc-qemu-trivial@gnu.org; Mon, 11 Oct 2021 13:36:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mZzDs-00021T-Qc; Mon, 11 Oct 2021 13:36:24 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:12776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mZzDp-0001Fo-KZ; Mon, 11 Oct 2021 13:36:23 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 1F5AB756030;
 Mon, 11 Oct 2021 19:36:17 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F1DE0756022; Mon, 11 Oct 2021 19:36:16 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH] memory: Log access direction for invalid accesses
Date: Mon, 11 Oct 2021 19:32:43 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, Michael S. Tsirkin <mst@redhat.com>,
 qemu-trivial@nongnu.org
Message-Id: <20211011173616.F1DE0756022@zero.eik.bme.hu>
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Oct 2021 17:36:25 -0000

In memory_region_access_valid() invalid accesses are logged to help
debugging but the log message does not say if it was a read or write.
Log that too to better identify the access causing the problem.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 softmmu/memory.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index db182e5d3d..e5826faa0c 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1378,17 +1378,17 @@ bool memory_region_access_valid(MemoryRegion *mr,
 {
     if (mr->ops->valid.accepts
         && !mr->ops->valid.accepts(mr->opaque, addr, size, is_write, attrs)) {
-        qemu_log_mask(LOG_GUEST_ERROR, "Invalid access at addr "
-                                       "0x%" HWADDR_PRIX ", size %u, "
-                                       "region '%s', reason: rejected\n",
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" HWADDR_PRIX
+                      ", size %u, region '%s', reason: rejected\n",
+                      is_write ? "write" : "read",
                       addr, size, memory_region_name(mr));
         return false;
     }
 
     if (!mr->ops->valid.unaligned && (addr & (size - 1))) {
-        qemu_log_mask(LOG_GUEST_ERROR, "Invalid access at addr "
-                                       "0x%" HWADDR_PRIX ", size %u, "
-                                       "region '%s', reason: unaligned\n",
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" HWADDR_PRIX
+                      ", size %u, region '%s', reason: unaligned\n",
+                      is_write ? "write" : "read",
                       addr, size, memory_region_name(mr));
         return false;
     }
@@ -1400,10 +1400,10 @@ bool memory_region_access_valid(MemoryRegion *mr,
 
     if (size > mr->ops->valid.max_access_size
         || size < mr->ops->valid.min_access_size) {
-        qemu_log_mask(LOG_GUEST_ERROR, "Invalid access at addr "
-                                       "0x%" HWADDR_PRIX ", size %u, "
-                                       "region '%s', reason: invalid size "
-                                       "(min:%u max:%u)\n",
+        qemu_log_mask(LOG_GUEST_ERROR, "Invalid %s at addr 0x%" HWADDR_PRIX
+                      ", size %u, region '%s', reason: invalid size "
+                      "(min:%u max:%u)\n",
+                      is_write ? "write" : "read",
                       addr, size, memory_region_name(mr),
                       mr->ops->valid.min_access_size,
                       mr->ops->valid.max_access_size);
-- 
2.21.4


