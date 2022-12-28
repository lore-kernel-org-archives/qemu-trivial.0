Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAWC6-00073A-Sn
	for mharc-qemu-trivial@gnu.org; Wed, 28 Dec 2022 08:10:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAWC3-00072Q-CY
 for qemu-trivial@nongnu.org; Wed, 28 Dec 2022 08:10:03 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAWC1-0005Vo-Jw
 for qemu-trivial@nongnu.org; Wed, 28 Dec 2022 08:10:03 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso1042253wmq.1
 for <qemu-trivial@nongnu.org>; Wed, 28 Dec 2022 05:10:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T3k+bQ1iJ0lDbsqrkg5Y3i0CjAbIkgORP4wzDU1zH0s=;
 b=vSAvsm+dAbGuXaFhHODrxHjxdxm9jJIFBAsowTINp0iWf7YR7iZbKN2+1NpVf9pDp4
 AvBkntPd7HKtKd2AkZO0Rbe4S4AMB+yIxqf95tsZFUmHRcguHk2bjWnLTPaXyO9x0RUN
 U8/RiKQhOM6KZfKZ01Bq2Zlji3BJwzmJ7jARZPlQHEdrPUg3B9I0EUXGcnITbVfUNWOc
 4KQZHu+p1K7wDLKPqObopbjm/fBxXhOTEgmPtdD9sQej9OktVcBlySoD7pnuQKBlqQmB
 epvWeukKxVGS5Txk++NKMC7qmfS/5FMGJ4CdrNUcySbWIxWhXQziCSmrlPqmSibP5fNO
 bx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T3k+bQ1iJ0lDbsqrkg5Y3i0CjAbIkgORP4wzDU1zH0s=;
 b=tovdQ6AdZOZKrUp333IJ1OzCW4yaxF1Ds62a2SK03+whaVR5r6mmKvEqfky5j4yfpm
 Ge97Le/a2IGJ4dUXZiKAZRkoqJHPyOCENrQpyxc3ZwiOs6hXS1jRckHpgXioADf7ZYST
 2yGxdEKB4oLTrM+SeozA+WOVZ6t/2F1aaEmI00pP/aXV5CD+9kZnlb+etxtjoO006MVy
 Ofk1OFp4f7xvtcSc+oQ1BWBwU9eO/bWrozTW9N2xzLtvZhdMd0czFSoNCYijn6ER50jP
 OuMM85qraquD0JQmGCHlMUt7PuESZjMkkoX8MUyFO4WJSnlCOZ1kaB01v67a2Q6Dw7HW
 agnQ==
X-Gm-Message-State: AFqh2kqTXzk7fhJ4+qXAXAKzPbY5ELwdLGbL09fY/rQc/TQijM7P2llt
 jv7PCeUH9Vh5/Hlfw0rP1Qpx4w==
X-Google-Smtp-Source: AMrXdXt3ScHjVVssAlEWIlt+qUtJT2+X69LQhJla+kMogytz3cxRTdRRiMnbwUf6H3P7DWJab8HKBw==
X-Received: by 2002:a05:600c:4998:b0:3cf:68d3:3047 with SMTP id
 h24-20020a05600c499800b003cf68d33047mr17489230wmp.41.1672232998411; 
 Wed, 28 Dec 2022 05:09:58 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c2caa00b003c701c12a17sm27515168wmc.12.2022.12.28.05.09.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 28 Dec 2022 05:09:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Chenyi Qiang <chenyi.qiang@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] virtio-mem: Fix typo in function name
Date: Wed, 28 Dec 2022 14:09:56 +0100
Message-Id: <20221228130956.80515-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Wed, 28 Dec 2022 13:10:04 -0000

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/virtio/virtio-mem.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
index d96bde1fab..c252027391 100644
--- a/hw/virtio/virtio-mem.c
+++ b/hw/virtio/virtio-mem.c
@@ -207,7 +207,7 @@ static int virtio_mem_for_each_unplugged_range(const VirtIOMEM *vmem, void *arg,
  *
  * Returns false if the intersection is empty, otherwise returns true.
  */
-static bool virito_mem_intersect_memory_section(MemoryRegionSection *s,
+static bool virtio_mem_intersect_memory_section(MemoryRegionSection *s,
                                                 uint64_t offset, uint64_t size)
 {
     uint64_t start = MAX(s->offset_within_region, offset);
@@ -245,7 +245,7 @@ static int virtio_mem_for_each_plugged_section(const VirtIOMEM *vmem,
                                       first_bit + 1) - 1;
         size = (last_bit - first_bit + 1) * vmem->block_size;
 
-        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
+        if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
             break;
         }
         ret = cb(&tmp, arg);
@@ -277,7 +277,7 @@ static int virtio_mem_for_each_unplugged_section(const VirtIOMEM *vmem,
                                  first_bit + 1) - 1;
         size = (last_bit - first_bit + 1) * vmem->block_size;
 
-        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
+        if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
             break;
         }
         ret = cb(&tmp, arg);
@@ -313,7 +313,7 @@ static void virtio_mem_notify_unplug(VirtIOMEM *vmem, uint64_t offset,
     QLIST_FOREACH(rdl, &vmem->rdl_list, next) {
         MemoryRegionSection tmp = *rdl->section;
 
-        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
+        if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
             continue;
         }
         rdl->notify_discard(rdl, &tmp);
@@ -329,7 +329,7 @@ static int virtio_mem_notify_plug(VirtIOMEM *vmem, uint64_t offset,
     QLIST_FOREACH(rdl, &vmem->rdl_list, next) {
         MemoryRegionSection tmp = *rdl->section;
 
-        if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
+        if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
             continue;
         }
         ret = rdl->notify_populate(rdl, &tmp);
@@ -346,7 +346,7 @@ static int virtio_mem_notify_plug(VirtIOMEM *vmem, uint64_t offset,
             if (rdl2 == rdl) {
                 break;
             }
-            if (!virito_mem_intersect_memory_section(&tmp, offset, size)) {
+            if (!virtio_mem_intersect_memory_section(&tmp, offset, size)) {
                 continue;
             }
             rdl2->notify_discard(rdl2, &tmp);
-- 
2.38.1


