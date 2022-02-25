Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nNmdb-0005D9-9j
	for mharc-qemu-trivial@gnu.org; Fri, 25 Feb 2022 21:16:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel@nider.org>) id 1nNjz9-0003Sf-60
 for qemu-trivial@nongnu.org; Fri, 25 Feb 2022 18:26:51 -0500
Received: from mailout.easymail.ca ([64.68.200.34]:36328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel@nider.org>) id 1nNjz6-0001yL-1w
 for qemu-trivial@nongnu.org; Fri, 25 Feb 2022 18:26:50 -0500
Received: from localhost (localhost [127.0.0.1])
 by mailout.easymail.ca (Postfix) with ESMTP id E16C546C98;
 Fri, 25 Feb 2022 23:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nider.org; s=easymail;
 t=1645831053; bh=OhOnuyUeA9F2nkOJM0pXuO5EqnDQKiPlpaScCt2oAP0=;
 h=From:To:Cc:Subject:Date:From;
 b=ZJuOn9+gXGHPwo6IheNOfiOlEAwg8GM/gax/OSgkqKBdYIeuZWt5mjty4XKRXOnYz
 VN0/WD+56ZJF4mRjoxudPdBSDT2DRUNdR3lYbogiIhIim/RQeqVFXlnQl1XiCT8VmA
 CQh/BGGlXZUTJx5L72pbt5I6BWjTVPHBmR76XSoBq/ftjqcdWaL35qWKehzzVA1tQ7
 kMvMP4Z0cDGx5NY90wi4MY3s1dTylhx3i2HSpVDkgF+ZZy0knyy0T38NXUjIL7RDzP
 jCk/Z9avV6TeVaswENBJ0sms3lb1DBlIBnD1thNS/wGWKhJUrrb8F2ibYMMtJcbytg
 UCk+Gh5QZGjDg==
X-Virus-Scanned: Debian amavisd-new at emo03-pco.easydns.vpn
Received: from mailout.easymail.ca ([127.0.0.1])
 by localhost (emo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7r_t4vHvOO72; Fri, 25 Feb 2022 23:17:33 +0000 (UTC)
Received: from orca.nider.org (S010674da88fe49f5.vc.shawcable.net
 [70.79.150.243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailout.easymail.ca (Postfix) with ESMTPSA id 2C1A046C95;
 Fri, 25 Feb 2022 23:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nider.org; s=easymail;
 t=1645831053; bh=OhOnuyUeA9F2nkOJM0pXuO5EqnDQKiPlpaScCt2oAP0=;
 h=From:To:Cc:Subject:Date:From;
 b=ZJuOn9+gXGHPwo6IheNOfiOlEAwg8GM/gax/OSgkqKBdYIeuZWt5mjty4XKRXOnYz
 VN0/WD+56ZJF4mRjoxudPdBSDT2DRUNdR3lYbogiIhIim/RQeqVFXlnQl1XiCT8VmA
 CQh/BGGlXZUTJx5L72pbt5I6BWjTVPHBmR76XSoBq/ftjqcdWaL35qWKehzzVA1tQ7
 kMvMP4Z0cDGx5NY90wi4MY3s1dTylhx3i2HSpVDkgF+ZZy0knyy0T38NXUjIL7RDzP
 jCk/Z9avV6TeVaswENBJ0sms3lb1DBlIBnD1thNS/wGWKhJUrrb8F2ibYMMtJcbytg
 UCk+Gh5QZGjDg==
From: Joel Nider <joel@nider.org>
To: qemu-trivial@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Joel Nider <joel@nider.org>
Subject: [PATCH] virtio-mem: fix typo virito
Date: Fri, 25 Feb 2022 15:17:00 -0800
Message-Id: <20220225231700.1360270-1-joel@nider.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.68.200.34; envelope-from=joel@nider.org;
 helo=mailout.easymail.ca
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 25 Feb 2022 21:16:42 -0500
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Feb 2022 23:26:51 -0000

Replace 'virito' with 'virtio'. No functional change.

Signed-off-by: Joel Nider <joel@nider.org>
---
 hw/virtio/virtio-mem.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index f55dcf61f2..75649f1777 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -208,7 +208,7 @@ static int virtio_mem_for_each_unplugged_range(const VirtIOMEM *vmem, void *arg,
  *
  * Returns false if the intersection is empty, otherwise returns true.
  */
-static bool virito_mem_intersect_memory_section(MemoryRegionSection *s,
+static bool virtio_mem_intersect_memory_section(MemoryRegionSection *s,
                                                 uint64_t offset, uint64_t size)
 {
     uint64_t start = MAX(s->offset_within_region, offset);
@@ -246,7 +246,7 @@ static int virtio_mem_for_each_plugged_section(const VirtIOMEM *vmem,
                                       first_bit + 1) - 1;
         size = (last_bit - first_bit + 1) * vmem->block_size;
 
-        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
+        if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
             break;
         }
         ret = cb(&tmp, arg);
@@ -278,7 +278,7 @@ static int virtio_mem_for_each_unplugged_section(const VirtIOMEM *vmem,
                                  first_bit + 1) - 1;
         size = (last_bit - first_bit + 1) * vmem->block_size;
 
-        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
+        if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
             break;
         }
         ret = cb(&tmp, arg);
@@ -314,7 +314,7 @@ static void virtio_mem_notify_unplug(VirtIOMEM *vmem, uint64_t offset,
     QLIST_FOREACH(rdl, &vmem->rdl_list, next) {
         MemoryRegionSection tmp = *rdl->section;
 
-        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
+        if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
             continue;
         }
         rdl->notify_discard(rdl, &tmp);
@@ -330,7 +330,7 @@ static int virtio_mem_notify_plug(VirtIOMEM *vmem, uint64_t offset,
     QLIST_FOREACH(rdl, &vmem->rdl_list, next) {
         MemoryRegionSection tmp = *rdl->section;
 
-        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
+        if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
             continue;
         }
         ret = rdl->notify_populate(rdl, &tmp);
@@ -347,7 +347,7 @@ static int virtio_mem_notify_plug(VirtIOMEM *vmem, uint64_t offset,
             if (rdl2 == rdl) {
                 break;
             }
-            if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
+            if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
                 continue;
             }
             rdl2->notify_discard(rdl2, &tmp);
-- 
2.25.1


