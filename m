Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rLpuV-0000N8-BQ
	for mharc-qemu-trivial@gnu.org; Fri, 05 Jan 2024 14:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1rLpuK-0000J4-A6; Fri, 05 Jan 2024 14:31:05 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1rLpuH-00030k-OL; Fri, 05 Jan 2024 14:31:03 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 12A5D40D30;
 Fri,  5 Jan 2024 22:30:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id B17E55B1F0;
 Fri,  5 Jan 2024 22:30:39 +0300 (MSK)
Received: (nullmailer pid 116619 invoked by uid 1000);
 Fri, 05 Jan 2024 19:30:38 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Max Erenberg <merenber@uwaterloo.ca>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PULL 5/6] edu: fix DMA range upper bound check
Date: Fri,  5 Jan 2024 22:30:37 +0300
Message-Id: <20240105193038.116576-6-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240105193038.116576-1-mjt@tls.msk.ru>
References: <20240105193038.116576-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 05 Jan 2024 19:31:07 -0000

From: Max Erenberg <merenber@uwaterloo.ca>

The edu_check_range function checks that start <= end1 < end2, where
end1 is the upper bound (exclusive) of the guest-supplied DMA range and
end2 is the upper bound (exclusive) of the device's allowed DMA range.
When the guest tries to transfer exactly DMA_SIZE (4096) bytes, end1
will be equal to end2, so the check fails and QEMU aborts with this
puzzling error message (newlines added for formatting):

  qemu: hardware error: EDU: DMA range
    0x0000000000040000-0x0000000000040fff out of bounds
   (0x0000000000040000-0x0000000000040fff)!

By checking end1 <= end2 instead, guests will be allowed to transfer
exactly 4096 bytes. It is not necessary to explicitly check for
start <= end1 because the previous two checks (within(addr, start, end2)
and end1 > addr) imply start < end1.

Fixes: b30934cb52a7 ("hw: misc, add educational driver", 2015-01-21)
Signed-off-by: Max Erenberg <merenber@uwaterloo.ca>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/misc/edu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index a1f8bc77e7..e64a246d3f 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -115,7 +115,7 @@ static void edu_check_range(uint64_t addr, uint64_t size1, uint64_t start,
     uint64_t end2 = start + size2;
 
     if (within(addr, start, end2) &&
-            end1 > addr && within(end1, start, end2)) {
+            end1 > addr && end1 <= end2) {
         return;
     }
 
-- 
2.39.2


