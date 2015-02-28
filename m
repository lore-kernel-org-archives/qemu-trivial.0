Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRlq2-0008Q6-LF
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 13:10:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57851)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YRlpz-0008Jt-KP
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 13:10:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1YRlpy-0006jV-K4
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 13:10:03 -0500
Received: from qemu.weilnetz.de ([37.221.198.45]:54220)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1YRlps-0006f0-UO; Sat, 28 Feb 2015 13:09:57 -0500
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 6B68917F93E; Sat, 28 Feb 2015 19:09:53 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Trivial <qemu-trivial@nongnu.org>
Date: Sat, 28 Feb 2015 19:09:42 +0100
Message-Id: <1425146983-16015-3-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1425146983-16015-1-git-send-email-sw@weilnetz.de>
References: <1425146983-16015-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: Amit Shah <amit.shah@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	QEMU Developer <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>
Subject: [Qemu-trivial] [PATCH 2/3] migration: Fix some 32 bit compiler
	errors
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
X-List-Received-Date: Sat, 28 Feb 2015 18:10:05 -0000

The current code won't compile on 32 bit hosts because there are lots
of type casts between pointers and 64 bit integers.

Fix some of them.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 migration/rdma.c |   23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index 67c5701..1512460 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -1104,7 +1104,7 @@ static int qemu_rdma_search_ram_block(RDMAContext *rdma,
  * to perform the actual RDMA operation.
  */
 static int qemu_rdma_register_and_get_keys(RDMAContext *rdma,
-        RDMALocalBlock *block, uint8_t *host_addr,
+        RDMALocalBlock *block, uintptr_t host_addr,
         uint32_t *lkey, uint32_t *rkey, int chunk,
         uint8_t *chunk_start, uint8_t *chunk_end)
 {
@@ -1141,11 +1141,12 @@ static int qemu_rdma_register_and_get_keys(RDMAContext *rdma,
         if (!block->pmr[chunk]) {
             perror("Failed to register chunk!");
             fprintf(stderr, "Chunk details: block: %d chunk index %d"
-                            " start %" PRIu64 " end %" PRIu64 " host %" PRIu64
-                            " local %" PRIu64 " registrations: %d\n",
-                            block->index, chunk, (uint64_t) chunk_start,
-                            (uint64_t) chunk_end, (uint64_t) host_addr,
-                            (uint64_t) block->local_host_addr,
+                            " start %" PRIuPTR " end %" PRIuPTR
+                            " host %" PRIuPTR
+                            " local %" PRIuPTR " registrations: %d\n",
+                            block->index, chunk, (uintptr_t)chunk_start,
+                            (uintptr_t)chunk_end, host_addr,
+                            (uintptr_t)block->local_host_addr,
                             rdma->total_registrations);
             return -1;
         }
@@ -1932,8 +1933,7 @@ retry:
             }
 
             /* try to overlap this single registration with the one we sent. */
-            if (qemu_rdma_register_and_get_keys(rdma, block,
-                                                (uint8_t *) sge.addr,
+            if (qemu_rdma_register_and_get_keys(rdma, block, sge.addr,
                                                 &sge.lkey, NULL, chunk,
                                                 chunk_start, chunk_end)) {
                 error_report("cannot get lkey");
@@ -1952,8 +1952,7 @@ retry:
             block->remote_host_addr = reg_result->host_addr;
         } else {
             /* already registered before */
-            if (qemu_rdma_register_and_get_keys(rdma, block,
-                                                (uint8_t *)sge.addr,
+            if (qemu_rdma_register_and_get_keys(rdma, block, sge.addr,
                                                 &sge.lkey, NULL, chunk,
                                                 chunk_start, chunk_end)) {
                 error_report("cannot get lkey!");
@@ -1965,7 +1964,7 @@ retry:
     } else {
         send_wr.wr.rdma.rkey = block->remote_rkey;
 
-        if (qemu_rdma_register_and_get_keys(rdma, block, (uint8_t *)sge.addr,
+        if (qemu_rdma_register_and_get_keys(rdma, block, sge.addr,
                                                      &sge.lkey, NULL, chunk,
                                                      chunk_start, chunk_end)) {
             error_report("cannot get lkey!");
@@ -3036,7 +3035,7 @@ static int qemu_rdma_registration_handle(QEMUFile *f, void *opaque,
                 chunk_start = ram_chunk_start(block, chunk);
                 chunk_end = ram_chunk_end(block, chunk + reg->chunks);
                 if (qemu_rdma_register_and_get_keys(rdma, block,
-                            (uint8_t *)host_addr, NULL, &reg_result->rkey,
+                            (uintptr_t)host_addr, NULL, &reg_result->rkey,
                             chunk, chunk_start, chunk_end)) {
                     error_report("cannot get rkey");
                     ret = -EINVAL;
-- 
1.7.10.4


